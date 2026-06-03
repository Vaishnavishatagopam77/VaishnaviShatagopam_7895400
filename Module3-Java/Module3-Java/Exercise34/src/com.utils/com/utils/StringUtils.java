package com.utils;
public class StringUtils {
    public static String greet(String name) {
        if (name==null||name.isEmpty()) 
        return "Hello, World!";
        return "Hello, " + name + "!";
    }
}
