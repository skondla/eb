/*
#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
*/

SET DEFINE OFF
alter session set NLS_DATE_FORMAT='MM/DD/YYYY HH24:MI:SS';

INSERT INTO SMARTACCT.ROLES (ROLE_ID, ROLE_NAME, ROLE_DESCRIPTION, ROLE_TYPE, CREATED_ON, LAST_UPDATED_ON, CREATED_BY) VALUES (1.0,'smartAccountAdmin','Smart Account Administrator','Admin',to_date('10/10/2015'),to_date('10/11/2015'),'Tom McKincey');
INSERT INTO SMARTACCT.ROLES (ROLE_ID, ROLE_NAME, ROLE_DESCRIPTION, ROLE_TYPE, CREATED_ON, LAST_UPDATED_ON, CREATED_BY) VALUES (2.0,'smartAccountUser','Smart Account User','User',to_date('10/10/2015'),to_date('10/11/2015'),'Tom McKincey');
INSERT INTO SMARTACCT.ROLES (ROLE_ID, ROLE_NAME, ROLE_DESCRIPTION, ROLE_TYPE, CREATED_ON, LAST_UPDATED_ON, CREATED_BY) VALUES (3.0,'smartAccountViewer','Smart Account Viewer','Viewer',to_date('10/10/2015'),to_date('10/11/2015'),'Tom McKincey');
INSERT INTO SMARTACCT.ROLES (ROLE_ID, ROLE_NAME, ROLE_DESCRIPTION, ROLE_TYPE, CREATED_ON, LAST_UPDATED_ON, CREATED_BY) VALUES (4.0,'virtualAccountAdmin','Virtaul Account Admin','Admin',to_date('10/10/2015'),to_date('10/11/2015'),'Tom McKincey');
INSERT INTO SMARTACCT.ROLES (ROLE_ID, ROLE_NAME, ROLE_DESCRIPTION, ROLE_TYPE, CREATED_ON, LAST_UPDATED_ON, CREATED_BY) VALUES (5.0,'virtualAccountUser','Virtual Account User','User',to_date('10/10/2015'),to_date('10/11/2015'),'Tom McKincey');
INSERT INTO SMARTACCT.ROLES (ROLE_ID, ROLE_NAME, ROLE_DESCRIPTION, ROLE_TYPE, CREATED_ON, LAST_UPDATED_ON, CREATED_BY) VALUES (6.0,'virtualAccountViewer','Virtual Account Viewer','Viewer',to_date('10/10/2015'),to_date('10/11/2015'),'Tom McKincey');
commit;
