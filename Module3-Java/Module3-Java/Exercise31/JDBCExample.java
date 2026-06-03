package Exercise31;

import java.sql.*;
public class JDBCExample{
    public static void main(String[] args) throws Exception{

        Connection con=DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/test",
                "root",
                "password"
            );
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM students");
        while(rs.next()) {System.out.println(rs.getInt(1)+ " " + rs.getString(2));
        }
        con.close();
    }
}
