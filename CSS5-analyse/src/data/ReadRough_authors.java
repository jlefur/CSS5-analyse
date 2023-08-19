package data;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
/** Lit un fichier csv avec les mots-clés en ligne puis sauvegarde toutes les paires de mots-clés possibles pour une utilisation dans Gephi<br>
 * Le Fur 04.2023 */
public class ReadRough_authors {
	private ArrayList<String> fullEvents_Ustring = new ArrayList<String>();
	private int chronoLength = 0;
	PrintWriter printer;

	protected void readFile() throws Throwable {
		BufferedReader buffer = new BufferedReader(new FileReader("keywords'.csv"));
		String readLine;
		readLine = buffer.readLine();// reads the first line
		if (readLine != null) {
			do {// put the entire chrono in dataChrono
				this.fullEvents_Ustring.add(readLine);
			} while ((readLine = buffer.readLine()) != null); // reads the next line
			this.chronoLength = this.fullEvents_Ustring.size();
			try {
				System.out.println("readFile : " + chronoLength + " events loaded in memory");
			} catch (Exception e) {
				System.err.println("readFile error: " + e.getMessage());
			}
		}
		buffer.close();
	}

	public static void main(String[] args) throws Throwable {
		ReadRough_authors x = new ReadRough_authors();
		x.printer = new PrintWriter(new BufferedWriter(new FileWriter(new File("network_authors.csv"), true)));
		x.readFile();
		for (int i = 0; i < x.chronoLength; i++) {
			String[] activities = x.fullEvents_Ustring.get(i).split(";");
			for (int j = 1; j < activities.length; j++) {
//					System.out.println(activities[0].trim() + ";" + activities[j].trim());
					x.printer.println(activities[0].trim() + ";" + activities[j].trim());
			}
		}
		x.printer.flush();
	}
}
