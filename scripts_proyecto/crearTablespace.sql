--Creación de tablespace PC

CREATE TABLESPACE PC_Data
       DATAFILE 'C:\app\HansF\oradata\dbprueba\pc_data01.dbf'
       SIZE 10M
       REUSE
       AUTOEXTEND ON
       NEXT 512k
       MAXSIZE 200M;

CREATE TABLESPACE PC_Ind
       DATAFILE 'C:\app\HansF\oradata\dbprueba\pc_ind01.dbf'
       SIZE 10M
       REUSE
       AUTOEXTEND ON
       NEXT 512k
       MAXSIZE 200M;
       
--Creacion de tablespace PCADMIN

CREATE TABLESPACE PCADMIN_Data
       DATAFILE 'C:\app\lin\oradata\orcl\pcadmin_data01.dbf'
       SIZE 10M
       REUSE
       AUTOEXTEND ON
       NEXT 512k
       MAXSIZE 200M;

CREATE TABLESPACE PCADMIN_Ind
       DATAFILE 'C:\app\lin\oradata\orcl\pcadmin_ind01.dbf'
       SIZE 10M
       REUSE
       AUTOEXTEND ON
       NEXT 512k
       MAXSIZE 200M;
