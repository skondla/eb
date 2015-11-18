/*
#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
*/

spool sa_schema_create.log

--CREATE TABLESPACE SMART_ACCT datafile '+DATA' size 1024M autoextend on;

DROP USER SMARTACCT CASCADE;

CREATE USER SMARTACCT identified by smar5Acc5 default tablespace SMART_ACCT temporary tablespace temp account unlock;

GRANT CONNECT TO SMARTACCT;
GRANT RESOURCE TO SMARTACCT;

CONNECT SMARTACCT/smar5Acc5 

ALTER TABLE Virtual_Account
DROP CONSTRAINT VA_FK;

ALTER TABLE Virtual_Account DROP CONSTRAINT R_42;

ALTER TABLE Role_Resource DROP CONSTRAINT R_26;

ALTER TABLE Role_Resource DROP CONSTRAINT R_29;

ALTER TABLE Role_Resource DROP CONSTRAINT R_39;

--ALTER TABLE Permissions DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Role DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Smart_Account DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Users DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Virtual_Account DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Resource_Master DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Role_Resource DROP PRIMARY KEY CASCADE  DROP INDEX;

--DROP INDEX XPKPermissions;

DROP INDEX XPKRole;

DROP INDEX XPKSmart_Account;

DROP INDEX XPKUser;

DROP INDEX XPKVirtual_Account;

DROP INDEX XIF1Virtual_Account;

DROP INDEX XIF3Virtual_Account;

DROP INDEX XPKResource_Master;

DROP INDEX XPKRole_Resource;

DROP INDEX XIF2Role_Resource;

DROP INDEX XIF3Role_Resource;

DROP INDEX XIF4Role_Resource;

	
CREATE TABLE Resource_Master
(
	Resource_ID          INTEGER NOT NULL ,
	Resource_Name        VARCHAR2(50) NULL ,
	Resource_Description VARCHAR2(100) NULL ,
	Created_On           DATE NULL ,
	Created_By           VARCHAR2(30) NULL,
	Last_Updated_On      DATE NULL 
);

CREATE UNIQUE INDEX XPKResource_Master ON Resource_Master (Resource_ID   ASC);

ALTER TABLE Resource_Master 	ADD CONSTRAINT  XPKResource_Master PRIMARY KEY (Resource_ID);

CREATE TABLE Roles
(
	Role_ID              INTEGER NOT NULL ,
	Role_Name            VARCHAR2(30) NULL ,
	Role_Description     VARCHAR2(100) NULL ,
	Role_Type            VARCHAR2(20) NULL ,
	Created_on           DATE NULL ,
	Last_updated_on      DATE NULL ,
	Created_By           VARCHAR2(30) NULL 
);

CREATE UNIQUE INDEX XPKRoles ON Roles (Role_ID   ASC);

ALTER TABLE Roles ADD CONSTRAINT  XPKRole PRIMARY KEY (Role_ID);

CREATE TABLE Role_Resource
(
	Role_Resource_ID     INTEGER NOT NULL ,
--	Access_Cache_ID      INTEGER NOT NULL ,
	Role_ID              INTEGER NOT NULL ,
	Resource_ID          INTEGER NOT NULL ,
	Created_on           DATE NULL ,
	Created_by           VARCHAR2(20) NULL 
);

CREATE UNIQUE INDEX XPKRole_Resource ON Role_Resource (Role_Resource_ID   ASC);

ALTER TABLE Role_Resource ADD CONSTRAINT  XPKRole_Resource PRIMARY KEY (Role_Resource_ID);

CREATE TABLE Smart_Account
(
	Smart_Account_ID     INTEGER NOT NULL ,
	Smart_Account_Name   VARCHAR(50) NULL ,
	Smart_Account_Description VARCHAR(200) NULL ,
	Domain               VARCHAR(100) NULL ,
	Type                 VARCHAR2(20) NULL ,
	Customer_type        VARCHAR2(20) NULL ,
	Source               VARCHAR2(20) NULL ,
	Status               VARCHAR2(20) NULL ,
	Agreement_Status     VARCHAR2(20) NULL ,
	Message_to_Creator   VARCHAR2(20) NULL ,
	Creator_Domain       VARCHAR2(20) NULL ,
	Contact_Phone        VARCHAR2(20) NULL ,
	CR_Party_ID          INTEGER NULL ,
	Is_Active            INTEGER NULL ,
	Status_Change_Reason_Code VARCHAR2(20) NULL ,
	Requesting_User      VARCHAR2(20) NULL ,
	Internal_Comments    VARCHAR(2000) NULL ,
	Account_Type         VARCHAR2(20) NULL ,
	Created_By           VARCHAR2(30) NULL ,
	Created_On           DATE NULL ,
	Last_Updated_By      VARCHAR2(20) NULL ,
	Last_Updated_on      DATE NULL 
);

CREATE UNIQUE INDEX XPKSmart_Account ON Smart_Account (Smart_Account_ID   ASC);

ALTER TABLE Smart_Account ADD CONSTRAINT  XPKSmart_Account PRIMARY KEY (Smart_Account_ID);

CREATE TABLE Users
(
	User_ID              INTEGER NOT NULL ,
	User_Name            VARCHAR2(30) NULL ,
	User_Type            VARCHAR2(20) NULL ,
	Created_On           DATE NULL ,
	Created_by           VARCHAR2(30) NOT NULL ,
	Last_updated_on      DATE NULL 
);

CREATE UNIQUE INDEX XPKUsers ON Users (User_ID   ASC,Created_by   ASC);

ALTER TABLE Users ADD CONSTRAINT  XPKUser PRIMARY KEY (User_ID);

CREATE TABLE Virtual_Account
(
	Virtual_Account_ID   INTEGER NOT NULL ,
	Virtual_Account_Name VARCHAR2(20) NULL ,
	Virtual_Account_Description VARCHAR2(100) NULL ,
	Default_VA              CHAR(1) NULL ,
	Order_Assignable     VARCHAR2(20) NULL ,
	Status               VARCHAR2(20) NULL ,
	Parent_Virtual_Account_ID INTEGER NULL ,
	Is_Active            VARCHAR2(20) NULL ,
	Created_By           VARCHAR2(30) NULL ,
	Created_On           DATE NULL ,
	Last_Updated_By      VARCHAR2(30) NULL ,
	Last_Updated_On      DATE NULL ,
	Overage              VARCHAR2(20) NULL ,
	Smart_Account_ID     INTEGER NOT NULL ,
	Position             INTEGER NULL ,
	Entitlement_Obj_ID   INTEGER NULL ,
	Is_sharable          CHAR(1) NULL 
);

CREATE UNIQUE INDEX XPKVirtual_Account ON Virtual_Account (Virtual_Account_ID   ASC);

ALTER TABLE Virtual_Account ADD CONSTRAINT  XPKVirtual_Account PRIMARY KEY (Virtual_Account_ID);

--ALTER TABLE Entitlement_Object 	ADD (CONSTRAINT R_32 FOREIGN KEY (Entitlement_class_ID) REFERENCES Entitlement_Class (Entitlement_class_ID));

--ALTER TABLE Entitlement_Ops ADD (CONSTRAINT R_33 FOREIGN KEY (Entitlement_class_ID) REFERENCES Entitlement_Class (Entitlement_class_ID));

ALTER TABLE Role_Resource ADD (CONSTRAINT R_26 FOREIGN KEY (Resource_ID) REFERENCES Resource_Master (Resource_ID));

ALTER TABLE Role_Resource ADD (CONSTRAINT R_29 FOREIGN KEY (Role_ID) REFERENCES Roles (Role_ID));

--ALTER TABLE Role_Resource ADD (CONSTRAINT R_39 FOREIGN KEY (Access_Cache_ID) REFERENCES Access_Cache (Access_Cache_ID) ON DELETE SET NULL);

ALTER TABLE Virtual_Account ADD (CONSTRAINT VA_FK FOREIGN KEY (Smart_Account_ID) REFERENCES Smart_Account (Smart_Account_ID));

--ALTER TABLE Virtual_Account ADD (CONSTRAINT R_42 FOREIGN KEY (Entitlement_Obj_ID) REFERENCES Entitlement_Object (Entitlement_Obj_ID) ON DELETE SET NULL);

CREATE TABLE User_role
(
	User_Role_ID       INTEGER NOT NULL ,
	User_Role_name     VARCHAR2(30) NULL ,
	User_Role_Description VARCHAR(100) NULL ,
	User_ID            INTEGER NOT NULL ,
	Smart_Account_ID   INTEGER NOT NULL ,
	Virtual_Account_ID INTEGER NOT NULL ,
	Role_ID            INTEGER NOT NULL ,
--	Access_Cache_ID    INTEGER NULL ,
	Created_on         DATE NULL ,
	Created_by         VARCHAR2(30) NOT NULL 
);

--COMMENT ON COLUMN User_role.Access_Cache_ID IS 'Access Cache is aggregation view of user_id, virtual_account_id and resource_id';

CREATE UNIQUE INDEX XPKUser_role ON User_role
(User_Role_ID   ASC);

ALTER TABLE User_role ADD CONSTRAINT  XPKUser_role PRIMARY KEY (User_Role_ID);

CREATE INDEX XIF1User_role ON User_role (User_ID   ASC);
CREATE INDEX XIF2User_role ON User_role (Role_ID   ASC);
CREATE INDEX XIF3User_role ON User_role (Smart_Account_ID   ASC);
CREATE INDEX XIF4User_role ON User_role (Virtual_Account_ID   ASC);
--CREATE INDEX XIF6User_role ON User_role (Access_Cache_ID   ASC);

ALTER TABLE User_role ADD (CONSTRAINT R_7 FOREIGN KEY (User_ID) REFERENCES Users (User_ID));

ALTER TABLE User_role ADD (CONSTRAINT R_10 FOREIGN KEY (Role_ID) REFERENCES Roles (Role_ID));

ALTER TABLE User_role ADD (CONSTRAINT R_11 FOREIGN KEY (Smart_Account_ID) REFERENCES Smart_Account (Smart_Account_ID));

ALTER TABLE User_role ADD (CONSTRAINT R_13 FOREIGN KEY (Virtual_Account_ID) REFERENCES Virtual_Account (Virtual_Account_ID));

--ALTER TABLE User_role ADD (CONSTRAINT R_40 FOREIGN KEY (Access_Cache_ID) REFERENCES Access_Cache (Access_Cache_ID) ON DELETE SET NULL);


CREATE  TRIGGER  tD_Resource_Master AFTER DELETE ON Resource_Master for each row
-- DELETE trigger on Resource_Master 
DECLARE NUMROWS INTEGER;
BEGIN
    SELECT count(*) INTO NUMROWS
      FROM Role_Resource
      WHERE
        /*  %JoinFKPK(Role_Resource,:%Old, = , AND) */
        Role_Resource.Resource_ID = :old.Resource_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Resource_Master because Role_Resource exists.'
      );
    END IF;
END;
/

CREATE  TRIGGER tU_Resource_Master AFTER UPDATE ON Resource_Master for each row
-- UPDATE trigger on Resource_Master 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Resource_Master  Role_Resource on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM=000118fd, PARENT_OWNER=, PARENT_TABLE=Resource_Master
    CHILD_OWNER=, CHILD_TABLE=Role_Resource
    P2C_VERB_PHRASE=, C2P_VERB_PHRASE=, 
    FK_CONSTRAINT=R_26, FK_COLUMNS=Resource_ID */
  IF
    /* %JoinPKPK(:%Old,:%New, <> , OR ) */
    :old.Resource_ID <> :new.Resource_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Role_Resource
      WHERE
        /*  %JoinFKPK(Role_Resource,:%Old, = , AND) */
        Role_Resource.Resource_ID = :old.Resource_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Resource_Master because Role_Resource exists.'
      );
    END IF;
  END IF;

-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Role AFTER DELETE ON Roles for each row
-- DELETE trigger on Role 
DECLARE NUMROWS INTEGER;
BEGIN
    /* Role  Role_Resource on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM=0000dec6, PARENT_OWNER=, PARENT_TABLE=Role
    CHILD_OWNER=, CHILD_TABLE=Role_Resource
    P2C_VERB_PHRASE=, C2P_VERB_PHRASE=, 
    FK_CONSTRAINT=R_29, FK_COLUMNS=Role_ID */
    SELECT count(*) INTO NUMROWS
      FROM Role_Resource
      WHERE
        /*  %JoinFKPK(Role_Resource,:%Old, = , AND) */
        Role_Resource.Role_ID = :old.Role_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Role because Role_Resource exists.'
      );
    END IF;
END;
/

CREATE  TRIGGER tU_Role AFTER UPDATE ON Roles for each row
-- UPDATE trigger on Role 
DECLARE NUMROWS INTEGER;
BEGIN
  /* Role  Role_Resource on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM=00010182, PARENT_OWNER=, PARENT_TABLE=Role
    CHILD_OWNER=, CHILD_TABLE=Role_Resource
    P2C_VERB_PHRASE=, C2P_VERB_PHRASE=, 
    FK_CONSTRAINT=R_29, FK_COLUMNS=Role_ID */
  IF
    /* %JoinPKPK(:%Old,:%New, <> , OR ) */
    :old.Role_ID <> :new.Role_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Role_Resource
      WHERE
        /*  %JoinFKPK(Role_Resource,:%Old, = , AND) */
        Role_Resource.Role_ID = :old.Role_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Role because Role_Resource exists.'
      );
    END IF;
  END IF;
END;
/

/*
CREATE  TRIGGER tI_Role_Resource BEFORE INSERT ON Role_Resource for each row
DECLARE NUMROWS INTEGER;
BEGIN
    UPDATE Role_Resource
      SET
        Role_Resource.Access_Cache_ID = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM Access_Cache
            WHERE
              :new.Access_Cache_ID = Access_Cache.Access_Cache_ID
        ) 
         and Role_Resource.Role_Resource_ID = :new.Role_Resource_ID;

    SELECT count(*) INTO NUMROWS
      FROM Role
      WHERE
        :new.Role_ID = Role.Role_ID;
    IF (
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Role_Resource because Role does not exist.'
      );
    END IF;

    SELECT count(*) INTO NUMROWS
      FROM Resource_Master
      WHERE
        :new.Resource_ID = Resource_Master.Resource_ID;
    IF (
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Role_Resource because Resource_Master does not exist.'
      );
    END IF;
END;
/

*/

/*

CREATE  TRIGGER tU_Role_Resource AFTER UPDATE ON Role_Resource for each row
-- UPDATE trigger on Role_Resource 
DECLARE NUMROWS INTEGER;
BEGIN
  SELECT count(*) INTO NUMROWS
    FROM Access_Cache
    WHERE
      :new.Access_Cache_ID = Access_Cache.Access_Cache_ID;
  IF (
    :new.Access_Cache_ID IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Role_Resource because Access_Cache does not exist.'
    );
  END IF;

  SELECT count(*) INTO NUMROWS
    FROM Role
    WHERE
      :new.Role_ID = Role.Role_ID;
  IF (
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Role_Resource because Role does not exist.'
    );
  END IF;

  SELECT count(*) INTO NUMROWS
    FROM Resource_Master
    WHERE
      :new.Resource_ID = Resource_Master.Resource_ID;
  IF (
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Role_Resource because Resource_Master does not exist.'
    );
  END IF;
END;
/
*/


CREATE  TRIGGER  tD_Smart_Account AFTER DELETE ON Smart_Account for each row
-- ERwin Builtin Trigger
-- DELETE trigger on Smart_Account 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* Smart_Account  Virtual_Account on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM=0000f012, PARENT_OWNER=, PARENT_TABLE=Smart_Account
    CHILD_OWNER=, CHILD_TABLE=Virtual_Account
    P2C_VERB_PHRASE=, C2P_VERB_PHRASE=, 
    FK_CONSTRAINT=VA_FK, FK_COLUMNS=Smart_Account_ID */
    SELECT count(*) INTO NUMROWS
      FROM Virtual_Account
      WHERE
        /*  %JoinFKPK(Virtual_Account,:%Old, = , AND) */
        Virtual_Account.Smart_Account_ID = :old.Smart_Account_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Smart_Account because Virtual_Account exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Smart_Account AFTER UPDATE ON Smart_Account for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on Smart_Account 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* Smart_Account  Virtual_Account on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM=00012bf5, PARENT_OWNER=, PARENT_TABLE=Smart_Account
    CHILD_OWNER=, CHILD_TABLE=Virtual_Account
    P2C_VERB_PHRASE=, C2P_VERB_PHRASE=, 
    FK_CONSTRAINT=VA_FK, FK_COLUMNS=Smart_Account_ID */
  IF
    /* %JoinPKPK(:%Old,:%New, <> , OR ) */
    :old.Smart_Account_ID <> :new.Smart_Account_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Virtual_Account
      WHERE
        /*  %JoinFKPK(Virtual_Account,:%Old, = , AND) */
        Virtual_Account.Smart_Account_ID = :old.Smart_Account_ID;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Smart_Account because Virtual_Account exists.'
      );
    END IF;
  END IF;
END;
/


/*
CREATE TABLE Permissions
(
	Permission_ID        INTEGER NOT NULL ,
	Permission_Name      VARCHAR2(20) NULL ,
	Created_on           DATE NULL ,
	Created_by           VARCHAR2(20) NULL 
);

CREATE UNIQUE INDEX XPKPermissions ON Permissions
(Permission_ID   ASC);

ALTER TABLE Permissions
	ADD CONSTRAINT  XPKPermissions PRIMARY KEY (Permission_ID);
*/

spool off
