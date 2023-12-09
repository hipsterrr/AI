import java.io.*;
import java.util.Scanner;

public class Preprocessing {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(new File("lol.xlsx"));
        sc.useDelimiter(",");
        int nullValueCount = 0; // Counter for null values
        while (sc.hasNext()) {
            String token = sc.next();
            if (token == null || token.trim().isEmpty()) {
                nullValueCount++;
            } else {
                System.out.print(token);
                // Assuming the token for price is at index 2 and token for quantity is at index D3
                if (sc.hasNext()) {
                    String priceToken = sc.next();
                    String quantityToken = sc.next();
                    try {
                        double price = Double.parseDouble(priceToken);
                        int quantity = Integer.parseInt(quantityToken);
                        double totalPrice = price * quantity;

                        System.out.print("," + totalPrice); // Print the calculated total price
                    } catch (NumberFormatException e) {
                        // Handle parsing errors
                    }
                }
            }
        }
        sc.close();
        System.out.println("\nTotal null values: " + nullValueCount);
    }
}

