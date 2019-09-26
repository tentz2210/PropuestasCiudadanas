--FROM SCHEMA PC

--Creation table country

CREATE TABLE country
(
    id_country       NUMBER(4),
        CONSTRAINT pk_country PRIMARY KEY (id_country)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    country_name     VARCHAR2(30) CONSTRAINT country_name_nn NOT NULL,
                                  CONSTRAINT country_name_uk UNIQUE(country_name),
    creation_date    DATE CONSTRAINT country_creation_date_nn NOT NULL,
    created_by       VARCHAR2(10) CONSTRAINT country_created_by_nn NOT NULL,
    last_modify_date DATE,
    last_modified_by VARCHAR2(10)
);

COMMENT ON TABLE country
IS 'Contains a catalogue of countries.';
COMMENT ON COLUMN country.id_country
IS 'Country primary key.';
COMMENT ON COLUMN country.country_name
IS 'Name of the country.';
COMMENT ON COLUMN country.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN country.created_by
IS 'Row creator.';
COMMENT ON COLUMN country.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN country.last_modified_by
IS 'Last user that modified the row.';
------------------------------------------------------------------------------------
--Creation table province
CREATE TABLE province
(
    id_province      NUMBER(4),
        CONSTRAINT pk_province PRIMARY KEY (id_province)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    province_name    VARCHAR2(30) CONSTRAINT province_name_nn NOT NULL,
    id_country       NUMBER(4),
        CONSTRAINT fk_province_country FOREIGN KEY
        (id_country) REFERENCES country(id_country),
    creation_date    DATE CONSTRAINT province_creation_date_nn NOT NULL,
    created_by       VARCHAR2(10) CONSTRAINT province_created_by_nn NOT NULL,
    last_modify_date DATE,
    last_modified_by VARCHAR2(10)
);

COMMENT ON TABLE province
IS 'Contains a catalogue of provinces.';
COMMENT ON COLUMN province.id_province
IS 'Province primary key.';
COMMENT ON COLUMN province.province_name
IS 'Name of the province.';
COMMENT ON COLUMN province.id_country
IS 'FK to the country that contains the province.';
COMMENT ON COLUMN province.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN province.created_by
IS 'Row creator.';
COMMENT ON COLUMN province.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN province.last_modified_by
IS 'Last user that modified the row.';
-----------------------------------------------------------------------
--Creation table canton
CREATE TABLE canton
(
    id_canton        NUMBER(4),
        CONSTRAINT pk_canton PRIMARY KEY (id_canton)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    canton_name VARCHAR2(30) CONSTRAINT canton_name_nn NOT NULL,
    id_province      NUMBER(4),
        CONSTRAINT fk_canton_province FOREIGN KEY
        (id_province) REFERENCES province(id_province),
    creation_date    DATE CONSTRAINT canton_creation_date_nn NOT NULL,
    created_by       VARCHAR2(10) CONSTRAINT canton_created_by_nn NOT NULL,
    last_modify_date DATE,
    last_modified_by VARCHAR2(10)
);

COMMENT ON TABLE canton
IS 'Contains a catalogue of cantons.';
COMMENT ON COLUMN canton.id_canton
IS 'Canton primary key.';
COMMENT ON COLUMN canton.canton_name
IS 'Name of the canton.';
COMMENT ON COLUMN canton.id_province
IS 'FK to the province that contains the canton.';
COMMENT ON COLUMN canton.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN canton.created_by
IS 'Row creator.';
COMMENT ON COLUMN canton.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN canton.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------
--Creation table district
CREATE TABLE district
(
    id_district      NUMBER(4),
        CONSTRAINT pk_district PRIMARY KEY (id_district)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    district_name    VARCHAR2(30) CONSTRAINT district_name_nn NOT NULL,
    id_canton NUMBER(4),
        CONSTRAINT fk_district_canton FOREIGN KEY
        (id_canton) REFERENCES canton(id_canton),
    creation_date    DATE CONSTRAINT district_creation_date_nn NOT NULL,
    created_by       VARCHAR2(10) CONSTRAINT district_created_by_nn NOT NULL,
    last_modify_date DATE,
    last_modified_by VARCHAR2(10)
);

COMMENT ON TABLE district
IS 'Contains a catalogue of districts.';
COMMENT ON COLUMN district.id_district
IS 'District primary key.';
COMMENT ON COLUMN district.district_name
IS 'Name of the district.';
COMMENT ON COLUMN district.id_canton
IS 'FK to the canton that contains the district.';
COMMENT ON COLUMN district.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN district.created_by
IS 'Row creator.';
COMMENT ON COLUMN district.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN district.last_modified_by
IS 'Last user that modified the row.';
----------------------------------------------------------------
--Creation table community

CREATE TABLE community
(
    id_community     NUMBER(4),
        CONSTRAINT pk_community PRIMARY KEY (id_community)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    community_name   VARCHAR2(30) CONSTRAINT community_name_nn NOT NULL,
    id_district      NUMBER(4),
        CONSTRAINT fk_community_district FOREIGN KEY
        (id_district) REFERENCES district(id_district),
    creation_date    DATE CONSTRAINT community_creation_date_nn NOT NULL,
    created_by       VARCHAR2(10) CONSTRAINT community_created_by_nn NOT NULL,
    last_modify_date DATE,
    last_modified_by VARCHAR2(10)
);

COMMENT ON TABLE community
IS 'Contains a catalogue of communities.';
COMMENT ON COLUMN community.id_community
IS 'Community primary key.';
COMMENT ON COLUMN community.community_name
IS 'Name of the community.';
COMMENT ON COLUMN community.id_district
IS 'FK to the district that contains the community.';
COMMENT ON COLUMN community.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN community.created_by
IS 'Row creator.';
COMMENT ON COLUMN community.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN community.last_modified_by
IS 'Last user that modified the row.';
--------------------------------------------------------------------------
--Creation table person

CREATE TABLE person
(
    id_number         NUMBER(20),
        CONSTRAINT pk_person PRIMARY KEY (id_number)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    first_name        VARCHAR2(25) CONSTRAINT person_name_nn NOT NULL,
    first_last_name   VARCHAR2(25) CONSTRAINT person_first_last_name_nn NOT NULL,
    second_last_name  VARCHAR2(25) CONSTRAINT person_second_last_name_nn NOT NULL,
    date_of_birth     DATE CONSTRAINT person_date_of_birth_nn NOT NULL,
    photo             VARCHAR2(25) CONSTRAINT person_photo_nn NOT NULL,
                                   CONSTRAINT person_photo_uk UNIQUE(photo),
    id_community      NUMBER(6)    CONSTRAINT person_id_community_nn NOT NULL,
        CONSTRAINT fk_person_community FOREIGN KEY
        (id_community) REFERENCES community(id_community),
    creation_date     DATE CONSTRAINT person_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT person_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE person
IS 'Contains general information about each person (users,admins).';
COMMENT ON COLUMN person.id_number
IS 'Identifier of the person (PK).';
COMMENT ON COLUMN person.first_name
IS 'Name of the person.';
COMMENT ON COLUMN person.first_last_name
IS 'First last name of the person.';
COMMENT ON COLUMN person.second_last_name
IS 'Second last name of the person.';
COMMENT ON COLUMN person.date_of_birth
IS 'Date of birth of the person.';
COMMENT ON COLUMN person.photo
IS 'Name of the profile photo of the person.';
COMMENT ON COLUMN person.id_community
IS 'Identifier of the community to which the person belongs (FK).';
COMMENT ON COLUMN person.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN person.created_by
IS 'Row creator.';
COMMENT ON COLUMN person.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN person.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------------
--Creation table category

CREATE TABLE category
(
    category_code     NUMBER(6),
        CONSTRAINT pk_category PRIMARY KEY (category_code)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    category_name     VARCHAR2(25) CONSTRAINT category_name_nn NOT NULL,
                                   CONSTRAINT category_name_uk UNIQUE(category_name),
    creation_date     DATE CONSTRAINT category_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT category_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE category
IS 'Contains every possible category that a proposal can have.';
COMMENT ON COLUMN category.category_code
IS 'Identifier of the category (PK).';
COMMENT ON COLUMN category.category_name
IS 'Name of the category.';
COMMENT ON COLUMN category.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN category.created_by
IS 'Row creator.';
COMMENT ON COLUMN category.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN category.last_modified_by
IS 'Last user that modified the row.'; 
-------------------------------------------------------------------------
--Creation table proposal
CREATE TABLE proposal
(
    id_proposal        NUMBER(8),
        CONSTRAINT pk_proposal PRIMARY KEY (id_proposal)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    category_code      NUMBER(4),
        CONSTRAINT fk_proposal_category FOREIGN KEY
        (category_code) REFERENCES category(category_code),
    id_number          NUMBER(10),
        CONSTRAINT fk_proposal_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
    description        VARCHAR2(200),
    approximate_budget NUMBER(8,2)  CONSTRAINT proposal_approximate_budget_nn NOT NULL,
    title              VARCHAR2(50) CONSTRAINT proposal_title_nn NOT NULL,
                                    CONSTRAINT proposal_title_uk UNIQUE(title),
    proposal_date      DATE DEFAULT SYSDATE CONSTRAINT proposal_date_nn NOT NULL,
    creation_date      DATE CONSTRAINT proposal_creation_date_nn NOT NULL,
    created_by         VARCHAR2(10) CONSTRAINT proposal_created_by_nn NOT NULL,
    last_modify_date   DATE,
    last_modified_by   VARCHAR2(10)
);

COMMENT ON TABLE proposal
IS 'Contains proposals made by citizens from a community.';
COMMENT ON COLUMN proposal.id_proposal
IS 'Proposal primary key.';
COMMENT ON COLUMN proposal.category_code
IS 'FK to the category containing the proposal.';
COMMENT ON COLUMN proposal.id_number
IS 'FK to the citizen who made the proposal.';
COMMENT ON COLUMN proposal.description
IS 'Description of the proposal that was made.';
COMMENT ON COLUMN proposal.approximate_budget
IS 'The proposals estimated budget.';
COMMENT ON COLUMN proposal.title
IS 'The title name of the proposal.';
COMMENT ON COLUMN proposal.proposal_date
IS 'Date when the citizen made the proposal.';
COMMENT ON COLUMN proposal.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN proposal.created_by
IS 'Row creator.';
COMMENT ON COLUMN proposal.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN proposal.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------------
--Creation table vote_x_person

CREATE TABLE vote_x_person
(
    id_proposal      NUMBER(8),
        CONSTRAINT fk_vote_proposal FOREIGN KEY
        (id_proposal) REFERENCES proposal(id_proposal),
    id_number        NUMBER(10),
        CONSTRAINT fk_vote_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
        
        CONSTRAINT pk_vote_x_person PRIMARY KEY (id_number,id_proposal)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    creation_date    DATE CONSTRAINT vote_creation_date_nn NOT NULL,
    created_by       VARCHAR2(10) CONSTRAINT vote_created_by_nn NOT NULL,
    last_modify_date DATE,
    last_modified_by VARCHAR2(10)
);

COMMENT ON TABLE vote_x_person
IS 'Contains the votes of citizens on proposals.';
COMMENT ON COLUMN vote_x_person.id_proposal
IS 'FK to the proposal that was voted.';
COMMENT ON COLUMN vote_x_person.id_number
IS 'FK to the person who voted the proposal.';
COMMENT ON COLUMN vote_x_person.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN vote_x_person.created_by
IS 'Row creator.';
COMMENT ON COLUMN vote_x_person.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN vote_x_person.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------------
--Creation table email

CREATE TABLE email
(
    mail              VARCHAR2(50) CONSTRAINT email_mail_nn NOT NULL, 
                                   CONSTRAINT email_mail_uk UNIQUE(mail),
    id_number         NUMBER(20)   CONSTRAINT email_id_number_nn NOT NULL,
        CONSTRAINT fk_email_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
        
        CONSTRAINT pk_email PRIMARY KEY (id_number,mail)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    creation_date     DATE CONSTRAINT email_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT email_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE email
IS 'Contains the email account or accounts associated to each person.';
COMMENT ON COLUMN email.mail
IS 'Mail account of the person (PK).';
COMMENT ON COLUMN email.id_number
IS 'Identifier of the person that owns the email account (FK-PK).';
COMMENT ON COLUMN email.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN email.created_by
IS 'Row creator.';
COMMENT ON COLUMN email.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN email.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------------
--Creation table telephone

CREATE TABLE telephone
(
    phone_number      NUMBER(10) CONSTRAINT telephone_phone_number_nn NOT NULL, 
                                 CONSTRAINT telephone_phone_number_uk UNIQUE(phone_number),
    id_number         NUMBER(20) CONSTRAINT telephone_id_number_nn NOT NULL,
        CONSTRAINT fk_telephone_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
        
        CONSTRAINT pk_telephone PRIMARY KEY (id_number,phone_number)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    creation_date     DATE CONSTRAINT telephone_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT telephone_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE telephone
IS 'Contains the telephone number or numbers associated to each person.';
COMMENT ON COLUMN telephone.phone_number
IS 'Telephone number of the person (PK).';
COMMENT ON COLUMN telephone.id_number
IS 'Identifier of the person that owns the telephone number (FK-PK).';
COMMENT ON COLUMN telephone.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN telephone.created_by
IS 'Row creator.';
COMMENT ON COLUMN telephone.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN telephone.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------------
--Creation table comment

CREATE TABLE proposal_comment
(
    code_comment      NUMBER(10),
        CONSTRAINT pk_proposal_comment PRIMARY KEY (code_comment)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    id_number         NUMBER(20) CONSTRAINT proposal_comment_id_number_nn NOT NULL,
        CONSTRAINT fk_proposal_comment_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
    id_proposal       NUMBER(10) CONSTRAINT comment_id_proposal_nn NOT NULL,
        CONSTRAINT fk_proposal_comment_proposal FOREIGN KEY
        (id_proposal) REFERENCES proposal(id_proposal),
    text              VARCHAR2(500) CONSTRAINT proposal_comment_text_nn NOT NULL,
    date_time         DATE DEFAULT SYSDATE CONSTRAINT proposal_comment_date_time_nn NOT NULL,
    creation_date     DATE CONSTRAINT comment_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT proposal_comment_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE proposal_comment
IS 'Contains every comment made by any person in a proposal.';
COMMENT ON COLUMN proposal_comment.code_comment
IS 'Identifier of the comment (PK).';
COMMENT ON COLUMN proposal_comment.id_number
IS 'Identifier of the person that wrote the comment (FK).';
COMMENT ON COLUMN proposal_comment.id_proposal
IS 'Identifier of the proposal to which the comment belongs (FK).';
COMMENT ON COLUMN proposal_comment.text
IS 'Text that was wrote in the comment.';
COMMENT ON COLUMN proposal_comment.date_time
IS 'Date and time in which the comment was posted.';
COMMENT ON COLUMN proposal_comment.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN proposal_comment.created_by
IS 'Row creator.';
COMMENT ON COLUMN proposal_comment.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN proposal_comment.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------------
--Creation table category_x_person

CREATE TABLE category_x_person
(
    id_number         NUMBER(20),
        CONSTRAINT fk_category_x_person_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
    category_code     NUMBER(6),
        CONSTRAINT fk_category_x_person_category FOREIGN KEY
        (category_code) REFERENCES category(category_code),
        
        CONSTRAINT pk_category_x_person PRIMARY KEY (id_number,category_code)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    creation_date     DATE CONSTRAINT cxp_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT cxp_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE category_x_person
IS 'Contains the favorite categories of each person.';
COMMENT ON COLUMN category_x_person.id_number
IS 'Identifier of the person that marked the category as favorite (FK-PK).';
COMMENT ON COLUMN category_x_person.category_code
IS 'Identifier of the category that was marked as favorite (FK-PK).';
COMMENT ON COLUMN category_x_person.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN category_x_person.created_by
IS 'Row creator.';
COMMENT ON COLUMN category_x_person.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN category_x_person.last_modified_by
IS 'Last user that modified the row.';
-------------------------------------------------------------------------
--Creation table parameter

CREATE TABLE parameter
(
    id_parameter      NUMBER(8),
        CONSTRAINT pk_parameter PRIMARY KEY (id_parameter)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    parameter_value   NUMBER(10) CONSTRAINT parameter_value_nn NOT NULL,
    parameter_name    VARCHAR2(25) CONSTRAINT parameter_name_nn NOT NULL,
                                   CONSTRAINT parameter_name_uk UNIQUE(parameter_name),
    creation_date     DATE CONSTRAINT parameter_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT parameter_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE parameter
IS 'Contains every parameter of the program with its value.';
COMMENT ON COLUMN parameter.id_parameter
IS 'Identifier of the parameter (PK).';
COMMENT ON COLUMN parameter.parameter_value
IS 'Value that the parameter takes.';
COMMENT ON COLUMN parameter.parameter_name
IS 'Name of the parameter.';
COMMENT ON COLUMN parameter.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN parameter.created_by
IS 'Row creator.';
COMMENT ON COLUMN parameter.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN parameter.last_modified_by
IS 'Last user that modified the row.'; 
-------------------------------------------------------------------------
--Creation table user_type

CREATE TABLE user_type
(
    id_user_type      NUMBER(4),
        CONSTRAINT pk_user_type PRIMARY KEY (id_user_type)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    user_type_name    VARCHAR2(25) CONSTRAINT user_type_name_nn NOT NULL,
                                   CONSTRAINT user_type_name_uk UNIQUE(user_type_name),
    creation_date     DATE CONSTRAINT user_type_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT user_type_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE user_type
IS 'Contains every possible type of user of the program.';
COMMENT ON COLUMN user_type.id_user_type
IS 'Identifier of the user type (PK).';
COMMENT ON COLUMN user_type.user_type_name
IS 'Name of the user type.';
COMMENT ON COLUMN user_type.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN user_type.created_by
IS 'Row creator.';
COMMENT ON COLUMN user_type.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN user_type.last_modified_by
IS 'Last user that modified the row.'; 
-------------------------------------------------------------------------
--Creation table user

CREATE TABLE person_user
(
    id_user           NUMBER(10),
        CONSTRAINT pk_user PRIMARY KEY (id_user)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    user_password     VARCHAR2(50) CONSTRAINT user_password_nn NOT NULL,
    id_number         NUMBER(20) CONSTRAINT user_id_number_nn NOT NULL,
        CONSTRAINT fk_user_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
    id_user_type      NUMBER(4) CONSTRAINT user_id_user_type_nn NOT NULL,
        CONSTRAINT fk_user_type_person FOREIGN KEY
        (id_user_type) REFERENCES user_type(id_user_type),
    user_name         VARCHAR2(25) CONSTRAINT user_name_nn NOT NULL,
                                   CONSTRAINT user_name_uk UNIQUE(user_name),
    creation_date     DATE CONSTRAINT user_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT user_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE person_user
IS 'Contains every user associated to each person.';
COMMENT ON COLUMN person_user.id_user
IS 'Identifier of the user (PK).';
COMMENT ON COLUMN person_user.user_password
IS 'Password of the user.';
COMMENT ON COLUMN person_user.id_number
IS 'Identifier of the person to which the user belongs (FK).';
COMMENT ON COLUMN person_user.id_user_type
IS 'Identifier of the user type (FK).';
COMMENT ON COLUMN person_user.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN person_user.created_by
IS 'Row creator.';
COMMENT ON COLUMN person_user.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN person_user.last_modified_by
IS 'Last user that modified the row.'; 
-------------------------------------------------------------------------
--Creation table nationality

CREATE TABLE nationality
(
    id_nationality    NUMBER(4),
        CONSTRAINT pk_nationality PRIMARY KEY (id_nationality)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    nationality_name  VARCHAR2(50) CONSTRAINT nationality_name_nn NOT NULL,
                                   CONSTRAINT nationality_name_uk UNIQUE(nationality_name),
    creation_date     DATE CONSTRAINT nationality_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT nationality_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE nationality
IS 'Contains every possible nationality that a person can have.';
COMMENT ON COLUMN nationality.id_nationality
IS 'Identifier of the nationality (PK).';
COMMENT ON COLUMN nationality.nationality_name
IS 'Name of the nationality.';
COMMENT ON COLUMN nationality.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN nationality.created_by
IS 'Row creator.';
COMMENT ON COLUMN nationality.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN nationality.last_modified_by
IS 'Last user that modified the row.'; 
-------------------------------------------------------------------------
--Creation table nationality_x_person

CREATE TABLE nationality_x_person
(
    id_number         NUMBER(10),
        CONSTRAINT fk_nationality_x_person_person FOREIGN KEY
        (id_number) REFERENCES person(id_number),
    id_nationality    NUMBER(4),
        CONSTRAINT fk_n_x_p_nationality FOREIGN KEY
        (id_nationality) REFERENCES nationality(id_nationality),
        
        CONSTRAINT pk_nationality_x_person PRIMARY KEY (id_number,id_nationality)
        USING INDEX
        TABLESPACE pc_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    creation_date     DATE CONSTRAINT n_x_p_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT n_x_p_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE nationality_x_person
IS 'Contains every nationality-person association.';
COMMENT ON COLUMN nationality_x_person.id_number
IS 'Identifier of the person (FK-PK).';
COMMENT ON COLUMN nationality_x_person.id_nationality
IS 'Identifier of the nationality (FK-PK).';
COMMENT ON COLUMN nationality_x_person.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN nationality_x_person.created_by
IS 'Row creator.';
COMMENT ON COLUMN nationality_x_person.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN nationality_x_person.last_modified_by
IS 'Last user that modified the row.'; 
-------------------------------------------------------------------------

--FROM SCHEMA PCADMIN


--Creation table password_change

CREATE TABLE password_change
(
    change_number     NUMBER(10),
        CONSTRAINT pk_password_change PRIMARY KEY (change_number)
        USING INDEX
        TABLESPACE pcadmin_ind PCTFREE 20
        STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0),
    id_user           NUMBER(10),
    date_of_change    DATE DEFAULT SYSDATE CONSTRAINT p_c_date_of_change_nn NOT NULL,
    old_password      VARCHAR2(50) CONSTRAINT p_c_old_password_nn NOT NULL,
    new_password      VARCHAR2(50) CONSTRAINT p_c_new_password_nn NOT NULL,
    creation_date     DATE CONSTRAINT p_c_creation_date_nn NOT NULL,
    created_by        VARCHAR2(10) CONSTRAINT p_c_created_by_nn NOT NULL,
    last_modify_date  DATE,
    last_modified_by  VARCHAR2(10)
);

COMMENT ON TABLE password_change
IS 'Contains every change that an user made to its password.';
COMMENT ON COLUMN password_change.change_number
IS 'Identifier of the change (PK).';
COMMENT ON COLUMN password_change.id_user
IS 'Identifier of the user that made the change (FK).';
COMMENT ON COLUMN password_change.date_of_change
IS 'Date in which the change was made.';
COMMENT ON COLUMN password_change.old_password
IS 'Last password used by the user.';
COMMENT ON COLUMN password_change.new_password
IS 'New password selected by the user.';
COMMENT ON COLUMN password_change.creation_date
IS 'Row creation date.';
COMMENT ON COLUMN password_change.created_by
IS 'Row creator.';
COMMENT ON COLUMN password_change.last_modify_date
IS 'Last row modification date.';
COMMENT ON COLUMN password_change.last_modified_by
IS 'Last user that modified the row.'; 

ALTER TABLE password_change
ADD (CONSTRAINT fk_password_change_user
     FOREIGN KEY (id_user)
     REFERENCES pc.person_user(id_user)); 
