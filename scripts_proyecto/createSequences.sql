--FROM SCHEMA PC

--Sequence for table person
CREATE SEQUENCE s_person_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;

--Sequence for table comment
CREATE SEQUENCE s_comment_code
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
    
--Sequence for table parameter
CREATE SEQUENCE s_parameter_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;

--Sequence for table category
CREATE SEQUENCE s_category_code
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
    
--Sequence for table user
CREATE SEQUENCE s_user_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
    
--Sequence for table user_type
CREATE SEQUENCE s_user_type_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
    
--Sequence for table nationality
CREATE SEQUENCE s_nationality_id
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;
    
--Sequence for table country
CREATE SEQUENCE s_country
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999
NOCACHE
NOCYCLE;

--Sequence for table canton
CREATE SEQUENCE s_canton
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999
NOCACHE
NOCYCLE;

--Sequence for table province
CREATE SEQUENCE s_province
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999
NOCACHE
NOCYCLE;

--Sequence for table district
CREATE SEQUENCE s_district
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999
NOCACHE
NOCYCLE;

--Sequence for table community
CREATE SEQUENCE s_community
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999
NOCACHE
NOCYCLE;

--Sequence for table proposal
CREATE SEQUENCE s_proposal
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE; 
    
--FROM SCHEMA PCADMIN

--Sequence for table password_change
CREATE SEQUENCE s_password_change_number  
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 10000000
    NOCACHE
    NOCYCLE;



