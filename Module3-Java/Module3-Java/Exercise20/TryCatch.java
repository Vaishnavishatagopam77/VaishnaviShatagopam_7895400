package Exercise20;

import java.util.Scanner;
public class TryCatch{
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        try {
            System.out.print("Enter first number: ");
            int a=sc.nextInt();
            System.out.print("Enter second number: ");
            int b=sc.nextInt();
            int res=a/b;
            System.out.println("Result="+res);

        } catch (ArithmeticException e) {
            System.out.println("Cannot divide by zero");
        }
        sc.close();
    }
}