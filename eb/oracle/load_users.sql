/*
#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
*/

SET DEFINE OFF
alter session set NLS_DATE_FORMAT='MM/DD/YYYY HH24:MI:SS';
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (1.0,'Joe Smith','Admin','Tom McKincey',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (2.0,'Tom Rogers','Admin','Jill Wagner',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (3.0,'Bill Smith','User','Tom McKincey',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (4.0,'Joby George','User','Tom McKincey',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (5.0,'Sudheer Kondla','User','Tom McKincey',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (6.0,'Law Chang','User','Jill Wagner',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (7.0,'Crystal Wagner','Viewer','Tom McKincey',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (9.0,'Jeniffer Chan','Viewer','Jill Wagner',to_date('10/10/2015'),to_date('10/11/2015'));
INSERT INTO SMARTACCT.USERS (USER_ID, USER_NAME, USER_TYPE, CREATED_BY, CREATED_ON, LAST_UPDATED_ON) VALUES (10.0,'Michael T.','Viewer','Jill Wagner',to_date('10/10/2015'),to_date('10/11/2015'));
commit;
