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
            CallableStatement stmt = con.prepareCall("{call pkg_user.registerUser(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            
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
            stmt.registerOutParameter(14,OracleTypes.INTEGER);
            
            stmt.execute();
            
            Global.insert_result = stmt.getInt(14);
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
    
    public static void getIdCommunity(int pid_user) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{? = call pkg_user.getPersonsIdCommunity(?)}");
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_user);
        stmt.executeUpdate();
        Global.user_id_community = stmt.getInt(1);
    }
    
    public static void getPersonIdNumber(int p_id_user) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{? = call pkg_person.getPersonIdNumber(?)}");
        stmt.registerOutParameter(1,OracleTypes.INTEGER);
        stmt.setInt(2,p_id_user);
        stmt.execute();
        Global.id_person = stmt.getInt(1);
    }
    
    public static void getProposals(int pid_number, int p_category_filter, int p_vote_filter, String p_after_date, String p_before_date) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getProposals(?,?,?,?,?,?)}");
        stmt.setInt(1,pid_number);
        stmt.setInt(2,p_category_filter);
        stmt.setInt(3, p_vote_filter);
        stmt.setString(4,p_after_date);
        stmt.setString(5,p_before_date);
        stmt.registerOutParameter(6,OracleTypes.CURSOR); //cursor proposals
        
        stmt.executeQuery();
        
        //recorrer cursor
    }
    
    public static void getProposalsByUser(int pid_number) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getProposalsByUser(?,?,?)}");
        stmt.setInt(1,pid_number);
        stmt.registerOutParameter(2,OracleTypes.CURSOR); //cursor proposals
        stmt.registerOutParameter(3,OracleTypes.INTEGER); //total proposals
        stmt.executeQuery();
        
        //recorrer cursor
    }
    
    public static void updatePersonName(int p_id_number,String p_new_name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updatePersonFirstName(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setString(2,p_new_name);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonFirstLastName(int p_id_number,String p_new_f_last_name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updatePersonFirstLastName(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setString(2,p_new_f_last_name);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonSecLastName(int p_id_number,String p_new_sec_last_name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updatePersonSecLastName(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setString(2,p_new_sec_last_name);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonId(int p_id_number,int p_new_id) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updatePersonId(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setInt(2,p_new_id);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonBirthDate(int p_id_number,String p_new_birth_date) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updatePersonBirthDate(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setString(2,p_new_birth_date);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonUserType(int p_id_number,int p_new_userTypeId) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updateUserType(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setInt(2,p_new_userTypeId);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonNationality(int p_id_number,int p_new_nationality) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updateNationalityXPerson(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setInt(2,p_new_nationality);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonLocation(int p_id_number,int p_new_idCommunity) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.updatePersonIdCommunity(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setInt(2,p_new_idCommunity);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonProfilePicture(int p_id_number,String p_new_photo) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_.updatePersonIdCommunity(?,?,?)}");
    }
    
    public static void updatePersonPassword(int p_id_number,String p_new_password) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user.updatePersonPhoto(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setString(2,p_new_password);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void insertEmail(String newMail, int idNumber)  throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_email.insertEmail(?,?,?)}");
        stmt.setString(1,newMail);
        stmt.setInt(2,idNumber);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        
        Global.insert_result = stmt.getInt(3);
    }
    
    public static void deleteEmail(String mail, int pIdNumber) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_email.deleteEmail(?,?,?)}");
        stmt.setString(1,mail);
        stmt.setInt(2,pIdNumber);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(3);
    }
    
    public static void updateEmail(int pIdNumber, String old_mail, String new_mail) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_email.updateEmail(?,?,?,?)}");
        stmt.setInt(1, pIdNumber);
        stmt.setString(2,old_mail);
        stmt.setString(3,new_mail);
        stmt.registerOutParameter(4,OracleTypes.INTEGER);
        
        stmt.execute();
        
        Global.update_result = stmt.getInt(4);
    }
}
