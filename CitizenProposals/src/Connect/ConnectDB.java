/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connect;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import oracle.jdbc.internal.OracleTypes;


/**
 *
 * @author lin
 */
public class ConnectDB 
{
    public static String user_type = "";
    public static int id_user = -1;
    public static int login_result = -1;
    
    public static void checkLogin(String p_user_name, String p_password) throws SQLException
    {
       String host = "jdbc:oracle:thin:@localhost:1521:orcl";
       String uName = "PC";
       String uPass = "PC";
       
       Connection con = DriverManager.getConnection(host, uName, uPass);
       CallableStatement stmt = con.prepareCall("{call pkg_user.checkLogin(?,?,?,?,?)}");
       
       stmt.setString(1, p_user_name);
       stmt.setString(2,p_password);
       stmt.registerOutParameter(3, OracleTypes.NUMBER);
       stmt.registerOutParameter(4, OracleTypes.VARCHAR);
       stmt.registerOutParameter(5, OracleTypes.NUMBER);
       stmt.execute();
       
       user_type = stmt.getString(4);
       id_user = stmt.getInt(3);
       login_result = stmt.getInt(5);
        //System.out.println("Id user: " + stmt.getInt(3) + " User type: " + stmt.getString(4) + " Login resut: " + stmt.getString(5) );
    }  
}
