--------------------------------------------------------
--  File created - Monday-April-22-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CHARGER_STATIONS
--------------------------------------------------------

  CREATE TABLE "DEKANY"."CHARGER_STATIONS" 
   (	"CHARGER_STATION_ID" NUMBER, 
	"PETROL_STATION_ID" NUMBER, 
	"CS_NUMBER" NUMBER(3,0), 
	"CS_IS_USABLE" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into DEKANY.CHARGER_STATIONS
SET DEFINE OFF;
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (1,1,1,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (2,1,2,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (3,1,3,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (4,2,1,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (5,2,2,0);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (6,2,3,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (7,3,1,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (8,3,2,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (9,3,3,0);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (10,4,1,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (11,4,2,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (12,4,3,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (13,5,1,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (14,5,2,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (15,5,3,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (16,6,1,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (17,6,2,0);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (18,6,3,1);
Insert into DEKANY.CHARGER_STATIONS (CHARGER_STATION_ID,PETROL_STATION_ID,CS_NUMBER,CS_IS_USABLE) values (19,2,4,1);
--------------------------------------------------------
--  DDL for Index CHARGER_STATION_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEKANY"."CHARGER_STATION_ID_PK" ON "DEKANY"."CHARGER_STATIONS" ("CHARGER_STATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger CHARGER_STATIONS_BI
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "DEKANY"."CHARGER_STATIONS_BI" 
BEFORE INSERT ON CHARGER_STATIONS
FOR EACH ROW
BEGIN
    SELECT SP_INSERT_CHARGER_STATION_SEQUENCE.nextval INTO :new.CHARGER_STATION_ID FROM dual;
END;

/
ALTER TRIGGER "DEKANY"."CHARGER_STATIONS_BI" ENABLE;
--------------------------------------------------------
--  Constraints for Table CHARGER_STATIONS
--------------------------------------------------------

  ALTER TABLE "DEKANY"."CHARGER_STATIONS" MODIFY ("CHARGER_STATION_ID" NOT NULL ENABLE);
  ALTER TABLE "DEKANY"."CHARGER_STATIONS" MODIFY ("PETROL_STATION_ID" NOT NULL ENABLE);
  ALTER TABLE "DEKANY"."CHARGER_STATIONS" MODIFY ("CS_IS_USABLE" NOT NULL ENABLE);
  ALTER TABLE "DEKANY"."CHARGER_STATIONS" ADD CONSTRAINT "CHARGER_STATION_ID_PK" PRIMARY KEY ("CHARGER_STATION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "DEKANY"."CHARGER_STATIONS" ADD CONSTRAINT "CS_NUMBER_RANGE" CHECK (CS_NUMBER BETWEEN 0 AND 20) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHARGER_STATIONS
--------------------------------------------------------

  ALTER TABLE "DEKANY"."CHARGER_STATIONS" ADD CONSTRAINT "CS_PET_FK" FOREIGN KEY ("PETROL_STATION_ID")
	  REFERENCES "DEKANY"."PETROL_STATIONS" ("PETROL_STATION_ID") ENABLE;
