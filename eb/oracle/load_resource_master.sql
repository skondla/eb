/*
#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
*/

SET DEFINE OFF
alter session set NLS_DATE_FORMAT='MM/DD/YYYY HH24:MI:SS';

INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (1.0,'Right to Allocate Quantity','Allocate Quantity',to_date('10/10/2015'),'Tom McKincey',to_date('10/11/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (2.0,'Right to Ask Questions','Ask Questions',to_date('10/11/2015'),'Tom McKincey',to_date('10/12/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (3.0,'Right to Assign Access','Assign Access',to_date('10/12/2015'),'Tom McKincey',to_date('10/13/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (4.0,'Right to Close a Case','Close a Case',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (5.0,'Right to Deactivate Object','Deactivate Object',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (6.0,'Right to Download Reports via API','Download Reports via API',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (7.0,'Right to Generate Report','Generate Report',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (8.0,'Right to Get a License Key','Get a License Key',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (9.0,'Right to Move Object','Move Object',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (10.0,'Right to Move Object (by Contract)','Move Object (by Contract)',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (11.0,'Right to Move Object (by Product)','Move Object (by Product)',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (12.0,'Right to Move Object (by Serial #)','Move Object (by Serial #)',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (13.0,'Right to Open a Case','Open a Case',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (14.0,'Right to Register or Run Collection','Register or Run Collection',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (15.0,'Right to Request Collector','Request Collector',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (16.0,'Right to Retire Object','Retire Object',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (17.0,'Right to Return for Credit','Return for Credit',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (18.0,'Right to Return for Repair','Return for Repair',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (19.0,'Right to Return for Replacement','Return for Replacement',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (20.0,'Right to Software Images','Software Images',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (21.0,'Right to Track Compliance','Track Compliance',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (22.0,'Right to Update a Case','Update a Case',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (23.0,'Right to Update Object','Update Object',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (24.0,'Right to Upgrade Software','Upgrade Software',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (25.0,'Right to Use','Use',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (26.0,'Right to View Object','View Object',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (27.0,'Right to View Report','View Report',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
INSERT INTO SMARTACCT.RESOURCE_MASTER (RESOURCE_ID, RESOURCE_NAME, RESOURCE_DESC, CREATED_ON, CREATED_BY, LAST_UPDATED_ON) VALUES (28.0,'Right to View Reports via Portal','View Reports via Portal',to_date('10/13/2015'),'Tom McKincey',to_date('10/14/2015'));
commit;