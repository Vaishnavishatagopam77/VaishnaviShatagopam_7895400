package com.greetings;
import com.utils.StringUtils;
public class App {
    public static void main(String[] args) {
        String name=(args.length>0)?args[0]:"World";
        System.out.println(StringUtils.greet(name));
    }
}
