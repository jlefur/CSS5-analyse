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
public class readRough {
	private ArrayList<String> fullEvents_Ustring = new ArrayList<String>();
	private int chronoLength = 0;
	PrintWriter printer;

	protected void readFile() throws Throwable {
		BufferedReader buffer = new BufferedReader(new FileReader("keywords_Multi-scale.csv"));
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
		readRough x = new readRough();
		x.printer = new PrintWriter(new BufferedWriter(new FileWriter(new File("network_Multi-scale.csv"), true)));
		x.readFile();
		for (int i = 0; i < x.chronoLength; i++) {
			String[] activities = x.fullEvents_Ustring.get(i).split(";");
			for (int j = 0; j < activities.length; j++) {
				for (int k = j + 1; k < activities.length; k++) {
					x.printer.println(activities[j].trim() + ";" + activities[k].trim());
				}
			}
		}
		x.printer.flush();
	}
}
