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
import java.sql.Types;


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
        CallableStatement stmt = con.prepareCall("{call pkg_user.updateUserType(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setInt(2,p_new_userTypeId);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updatePersonNationality(int p_id_number,int p_new_nationality) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_nationality_x_person.updateNationalityXPerson(?,?,?)}");
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
        CallableStatement stmt = con.prepareCall("{call pkg_person.updatePersonPhoto(?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setString(2,p_new_photo);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
        
    }
    
    public static void updatePersonPassword(int p_id_number,String p_old_password,String p_new_password) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user.updateUserPassword(?,?,?,?)}");
        stmt.setInt(1,p_id_number);
        stmt.setString(2,p_old_password);
        stmt.setString(3,p_new_password);
        stmt.registerOutParameter(4,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(4);
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
    
    public static void insertPhoneNumber(int newPhoneNumber, int pIdUser) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_telephone.insertTelephone(?,?,?)}");
        stmt.setInt(1,newPhoneNumber);
        stmt.setInt(2,pIdUser);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        
        Global.insert_result = stmt.getInt(3);
    }
    
    public static void deletePhoneNumber(int phoneNumb, int pIdUser) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_telephone.deleteTelephone(?,?,?)}");
        stmt.setInt(1,phoneNumb);
        stmt.setInt(2,pIdUser);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        
        Global.delete_result = stmt.getInt(3);
    }
    
    public static void modifyPhoneNumber(int pIdNumber, int oldNum, int newNum) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_telephone.updateTelephoneNumber(?,?,?,?)}");
        stmt.setInt(1,pIdNumber);
        stmt.setInt(2,oldNum);
        stmt.setInt(3,newNum);
        stmt.registerOutParameter(4,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(4);
    }
    
    public static void modifyUserName(int pIdNumber, String newUserName) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user.updateUserName(?,?,?)}");
        stmt.setInt(1,pIdNumber);
        stmt.setString(2,newUserName);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }

    public static ResultSet getStatisticsPerCountry() throws SQLException{
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getStatisticsPerCountry(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerProvince() throws SQLException{
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getStatisticsPerProvince(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerCanton() throws SQLException{
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getStatisticsPerCanton(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerDistrict() throws SQLException{
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getStatisticsPerDistrict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerCommunity() throws SQLException{
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getStatisticsPerCommunity(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerCategory() throws SQLException{
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getStatisticsPerCategory(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsUsersAge() throws SQLException{
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.getStatisticsUsersAge(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }

    public static ResultSet getStatisticsPerUserCountry() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.getStatisticsPerCountry(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerUserProvince() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.getStatisticsPerProvince(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerUserCanton() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.getStatisticsPerCanton(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerUserDistrict() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.getStatisticsPerDistrict(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getStatisticsPerUserCommunity() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_person.getStatisticsPerCommunity(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getTopCommunityProposals() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getTopCommunityProposals(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getTopVotedProposals() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getTopVotedProposals(?)}");
        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(1);
        
        return r;
    }
    
    public static ResultSet getProposalsByUser() throws SQLException {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_proposal.getProposalsByUser(?,?,?)}");
        stmt.setInt(1, Global.id_person);
        stmt.registerOutParameter(2, OracleTypes.CURSOR);
        stmt.registerOutParameter(3, OracleTypes.INTEGER);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(2);
        
        return r;
    }
    
    public static ResultSet getPasswordLogReport(String f_name, String f_middlename, String f_lastname,
                                                 String f_username, int f_id) throws SQLException {
        Connection con = DriverManager.getConnection(host, uAdminName, uAdminPass);
        CallableStatement stmt = con.prepareCall("{call pkg_password_log.getPasswordLogReport(?,?,?,?,?,?)}");
        if(f_name.equals(""))
            stmt.setString(1, f_name);
        else
            stmt.setNull(1, Types.VARCHAR);
        if(f_middlename.equals(""))
            stmt.setString(2, f_middlename);
        else
            stmt.setNull(2, Types.VARCHAR);
        if(f_lastname.equals(""))
            stmt.setString(3, f_lastname);
        else
            stmt.setNull(3, Types.VARCHAR);
        if(f_username.equals(""))
            stmt.setString(4, f_username);
        else
            stmt.setNull(4, Types.VARCHAR);
        if(f_id != 0)
            stmt.setInt(5, f_id);
        else
            stmt.setNull(5, Types.INTEGER);
        stmt.setInt(5, f_id);
        stmt.registerOutParameter(6, OracleTypes.CURSOR);
        stmt.executeQuery();
        ResultSet r = (ResultSet) stmt.getObject(6);
        return r;
    }
    
    public static void insertCountry(String name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_country.createCountry(?,?)}");
        stmt.setString(1,name);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        Global.insert_result = stmt.getInt(2);
    }
    
    public static void updateCountryName(int idCountry, String name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_country.updateCountryName(?,?,?)}");
        stmt.setInt(1,idCountry);
        stmt.setString(2,name);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updateCountryEnable(int idCountry, int enabled) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_country.updateCountryIsEnabled(?,?,?)}");
        stmt.setInt(1,idCountry);
        stmt.setInt(2,enabled);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.update_result = stmt.getInt(3); 
    }
    
    public static void deleteCountry(int idCountry) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_country.deleteCountry(?,?)}");
        stmt.setInt(1,idCountry);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(2);
    }
    
    public static void insertProvince(String name,int idCountry) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_province.createProvince(?,?,?)}");
        stmt.setString(1,name);
        stmt.setInt(2,idCountry);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.insert_result = stmt.getInt(3);
    }
    
    public static void updateProvinceName(int idProvince,String newName) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_province.updateProvinceName(?,?,?)}");
        stmt.setInt(1, idProvince);
        stmt.setString(2,newName);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updateProvinceEnable(int idProvince, int enabled) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_province.updateProvinceIsEnabled(?,?,?)}");
        stmt.setInt(1,idProvince);
        stmt.setInt(2,enabled);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.update_result = stmt.getInt(3); 
    }
    
    public static void deleteProvince(int idProvince) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_province.deleteProvince(?,?)}");
        stmt.setInt(1,idProvince);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(2);
    }
    
    public static void insertCanton(String name,int idProvince) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_canton.createCanton(?,?,?)}");
        stmt.setString(1,name);
        stmt.setInt(2,idProvince);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.insert_result = stmt.getInt(3);
    }
    
    public static void updateCantonName(int idCanton,String newName) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_canton.updateCantonName(?,?,?)}");
        stmt.setInt(1, idCanton);
        stmt.setString(2,newName);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updateCantonEnable(int idCanton, int enabled) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_canton.updateCantonIsEnabled(?,?,?)}");
        stmt.setInt(1,idCanton);
        stmt.setInt(2,enabled);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.update_result = stmt.getInt(3); 
    }
    
    public static void deleteCanton(int idCanton) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_canton.deleteCanton(?,?)}");
        stmt.setInt(1,idCanton);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(2);
    }
    
    public static void insertDistrict(String name,int idCanton) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_district.createDistrict(?,?,?)}");
        stmt.setString(1,name);
        stmt.setInt(2,idCanton);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.insert_result = stmt.getInt(3);
    }
    
    public static void updateDistrictName(int idDistrict,String newName) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_district.updateDistrictName(?,?,?)}");
        stmt.setInt(1, idDistrict);
        stmt.setString(2,newName);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updateDistrictEnable(int idDistrict, int enabled) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_district.updateDistrictIsEnabled(?,?,?)}");
        stmt.setInt(1,idDistrict);
        stmt.setInt(2,enabled);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.update_result = stmt.getInt(3); 
    }
    
    public static void deleteDistrict(int idDistrict) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_district.deleteDistrict(?,?)}");
        stmt.setInt(1,idDistrict);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(2);
    }
    
    public static void insertCommunity(String name,int idDistrict) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_community.createCommunity(?,?,?)}");
        stmt.setString(1,name);
        stmt.setInt(2,idDistrict);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.insert_result = stmt.getInt(3);
    }
    
    public static void updateCommunityName(int idCommunity,String newName) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_community.updateCommunityName(?,?,?)}");
        stmt.setInt(1, idCommunity);
        stmt.setString(2,newName);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updateCommunityEnable(int idCommunity, int enabled) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_community.updateCommunityIsEnabled(?,?,?)}");
        stmt.setInt(1,idCommunity);
        stmt.setInt(2,enabled);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        
        stmt.execute();
        Global.update_result = stmt.getInt(3); 
    }
    
    public static void deleteCommunity(int idCommunity) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_community.deleteCommunity(?,?)}");
        stmt.setInt(1,idCommunity);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(2);
    }
    
    public static void insertNationality(String name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_nationality.createNationality(?,?)}");
        stmt.setString(1,name);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        Global.insert_result = stmt.getInt(2);
    }
    
    public static void deleteNationality(int idNationality) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_nationality.deleteNationality(?,?)}");
        stmt.setInt(1,idNationality);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        Global.delete_result = stmt.getInt(2);
    }
    
    public static void updateNationalityName(String newName, int idNationality) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_nationality.updateNationalityName(?,?,?)}");
        stmt.setInt(1,idNationality);
        stmt.setString(2,newName);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
    
    public static void updateNationalityIsEnabled(int idNationality, int enabled) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_nationality.updateNationalityIsEnabled(?,?,?)}");
        stmt.setInt(1,idNationality);
        stmt.setInt(2,enabled);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3); 
    }
    
    public static void insertCategory(String name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_category.createCategory(?,?)}");
        stmt.setString(1,name);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.insert_result = stmt.getInt(2);
        
    }
    
    public static void deleteCategory(int catCode) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_category.deleteCategory(?,?)}");
        stmt.setInt(1,catCode);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(2);
        
    }
    
    public void updateCategoryName(int catCode, String newName) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_category.updateCategoryName(?,?,?)}");
        stmt.setInt(1,catCode);
        stmt.setString(2,newName);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
        
    }
    
    public void updateCategoryIsEnabled(int catCode, int enabled) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_category.updateCategoryIsEnabled(?,?,?)}");
        stmt.setInt(1,catCode);
        stmt.setInt(2,enabled);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        Global.update_result = stmt.getInt(3);
    }
    
    public void insertUserType(String name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user_type.createUserType(?,?)}");
        stmt.setString(1,name);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.insert_result = stmt.getInt(2);
        
    }
    
    public void deleteUserType(int id) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user_type.deleteUserType(?,?)}");
        stmt.setInt(1, id);
        stmt.registerOutParameter(2,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.delete_result = stmt.getInt(2);
        
    }
    
    public void updateUserTypeName(int id, String name) throws SQLException
    {
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{call pkg_user_type.updateUserTypeName(?,?,?)}");
        stmt.setInt(1,id);
        stmt.setString(2,name);
        stmt.registerOutParameter(3,OracleTypes.INTEGER);
        stmt.execute();
        
        Global.update_result = stmt.getInt(3);
    }
}
