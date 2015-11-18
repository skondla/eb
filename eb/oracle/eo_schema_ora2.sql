/*
#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
*/

spool eo_schema_create.log

DROP USER EOCACHE CASCADE;

CREATE USER EOCACHE identified by e0Cach3Z default tablespace SMART_ACCT temporary tablespace temp account unlock;

GRANT CONNECT TO EOCACHE;
GRANT RESOURCE TO EOCACHE;

CONNECT EOCACHE/e0Cach3Z


ALTER TABLE Entitlement_Class DROP PRIMARY KEY CASCADE  DROP INDEX;

ALTER TABLE Entitlement_Ops DROP PRIMARY KEY CASCADE  DROP INDEX;
ALTER TABLE Entitlement_Object DROP PRIMARY KEY CASCADE  DROP INDEX;
DROP INDEX XPKEntitlement_Class;

DROP INDEX XPKEntitlement_Ops;

DROP INDEX XIF2Entitlement_Ops;

DROP INDEX XPKEntitlement_Object;

DROP INDEX XIF2Entitlement_Object;

CREATE TABLE Entitlement_Class
(
	Entitlement_class_ID INTEGER NOT NULL ,
	Entitlement_class_Name VARCHAR2(30) NULL ,
	Entitlement_Domain   VARCHAR2(20) NULL ,
	Created_On           DATE NULL ,
	Created_By           VARCHAR2(30) NULL ,
	Last_updated_on      DATE NULL ,
	Status               VARCHAR2(20) NULL ,
	Entitlement_Class_Description VARCHAR(100) NULL ,
	Attribute_Name_1     VARCHAR2(30) NULL ,
	Attribute_Name_2     VARCHAR2(30) NULL ,
	Attribute_Name_3     VARCHAR2(30) NULL ,
	Attribute_Name_4     VARCHAR2(30) NULL ,
	Attribute_Name_5     VARCHAR2(30) NULL 
);

CREATE UNIQUE INDEX XPKEntitlement_Class ON Entitlement_Class
(Entitlement_class_ID   ASC);

ALTER TABLE Entitlement_Class
	ADD CONSTRAINT  XPKEntitlement_Class PRIMARY KEY (Entitlement_class_ID);

CREATE TABLE Entitlement_Object
(
	Entitlement_class_ID INTEGER NOT NULL ,
	Smart_Account_ID     INTEGER NULL ,
	Status               VARCHAR2(20) NULL ,
	Start_Date           DATE NULL ,
	End_Date             DATE NULL ,
	Created_On           DATE NULL ,
	Created_By           VARCHAR2(20) NULL ,
	Entitlement_Obj_ID   INTEGER NOT NULL ,
	Entitlement_Operation_Name VARCHAR2(20) NULL ,
	Entitlement_Domain   VARCHAR2(20) NULL ,
	Entitlement_Ops_Type VARCHAR2(20) NULL ,
	Virtual_Account_ID   INTEGER NULL ,
	Attribute_Name_1     VARCHAR2(30) NULL ,
	Attribute_Name_2     VARCHAR2(30) NULL ,
	Attribute_Name_3     VARCHAR2(30) NULL ,
	Attribute_Name_4     VARCHAR2(30) NULL ,
	Attribute_Name_5     VARCHAR2(30) NULL ,
	Attribute_value_1    VARCHAR2(200) NULL ,
	Attribute_value_2    VARCHAR2(200) NULL ,
	Attribute_value_3    VARCHAR2(200) NULL ,
	Attribute_value_4    VARCHAR2(200) NULL ,
	Attribute_value_5    VARCHAR2(200) NULL ,
	Source_type          VARCHAR2(20) NULL ,
	Source_Reference_ID  VARCHAR2(20) NULL ,
	Entitlement_Ops_Name_1 VARCHAR2(30) NULL ,
	Entitlement_Ops_Name_2 VARCHAR2(30) NULL ,
	Entitlement_Ops_Name_3 VARCHAR2(30) NULL ,
	Entitlement_Ops_Name_4 VARCHAR2(30) NULL ,
	Entitlement_Ops_Name_5 VARCHAR2(30) NULL 
);

CREATE UNIQUE INDEX XPKEntitlement_Object ON Entitlement_Object
(Entitlement_Obj_ID   ASC);

ALTER TABLE Entitlement_Object
	ADD CONSTRAINT  XPKEntitlement_Object PRIMARY KEY (Entitlement_Obj_ID);

CREATE TABLE Entitlement_Ops
(
	Entitlement_Ops_ID   INTEGER NOT NULL ,
	Entitlement_Ops_Name VARCHAR2(30) NULL ,
	Created_On           DATE NULL ,
	Created_By           VARCHAR2(30) NULL ,
	Entitlement_class_ID INTEGER NOT NULL ,
	Entitlement_Ops_type VARCHAR2(20) NULL ,
	Entitlement_Ops_Desc VARCHAR2(100) NULL 
);

CREATE UNIQUE INDEX XPKEntitlement_Ops ON Entitlement_Ops
(Entitlement_Ops_ID   ASC);

ALTER TABLE Entitlement_Ops
	ADD CONSTRAINT  XPKEntitlement_Ops PRIMARY KEY (Entitlement_Ops_ID);


--Triggers
/*
CREATE  TRIGGER  tD_Entitlement_Class AFTER DELETE ON Entitlement_Class for each row
-- ERwin Builtin Trigger
-- DELETE trigger on Entitlement_Class
DECLARE NUMROWS INTEGER;
BEGIN
    SELECT count(*) INTO NUMROWS
      FROM Entitlement_Ops
      WHERE
        Entitlement_Ops.Entitlement_class_ID = :old.Entitlement_class_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Entitlement_Class because Entitlement_Ops exists.'
      );
    END IF;

    SELECT count(*) INTO NUMROWS
      FROM Entitlement_Object
      WHERE
        Entitlement_Object.Entitlement_class_ID = :old.Entitlement_class_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Entitlement_Class because Entitlement_Object exists.'
      );
    END IF;


-- ERwin Builtin Trigger
END;
/

*/


--Trigger
/*
CREATE  TRIGGER tU_Entitlement_Class AFTER UPDATE ON Entitlement_Class for each row
DECLARE NUMROWS INTEGER;
BEGIN
  IF
    :old.Entitlement_class_ID <> :new.Entitlement_class_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Entitlement_Ops
      WHERE
        Entitlement_Ops.Entitlement_class_ID = :old.Entitlement_class_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20005,
        'Cannot update Entitlement_Class because Entitlement_Ops exists.'
      );
    END IF;
  END IF;

  IF
    :old.Entitlement_class_ID <> :new.Entitlement_class_ID
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Entitlement_Object
      WHERE
        Entitlement_Object.Entitlement_class_ID = :old.Entitlement_class_ID;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20005,
        'Cannot update Entitlement_Class because Entitlement_Object exists.'
      );
    END IF;
  END IF;


-- ERwin Builtin Trigger
END;
/
*/

--Trigger

/*

CREATE  TRIGGER  tD_Entitlement_Object AFTER DELETE ON Entitlement_Object for each row
DECLARE NUMROWS INTEGER;
BEGIN
    UPDATE Virtual_Account
      SET
        Virtual_Account.Entitlement_Obj_ID = NULL
      WHERE
        Virtual_Account.Entitlement_Obj_ID = :old.Entitlement_Obj_ID;
END;
/

CREATE  TRIGGER tI_Entitlement_Object BEFORE INSERT ON Entitlement_Object for each row
DECLARE NUMROWS INTEGER;
BEGIN
    SELECT count(*) INTO NUMROWS
      FROM Entitlement_Class
      WHERE
        :new.Entitlement_class_ID = Entitlement_Class.Entitlement_class_ID;
    IF (
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Entitlement_Object because Entitlement_Class does not exist.'
      );
    END IF;
END;
/
*/

--Trigger
/*
CREATE  TRIGGER tU_Entitlement_Object AFTER UPDATE ON Entitlement_Object for each row
DECLARE NUMROWS INTEGER;
BEGIN
  IF
    :old.Entitlement_Obj_ID <> :new.Entitlement_Obj_ID
  THEN
    UPDATE Virtual_Account
      SET
        Virtual_Account.Entitlement_Obj_ID = NULL
      WHERE
        Virtual_Account.Entitlement_Obj_ID = :old.Entitlement_Obj_ID;
  END IF;

  SELECT count(*) INTO NUMROWS
    FROM Entitlement_Class
    WHERE
      :new.Entitlement_class_ID = Entitlement_Class.Entitlement_class_ID;
  IF (
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Entitlement_Object because Entitlement_Class does not exist.'
    );
  END IF;
END;
/

*/

spool off
