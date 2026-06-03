package Exercise21;

class InvalidAgeException extends Exception{
    InvalidAgeException(String msg){
        super(msg);
    }
}
public class CustomException{
    static void checkAge(int age) throws InvalidAgeException {
        if(age<18)
            throw new InvalidAgeException("Age must be 18+");
    }
    public static void main(String[] args) {
        try {
            checkAge(15);
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
