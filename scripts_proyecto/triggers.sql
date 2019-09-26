--FROM SCHEMA PC

--Triggers for table person
CREATE OR REPLACE TRIGGER pc.beforeInsertPerson
BEFORE INSERT
ON pc.person
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertPerson;

CREATE OR REPLACE TRIGGER pc.beforeUpdatePerson
BEFORE UPDATE
ON pc.person
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdatePerson;
  
--Triggers for table email
CREATE OR REPLACE TRIGGER pc.beforeInsertEmail
BEFORE INSERT
ON pc.email
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertEmail;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateEmail
BEFORE UPDATE
ON pc.email
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateEmail;
  
--Triggers for table telephone
CREATE OR REPLACE TRIGGER pc.beforeInsertTelephone
BEFORE INSERT
ON pc.telephone
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertTelephone;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateTelephone
BEFORE UPDATE
ON pc.telephone
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateTelephone;
  
--Triggers for table comment
CREATE OR REPLACE TRIGGER pc.beforeInsertComment
BEFORE INSERT
ON pc.proposal_comment
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertComment;

CREATE OR REPLACE TRIGGER pc.beforeUpdateComment
BEFORE UPDATE
ON pc.proposal_comment
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateComment;
  
--Triggers for table category_x_person
CREATE OR REPLACE TRIGGER pc.beforeInsertCategory_X_Person
BEFORE INSERT
ON pc.category_x_person
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertCategory_X_Person;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateCategory_X_Person
BEFORE UPDATE
ON pc.category_x_person
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateCategory_X_Person;
  
--Triggers for table parameter
CREATE OR REPLACE TRIGGER pc.beforeInsertParameter
BEFORE INSERT
ON pc.parameter
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertParameter;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateParameter
BEFORE UPDATE
ON pc.parameter
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateParameter; 
  
--Triggers for table category
CREATE OR REPLACE TRIGGER pc.beforeInsertCategory
BEFORE INSERT
ON pc.category
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertCategory;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateCategory
BEFORE UPDATE
ON pc.category
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateCategory; 
  
--Trigger for table user
CREATE OR REPLACE TRIGGER pc.beforeInsertUser
BEFORE INSERT
ON pc.person_user
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertUser;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateUser
BEFORE UPDATE
ON pc.person_user
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateUser; 
  
--Trigger for table user_type
CREATE OR REPLACE TRIGGER pc.beforeInsertUser_Type
BEFORE INSERT
ON pc.user_type
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertUser_Type;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateUser_Type
BEFORE UPDATE
ON pc.user_type
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateUser_Type; 

--Triggers for table nationality
CREATE OR REPLACE TRIGGER pc.beforeInsertNationality
BEFORE INSERT
ON pc.nationality
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertNationality;

CREATE OR REPLACE TRIGGER pc.beforeUpdateNationality
BEFORE UPDATE
ON pc.nationality
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateNationality; 

--Triggers for table nationality_x_person
CREATE OR REPLACE TRIGGER pc.beforeInsertN_X_P
BEFORE INSERT
ON pc.nationality_x_person
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertN_X_P;
  
CREATE OR REPLACE TRIGGER pc.beforeUpdateN_X_P
BEFORE UPDATE
ON pc.nationality_x_person
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdateN_X_P;
  
-----------------Triggers Country-----------------
CREATE OR REPLACE TRIGGER pc.beforeInsertCountry
BEFORE INSERT
ON pc.country
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.created_by:=USER;
END beforeInsertCountry;

CREATE OR REPLACE TRIGGER pc.beforeUpdateCountry
BEFORE UPDATE
ON pc.country
FOR EACH ROW
BEGIN
    :new.last_modify_date:=SYSDATE;
    :new.last_modified_by:=USER;
END beforeUpdateCountry;

-----------------Triggers Canton-----------------
CREATE OR REPLACE TRIGGER pc.beforeInsertCanton
BEFORE INSERT
ON pc.canton
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.created_by:=USER;
END beforeInsertCanton;

CREATE OR REPLACE TRIGGER pc.beforeUpdateCanton
BEFORE UPDATE
ON pc.canton
FOR EACH ROW
BEGIN
    :new.last_modify_date:=SYSDATE;
    :new.last_modified_by:=USER;
END beforeUpdateCanton;

-----------------Triggers Province-----------------
CREATE OR REPLACE TRIGGER pc.beforeInsertProvince
BEFORE INSERT
ON pc.province
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.created_by:=USER;
END beforeInsertProvince;

CREATE OR REPLACE TRIGGER pc.beforeUpdateProvince
BEFORE UPDATE
ON pc.province
FOR EACH ROW
BEGIN
    :new.last_modify_date:=SYSDATE;
    :new.last_modified_by:=USER;
END beforeUpdateProvince;

-----------------Triggers District-----------------
CREATE OR REPLACE TRIGGER pc.beforeInsertDistrict
BEFORE INSERT
ON pc.district
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.created_by:=USER;
END beforeInsertDistrict;

CREATE OR REPLACE TRIGGER pc.beforeUpdateDistrict
BEFORE UPDATE
ON pc.district
FOR EACH ROW
BEGIN
    :new.last_modify_date:=SYSDATE;
    :new.last_modified_by:=USER;
END beforeUpdateDistrict;

-----------------Triggers Community-----------------
CREATE OR REPLACE TRIGGER pc.beforeInsertCommunity
BEFORE INSERT
ON pc.community
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.created_by:=USER;
END beforeInsertCommunity;

CREATE OR REPLACE TRIGGER pc.beforeUpdateCommunity
BEFORE UPDATE
ON pc.community
FOR EACH ROW
BEGIN
    :new.last_modify_date:=SYSDATE;
    :new.last_modified_by:=USER;
END beforeUpdateCommunity;

-----------------Triggers Proposal-----------------
CREATE OR REPLACE TRIGGER pc.beforeInsertProposal
BEFORE INSERT
ON pc.proposal
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.created_by:=USER;
END beforeInsertProposal;

CREATE OR REPLACE TRIGGER pc.beforeUpdateProposal
BEFORE UPDATE
ON pc.proposal
FOR EACH ROW
BEGIN
    :new.last_modify_date:=SYSDATE;
    :new.last_modified_by:=USER;
END beforeUpdateProposal;

-----------------Triggers VotexPerson-----------------
CREATE OR REPLACE TRIGGER pc.beforeInsertVote_X_Person
BEFORE INSERT
ON pc.vote_x_person
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.created_by:=USER;
END beforeInsertVote_X_Person;

CREATE OR REPLACE TRIGGER pc.beforeUpdateVote_X_Person
BEFORE UPDATE
ON pc.vote_x_person
FOR EACH ROW
BEGIN
    :new.last_modify_date:=SYSDATE;
    :new.last_modified_by:=USER;
END beforeUpdateVote_X_Person;

CREATE OR REPLACE TRIGGER PC.beforeUpdatePassword
BEFORE UPDATE OF user_password
ON person_user
FOR EACH ROW
  BEGIN 
    INSERT INTO PCADMIN.password_change(change_number,id_user,date_of_change,old_password,new_password)
    VALUES(PCADMIN.s_password_change_number.NEXTVAL,:new.id_user,SYSDATE,:old.user_password,:new.user_password);
  END beforeUpdatePassword;

--FROM SCHEMA PCADMIN

--Triggers for table password_change
CREATE OR REPLACE TRIGGER pcadmin.beforeInsertPassword_Change
BEFORE INSERT
ON pcadmin.password_change
For each row
  BEGIN 
    :new.creation_date:= SYSDATE;
    :new.created_by:= USER;
  END beforeInsertPassword_Change;

CREATE OR REPLACE TRIGGER pcadmin.beforeUpdatePassword_Change
BEFORE UPDATE
ON pcadmin.password_change
For each row
  BEGIN
    :new.last_modify_date:= SYSDATE;
    :new.last_modified_by:= USER;
  END beforeUpdatePassword_Change;   
