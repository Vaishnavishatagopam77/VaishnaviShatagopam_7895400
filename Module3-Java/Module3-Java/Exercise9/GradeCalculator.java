/*Task9 - Grade Calculator */
import java.util.*;
public class GradeCalculator{
  public static void main(String[] args){
    Scanner sc=new Scanner(System.in);
    int marks=sc.nextInt();
    if(marks>=90&&marks<=100){
      System.out.println("A");
    }
    else if(marks<90&&marks>=80){
      System.out.println("B");
    }
    else if(marks<80&&marks>=70){
      System.out.println("C");
    }
    else if(marks<70&&marks>=60){
      System.out.println("D");
    }
    else{
      System.out.println("F");
    }
    sc.close();
  }
}