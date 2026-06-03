/*Task 4 - Leap Year Check */
import java.util.*;
public class LeapYearCheck{
  public static void main(String[] args){
    Scanner sc=new Scanner(System.in);
    int year=sc.nextInt();
    if((year%4==0 && year%100!=0) || year%400==0){
      System.out.println("It is leap year:"+year);
    }
    else{
      System.out.println("It is not leap year:"+year);
    }
    sc.close();
  }
}
