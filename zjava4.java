import java.io.*;

public class java {
    public static void main(String[] args) {
        String csvFile = "lol.xlsx"; // Change to your CSV file&#39;s name
        String tempFile = "temp.xlsx"; // Temporary file to hold updated data
        String line;
        String delimiter = ",";
        try {
            BufferedReader br = new BufferedReader(new FileReader(csvFile));
            BufferedWriter bw = new BufferedWriter(new FileWriter(tempFile));
            String headerLine = br.readLine();
            String[] columnNames = headerLine.split(delimiter); // Split header to get column names
            int column16Index = 15; // Index of column 16 (0-based)
            int column17Index = 16; // Index of column 17 (0-based)
            // Append new column name
            String newHeaderLine = headerLine + ",Amount";
            bw.write(newHeaderLine);
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) {
                    continue; // Skip empty lines
                }
                String[] data = line.split(delimiter);
                if (data.length < 18) { // Check if there are enough columns
                    continue; // Skip lines with insufficient data
                }
                double column16Value = Double.parseDouble(data[column16Index]);
                double column17Value = Double.parseDouble(data[column17Index]);
                double amount = column16Value * column17Value;
                bw.newLine();
                bw.write(line + "," + amount);
                // Print row and column name
                System.out.println("Row: " + (data[0]) + ", Column 16:" +
                        columnNames[column16Index] + ", Column 17: " + columnNames[column17Index]);
            }
            br.close();
            bw.close();
            // Replace the original CSV file with the updated data

            File originalFile = new File(csvFile);
            File newFile = new File(tempFile);
            if (newFile.renameTo(originalFile)) {
                System.out.println("Amounts updated in the same CSV file.");
            } else {
                System.err.println("Error updating amounts.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}