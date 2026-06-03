/*Exercise2 in java - Simple Calculator*/
import java.util.*;
public class Calculator{
  public static void main(String[] args){
    Scanner sc=new Scanner(System.in);
    System.out.println("Enter your first number:");
    double num1=sc.nextDouble();
    System.out.println("Enter your second number:");
    double num2=sc.nextDouble();
    System.out.println("Choose an operation:(+,-,*,/)");
    char op=sc.next().charAt(0);
    double res=0;
    switch(op){
      case '+':
        res=num1+num2;
        break;
      case '-':
        res=num1-num2;
        break;
      case '*':
        res=num1*num2;
        break;
      case '/':
        if(num2!=0){
          res=num1/num2;
        }
        else{
          System.out.println("Cannot divide by zero");
          
        }
        break;
      default:
        System.out.println("Invalid");
        break;
      
    }
    sc.close();
    System.out.println("The result is:"+res);
  }
}
