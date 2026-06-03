/*Task8- Operator Precedence*/
public class OperatorPrecedence{
  public static void main(String[] args){
    int res1=10+5*2;
    int res2=(10+5)*2;
    /*Multiplication has higher precedence than addition.
Parentheses are evaluated first.*/
    System.out.println("The result of res1 is:"+res1);
    System.out.println("The result of res2 is:"+res2);
    System.out.println("The reason for variation of outputs is:Multiplication has higher precedence than addition.\r\n" + //
            "Parentheses are evaluated first.");
  }
}
