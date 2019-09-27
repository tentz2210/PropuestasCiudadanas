----------PACKAGE COUNTRY----------
CREATE OR REPLACE PACKAGE pkg_country IS

END pkg_country;

CREATE OR REPLACE PACKAGE BODY pkg_country AS
    ------PROCEDURE INSERT------
    
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_country;

----------PACKAGE PROVINCE----------
CREATE OR REPLACE PACKAGE pkg_province IS

END pkg_province;

CREATE OR REPLACE PACKAGE BODY pkg_province AS
    ------PROCEDURE INSERT------
    
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_province;

----------PACKAGE CANTON----------
CREATE OR REPLACE PACKAGE pkg_canton IS

END pkg_canton;

CREATE OR REPLACE PACKAGE BODY pkg_canton AS
    ------PROCEDURE INSERT------
    
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_canton;

----------PACKAGE DISTRICT----------
CREATE OR REPLACE PACKAGE pkg_district IS

END pkg_district;

CREATE OR REPLACE PACKAGE BODY pkg_district AS
    ------PROCEDURE INSERT------
    
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_district;

----------PACKAGE COMMUNITY----------
CREATE OR REPLACE PACKAGE pkg_community IS

END pkg_community;

CREATE OR REPLACE PACKAGE BODY pkg_community AS
    ------PROCEDURE INSERT------
    
    ------PROCEDURE UPDATE------
    
    ------PROCEDURE DELETE------
    
END pkg_community;

----------PACKAGE PROPOSAL----------
CREATE OR REPLACE PACKAGE pkg_proposal IS

END pkg_proposal;

CREATE OR REPLACE PACKAGE BODY pkg_proposal AS
    ------PROCEDURE INSERT------
    
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
