package Exercise39;

import java.lang.reflect.*;

class Test {
    public void show() {
        System.out.println("Hello");
    }
}
public class ReflectionDemo {
    public static void main(String[] args) throws Exception {
        Class<?> c=Class.forName("Test");
        Object obj=c.getDeclaredConstructor().newInstance();
        Method m = c.getMethod("show");
        m.invoke(obj);
    }
}
