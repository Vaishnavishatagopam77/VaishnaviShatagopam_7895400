package Exercise24;

import java.util.*;
public class ArrayListDemo{
    public static void main(String[] args) {
        ArrayList<String> students=new ArrayList<>();
        students.add("Alice");
        students.add("Bob");
        for(String s : students) {
            System.out.println(s);
        }
    }
}

