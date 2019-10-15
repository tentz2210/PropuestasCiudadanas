/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connect;

import Utils.CatalogueContainer;
import Utils.Global;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.internal.OracleTypes;
import Utils.IConstants;


/**
 *
 * @author lin
 */
public class ConnectDB implements IConstants
{   
    public static void checkLogin(String p_user_name, String p_password) throws SQLException
    {     
       Connection con = DriverManager.getConnection(host, uName, uPass);
       CallableStatement stmt = con.prepareCall("{call pkg_user.checkLogin(?,?,?,?,?)}");
       
       stmt.setString(1, p_user_name);
       stmt.setString(2,p_password);
       stmt.registerOutParameter(3, OracleTypes.NUMBER);
       stmt.registerOutParameter(4, OracleTypes.VARCHAR);
       stmt.registerOutParameter(5, OracleTypes.NUMBER);
       stmt.execute();
       
       Global.user_type = stmt.getString(4);
       Global.id_user = stmt.getInt(3);
       Global.login_result = stmt.getInt(5);
    }  
    
    public static void registerPerson(int pId_user, String p_first_name, String p_first_last_name , String p_second_last_name, String p_date_of_birth,
                                      String p_photo, int pId_community, String p_user_name, String p_user_password, int pId_user_type,
                                      String p_email, int p_phone_number, int p_id_nationality) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user.registerUser(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        
        stmt.setInt(1,pId_user);
        stmt.setString(2,p_first_name);
        stmt.setString(3,p_first_last_name);
        stmt.setString(4,p_second_last_name);
        stmt.setString(5,p_date_of_birth);
        stmt.setString(6,p_photo);
        stmt.setInt(7,pId_community);
        stmt.setString(8,p_user_name);
        stmt.setString(9,p_user_password);
        stmt.setInt(10,pId_user_type);
        stmt.setString(11,p_email);
        stmt.setInt(12,p_phone_number);
        stmt.setInt(13,p_id_nationality);
        
        stmt.execute();
    }
    
    public static void getCountries() throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_country.getCountries(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        Global.countriesInfo.clear();
        while (r.next())
        {
            CatalogueContainer cc = new CatalogueContainer(r.getInt("id_country"),r.getString("country_name"));
            Global.countriesInfo.add(cc);
        }
        
    }
    
    public static void getProvincesFromCountry(int pId_country) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_province.getProvincesFromCountry(?,?)}");
        stmt.setInt(1,pId_country);
        stmt.registerOutParameter(2, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(2);
        
        Global.provincesInfo.clear();
        while (r.next())
        {
            CatalogueContainer cc = new CatalogueContainer(r.getInt("id_province"),r.getString("province_name"));
            Global.provincesInfo.add(cc);
        }
    }
    
    public static void getCantonsFromProvince(int pId_province) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_canton.getCantonsFromProvince(?,?)}");
        stmt.setInt(1,pId_province);
        stmt.registerOutParameter(2, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(2);
        
        Global.cantonsInfo.clear();
        while (r.next())
        {
            CatalogueContainer cc = new CatalogueContainer(r.getInt("id_canton"),r.getString("canton_name"));
            Global.cantonsInfo.add(cc);
        }
    }
    
    public static void getDistrictsFromCanton(int pId_canton) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_district.getDistrictsFromCanton(?,?)}");
        stmt.setInt(1,pId_canton);
        stmt.registerOutParameter(2, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(2);
        
        Global.districtsInfo.clear();
        while (r.next())
        {
            CatalogueContainer cc = new CatalogueContainer(r.getInt("id_district"),r.getString("district_name"));
            Global.districtsInfo.add(cc);
        }
    }
    
    public static void getCommunitiesFromDistrict(int pId_district) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_community.getCommunitiesFromDistrict(?,?)}");
        stmt.setInt(1,pId_district);
        stmt.registerOutParameter(2, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(2);
        
        Global.communitiesInfo.clear();
        while (r.next())
        {
            CatalogueContainer cc = new CatalogueContainer(r.getInt("id_community"),r.getString("community_name"));
            Global.communitiesInfo.add(cc);
        }
    }
    
    public static void getNationalities () throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_nationality.getNationalities(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        Global.nationalitiesInfo.clear();
        while (r.next())
        {
            CatalogueContainer cc = new CatalogueContainer(r.getInt("id_nationality"),r.getString("nationality_name"));
            Global.nationalitiesInfo.add(cc);
        }
    }
    
    public static void getUserTypes () throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user_type.getUserTypes(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        Global.userTypesInfo.clear();
        while (r.next())
        {
            CatalogueContainer cc = new CatalogueContainer(r.getInt("id_user_type"),r.getString("user_type_name"));
            Global.userTypesInfo.add(cc);
        }
    }
}
