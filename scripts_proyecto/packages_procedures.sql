----------PACKAGE COUNTRY----------
CREATE OR REPLACE PACKAGE pkg_country IS
    PROCEDURE createCountry(pNameCountry VARCHAR2, p_result OUT NUMBER);
    PROCEDURE getCountries(p_countrylist_refcur IN OUT SYS_REFCURSOR);
    PROCEDURE deleteCountry(pid_country NUMBER, p_result OUT NUMBER);
    PROCEDURE updateCountryName(p_id_country NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER);
    PROCEDURE updateCountryIsEnabled(p_id_country NUMBER, p_enabled NUMBER,p_result OUT NUMBER);
END pkg_country;

CREATE OR REPLACE PACKAGE BODY pkg_country AS
    ------PROCEDURE INSERT------
    PROCEDURE createCountry (pNameCountry VARCHAR2, p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.country(id_country, country_name)
        VALUES(pc.s_country.nextval, pNameCountry);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE ('Country name already exists');
            ROLLBACK;
            p_result:=0;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting country');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;    
    END;
    
    ------PROCEDURES UPDATE------
    PROCEDURE updateCountryName(p_id_country NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE country
        SET country_name = p_new_name
        WHERE id_country = p_id_country;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateCountryIsEnabled(p_id_country NUMBER, p_enabled NUMBER,p_result OUT NUMBER)IS
    BEGIN
        UPDATE country
        SET is_enabled = p_enabled
        WHERE id_country = p_id_country;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURE DELETE------
    PROCEDURE deleteCountry(pid_country NUMBER,p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM country
        WHERE id_country = pid_country;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
    END;
    
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
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_country;

----------PACKAGE PROVINCE----------
CREATE OR REPLACE PACKAGE pkg_province IS
    PROCEDURE createProvince(pNameProvince VARCHAR2, pCountryId NUMBER, p_result OUT NUMBER);
    PROCEDURE getProvincesFromCountry(pid_country IN NUMBER, p_provincelist_refcur IN OUT SYS_REFCURSOR);
    PROCEDURE deleteProvince(pid_province NUMBER, p_result OUT NUMBER);
    PROCEDURE updateProvinceName(p_id_province NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updateProvinceIsEnabled(p_id_province NUMBER, p_enabled NUMBER, p_result OUT NUMBER);
END pkg_province;

CREATE OR REPLACE PACKAGE BODY pkg_province AS
    ------PROCEDURE INSERT------
    PROCEDURE createProvince (pNameProvince VARCHAR2, pCountryId NUMBER,p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.province(id_province, province_name, id_country)
        VALUES(pc.s_province.nextval, pNameProvince, pCountryId);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting province');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURES UPDATE------
    PROCEDURE updateProvinceName(p_id_province NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE province
        SET province_name = p_new_name
        WHERE id_province = p_id_province;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateProvinceIsEnabled(p_id_province NUMBER, p_enabled NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE province
        SET is_enabled = p_enabled
        WHERE id_province = p_id_province;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURE DELETE------
    PROCEDURE deleteProvince(pid_province NUMBER, p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM province
        WHERE id_province = pid_province;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
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
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_province;

----------PACKAGE CANTON----------
CREATE OR REPLACE PACKAGE pkg_canton IS
    PROCEDURE createCanton (pNameCanton VARCHAR2, pProvinceId NUMBER, p_result OUT NUMBER);
    PROCEDURE getCantonsFromProvince(pid_province IN NUMBER, p_cantonlist_refcur IN OUT SYS_REFCURSOR);
    PROCEDURE deleteCanton(pid_canton NUMBER, p_result OUT NUMBER);
    PROCEDURE updateCantonName(p_id_canton NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER);
    PROCEDURE updateCantonIsEnabled(p_id_canton NUMBER, p_enabled NUMBER, p_result OUT NUMBER);
END pkg_canton;

CREATE OR REPLACE PACKAGE BODY pkg_canton AS
    ------PROCEDURE INSERT------
    PROCEDURE createCanton (pNameCanton VARCHAR2, pProvinceId NUMBER,p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.canton(id_canton, canton_name, id_province)
        VALUES(pc.s_canton.nextval, pNameCanton, pProvinceId);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting canton');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURES UPDATE------
    PROCEDURE updateCantonName(p_id_canton NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE canton
        SET canton_name = p_new_name
        WHERE id_canton = p_id_canton;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateCantonIsEnabled(p_id_canton NUMBER, p_enabled NUMBER,p_result OUT NUMBER)IS
    BEGIN
        UPDATE canton
        SET is_enabled = p_enabled
        WHERE id_canton = p_id_canton;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteCanton(pid_canton NUMBER,p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM canton
        WHERE id_canton = pid_canton;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
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
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_canton;

----------PACKAGE DISTRICT----------
CREATE OR REPLACE PACKAGE pkg_district IS
    PROCEDURE createDistrict (pNameDistrict VARCHAR2, pCantonId NUMBER, p_result OUT NUMBER);
    PROCEDURE getDistrictsFromCanton(pid_canton IN NUMBER, p_districtlist_refcur IN OUT SYS_REFCURSOR);
    PROCEDURE deleteDistrict(pid_district NUMBER,p_result OUT NUMBER);
    PROCEDURE updateDistrictName(p_id_district NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updateDistrictIsEnabled(p_id_district NUMBER, p_enabled NUMBER, p_result OUT NUMBER);
END pkg_district;

CREATE OR REPLACE PACKAGE BODY pkg_district AS
    ------PROCEDURE INSERT------
    PROCEDURE createDistrict (pNameDistrict VARCHAR2, pCantonId NUMBER,p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.district(id_district, district_name, id_canton)
        VALUES(pc.s_district.nextval, pNameDistrict, pCantonId);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting district');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURES UPDATE------
    PROCEDURE updateDistrictName(p_id_district NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE district
        SET district_name = p_new_name
        WHERE id_district = p_id_district;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateDistrictIsEnabled(p_id_district NUMBER, p_enabled NUMBER,p_result OUT NUMBER)IS
    BEGIN
        UPDATE district
        SET is_enabled = p_enabled
        WHERE id_district = p_id_district;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteDistrict(pid_district NUMBER,p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM district
        WHERE id_district = pid_district;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
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
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_district;

----------PACKAGE COMMUNITY----------
CREATE OR REPLACE PACKAGE pkg_community IS
    PROCEDURE createCommunity (pNameCommunity VARCHAR2, pDistrictId NUMBER,p_result OUT NUMBER);
    PROCEDURE getCommunitiesFromDistrict(pid_district IN NUMBER, p_communitylist_refcur IN OUT SYS_REFCURSOR);
    PROCEDURE deleteCommunity(pid_community NUMBER,p_result OUT NUMBER);
    PROCEDURE updateCommunityName(p_id_community NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updateCommunityIsEnabled(p_id_community NUMBER, p_enabled NUMBER, p_result OUT NUMBER);
END pkg_community;

CREATE OR REPLACE PACKAGE BODY pkg_community AS
    ------PROCEDURE INSERT------
    PROCEDURE createCommunity (pNameCommunity VARCHAR2, pDistrictId NUMBER,p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.community(id_community, community_name, id_district)
        VALUES(pc.s_community.nextval, pNameCommunity, pDistrictId);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting community');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURES UPDATE------
    PROCEDURE updateCommunityName(p_id_community NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE community
        SET community_name = p_new_name
        WHERE id_community = p_id_community;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateCommunityIsEnabled(p_id_community NUMBER, p_enabled NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE community
        SET is_enabled = p_enabled
        WHERE id_community = p_id_community;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteCommunity(pid_community NUMBER,p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM community
        WHERE id_community = pid_community;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
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
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_community;

----------PACKAGE PROPOSAL----------
CREATE OR REPLACE PACKAGE pkg_proposal IS
    PROCEDURE createProposal(pTitle VARCHAR2, pApproxBudget NUMBER,
                             pDescription VARCHAR2, pCategoryCode NUMBER, pIdNumber NUMBER, p_result OUT NUMBER);
    PROCEDURE deleteProposal(pid_proposal NUMBER);
    PROCEDURE getProposalInfo(pid_proposal IN NUMBER, pout_title OUT VARCHAR2, pout_category_name OUT VARCHAR2,
                              pout_description OUT VARCHAR2, pout_approximate_budget OUT NUMBER, pout_proposed_by OUT VARCHAR2, 
                              pout_proposal_date OUT VARCHAR2, pout_community_name OUT VARCHAR2, p_comments_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getProposals(pid_number NUMBER, p_category_filter NUMBER, p_vote_filter NUMBER, pafter_date VARCHAR2, 
                           pbefore_date VARCHAR2, p_proposal_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getTopCommunityProposals(p_top_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getTopVotedProposals(p_top_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getProposalsByUser(pid_number IN NUMBER, p_proposal_cursor IN OUT SYS_REFCURSOR, ptotal_proposals OUT NUMBER);
    --
    PROCEDURE getStatisticsPerCategory(p_proposal_cat_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerCountry(p_proposal_country_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerProvince(p_proposal_province_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerCanton(p_proposal_canton_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerDistrict(p_proposal_district_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerCommunity(p_proposal_community_cursor IN OUT SYS_REFCURSOR);
    FUNCTION countVotes(pid_proposal NUMBER) RETURN NUMBER;
    PROCEDURE updateProposalDescription(p_id_proposal NUMBER, p_new_description VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updateProposalTitle(p_id_proposal NUMBER, p_new_title VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updateProposalBudget(p_id_proposal NUMBER, p_budget NUMBER,p_result OUT NUMBER);
    PROCEDURE updateProposalIsEnabled(p_id_proposal NUMBER, p_enabled NUMBER,p_result OUT NUMBER);
END pkg_proposal;

CREATE OR REPLACE PACKAGE BODY pkg_proposal AS
    ------PROCEDURE INSERT------
    PROCEDURE createProposal(pTitle VARCHAR2, pApproxBudget NUMBER,
                         pDescription VARCHAR2, pCategoryCode NUMBER, pIdNumber NUMBER, p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.proposal(id_proposal, category_code, id_number, description, approximate_budget, title, proposal_date)
        VALUES (pc.s_proposal.nextval, pCategoryCode, pIdNumber, pDescription, pApproxBudget, pTitle, SYSDATE); 
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting proposal');
		    DBMS_OUTPUT.PUT_LINE(SQLERRM);
		    DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURES UPDATE------
    PROCEDURE updateProposalDescription(p_id_proposal NUMBER, p_new_description VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE proposal
        SET description = p_new_description
        WHERE id_proposal = p_id_proposal;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateProposalTitle(p_id_proposal NUMBER, p_new_title VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE proposal
        SET title = p_new_title
        WHERE id_proposal = p_id_proposal;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateProposalBudget(p_id_proposal NUMBER, p_budget NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE proposal
        SET approximate_budget = p_budget
        WHERE id_proposal = p_id_proposal;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    PROCEDURE updateProposalIsEnabled(p_id_proposal NUMBER, p_enabled NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE proposal
        SET is_enabled =p_enabled
        WHERE id_proposal = p_id_proposal;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    ------PROCEDURE getProposalInfo------
    PROCEDURE getProposalInfo(pid_proposal IN NUMBER, pout_title OUT VARCHAR2, pout_category_name OUT VARCHAR2,
                              pout_description OUT VARCHAR2, pout_approximate_budget OUT NUMBER, pout_proposed_by OUT VARCHAR2, 
                              pout_proposal_date OUT VARCHAR2, pout_community_name OUT VARCHAR2, p_comments_cursor IN OUT SYS_REFCURSOR) IS
    BEGIN
        SELECT p.title, c.category_name, p.description, p.approximate_budget, 
        pe.first_name||' '||pe.first_last_name||' '||pe.second_last_name full_name, TO_CHAR(p.proposal_date, 'DD/MM/YYYY') date_of_proposition,
        co.community_name
        INTO
        pout_title, pout_category_name, pout_description, pout_approximate_budget, pout_proposed_by, pout_proposal_date, pout_community_name
        FROM pc.proposal p INNER JOIN pc.category c
        ON p.category_code = c.category_code
        INNER JOIN pc.person pe
        ON p.id_number = pe.id_number
        INNER JOIN pc.community co
        ON pe.id_community = co.id_community
        WHERE p.id_proposal = pid_proposal;
        
        OPEN p_comments_cursor FOR
        SELECT pe.first_name||' '||pe.first_last_name||' '||pe.second_last_name full_name, pcom.text, TO_CHAR(pcom.date_time, 
               'DD/MM/YYYY HH24:MI:SS') time_of_comment
               FROM pc.proposal_comment pcom INNER JOIN pc.person pe
               ON pcom.id_number = pe.id_number
               WHERE pcom.id_proposal = pid_proposal
               ORDER BY pcom.date_time DESC;
               
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error fetching proposal info');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteProposal(pid_proposal NUMBER) IS
    BEGIN
        DELETE FROM proposal
        WHERE id_proposal = pid_proposal;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
    END;
    
    ------FUNCTION countVotes------
    FUNCTION countVotes(pid_proposal NUMBER) RETURN NUMBER IS
        v_vote_amount NUMBER(8);
    BEGIN 
        SELECT count(vxp.id_number) INTO v_vote_amount
        FROM pc.vote_x_person vxp
        WHERE vxp.id_proposal = NVL(pid_proposal, vxp.id_proposal);
        RETURN v_vote_amount;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error counting votes');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            RETURN -1;
    END;
    
    ------PROCEDURE getProposals------
    PROCEDURE getProposals(pid_number NUMBER, p_category_filter NUMBER, p_vote_filter NUMBER, pafter_date VARCHAR2, 
                           pbefore_date VARCHAR2, p_proposal_cursor IN OUT SYS_REFCURSOR) IS
        vstart_date DATE;
        vend_date DATE;
	vid_community NUMBER(8);
    BEGIN
        vstart_date := TO_DATE(pafter_date, 'DD/MM/YYYY');
        vend_date := TO_DATE(pbefore_date, 'DD/MM/YYYY');
	
	SELECT id_community INTO vid_community
	FROM pc.person
	WHERE id_number = pid_number;
    
        OPEN p_proposal_cursor FOR
            SELECT c.category_name, p.title, p.description, p.approximate_budget, TO_CHAR(p.proposal_date),
                   pe.first_name||' '||pe.first_last_name name, fav
            FROM pc.proposal p INNER JOIN pc.person pe
            ON p.id_number = pe.id_number
            INNER JOIN pc.category c
            ON p.category_code = c.category_code
            FULL OUTER JOIN (SELECT category_code fav
                             FROM pc.category_x_person cxp
                             WHERE cxp.id_number = pid_number)
            ON p.category_code = fav
            WHERE p.category_code = NVL(p_category_filter, p.category_code)
            AND (p.proposal_date BETWEEN NVL(vstart_date, p.proposal_date) AND NVL(vend_date, p.proposal_date))
            AND pkg_proposal.countVotes(p.id_proposal) >= NVL(p_vote_filter, 0)
	    AND pe.id_community = vid_community
            ORDER BY fav NULLS LAST, c.category_name;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error getting proposals');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getTopCommunityProposals------
    PROCEDURE getTopCommunityProposals(p_top_cursor IN OUT SYS_REFCURSOR) IS
    
    BEGIN
        OPEN p_top_cursor FOR
            WITH top_communities AS (SELECT communities, proposal_amount, RANK() OVER(ORDER BY proposal_amount DESC) proposal_rank
            FROM (SELECT c.community_name communities, count(p.id_proposal) proposal_amount
                  FROM pc.proposal p INNER JOIN pc.person pe
                  ON p.id_number = pe.id_number
                  INNER JOIN pc.community c
                  ON pe.id_community = c.id_community
                  GROUP BY c.community_name))
            SELECT communities, proposal_amount, proposal_rank
            FROM top_communities
            WHERE proposal_rank <= 5; --Aqui va el parametro
            
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error getting top');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    
    ------PROCEDURE getTopVotedProposals------
    PROCEDURE getTopVotedProposals(p_top_cursor IN OUT SYS_REFCURSOR) IS
    
    BEGIN
        OPEN p_top_cursor FOR
        WITH top_voted AS (SELECT proposal_id, proposal_title, votes, RANK() OVER(ORDER BY votes DESC) vote_rank
        FROM (SELECT p.id_proposal proposal_id, p.title proposal_title, COUNT(vxp.id_number) votes
              FROM pc.proposal p INNER JOIN pc.vote_x_person vxp
              ON p.id_proposal = vxp.id_proposal
              GROUP BY p.id_proposal, p.title))
        SELECT proposal_id, proposal_title, votes, vote_rank
        FROM top_voted
        WHERE vote_rank <= 5; --Aqui va el parametro
    END;
    
    ------PROCEDURE getProposalsByUser------
    PROCEDURE getProposalsByUser(pid_number IN NUMBER, p_proposal_cursor IN OUT SYS_REFCURSOR, ptotal_proposals OUT NUMBER) IS
    BEGIN
        OPEN p_proposal_cursor FOR
            SELECT p.title, p.description, p.approximate_budget, p.proposal_date, c.category_name
            FROM pc.proposal p INNER JOIN pc.category c
            ON p.category_code = c.category_code
            WHERE p.id_number = pid_number;
            
        SELECT COUNT(p.id_proposal) INTO ptotal_proposals
        FROM pc.proposal p
        WHERE p.id_number = pid_number;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error getting user proposals.');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ptotal_proposals:= -1;
    END;
    
    ------PROCEDURE getStatisticsPerCategory------
    PROCEDURE getStatisticsPerCategory(p_proposal_cat_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalProposals NUMBER(10);
    BEGIN
        SELECT count (1)
        INTO vnTotalProposals
        FROM pc.proposal;
        
        OPEN p_proposal_cat_cursor FOR
            SELECT c.category_name category, count(1) AS "Number of proposals", count(1)/vnTotalProposals *100 AS "Percentage"
            FROM pc.proposal p INNER JOIN category c
            ON p.category_code = c.category_code
            GROUP BY c.category_name;
            
        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerCountry------
    PROCEDURE getStatisticsPerCountry(p_proposal_country_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalProposals NUMBER(10);
    BEGIN
        SELECT count(1)
        INTO vnTotalProposals
        FROM pc.proposal;
        
        OPEN p_proposal_country_cursor FOR
            SELECT co.country_name country, count(1) AS "Number of proposals", count(1)/vnTotalProposals *100 AS "Percentage"
            FROM pc.proposal p INNER JOIN pc.person pe
            ON p.id_number = pe.id_number
            INNER JOIN pc.community c ON pe.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name;
            
        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerProvince------
    PROCEDURE getStatisticsPerProvince(p_proposal_province_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalProposals NUMBER(10);
    BEGIN
        SELECT count(1)
        INTO vnTotalProposals
        FROM pc.proposal;
        
        OPEN p_proposal_province_cursor FOR
            SELECT co.country_name||','||pr.province_name statIdentifier, count(1) AS "Number of proposals", count(1)/vnTotalProposals *100 AS "Percentage"
            FROM pc.proposal p INNER JOIN pc.person pe
            ON p.id_number = pe.id_number
            INNER JOIN pc.community c ON pe.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name;
            
        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerCanton------
    PROCEDURE getStatisticsPerCanton(p_proposal_canton_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalProposals NUMBER(10);
    BEGIN
        SELECT count(1)
        INTO vnTotalProposals
        FROM pc.proposal;
        
        OPEN p_proposal_canton_cursor FOR
            SELECT co.country_name||','||pr.province_name||','||ca.canton_name statIdentifier, count(1) AS "Number of proposals", count(1)/vnTotalProposals *100 AS "Percentage"
            FROM pc.proposal p INNER JOIN pc.person pe
            ON p.id_number = pe.id_number
            INNER JOIN pc.community c ON pe.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name||','||ca.canton_name;
            
        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerDistrict------
    PROCEDURE getStatisticsPerDistrict(p_proposal_district_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalProposals NUMBER(10);
    BEGIN
        SELECT count(1)
        INTO vnTotalProposals
        FROM pc.proposal;
        
        OPEN p_proposal_district_cursor FOR
            SELECT co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name statIdentifier, count(1) AS "Number of proposals", count(1)/vnTotalProposals *100 AS "Percentage"
            FROM pc.proposal p INNER JOIN pc.person pe
            ON p.id_number = pe.id_number
            INNER JOIN pc.community c ON pe.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name;
            
        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
     ------PROCEDURE getStatisticsPerCommunity------
    PROCEDURE getStatisticsPerCommunity(p_proposal_community_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalProposals NUMBER(10);
    BEGIN
        SELECT count(1)
        INTO vnTotalProposals
        FROM pc.proposal;
        
        OPEN p_proposal_community_cursor FOR
            SELECT co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name||','||c.community_name statIdentifier, count(1) AS "Number of proposals", count(1)/vnTotalProposals *100 AS "Percentage"
            FROM pc.proposal p INNER JOIN pc.person pe
            ON p.id_number = pe.id_number
            INNER JOIN pc.community c ON pe.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name||','||c.community_name;
            
        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_proposal;

----------PACKAGE CATEGORY----------
CREATE OR REPLACE PACKAGE pkg_category IS
    PROCEDURE createCategory(pCategoryName VARCHAR2,p_result OUT NUMBER);
    PROCEDURE deleteCategory(pcategory_code NUMBER,p_result OUT NUMBER);
    PROCEDURE updateCategoryName(p_category_code NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updateCategoryIsEnabled(p_category_code NUMBER,p_enabled NUMBER,p_result OUT NUMBER);
    PROCEDURE getCategories(p_categories_cursor IN OUT SYS_REFCURSOR);
END pkg_category;

CREATE OR REPLACE PACKAGE BODY pkg_category AS

    PROCEDURE getCategories(p_categories_cursor IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_categories_cursor FOR
            SELECT category_code, category_name
            FROM pc.category
            ORDER BY category_name;
        EXCEPTION 
            WHEN CURSOR_ALREADY_OPEN THEN
                DBMS_OUTPUT.PUT_LINE('Cursor is already open');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('General Error');
                DBMS_OUTPUT.PUT_LINE(SQLERRM);
                DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE INSERT------
    PROCEDURE createCategory(pCategoryName VARCHAR2,p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.category(category_code, category_name)
        VALUES (s_category_code.NEXTVAL, pCategoryName);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting category');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURES UPDATE------
    PROCEDURE updateCategoryName(p_category_code NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE category
        SET category_name = p_new_name
        WHERE category_code = p_category_code;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updateCategoryIsEnabled(p_category_code NUMBER,p_enabled NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE category
        SET is_enabled = p_enabled
        WHERE category_code = p_category_code;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteCategory(pcategory_code NUMBER, p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM pc.category
        WHERE category_code = pcategory_code;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
END pkg_category;

----------PACKAGE USER TYPE----------
CREATE OR REPLACE PACKAGE pkg_user_type IS
    PROCEDURE createUserType(pIdUserName VARCHAR2,p_result OUT NUMBER);
    PROCEDURE deleteUserType(pid_user_type NUMBER,p_result OUT NUMBER);
    PROCEDURE updateUserTypeName(pid_user_type NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER);
    PROCEDURE getUserTypes(p_user_types_cursor IN OUT SYS_REFCURSOR);
END pkg_user_type;

CREATE OR REPLACE PACKAGE BODY pkg_user_type AS
    ------PROCEDURE INSERT------
    PROCEDURE createUserType(pIdUserName VARCHAR2,p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.user_type(id_user_type,user_type_name)
        VALUES(s_user_type_id.NEXTVAL,pIdUserName);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting user type');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURE UPDATE------
    PROCEDURE updateUserTypeName(pid_user_type NUMBER, p_new_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE user_type
        SET user_type_name = p_new_name
        WHERE id_user_type = pid_user_type;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteUserType(pid_user_type NUMBER,p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM user_type
        WHERE id_user_type = pid_user_type;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
    
    ------PROCEDURE GET USER TYPES------
    PROCEDURE getUserTypes(p_user_types_cursor IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_user_types_cursor FOR
            SELECT id_user_type, user_type_name
            FROM pc.user_type
            ORDER BY user_type_name desc;
        EXCEPTION 
            WHEN CURSOR_ALREADY_OPEN THEN
                DBMS_OUTPUT.PUT_LINE('Cursor is already open');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('General Error');
                DBMS_OUTPUT.PUT_LINE(SQLERRM);
                DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_user_type;

----------PACKAGE NATIONALITY----------
CREATE OR REPLACE PACKAGE pkg_nationality IS
    PROCEDURE createNationality(pNationalityName VARCHAR2,p_result OUT NUMBER);
    PROCEDURE deleteNationality(pid_nationality NUMBER,p_result OUT NUMBER);
    PROCEDURE updateNationalityName(pid_nationality NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER);
    PROCEDURE updateNationalityIsEnabled(pid_nationality NUMBER, p_enabled NUMBER, p_result OUT NUMBER);
    PROCEDURE getNationalities(p_nationalities_cursor IN OUT SYS_REFCURSOR);
END pkg_nationality;

CREATE OR REPLACE PACKAGE BODY pkg_nationality AS
    ------PROCEDURE INSERT------
    PROCEDURE createNationality(pNationalityName VARCHAR2,p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.nationality(id_nationality, nationality_name)
        VALUES(s_nationality_id.NEXTVAL, pNationalityName);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting nationality');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURES UPDATE------
    PROCEDURE updateNationalityName(pid_nationality NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER)IS
    BEGIN
        UPDATE nationality
        SET nationality_name = p_new_name
        WHERE id_nationality = pid_nationality;
      COMMIT;
      p_result :=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updateNationalityIsEnabled(pid_nationality NUMBER, p_enabled NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE nationality
        SET is_enabled = p_enabled
        WHERE id_nationality = pid_nationality;
      COMMIT;
      p_result :=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteNationality(pid_nationality NUMBER,p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM nationality
        WHERE id_nationality = pid_nationality;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
    
    ------PROCEDURE GET_NATIONALITIES------
    PROCEDURE getNationalities(p_nationalities_cursor IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN p_nationalities_cursor FOR
            SELECT id_nationality, nationality_name
            FROM pc.nationality
            ORDER BY nationality_name;
        EXCEPTION 
            WHEN CURSOR_ALREADY_OPEN THEN
                DBMS_OUTPUT.PUT_LINE('Cursor is already open');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('General Error');
                DBMS_OUTPUT.PUT_LINE(SQLERRM);
                DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
END pkg_nationality;

----------PACKAGE PERSON----------
CREATE OR REPLACE PACKAGE pkg_person IS
    PROCEDURE insertPerson(pId NUMBER, pFirstName VARCHAR2, pFirstLastName VARCHAR2, pSecondLastName VARCHAR2, 
                           pDateOfBirth DATE, pPhoto VARCHAR2,pIdCommunity NUMBER);
    PROCEDURE deletePerson(pid_number NUMBER);
    PROCEDURE getStatisticsPerCountry(p_user_country_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerProvince(p_user_province_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerCanton(p_user_canton_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerDistrict(p_user_district_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getStatisticsPerCommunity(p_user_community_cursor IN OUT SYS_REFCURSOR);
    FUNCTION getAgeRank(p_date_of_birth DATE) RETURN VARCHAR2;
    PROCEDURE getStatisticsUsersAge(p_user_age_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE updatePersonId(p_id_number NUMBER, p_new_id NUMBER,p_result OUT NUMBER);
    PROCEDURE updatePersonFirstName(p_id_number NUMBER, p_new_first_name VARCHAR2,p_result OUT NUMBER);
    PROCEDURE updatePersonFirstLastName(p_id_number NUMBER, p_new_first_last_name VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updatePersonSecLastName(p_id_number NUMBER, p_new_sec_last_name VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updatePersonBirthDate(p_id_number NUMBER, p_new_birth_date DATE,p_result OUT NUMBER);
    PROCEDURE updatePersonIdCommunity(p_id_number NUMBER, p_new_id_community NUMBER, p_result OUT NUMBER);
    PROCEDURE updatePersonPhoto(p_id_number NUMBER,p_new_photo VARCHAR2, p_result OUT NUMBER);
    FUNCTION getPersonIdNumber(p_id_user NUMBER) RETURN NUMBER;
END pkg_person;

CREATE OR REPLACE PACKAGE BODY pkg_person AS
    ------UPDATE PHOTO------
    PROCEDURE updatePersonPhoto(p_id_number NUMBER,p_new_photo VARCHAR2, p_result OUT NUMBER) IS
    BEGIN
        UPDATE person
            SET photo = p_new_photo
            WHERE id_number = p_id_number;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result := 0;
    END;
    
    ------FUNCTION GET ID NUMBER------
    FUNCTION getPersonIdNumber(p_id_user NUMBER) RETURN NUMBER IS
    vn_id_number NUMBER(20);
    BEGIN 
        SELECT u.id_number into vn_id_number
        FROM pc.person_user u
        WHERE u.id_user = p_id_user;
        RETURN vn_id_number;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error getting id person');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            RETURN -1;
    END;
    
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
    ------PROCEDURES UPDATE------
    PROCEDURE updatePersonId(p_id_number NUMBER, p_new_id NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE person
        SET id = p_new_id
        WHERE id_number = p_id_number;
	COMMIT;
    p_result:= 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updatePersonFirstName(p_id_number NUMBER, p_new_first_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE person
        SET first_name = p_new_first_name
        WHERE id_number = p_id_number;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updatePersonFirstLastName(p_id_number NUMBER, p_new_first_last_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE person
        SET first_last_name = p_new_first_last_name
        WHERE id_number = p_id_number;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updatePersonSecLastName(p_id_number NUMBER, p_new_sec_last_name VARCHAR2, p_result OUT NUMBER)IS
    BEGIN
        UPDATE person
        SET second_last_name = p_new_sec_last_name
        WHERE id_number = p_id_number;
	COMMIT;
    p_result:= 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updatePersonBirthDate(p_id_number NUMBER, p_new_birth_date DATE, p_result OUT NUMBER)IS
    BEGIN
        UPDATE person
        SET date_of_birth = p_new_birth_date
        WHERE id_number = p_id_number;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updatePersonIdCommunity(p_id_number NUMBER, p_new_id_community NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE person
        SET id_community = p_new_id_community
        WHERE id_number = p_id_number;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result := 0;
    END;
    ------PROCEDURE DELETE------
    PROCEDURE deletePerson(pid_number NUMBER) IS
    BEGIN
        DELETE FROM person
        WHERE id_number = pid_number;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
    END;
    
    ------PROCEDURE getStatisticsPerCountry------
    PROCEDURE getStatisticsPerCountry(p_user_country_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalUsers NUMBER(10);
    BEGIN
        SELECT count (1)
        INTO vnTotalUsers
        FROM pc.person;

        OPEN p_user_country_cursor FOR
            SELECT co.country_name country, count(1) AS "Number of users", count(1)/vnTotalUsers *100 AS "Percentage"
            FROM pc.person p INNER JOIN pc.community c
            ON p.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name;

        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerProvince------
    PROCEDURE getStatisticsPerProvince(p_user_province_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalUsers NUMBER(10);
    BEGIN
        SELECT count (1)
        INTO vnTotalUsers
        FROM pc.person;

        OPEN p_user_province_cursor FOR
            SELECT co.country_name||','||pr.province_name statIdentifier, count(1) AS "Number of users", count(1)/vnTotalUsers *100 AS "Percentage"
            FROM pc.person p INNER JOIN pc.community c
            ON p.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name;

        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerCanton------
    PROCEDURE getStatisticsPerCanton(p_user_canton_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalUsers NUMBER(10);
    BEGIN
        SELECT count (1)
        INTO vnTotalUsers
        FROM pc.person;

        OPEN p_user_canton_cursor FOR
            SELECT co.country_name||','||pr.province_name||','||ca.canton_name statIdentifier, count(1) AS "Number of users", count(1)/vnTotalUsers *100 AS "Percentage"
            FROM pc.person p INNER JOIN pc.community c
            ON p.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name||','||ca.canton_name;

        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerDistrict------
    PROCEDURE getStatisticsPerDistrict(p_user_district_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalUsers NUMBER(10);
    BEGIN
        SELECT count (1)
        INTO vnTotalUsers
        FROM pc.person;

        OPEN p_user_district_cursor FOR
            SELECT co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name statIdentifier, count(1) AS "Number of users", count(1)/vnTotalUsers *100 AS "Percentage"
            FROM pc.person p INNER JOIN pc.community c
            ON p.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name;

        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------PROCEDURE getStatisticsPerCommunity------
    PROCEDURE getStatisticsPerCommunity(p_user_community_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalUsers NUMBER(10);
    BEGIN
        SELECT count (1)
        INTO vnTotalUsers
        FROM pc.person;

        OPEN p_user_community_cursor FOR
            SELECT co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name||','||c.community_name statIdentifier, count(1) AS "Number of users", count(1)/vnTotalUsers *100 AS "Percentage"
            FROM pc.person p INNER JOIN pc.community c
            ON p.id_community = c.id_community
            INNER JOIN pc.district d ON c.id_district = d.id_district
            INNER JOIN pc.canton ca ON d.id_canton = ca.id_canton
            INNER JOIN pc.province pr ON ca.id_province = pr.id_province
            INNER JOIN pc.country co ON pr.id_country = co.id_country
            GROUP BY co.country_name||','||pr.province_name||','||ca.canton_name||','||d.district_name||','||c.community_name;

        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
    
    ------FUNCTION getAgeRankId------
    FUNCTION getAgeRank(p_date_of_birth DATE) RETURN VARCHAR2 IS
    vnAge NUMBER(3);
    vcRank VARCHAR2(10);
    BEGIN
        vnAge:= FLOOR((SYSDATE - p_date_of_birth)/365.25);
        IF (vnAge BETWEEN 0 AND 18) THEN
            vcRank := '0 a 18';
        ELSIF (vnAge BETWEEN 19 AND 30) THEN
            vcRank := '19 a 30';
        ELSIF (vnAge BETWEEN 30 AND 45) THEN
            vcRank := '30 a 45';
        ELSIF (vnAge BETWEEN 46 AND 55) THEN
            vcRank := '46 a 55';
        ELSIF (vnAge BETWEEN 55 AND 65) THEN
            vcRank := '55 a 65';
        ELSIF (vnAge BETWEEN 66 AND 75) THEN
            vcRank := '66 a 75';
        ELSIF (vnAge BETWEEN 76 AND 85) THEN
            vcRank := '76 a 85';
        ELSE --vnAge > 85
            vcRank := 'mayor a 85';
        END IF;
        RETURN vcRank;
        
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error getting age rank');
                DBMS_OUTPUT.PUT_LINE(SQLERRM);
                DBMS_OUTPUT.PUT_LINE(SQLCODE);
                RETURN '';
    END;
    
    ------PROCEDURE getStatisticsUsersAge------
    PROCEDURE getStatisticsUsersAge(p_user_age_cursor IN OUT SYS_REFCURSOR) IS
    vnTotalUsers NUMBER(10);
    BEGIN
        SELECT count (1)
        INTO vnTotalUsers
        FROM pc.person;
        
        OPEN p_user_age_cursor FOR
            SELECT age_rank, count(1) total, count(1)/vnTotalUsers * 100 percentage
            FROM (SELECT pkg_person.getAgeRank(p.date_of_birth) age_rank FROM pc.person p)
            GROUP BY age_rank;
        
        EXCEPTION 
        WHEN CURSOR_ALREADY_OPEN THEN
            DBMS_OUTPUT.PUT_LINE('Cursor is already open');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('General Error');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);        
    END;
    
END pkg_person;

----------PACKAGE fEMAIL----------
CREATE OR REPLACE PACKAGE pkg_email IS
    PROCEDURE insertEmail(pMail VARCHAR2, pIdNumber NUMBER, p_result OUT NUMBER);
    PROCEDURE deleteEmail(p_mail VARCHAR2, pIdNumber NUMBER, p_result OUT NUMBER);
    PROCEDURE updateEmail(p_id_number NUMBER,p_old_email VARCHAR2 ,p_new_email VARCHAR2,p_result OUT NUMBER);
END pkg_email;

CREATE OR REPLACE PACKAGE BODY pkg_email AS
    ------PROCEDURE INSERT------
    PROCEDURE insertEmail(pMail VARCHAR2, pIdNumber NUMBER, p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.email(mail,id_number)
        VALUES(pMail,pIdNumber);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting email');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
        p_result:=0;
    END;
    ------PROCEDURE UPDATE------
    PROCEDURE updateEmail(p_id_number NUMBER,p_old_email VARCHAR2 ,p_new_email VARCHAR2,p_result OUT NUMBER) IS
    BEGIN
        UPDATE email
        SET mail = p_new_email
        WHERE id_number = p_id_number AND mail = p_old_email;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    ------PROCEDURE DELETE------
    PROCEDURE deleteEmail(p_mail VARCHAR2, pIdNumber NUMBER, p_result OUT NUMBER) IS
    BEGIN
        DELETE FROM email
        WHERE mail = p_mail AND id_number = pIdNumber;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;
    
END pkg_email;

----------PACKAGE TELEPHONE----------
CREATE OR REPLACE PACKAGE pkg_telephone IS
    PROCEDURE insertTelephone(pTelephone NUMBER, pIdNumber NUMBER, p_result OUT NUMBER);
    PROCEDURE deleteTelephone(p_phone_number NUMBER, pIdNumber NUMBER, p_result OUT NUMBER);
    PROCEDURE updateTelephoneNumber(p_id_number NUMBER,p_old_phone NUMBER ,p_new_phone_number NUMBER,p_result OUT NUMBER);
END pkg_telephone;
    
CREATE OR REPLACE PACKAGE BODY pkg_telephone AS
    ------PROCEDURE INSERT------
    PROCEDURE insertTelephone(pTelephone NUMBER, pIdNumber NUMBER, p_result OUT NUMBER) IS
    BEGIN
        INSERT INTO pc.telephone(phone_number,id_number)
        VALUES(pTelephone,pIdNumber);
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting telephone');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
        	DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURE UPDATE------
    PROCEDURE updateTelephoneNumber(p_id_number NUMBER,p_old_phone NUMBER ,p_new_phone_number NUMBER,p_result OUT NUMBER) IS
    BEGIN
        UPDATE telephone
        SET phone_number = p_new_phone_number
        WHERE id_number = p_id_number AND phone_number = p_old_phone;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    ------PROCEDURE DELETE------
    PROCEDURE deleteTelephone(p_phone_number NUMBER, pIdNumber NUMBER, p_result OUT NUMBER)IS
    BEGIN
        DELETE FROM telephone
        WHERE phone_number = p_phone_number AND id_number = pIdNumber;
        COMMIT;
        p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
            p_result:=0;
    END;

END pkg_telephone;
    
----------PACKAGE COMMENT----------
CREATE OR REPLACE PACKAGE pkg_comment IS
    PROCEDURE insertComment(pIdNumber NUMBER, pIdProposal NUMBER, pText VARCHAR2);
    PROCEDURE deleteComment(p_code_comment NUMBER);
    PROCEDURE updateCommentText(p_code_comment NUMBER, p_new_text VARCHAR2,p_result OUT NUMBER);
END pkg_comment;

CREATE OR REPLACE PACKAGE BODY pkg_comment AS
    ------PROCEDURE INSERT------
    PROCEDURE insertComment(pIdNumber NUMBER, pIdProposal NUMBER, pText VARCHAR2) IS
    BEGIN
        INSERT INTO pc.proposal_comment(code_comment,id_number,id_proposal,text,date_time)
        VALUES(s_comment_code.NEXTVAL, pIdNumber, pIdProposal, pText, SYSDATE);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error inserting comment');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    ------PROCEDURE UPDATE------
    PROCEDURE updateCommentText(p_code_comment NUMBER, p_new_text VARCHAR2,p_result OUT NUMBER)IS
    BEGIN
        UPDATE proposal_comment
        SET text = p_new_text
        WHERE code_comment = p_code_comment;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
            p_result:=0;
    END;
    ------PROCEDURE DELETE------
    PROCEDURE deleteComment(p_code_comment NUMBER) IS
    BEGIN
        DELETE FROM proposal_comment
        WHERE code_comment = p_code_comment;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
    END;
    
END pkg_comment;
    
----------PACKAGE VOTE X PERSON----------
CREATE OR REPLACE PACKAGE pkg_vote_x_person IS
    PROCEDURE insertVote(pIdProposal NUMBER, pIdNumber NUMBER);
    PROCEDURE deleteVote(pid_number NUMBER, pid_proposal NUMBER);
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
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteVote(pid_number NUMBER, pid_proposal NUMBER) IS
    BEGIN
        DELETE FROM vote_x_person
        WHERE id_number = pid_number
        AND id_proposal = pid_proposal;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
    END;
    
END pkg_vote_x_person;
    
----------PACKAGE CATEGORY X PERSON----------
CREATE OR REPLACE PACKAGE pkg_category_x_person IS
    PROCEDURE insertFavoriteCategory(pIdNumber NUMBER, pCategoryCode NUMBER);
    PROCEDURE deleteFavoriteCategory(pIdNumber NUMBER, pCategoryCode NUMBER);
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
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteFavoriteCategory(pIdNumber NUMBER, pCategoryCode NUMBER) IS
    BEGIN
        DELETE FROM category_x_person
        WHERE id_number = pidNumber
        AND category_code = pcategoryCode;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error deleting favorite');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    
END pkg_category_x_person;
    
----------PACKAGE USER----------
CREATE OR REPLACE PACKAGE pkg_user IS
    PROCEDURE insertUser(pPassword VARCHAR2, pIdNumber NUMBER, pIdUserType NUMBER, pUserName VARCHAR2);
    PROCEDURE deleteUser(pid_user NUMBER);
    PROCEDURE checkLogin(p_username IN VARCHAR2, p_password IN VARCHAR2, pid_user OUT NUMBER, p_user_type OUT VARCHAR2, p_result IN OUT NUMBER);
    PROCEDURE registerUser(p_id NUMBER, pfirst_name VARCHAR2, pfirst_last_name VARCHAR2, psecond_last_name VARCHAR2, pdate_of_birth VARCHAR2,
                           pphoto VARCHAR2, pid_community NUMBER, puser_name VARCHAR2, puser_password VARCHAR2, pid_user_type NUMBER,
                           p_email VARCHAR2, p_phone_number NUMBER, p_id_nationality NUMBER, p_register_result OUT NUMBER);
    PROCEDURE updateUserPassword(p_id_user NUMBER,p_old_password VARCHAR2,p_new_password VARCHAR2, p_result OUT NUMBER);
    PROCEDURE updateUserType(p_id_user NUMBER,p_new_type NUMBER,p_result OUT NUMBER);
    PROCEDURE updateUserName(p_id_user NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER);
    FUNCTION getPersonsIdCommunity(pid_user IN NUMBER) RETURN NUMBER;
END pkg_user;

CREATE OR REPLACE PACKAGE BODY pkg_user AS
    ------FUNCTION GET ID COMMUNITY-------
    FUNCTION getPersonsIdCommunity(pid_user IN NUMBER) RETURN NUMBER IS
    vn_id_community NUMBER(6);
    BEGIN
        SELECT p.id_community INTO vn_id_community
        FROM pc.person p
        INNER JOIN pc.person_user u
        ON p.id_number = u.id_number
        WHERE u.id_user = pid_user;
        RETURN vn_id_community;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error getting community id');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            RETURN -1;
    END;
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
    ------PROCEDURES UPDATE------
    PROCEDURE updateUserPassword(p_id_user NUMBER,p_old_password VARCHAR2,p_new_password VARCHAR2, p_result OUT NUMBER)IS
    vPassword VARCHAR2(50);
    
    BEGIN
        SELECT p. user_password into vPassword
        FROM pc.person_user p
        WHERE p.id_user = p_id_user;
    
        UPDATE person_user
        SET user_password = p_new_password
        WHERE id_user = p_id_user AND vPassword = p_old_password;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
  	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updateUserType(p_id_user NUMBER,p_new_type NUMBER,p_result OUT NUMBER)IS
    BEGIN
        UPDATE person_user
        SET id_user_type = p_new_type
        WHERE id_user = p_id_user;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updateUserName(p_id_user NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER)IS
    BEGIN
        UPDATE person_user
        SET user_name = p_new_name
        WHERE id_user = p_id_user;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    ------PROCEDURE DELETE------
    PROCEDURE deleteUser(pid_user NUMBER) IS
    BEGIN
        DELETE FROM person_user
        WHERE id_user = pid_user;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
    END;
    
    ------PROCEDURE registerUser------
    PROCEDURE registerUser(p_id NUMBER, pfirst_name VARCHAR2, pfirst_last_name VARCHAR2, psecond_last_name VARCHAR2, pdate_of_birth VARCHAR2,
                           pphoto VARCHAR2, pid_community NUMBER, puser_name VARCHAR2, puser_password VARCHAR2, pid_user_type NUMBER,
                           p_email VARCHAR2, p_phone_number NUMBER, p_id_nationality NUMBER, p_register_result OUT NUMBER) IS
        vid_number NUMBER(20);   
    BEGIN
        vid_number := pc.s_person_id.nextval;
        INSERT INTO pc.person(id_number, id, first_name, first_last_name, second_last_name, date_of_birth, photo, id_community)
        VALUES (vid_number, p_id, pfirst_name, pfirst_last_name, psecond_last_name,
                TO_DATE(pdate_of_birth, 'DD/MM/YYYY'), pphoto, pid_community);
                
        INSERT INTO pc.person_user(id_user, user_name, user_password, id_number, id_user_type)
        VALUES (pc.s_user_id.nextval, puser_name, puser_password, vid_number, pid_user_type);
        
        INSERT INTO pc.email(id_number, mail)
        VALUES (vid_number, p_email);
        
        INSERT INTO pc.telephone(id_number, phone_number)
        VALUES (vid_number, p_phone_number);
        
        INSERT INTO pc.nationality_x_person(id_number, id_nationality)
        VALUES (vid_number, p_id_nationality);
        COMMIT;
	p_register_result:= 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error signing up user');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
	    p_register_result:= 0;
    END;
    ------PROCEDURE checkLogin------
    PROCEDURE checkLogin(p_username IN VARCHAR2, p_password IN VARCHAR2, pid_user OUT NUMBER, p_user_type OUT VARCHAR2, p_result IN OUT NUMBER) IS
    BEGIN
        SELECT pu.id_user, ut.user_type_name INTO pid_user, p_user_type
        FROM pc.person_user pu inner join pc.user_type ut
        ON pu.id_user_type = ut.id_user_type
        WHERE pu.user_name = p_username
        AND pu.user_password = p_password;
        p_result := 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Wrong username or password');
            p_result := 0;
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Error logging in');
            p_result:=0;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error logging in');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            p_result :=0;
    END;
    
END pkg_user;
    
----------PACKAGE NATIONALITY X PERSON----------
CREATE OR REPLACE PACKAGE pkg_nationality_x_person IS
    PROCEDURE insertNationalityXPerson(pIdNumber NUMBER, pIdNationality NUMBER);
    PROCEDURE updateNationalityXPerson(pIdNumber NUMBER,pIdNationality NUMBER, p_result OUT NUMBER);
END pkg_nationality_x_person;

CREATE OR REPLACE PACKAGE BODY pkg_nationality_x_person AS
PROCEDURE updateNationalityXPerson(pIdNumber NUMBER,pIdNationality NUMBER, p_result OUT NUMBER)IS
    BEGIN
        UPDATE nationality_x_person
            SET id_nationality = pIdNationality
            WHERE id_number = pIdNumber;
	COMMIT;
    p_result := 1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result := 0;
    END;
    
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
    
    ------PROCEDURE DELETE------
    
END pkg_nationality_x_person;

----------PACKAGE PARAMETER----------
CREATE OR REPLACE PACKAGE pkg_parameter IS
    PROCEDURE insertParameter(pValue NUMBER, pName VARCHAR2);
    PROCEDURE deleteParameter(pid_parameter NUMBER);
    PROCEDURE updateParameterValue(p_id_parameter NUMBER, p_new_value NUMBER,p_result OUT NUMBER);
    PROCEDURE updateParameterName(p_id_parameter NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER);
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
    PROCEDURE updateParameterValue(p_id_parameter NUMBER, p_new_value NUMBER,p_result OUT NUMBER)IS
    BEGIN
        UPDATE parameter
        SET parameter_value = p_new_value
        WHERE id_parameter = p_id_parameter;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    
    PROCEDURE updateParameterName(p_id_parameter NUMBER, p_new_name VARCHAR2,p_result OUT NUMBER)IS
    BEGIN
        UPDATE parameter
        SET parameter_name = p_new_name
        WHERE id_parameter = p_id_parameter;
	COMMIT;
    p_result:=1;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
	    ROLLBACK;
        p_result:=0;
    END;
    ------PROCEDURE DELETE------
    PROCEDURE deleteParameter(pid_parameter NUMBER) IS
    BEGIN
        DELETE FROM pc.parameter
        WHERE id_parameter = pid_parameter;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al eliminar');
            ROLLBACK;
    END;
    
END pkg_parameter;
		 
		  
--En pcadmin
		  

----------PACKAGE PASSWORD_LOG----------
CREATE OR REPLACE PACKAGE pkg_password_log IS
    PROCEDURE getPasswordLogReport(pfilter_name VARCHAR2, pfilter_middle_name VARCHAR2, pfilter_last_name VARCHAR2,
                                   pfilter_username VARCHAR2, pfilter_id NUMBER, p_report_cursor IN OUT SYS_REFCURSOR);
    PROCEDURE getPasswordLogReportByDates(pfilter_name VARCHAR2, pfilter_middle_name VARCHAR2, pfilter_last_name VARCHAR2,
                                   pfilter_username VARCHAR2, pfilter_id NUMBER, pfilter_start_date VARCHAR2,
                                   pfilter_end_date VARCHAR2, p_report_cursor IN OUT SYS_REFCURSOR);
END pkg_password_log;

CREATE OR REPLACE PACKAGE BODY pkg_password_log IS

    ------PROCEDURE getPasswordReport------
    PROCEDURE getPasswordLogReport(pfilter_name VARCHAR2, pfilter_middle_name VARCHAR2, pfilter_last_name VARCHAR2,
                                   pfilter_username VARCHAR2, pfilter_id NUMBER, p_report_cursor IN OUT SYS_REFCURSOR) IS
        vdate_limit DATE;
        vcurrent_date DATE;
    BEGIN
        vcurrent_date := trunc(SYSDATE);
        vdate_limit := vcurrent_date - 10;
        OPEN p_report_cursor FOR
            SELECT pu.user_name, pe.first_name||' '||pe.first_last_name||' '||pe.second_last_name full_name, pe.id, vcurrent_date - pwc.doc
            FROM pc.person_user pu INNER JOIN pc.person pe
            ON pu.id_number = pe.id_number
            INNER JOIN (SELECT id_user, trunc(date_of_change) doc
                        FROM pcadmin.password_change
                        WHERE date_of_change > vdate_limit) pwc
            ON pu.id_user = pwc.id_user
            WHERE pu.user_name = NVL(pfilter_username, pu.user_name)
            AND pe.first_name = NVL(pfilter_name, pe.first_name)
            AND pe.first_last_name = NVL(pfilter_middle_name, pe.first_last_name)
            AND pe.second_last_name = NVL(pfilter_last_name, pe.second_last_name)
            AND pe.id = NVL(pfilter_id, pe.id);
    END;
    
    ------PROCEDURE getPasswordReportByDates------
    PROCEDURE getPasswordLogReportByDates(pfilter_name VARCHAR2, pfilter_middle_name VARCHAR2, pfilter_last_name VARCHAR2,
                                   pfilter_username VARCHAR2, pfilter_id NUMBER, pfilter_start_date VARCHAR2,
                                   pfilter_end_date VARCHAR2, p_report_cursor IN OUT SYS_REFCURSOR) IS
        vstart_date DATE;
        vend_date DATE;
    BEGIN
        vstart_date := TO_DATE(pfilter_start_date, 'DD/MM/YYYY');
        vend_date := TO_DATE(pfilter_end_date, 'DD/MM/YYYY');
        OPEN p_report_cursor FOR
            SELECT pu.user_name, pe.first_name||' '||pe.first_last_name||' '||pe.second_last_name full_name, pe.id, pwc.date_of_change
            FROM pc.person_user pu INNER JOIN pc.person pe
            ON pu.id_number = pe.id_number
            INNER JOIN pcadmin.password_change pwc
            ON pu.id_user = pwc.id_user
            WHERE pu.user_name = NVL(pfilter_username, pu.user_name)
            AND pe.first_name = NVL(pfilter_name, pe.first_name)
            AND pe.first_last_name = NVL(pfilter_middle_name, pe.first_last_name)
            AND pe.second_last_name = NVL(pfilter_last_name, pe.second_last_name)
            AND pe.id = NVL(pfilter_id, pe.id)
            AND pwc.date_of_change BETWEEN NVL(vstart_date, pwc.date_of_change) AND NVL(vend_date, pwc.date_of_change);
    END;
END pkg_password_log;

----------PACKAGE DAILY_TOP----------
CREATE OR REPLACE PACKAGE pkg_daily_top AS
    PROCEDURE generateDailyReport;
    PROCEDURE getReportFromDate(pDateChar VARCHAR2, preport_cursor IN OUT SYS_REFCURSOR);
END pkg_daily_top;

CREATE OR REPLACE PACKAGE BODY pkg_daily_top AS

    ------PROCEDURE generateDailyReport------
    PROCEDURE generateDailyReport IS
        vid_proposal NUMBER(8);
        vtop_date DATE;
        CURSOR ranking_cursor IS
        WITH voteRanking AS (SELECT community_id, proposal_id, votes, RANK() OVER(PARTITION BY community_id ORDER BY votes DESC) vote_rank
            FROM(SELECT c.id_community community_id, p.id_proposal proposal_id, pkg_proposal.countVotes(p.id_proposal) votes
                FROM pc.proposal p INNER JOIN pc.person pe
                ON p.id_number = pe.id_number
                FULL OUTER JOIN pc.community c
                ON pe.id_community = c.id_community))
        SELECT proposal_id
        FROM voteRanking
        WHERE vote_rank = 1 AND proposal_id IS NOT NULL;
    BEGIN
        vtop_date := SYSDATE;
        OPEN ranking_cursor;
        LOOP
            FETCH ranking_cursor INTO vid_proposal;
            EXIT WHEN ranking_cursor%NOTFOUND;
            INSERT INTO pcadmin.daily_top(id_top, id_proposal, top_date)
            VALUES (s_daily_top_id.nextval, vid_proposal, vtop_date);
        END LOOP;
        CLOSE ranking_cursor;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error generating job report');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            ROLLBACK;
    END;
    
    PROCEDURE getReportFromDate(pDateChar VARCHAR2, preport_cursor IN OUT SYS_REFCURSOR) IS
        vDateFilter DATE;
    BEGIN
        vDateFilter := trunc(TO_DATE(pdatechar, 'DD/MM/YYYY'));
        OPEN preport_cursor FOR
            SELECT p.id_proposal, p.title, c.community_name, dt.top_date
            FROM pcadmin.daily_top dt INNER JOIN pc.proposal p
                ON dt.id_proposal = p.id_proposal
                INNER JOIN pc.person pe
                ON p.id_number = pe.id_number
                INNER JOIN pc.community c
                ON pe.id_community = c.id_community
            WHERE trunc(dt.top_date) = NVL(vDateFilter, trunc(dt.top_date));
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error fetching job report');
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
    END;
END pkg_daily_top;
