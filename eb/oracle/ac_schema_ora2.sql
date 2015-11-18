/*
#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
*/

spool eo_schema_create.log

DROP USER ACCESSCACHE CASCADE;

CREATE USER ACCESSCACHE identified by acc3ssca1 default tablespace SMART_ACCT temporary tablespace temp account unlock;

GRANT CONNECT TO ACCESSCACHE;
GRANT RESOURCE TO ACCESSCACHE;

CONNECT ACCESSCACHE/acc3ssca1



ALTER TABLE Access_Cache DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Access_Cache DROP CONSTRAINT XAK1Access_Cache CASCADE  DROP INDEX;

DROP INDEX XPKAccess_Cache;

DROP INDEX XAK1Access_Cache;


CREATE TABLE Access_Cache
(
	Access_Cache_ID      INTEGER NOT NULL ,
	User_ID              INTEGER NULL ,
	Resource_ID          INTEGER NULL ,
	Virtual_Account_ID   INTEGER NULL ,
	Smart_Account_ID     INTEGER NULL 
); 

CREATE UNIQUE INDEX XPKAccess_Cache ON Access_Cache
(Access_Cache_ID   ASC);

ALTER TABLE Access_Cache
	ADD CONSTRAINT  XPKAccess_Cache PRIMARY KEY (Access_Cache_ID);

CREATE UNIQUE INDEX XAK1Access_Cache ON Access_Cache
(User_ID   ASC,Resource_ID   ASC,Virtual_Account_ID   ASC,Access_Cache_ID   ASC);

ALTER TABLE Access_Cache
ADD CONSTRAINT  XAK1Access_Cache UNIQUE (User_ID,Resource_ID,Virtual_Account_ID,Access_Cache_ID);

/*
CREATE  TRIGGER  tD_Access_Cache AFTER DELETE ON Access_Cache for each row
-- ERwin Builtin Trigger
-- DELETE trigger on Access_Cache
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* Access_Cache  Role_Resource on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000d1a6", PARENT_OWNER="", PARENT_TABLE="Access_Cache"
    CHILD_OWNER="", CHILD_TABLE="Role_Resource"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_39", FK_COLUMNS="Access_Cache_ID" */
  --  UPDATE Role_Resource
  --    SET
        /* %SetFK(Role_Resource,NULL) */
  --      Role_Resource.Access_Cache_ID = NULL
  --    WHERE
        /* %JoinFKPK(Role_Resource,:%Old," = "," AND") */
  --      Role_Resource.Access_Cache_ID = :old.Access_Cache_ID;


-- ERwin Builtin Trigger
--END;
--/
/*
CREATE  TRIGGER tU_Access_Cache AFTER UPDATE ON Access_Cache for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on Access_Cache
DECLARE NUMROWS INTEGER;
BEGIN
  /* Access_Cache  Role_Resource on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000fafe", PARENT_OWNER="", PARENT_TABLE="Access_Cache"
    CHILD_OWNER="", CHILD_TABLE="Role_Resource"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="",
    FK_CONSTRAINT="R_39", FK_COLUMNS="Access_Cache_ID" */
--  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
--    :old.Access_Cache_ID <> :new.Access_Cache_ID
--  THEN
--    UPDATE Role_Resource
--      SET
        /* %SetFK(Role_Resource,NULL) */
--        Role_Resource.Access_Cache_ID = NULL
--      WHERE
        /* %JoinFKPK(Role_Resource,:%Old," = ",",") */
--        Role_Resource.Access_Cache_ID = :old.Access_Cache_ID;
--  END IF;
-- ERwin Builtin Trigger
--END;
--/

spool off
