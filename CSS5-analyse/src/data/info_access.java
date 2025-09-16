package data;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.time.LocalDate;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * BuildInfoAccessTimeseries
 *
 * Usage:
 *   java BuildInfoAccessTimeseries "<dossier_sql>" "<csv_sortie>"
 *
 * Exemple (PowerShell, depuis le dossier qui contient ce .java):
 *   javac BuildInfoAccessTimeseries.java
 *   java BuildInfoAccessTimeseries "C:\mes_sql" "C:\mes_sql\info_access_timeseries.csv"
 */

/**
 * REQUETE ChatGPT Sous windows 11 : j'ai une liste de fichiers .sql
 * représentant des versions successives d'une base css5. le nom des fichiers
 * commence avec la date au format AAAAMMJJ exemple: 20250916-xxx.sql dans ces
 * versions de css5 il y a une table nommée info_access avec les trois champs
 * suivants:
 * 
 * 1- id pour le numéro d'enregistrement 2- idInformation pour l'information
 * accédée 3- nbAccess pour le nombre de fois où l'information a été accédée
 * 
 * dans la table info_access il y a un enregistrement par information accédée Au
 * cours du temps le nombre d'informations augmente et donc aussi la table
 * infoaccess
 * 
 * je souhaiterais récupérer un tableau (csv par exemple) avec les colonnes
 * suivantes date, numéro information 1, numéro information 2, … , numéro
 * information n
 * 
 * je dispose de java sous eclipse et excel (je peux installer python si besoin)
 * ci-joint un exemple de ces fichiers sql
 */
public class info_access {

	// Regex pour capter les blocs d'INSERT INTO `info_access` (...) VALUES (...);
	// (multiligne)
	private static final Pattern INSERT_BLOCK = Pattern.compile(
			"INSERT\\s+INTO\\s+`?info_access`?\\s*\\([^)]*\\)\\s*VALUES\\s*(.*?);",
			Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

	// Regex pour capter les tuples (id, idInformation, nbAccess) à l'intérieur des
	// VALUES
	private static final Pattern TUPLE = Pattern.compile("\\(\\s*\\d+\\s*,\\s*(\\d+)\\s*,\\s*(\\d+)\\s*\\)");

	public static void main(String[] args) {
		if (args.length != 2) {
			System.err.println("Usage: java BuildInfoAccessTimeseries <dossier_sql> <csv_sortie>");
			System.exit(1);
		}

		Path folder = Paths.get(args[0]);
		Path outCsv = Paths.get(args[1]);

		if (!Files.isDirectory(folder)) {
			System.err.println("Le chemin fourni n'est pas un dossier: " + folder);
			System.exit(1);
		}

		try {
			// Récupérer tous les fichiers du type AAAAMMJJ-*.sql
			List<Path> sqlFiles = listDatedSqlFiles(folder);
			if (sqlFiles.isEmpty()) {
				System.err.println("Aucun fichier trouvé au format AAAAMMJJ-*.sql dans " + folder);
				System.exit(1);
			}

			// Agrégats
			// Ensemble de tous les idInformation observés (pour faire les colonnes)
			SortedSet<Integer> allIds = new TreeSet<>();
			// Par date (chaine AAAAMMJJ) -> map idInformation -> nbAccess
			Map<String, Map<Integer, Integer>> perDate = new HashMap<>();

			for (Path p : sqlFiles) {
				String date = extractDateFromFilename(p.getFileName().toString());
				if (date == null) {
					continue; // ignore si ne matche pas exactement le pattern
				}

				String content = readWholeFile(p);

				// Extraire tous les tuples (idInformation, nbAccess)
				// S’il y a des doublons d’un même idInformation, on garde le DERNIER (ordre
				// d’apparition)
				LinkedHashMap<Integer, Integer> lastById = new LinkedHashMap<>();
				Matcher mBlock = INSERT_BLOCK.matcher(content);
				while (mBlock.find()) {
					String valuesChunk = mBlock.group(1);
					Matcher mTuple = TUPLE.matcher(valuesChunk);
					while (mTuple.find()) {
						int idInfo = Integer.parseInt(mTuple.group(1));
						int nbAccess = Integer.parseInt(mTuple.group(2));
						lastById.put(idInfo, nbAccess); // écrase l'ancien si ré-apparaît
					}
				}

				// Enregistre si on a trouvé quelque chose (même vide, on peut ignorer)
				perDate.put(date, lastById);
				allIds.addAll(lastById.keySet());
			}

			// Ecrit le CSV: colonnes triées (numériques) + 'date' en premier
			writeCsv(outCsv, perDate, allIds);
			System.out.println("Écrit: " + outCsv.toAbsolutePath());

		} catch (IOException e) {
			System.err.println("Erreur IO: " + e.getMessage());
			System.exit(2);
		}
	}

	/**
	 * Liste les fichiers dont le nom matche AAAAMMJJ-*.sql (AAAAMMJJ = 8 chiffres).
	 * Trié par date extraite puis nom, pour une sortie ordonnée.
	 */
	private static List<Path> listDatedSqlFiles(Path folder) throws IOException {
		List<Path> files = new ArrayList<>();
		try (DirectoryStream<Path> ds = Files.newDirectoryStream(folder, "*.sql")) {
			for (Path p : ds) {
				String name = p.getFileName().toString();
				if (name.length() >= 13 // 8 chiffres + '-' + au moins 1 char + ".sql"
						&& name.matches("^\\d{8}-.*\\.sql$")) {
					files.add(p);
				}
			}
		}
		// Tri par date (AAAAMMJJ) puis nom
		files.sort(Comparator.comparing(
				(Path p) -> Optional.ofNullable(extractDateFromFilename(p.getFileName().toString())).orElse("99999999"))
				.thenComparing(p -> p.getFileName().toString()));
		return files;
	}

	/**
	 * Extrait AAAAMMJJ depuis "AAAAMMJJ-xxx.sql". Renvoie null si non conforme.
	 */
	private static String extractDateFromFilename(String filename) {
		if (filename.matches("^\\d{8}-.*\\.sql$")) {
			return filename.substring(0, 8);
		}
		return null;
	}

	/**
	 * Lit un fichier en entier en UTF-8 (tolérant aux caractères invalides).
	 */
	private static String readWholeFile(Path path) throws IOException {
		// Lecture streaming -> StringBuilder (plus robuste pour gros fichiers que
		// Files.readString pré-Java 11)
		try (BufferedInputStream bis = new BufferedInputStream(Files.newInputStream(path));
				ByteArrayOutputStream bos = new ByteArrayOutputStream(1024 * 1024)) {
			byte[] buf = new byte[8192];
			int r;
			while ((r = bis.read(buf)) != -1) {
				bos.write(buf, 0, r);
			}
			// Remplacement des caractères invalides n’est pas natif ; ici on decode direct
			// UTF-8
			return bos.toString(StandardCharsets.UTF_8);
		}
	}

	/**
	 * Écrit le CSV final: 1 ligne par date, colonnes = union de tous les
	 * idInformation.
	 */
	private static void writeCsv(Path outCsv, Map<String, Map<Integer, Integer>> perDate, SortedSet<Integer> allIds)
			throws IOException {

		// Tri des dates (AAAAMMJJ) chronologiquement
		List<String> dates = new ArrayList<>(perDate.keySet());
		dates.sort(Comparator.naturalOrder());

		// Création des dossiers si besoin
		if (outCsv.getParent() != null) {
			Files.createDirectories(outCsv.getParent());
		}

		try (BufferedWriter w = Files.newBufferedWriter(outCsv, StandardCharsets.UTF_8);
				PrintWriter pw = new PrintWriter(w)) {

			// En-tête: date, puis toutes les colonnes idInformation
			pw.print("date");
			for (Integer id : allIds) {
				pw.print(",");
				pw.print(id);
			}
			pw.println();

			// Lignes
			for (String date : dates) {
				pw.print(date);
				Map<Integer, Integer> map = perDate.getOrDefault(date, Collections.emptyMap());
				for (Integer id : allIds) {
					pw.print(",");
					Integer nb = map.get(id);
					if (nb != null) {
						pw.print(nb);
					} // sinon vide
				}
				pw.println();
			}
		}
	}

	// (Optionnel) utilitaire de validation de date AAAAMMJJ (non utilisé, mais
	// pratique si nécessaire)
	@SuppressWarnings("unused")
	private static boolean isValidYyyymmdd(String yyyymmdd) {
		try {
			// Valide la date sans séparateurs
			int y = Integer.parseInt(yyyymmdd.substring(0, 4));
			int m = Integer.parseInt(yyyymmdd.substring(4, 6));
			int d = Integer.parseInt(yyyymmdd.substring(6, 8));
			LocalDate.of(y, m, d);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
