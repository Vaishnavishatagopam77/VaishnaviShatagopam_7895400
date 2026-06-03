package Exercise12;

public class MethodOver{
  int add(int a, int b){
    return a+b;
  }
  double add(double a,double b){
    return a+b;
  }
  int add(int a, int b,int c){
    return a+b+c;
  }
    public static void main(String[] args) {
        MethodOver m=new MethodOver();
        System.out.println(m.add(2,5));
        System.out.println(m.add(2.5,5.5));
        System.out.println(m.add(2,5,10));
        
    }
}