----------PACKAGE COUNTRY----------
CREATE OR REPLACE PACKAGE pkg_country IS
    PROCEDURE createCountry(pNameCountry VARCHAR2);
    PROCEDURE getCountries(p_countrylist_refcur IN OUT SYS_REFCURSOR);
END pkg_country;

CREATE OR REPLACE PACKAGE BODY pkg_country AS
    ------PROCEDURE INSERT------
    PROCEDURE createCountry (pNameCountry VARCHAR2) IS
    BEGIN
        INSERT INTO pc.country(id_country, country_name)
        VALUES(pc.s_country.nextval, pNameCountry);
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE ('Country name already exists');
            ROLLBACK;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting country');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
    ------PROCEDURE getCountries------
    PROCEDURE getCountries(p_countrylist_refcur IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_countrylist_refcur FOR
            SELECT id_country, country_name
            FROM pc.country
            ORDER BY country_name;
    EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUTLINE('General Error');
            DBMS_OUTPUT.PUTLINE(SQLERRM);
            DBMS_OUTPUT.PUTLINE(SQLCODE);
    END;
    
END pkg_country;

----------PACKAGE PROVINCE----------
CREATE OR REPLACE PACKAGE pkg_province IS
    PROCEDURE createProvince(pNameProvince VARCHAR2, pCountryId NUMBER);
    PROCEDURE getProvincesFromCountry(pid_country IN NUMBER, p_provincelist_refcur IN OUT SYS_REFCURSOR);
END pkg_province;

CREATE OR REPLACE PACKAGE BODY pkg_province AS
    ------PROCEDURE INSERT------
    PROCEDURE createProvince (pNameProvince VARCHAR2, pCountryId NUMBER) IS
    BEGIN
        INSERT INTO pc.province(id_province, province_name, id_country)
        VALUES(pc.s_province.nextval, pNameProvince, pCountryId);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting province');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
    ------PROCEDURE getProvincesFromCountry------
    PROCEDURE getProvincesFromCountry(pid_country IN NUMBER, p_provincelist_refcur IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_provincelist_refcur FOR
            SELECT id_province, province_name
            FROM pc.province
            WHERE id_country = pid_country
            ORDER BY province_name;
    EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUTLINE('General Error');
            DBMS_OUTPUT.PUTLINE(SQLERRM);
            DBMS_OUTPUT.PUTLINE(SQLCODE);
    END;
    
END pkg_province;

----------PACKAGE CANTON----------
CREATE OR REPLACE PACKAGE pkg_canton IS
    PROCEDURE createCanton (pNameCanton VARCHAR2, pProvinceId NUMBER);
    PROCEDURE getCantonsFromProvince(pid_province IN NUMBER, p_cantonlist_refcur IN OUT SYS_REFCURSOR);
END pkg_canton;

CREATE OR REPLACE PACKAGE BODY pkg_canton AS
    ------PROCEDURE INSERT------
    PROCEDURE createCanton (pNameCanton VARCHAR2, pProvinceId NUMBER) IS
    BEGIN
        INSERT INTO pc.canton(id_canton, canton_name, id_province)
        VALUES(pc.s_canton.nextval, pNameCanton, pProvinceId);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting canton');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
    ------PROCEDURE getCantonsFromProvince------
    PROCEDURE getCantonsFromProvince(pid_province IN NUMBER, p_cantonlist_refcur IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_cantonlist_refcur FOR
            SELECT id_canton, canton_name
            FROM pc.canton
            WHERE id_province = pid_province
            ORDER BY canton_name;
    EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUTLINE('General Error');
            DBMS_OUTPUT.PUTLINE(SQLERRM);
            DBMS_OUTPUT.PUTLINE(SQLCODE);
    END;
    
END pkg_canton;

----------PACKAGE DISTRICT----------
CREATE OR REPLACE PACKAGE pkg_district IS
    PROCEDURE createDistrict (pNameDistrict VARCHAR2, pCantonId NUMBER);
    PROCEDURE getDistrictsFromCanton(pid_canton IN NUMBER, p_districtlist_refcur IN OUT SYS_REFCURSOR);
END pkg_district;

CREATE OR REPLACE PACKAGE BODY pkg_district AS
    ------PROCEDURE INSERT------
    PROCEDURE createDistrict (pNameDistrict VARCHAR2, pCantonId NUMBER) IS
    BEGIN
        INSERT INTO pc.district(id_district, district_name, id_canton)
        VALUES(pc.s_district.nextval, pNameDistrict, pCantonId);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting district');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
    ------PROCEDURE getDistrictsFromCanton------
    PROCEDURE getDistrictsFromCanton(pid_canton IN NUMBER, p_districtlist_refcur IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_districtlist_refcur FOR
            SELECT id_district, district_name
            FROM pc.district
            WHERE id_canton = pid_canton
            ORDER BY district_name;
    EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUTLINE('General Error');
            DBMS_OUTPUT.PUTLINE(SQLERRM);
            DBMS_OUTPUT.PUTLINE(SQLCODE);
    END;
    
END pkg_district;

----------PACKAGE COMMUNITY----------
CREATE OR REPLACE PACKAGE pkg_community IS
    PROCEDURE createCommunity (pNameCommunity VARCHAR2, pDistrictId NUMBER);
    PROCEDURE getCommunitiesFromDistrict(pid_district IN NUMBER, p_communitylist_refcur IN OUT SYS_REFCURSOR);
END pkg_community;

CREATE OR REPLACE PACKAGE BODY pkg_community AS
    ------PROCEDURE INSERT------
    PROCEDURE createCommunity (pNameCommunity VARCHAR2, pDistrictId NUMBER) IS
    BEGIN
        INSERT INTO pc.community(id_community, community_name, id_district)
        VALUES(pc.s_community.nextval, pNameCommunity, pDistrictId);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting community');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
    ------PROCEDURE getCommunitiesFromDistrict------
    PROCEDURE getCommunitiesFromDistrict(pid_district IN NUMBER, p_communitylist_refcur IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_communitylist_refcur FOR
            SELECT id_community, community_name
            FROM pc.community
            WHERE id_district = pid_district
            ORDER BY community_name;
    EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUTLINE('General Error');
            DBMS_OUTPUT.PUTLINE(SQLERRM);
            DBMS_OUTPUT.PUTLINE(SQLCODE);
    END;
    
END pkg_community;

----------PACKAGE PROPOSAL----------
CREATE OR REPLACE PACKAGE pkg_proposal IS
    PROCEDURE createProposal(pTitle VARCHAR2, pProposalDate VARCHAR2, pApproxBudget NUMBER,
                             pDescription VARCHAR2, pCategoryCode NUMBER, pIdNumber NUMBER);
END pkg_proposal;

CREATE OR REPLACE PACKAGE BODY pkg_proposal AS
    ------PROCEDURE INSERT------
    PROCEDURE createProposal(pTitle VARCHAR2, pProposalDate VARCHAR2, pApproxBudget NUMBER,
                         pDescription VARCHAR2, pCategoryCode NUMBER, pIdNumber NUMBER) IS
    BEGIN
        INSERT INTO pc.proposal(id_proposal, category_code, id_number, proposal_description, approximate_budget, title, proposal_date)
        VALUES (pc.s_proposal.nextval, pCategoryCode, pIdNumber, pDescription, pApproxBudget, pTitle, SYSDATE); 
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting proposal');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_proposal;

----------PACKAGE CATEGORY----------
CREATE OR REPLACE PACKAGE pkg_category IS
    PROCEDURE createCategory(pCategoryName VARCHAR2);
END pkg_category;

CREATE OR REPLACE PACKAGE BODY pkg_category AS
    ------PROCEDURE INSERT------
    PROCEDURE createCategory(pCategoryName VARCHAR2) IS
    BEGIN
        INSERT INTO pc.category(category_code, category_name)
        VALUES (s_category_code.NEXTVAL, pCategoryName);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting category');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_category;

----------PACKAGE USER TYPE----------
CREATE OR REPLACE PACKAGE pkg_user_type IS
    PROCEDURE createUserType(pIdUserName VARCHAR2);
END pkg_user_type;

CREATE OR REPLACE PACKAGE BODY pkg_user_type AS
    ------PROCEDURE INSERT------
    PROCEDURE createUserType(pIdUserName VARCHAR2) IS
    BEGIN
        INSERT INTO pc.user_type(id_user_type,user_type_name)
        VALUES(s_user_type_id.NEXTVAL,pIdUserName);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting user type');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_user_type;

----------PACKAGE NATIONALITY----------
CREATE OR REPLACE PACKAGE pkg_nationality IS
    PROCEDURE createNationality(pNationalityName VARCHAR2);
END pkg_nationality;

CREATE OR REPLACE PACKAGE BODY pkg_nationality AS
    ------PROCEDURE INSERT------
    PROCEDURE createNationality(pNationalityName VARCHAR2) IS
    BEGIN
        INSERT INTO pc.nationality(id_nationality, nationality_name)
        VALUES(s_nationality_id.NEXTVAL, pNationalityName);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting nationality');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_nationality;

----------PACKAGE PERSON----------
CREATE OR REPLACE PACKAGE pkg_person IS
    PROCEDURE insertPerson(pId NUMBER, pFirstName VARCHAR2, pFirstLastName VARCHAR2, pSecondLastName VARCHAR2, 
                           pDateOfBirth DATE, pPhoto VARCHAR2,pIdCommunity NUMBER);
END pkg_person;

CREATE OR REPLACE PACKAGE BODY pkg_person AS
    ------PROCEDURE INSERT------
    PROCEDURE insertPerson(pId NUMBER, pFirstName VARCHAR2, pFirstLastName VARCHAR2,
                           pSecondLastName VARCHAR2, pDateOfBirth DATE, pPhoto VARCHAR2,pIdCommunity NUMBER) IS
    BEGIN
        INSERT INTO pc.person(id_number, id, first_name, first_last_name, second_last_name, date_of_birth, photo, id_community)
        VALUES (s_person_id.NEXTVAL, pId, pFirstName, pFirstLastName, pSecondLastName, TO_DATE(pDateOfBirth, 'dd/mm/yyyy'), pPhoto,pIdCommunity);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting person');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_person;

----------PACKAGE EMAIL----------
CREATE OR REPLACE PACKAGE pkg_email IS
    PROCEDURE insertEmail(pMail VARCHAR2, pIdNumber NUMBER);
END pkg_email;

CREATE OR REPLACE PACKAGE BODY pkg_email AS
    ------PROCEDURE INSERT------
    PROCEDURE insertEmail(pMail VARCHAR2, pIdNumber NUMBER) IS
    BEGIN
        INSERT INTO pc.email(mail,id_number)
        VALUES(pMail,pIdNumber);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting email');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_email;

----------PACKAGE TELEPHONE----------
CREATE OR REPLACE PACKAGE pkg_telephone IS
    PROCEDURE insertTelephone(pTelephone NUMBER, pIdNumber NUMBER);
END pkg_telephone;
    
CREATE OR REPLACE PACKAGE BODY pkg_telephone AS
    ------PROCEDURE INSERT------
    PROCEDURE insertTelephone(pTelephone NUMBER, pIdNumber NUMBER) IS
    BEGIN
        INSERT INTO pc.telephone(phone_number,id_number)
        VALUES(pTelephone,pIdNumber);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting telephone');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
        	DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_telephone;
    
----------PACKAGE COMMENT----------
CREATE OR REPLACE PACKAGE pkg_comment IS
    PROCEDURE insertComment(pIdNumber NUMBER, pIdProposal NUMBER, pText VARCHAR2, pDate DATE);
END pkg_comment;

CREATE OR REPLACE PACKAGE BODY pkg_comment AS
    ------PROCEDURE INSERT------
    PROCEDURE insertComment(pIdNumber NUMBER, pIdProposal NUMBER, pText VARCHAR2, pDate DATE) IS
    BEGIN
        IF pDate IS NULL THEN
            INSERT INTO pc.proposal_comment(code_comment,id_number,id_proposal,text)
            VALUES(s_comment_code.NEXTVAL, pIdNumber, pIdProposal, pText);
            COMMIT;
        ELSE
            INSERT INTO pc.proposal_comment(code_comment,id_number,id_proposal,text,date_time)
            VALUES(s_comment_code.NEXTVAL, pIdNumber, pIdProposal, pText, TO_DATE(pDate, 'dd/mm/yyyy'));
            COMMIT;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting comment');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_comment;
    
----------PACKAGE VOTE X PERSON----------
CREATE OR REPLACE PACKAGE pkg_vote_x_person IS
    PROCEDURE insertVote(pIdProposal NUMBER, pIdNumber NUMBER);
END pkg_vote_x_person;

CREATE OR REPLACE PACKAGE BODY pkg_vote_x_person AS
    ------PROCEDURE INSERT------
    PROCEDURE insertVote(pIdProposal NUMBER, pIdNumber NUMBER) IS
    BEGIN
        INSERT INTO pc.vote_x_person(id_proposal, id_number)
        VALUES (pIdProposal, pIdNumber);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting vote');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_vote_x_person;
    
----------PACKAGE CATEGORY X PERSON----------
CREATE OR REPLACE PACKAGE pkg_category_x_person IS
    PROCEDURE insertFavoriteCategory(pIdNumber NUMBER, pCategoryCode NUMBER);
END pkg_category_x_person;

CREATE OR REPLACE PACKAGE BODY pkg_category_x_person AS
    ------PROCEDURE INSERT------
    PROCEDURE insertFavoriteCategory(pIdNumber NUMBER, pCategoryCode NUMBER) IS
    BEGIN
        INSERT INTO pc.category_x_person (id_number, category_code)
        VALUES (pIdNumber, pCategoryCode);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting favorite category');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_category_x_person;
    
----------PACKAGE USER----------
CREATE OR REPLACE PACKAGE pkg_user IS
    PROCEDURE insertUser(pPassword VARCHAR2, pIdNumber NUMBER, pIdUserType NUMBER, pUserName VARCHAR2);
END pkg_user;

CREATE OR REPLACE PACKAGE BODY pkg_user AS
    ------PROCEDURE INSERT------
    PROCEDURE insertUser(pPassword VARCHAR2, pIdNumber NUMBER, pIdUserType NUMBER, pUserName VARCHAR2) IS
    BEGIN
        INSERT INTO pc.person_user(id_user,user_password,id_number,id_user_type,user_name)
        VALUES(s_user_id.NEXTVAL,pPassword,pIdNumber,pIdUserType,pUserName);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting user');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_user;
    
----------PACKAGE NATIONALITY X PERSON----------
CREATE OR REPLACE PACKAGE pkg_nationality_x_person IS
    PROCEDURE insertNationalityXPerson(pIdNumber NUMBER, pIdNationality NUMBER);
END pkg_nationality_x_person;

CREATE OR REPLACE PACKAGE BODY pkg_nationality_x_person AS
    ------PROCEDURE INSERT------
    PROCEDURE insertNationalityXPerson(pIdNumber NUMBER, pIdNationality NUMBER) IS
    BEGIN
        INSERT INTO pc.nationality_x_person(id_number, id_nationality)
        VALUES(pIdNumber,pIdNationality);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting nationality to person');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_nationality_x_person;

----------PACKAGE PARAMETER----------
CREATE OR REPLACE PACKAGE pkg_parameter IS
    PROCEDURE insertParameter(pValue NUMBER, pName VARCHAR2);
END pkg_parameter;

CREATE OR REPLACE PACKAGE BODY pkg_parameter AS
    ------PROCEDURE INSERT------
    PROCEDURE insertParameter(pValue NUMBER, pName VARCHAR2) IS
    BEGIN
        INSERT INTO pc.parameter(id_parameter,parameter_value,parameter_name)
        VALUES(s_parameter_id.NEXTVAL,pValue,pName);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting parameter');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_parameter;
