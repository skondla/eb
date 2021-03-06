/*
#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
*/

SET DEFINE OFF
alter session set NLS_DATE_FORMAT='MM/DD/YYYY HH24:MI:SS';

INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (1.0,1.0,1.0,'Joe Smith Smart Acct Admin','Smart Account Admin',1.0,1.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (2.0,1.0,2.0,'Joe Smith Smart Acct User','Smart Account User',1.0,2.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (3.0,2.0,1.0,'Tom Rogers Smart Acct Admin','Smart Account Admin',1.0,3.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (4.0,2.0,2.0,'Joe Smith Smart Acct User','Smart Account User',1.0,4.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (5.0,3.0,2.0,'Bill Smith Smart Acct User','Smart Account User',3.0,1.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (6.0,7.0,6.0,'Crystal Virtual Account Viewer','Virtual Account Viewer',3.0,2.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (7.0,9.0,6.0,'Michael Virtual Account Viewer','Virtual Account Viewer',3.0,3.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (8.0,9.0,3.0,'Jennifer Smart Account Viewer','Smart Account Viewer',4.0,1.0,'Tom McKincey',to_date('10/10/2015'));
INSERT INTO SMARTACCT.USER_ROLE (USER_ROLE_ID, USER_ID, ROLE_ID, USER_ROLE_NAME, USER_ROLE_DESCRIPTION, SMART_ACCOUNT_ID, VIRTUAL_ACCOUNT_ID, CREATED_BY, CREATED_ON) VALUES (9.0,5.0,5.0,'Sudheer Virtual Account User','Virtual Account User',4.0,2.0,'Tom McKincey',to_date('10/10/2015'));
commit;
