/*Task 10 - Number Guessing Game */
import java.util.*;
public class NumberGuess{
  public static void main(String[] args){
    Scanner sc=new Scanner(System.in);
    Random rand=new Random();
    int num=rand.nextInt(100)+1;
    
    int guess;
    do{
      System.out.println("Guess the number(1-100):");
      guess=sc.nextInt();
      if(guess>num){
        System.out.println("Too high!");
      }
      else if(guess<num){
        System.out.println("Too low!");
      }
      else{
        System.out.println("Correct!");
      }
    }while(guess!=num);
    sc.close();
  }
}