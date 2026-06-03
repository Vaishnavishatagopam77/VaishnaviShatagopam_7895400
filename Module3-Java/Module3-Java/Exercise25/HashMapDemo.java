package Exercise25;

import java.util.*;

public class HashMapDemo {
    public static void main(String[] args) {
        HashMap<Integer, String> map=new HashMap<>();
        map.put(1, "Alice");
        map.put(2, "Bob");
        System.out.println(map.get(1));
    }
}

