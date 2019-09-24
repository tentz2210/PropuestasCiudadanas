CREATE OR REPLACE TRIGGER PC.beforeUpdatePassword
BEFORE UPDATE OF user_password
ON person_user
FOR EACH ROW
  BEGIN 
    INSERT INTO PCADMIN.password_change(change_number,id_user,date_of_change,old_password,new_password)
    VALUES(s_password_change_number.NEXTVAL,:new.id_user,SYSDATE,:old.user_password,:new.user_password);
  END beforeUpdatePassword;
