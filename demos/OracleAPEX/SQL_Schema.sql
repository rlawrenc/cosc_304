--Drop all tables if they exist
DROP TABLE f_shift_assignments;
DROP TABLE f_shifts;
DROP TABLE f_order_lines;
DROP TABLE f_orders;
DROP TABLE f_staffs;
DROP TABLE f_food_items;
DROP TABLE f_regular_menus;
DROP TABLE f_promotional_menus;
DROP TABLE f_customers;
DROP TABLE d_track_listings;
DROP TABLE d_play_list_items;
DROP TABLE d_songs;
DROP TABLE d_types;
DROP TABLE d_job_assignments;
DROP TABLE d_partners;
DROP TABLE d_events;
DROP TABLE d_venues;
DROP TABLE d_themes;
DROP TABLE d_packages;
DROP TABLE d_clients;
DROP TABLE d_cds;
ALTER TABLE DEPARTMENTS DROP CONSTRAINT "DEPT_MGR_FK";
DROP TABLE job_grades;
DROP TABLE job_history;
DROP TABLE employees;
DROP TABLE jobs;
DROP TABLE departments;
DROP TABLE locations;
DROP TABLE countries;
DROP TABLE regions;
DROP TABLE wf_spoken_languages;
DROP TABLE wf_languages;
DROP TABLE wf_countries;
DROP TABLE wf_world_regions;
DROP TABLE wf_currencies;

--Create wf_currencies table
CREATE TABLE  WF_CURRENCIES 
   ("CURRENCY_CODE" VARCHAR2(7), 
	"CURRENCY_NAME" VARCHAR2(40) CONSTRAINT "WF_CURR_NN" NOT NULL ENABLE, 
	"COMMENTS" VARCHAR2(150), 
	CONSTRAINT "WF_CURR_PK" PRIMARY KEY ("CURRENCY_CODE")
	USING INDEX  ENABLE
   );

-- Create wf_languages table
CREATE TABLE  WF_LANGUAGES
   ("LANGUAGE_ID" NUMBER(4,0), 
	"LANGUAGE_NAME" VARCHAR2(50) CONSTRAINT "WF_LANG_LANGNAME_NN" NOT NULL ENABLE, 
	CONSTRAINT "WF_LANG_PK" PRIMARY KEY ("LANGUAGE_ID")
	USING INDEX  ENABLE
   );

--Create wf_world_regions table
CREATE TABLE  WF_WORLD_REGIONS
   ("REGION_ID" NUMBER(3,0), 
	"REGION_NAME" VARCHAR2(35) CONSTRAINT "WF_REG_REGNAME_NN" NOT NULL ENABLE, 
	CONSTRAINT "WF_REG_PK" PRIMARY KEY ("REGION_ID")
	USING INDEX  ENABLE
   );

-- Create wf_countries table
CREATE TABLE  WF_COUNTRIES
   ("COUNTRY_ID" NUMBER(4,0), 
	"REGION_ID" NUMBER(3,0) NOT NULL ENABLE, 
	"COUNTRY_NAME" VARCHAR2(70) CONSTRAINT "WF_CNAME_NN" NOT NULL ENABLE, 
	"COUNTRY_TRANSLATED_NAME" VARCHAR2(40), 
	"LOCATION" VARCHAR2(90), 
	"CAPITOL" VARCHAR2(50), 
	"AREA" NUMBER(15,0), 
	"COASTLINE" NUMBER(8,0), 
	"LOWEST_ELEVATION" NUMBER(6,0), 
	"LOWEST_ELEV_NAME" VARCHAR2(70), 
	"HIGHEST_ELEVATION" NUMBER(6,0), 
	"HIGHEST_ELEV_NAME" VARCHAR2(50), 
	"DATE_OF_INDEPENDENCE" VARCHAR2(30), 
	"NATIONAL_HOLIDAY_NAME" VARCHAR2(200), 
	"NATIONAL_HOLIDAY_DATE" VARCHAR2(30), 
	"POPULATION" NUMBER(12,0), 
	"POPULATION_GROWTH_RATE" VARCHAR2(10), 
	"LIFE_EXPECT_AT_BIRTH" NUMBER(6,2), 
	"MEDIAN_AGE" NUMBER(6,2), 
	"AIRPORTS" NUMBER(6,0), 
	"CLIMATE" VARCHAR2(1000), 
	"FIPS_ID" CHAR(2), 
	"INTERNET_EXTENSION" VARCHAR2(3), 
	"FLAG" BLOB, 
	"CURRENCY_CODE" VARCHAR2(7) NOT NULL ENABLE, 
	CONSTRAINT "WF_CRTY_PK" PRIMARY KEY ("COUNTRY_ID")
	USING INDEX  ENABLE
   );
   
-- Add FK constraints
ALTER TABLE  WF_COUNTRIES ADD CONSTRAINT "WF_REGION_ID_FK1" FOREIGN KEY ("REGION_ID")
	REFERENCES  WF_WORLD_REGIONS ("REGION_ID") ENABLE;

CREATE INDEX  "WF_CTRY_REG_IDX" ON  WF_COUNTRIES ("REGION_ID");

ALTER TABLE  WF_COUNTRIES ADD CONSTRAINT "WF_CURR_ID_FK2" FOREIGN KEY ("CURRENCY_CODE")
	REFERENCES  WF_CURRENCIES ("CURRENCY_CODE") ENABLE;

CREATE INDEX  "WF_CTRY_CURR_IDX" ON  WF_COUNTRIES ("CURRENCY_CODE");

-- Create wf_spoken_languages table
CREATE TABLE  WF_SPOKEN_LANGUAGES
   ("COUNTRY_ID" NUMBER(4,0), 
	"LANGUAGE_ID" NUMBER(4,0), 
	"OFFICIAL" VARCHAR2(2), 
	"COMMENTS" VARCHAR2(512), 
	CONSTRAINT "WF_SPOKEN_LANG_PK" PRIMARY KEY ("COUNTRY_ID", "LANGUAGE_ID")
	USING INDEX  ENABLE
   );
-- Add FK constraints
ALTER TABLE  WF_SPOKEN_LANGUAGES ADD CONSTRAINT "WF_CTRY_NUM_FK1" FOREIGN KEY ("COUNTRY_ID")
	REFERENCES  WF_COUNTRIES ("COUNTRY_ID") ENABLE;

ALTER TABLE  WF_SPOKEN_LANGUAGES ADD CONSTRAINT "WF_LANG_ID_FK" FOREIGN KEY ("LANGUAGE_ID")
	REFERENCES  WF_LANGUAGES ("LANGUAGE_ID") ENABLE;
	
--populate wf_world regions
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (14,'Eastern Africa');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (17,'Middle Africa');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (15,'Northern Africa');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (18,'Southern Africa');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (11,'Western Africa');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (29,'Caribbean');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (13,'Central America');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (5,'South America');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (21,'Northern America');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (143,'Central Asia');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (30,'Eastern Asia');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (34,'Southern Asia');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (35,'South-Eastern Asia');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (145,'Western Asia');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (151,'Eastern Europe');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (154,'Northern Europe');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (39,'Southern Europe');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (155,'Western Europe');
INSERT INTO wf_world_regions (region_id, region_name)
VALUES (9,'Oceania');

-- Populate wf_currencies
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('AED','Emirati dirham','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('AFA','Afghani','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ALL','Lek','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('AMD','Dram','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ANG','Netherlands Antillean guilder','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('AOA','Kwanza','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ARS','Argentine peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('AUD','Australian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('AWG','Aruban guilder','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('AZM','Azerbaijani Manat','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BAM','Marka','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BBD','Barbadian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BDT','Taka','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BGL','Lev','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BIF','Burundi franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BMD','Bermudian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BND','Bruneian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BOB','Boliviano','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BRL','Real','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BSD','Bahamian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BTN','Ngultrum','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BWP','Pula','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BYB','Belarusian ruble','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BZD','Belizean dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CAD','Canadian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CDF','Congolese franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CHF','Swiss franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CLP','Chilean peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CNY','yuan','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('COP','Colombian peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CRC','Costa Rican colon','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CUC','Convertible peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CUP','Cuban peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CVE','Cape Verdean escudo','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CYP','Cypriot pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('CZK','Czech koruna','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('DJF','Djiboutian franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('DKK','Danish krone','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('DOP','Dominican peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('DZD','Algerian dinar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('EEK','Estonian kroon','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('EGP','Egyptian pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ERN','nakfa','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ETB','birr','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('EUR','Euro','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('FJD','Fijian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('FKP','Falkland pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GBP','British pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GEL','lari','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GHC','cedi','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GIP','Gibraltar pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GMD','dalasi','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GNF','Guinean franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GTQ','quetzal','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('GYD','Guyanese dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('HKD','Hong Kong dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('HNL','lempira','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('HRK','kuna','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('HTG','gourde','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('HUF','forint','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('IDR','Indonesian rupiah','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ILS','new Israeli shekel','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('INR','Indian rupee','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('IRR','Iranian rial','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ISK','Icelandic krona','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('JMD','Jamaican dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('JOD','Jordanian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('JPY','yen','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KD','Kuwaiti dinar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KES','Kenyan shilling','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KHR','riel','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KMF','Comoran franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KPW','North Korean won','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KRW','South Korean won','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KYD','Caymanian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('KZT','tenge','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LAK','kip','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LBP','Lebanese pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LKR','Sri Lankan rupee','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LRD','Liberian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LSL','loti','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LTL','litas','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LVL','Latvian lat','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('LYD','Libyan dinar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MAD','Moroccan dirham','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MDL','Moldovan leu','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MGA','Madagascar ariary','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MKD','Macedonian denar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MMK','Kyat','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MNT','togrog/tugrik','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MOP','pataca','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MRO','ouguiya','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MTL','Maltese lira','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MUR','Mauritian rupee','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MVR','rufiyaa','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MWK','Malawian kwacha','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MXN','Mexican peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MYR','ringgit','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('MZM','metical','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NAD','Namibian dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NGN','naira','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NID','New Iraqi dinar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NOK','Norwegian krone','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NONE','No currency used','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NPR','Nepalese rupee','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NZD','New Zealand dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('PAB','balboa','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('PEN','nuevo sol','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('PGK','kina','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('PKR','Pakistani rupee','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('PLN','zloty','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('PYG','guarani','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('QAR','Qatari rial','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('RMB','Renminbi','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('RUR','Russian ruble','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SAR','Saudi riyal','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SAT','tala','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SBD','Solomon Islands dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SCR','Seychelles rupee','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SEK','Swedish krona','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SGD','Singapore dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SHP','Saint Helenian pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SIT','tolar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SLL','leone','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SOS','Somali shilling','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SRD','Surinam dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('STD','dobra','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SZL','lilangeni','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('THB','baht','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('TMM','Turkmen manat','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('TND','Tunisian dinar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('TTD','Trinidad and Tobago dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('TWD','new Taiwan dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('UAH','hryvnia','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('UGX','Ugandan shilling','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('USD','US Dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('UYU','Uruguayan peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('UZS','Uzbekistani soum','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('VEB','bolivar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('VND','dong','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('VUV','vatu','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('XAF','Communaute Financiere Africaine franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('XCD','East Caribbean dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('XOF','Communaute Financiere Africaine franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('XPF','Comptoirs Francais du Pacifique franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('YER','Yemeni rial','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('YTL','Turkish lira','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ZAR','South African rand','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ZMK','Zambian kwacha','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('ZWD','Zimbabwean dollar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('NIO','gold cordoba','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('OMR','Omani rial','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('PHP','Philippine peso','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('RON','leu','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('RWF','Rwandan franc','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SDD','Sudanese dinar','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SKK','Slovak koruna','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('SYP','Syrian pound','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('TOP','paanga','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('TZS','Tanzanian shilling','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('TJS','Tajikistani somoni','');
INSERT INTO wf_currencies(currency_code, currency_name, comments)
VALUES('BHD','Bahraini Dinar','');

-- Populate wf_languages
INSERT INTO wf_languages(language_id,language_name)
VALUES(0,'N/A');
INSERT INTO wf_languages(language_id,language_name)
VALUES(20,'Afar');
INSERT INTO wf_languages(language_id,language_name)
VALUES(30,'Afrikaans');
INSERT INTO wf_languages(language_id,language_name)
VALUES(40,'Albanian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(50,'Amerindian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(60,'Amharic');
INSERT INTO wf_languages(language_id,language_name)
VALUES(70,'Angaur');
INSERT INTO wf_languages(language_id,language_name)
VALUES(80,'Arabic');
INSERT INTO wf_languages(language_id,language_name)
VALUES(90,'Armenian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(100,'Assyrian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(101,'Aymara');
INSERT INTO wf_languages(language_id,language_name)
VALUES(102,'Azen');
INSERT INTO wf_languages(language_id,language_name)
VALUES(103,'Azerbaijani');
INSERT INTO wf_languages(language_id,language_name)
VALUES(104,'Bahasa Indonesia');
INSERT INTO wf_languages(language_id,language_name)
VALUES(105,'Bahasa Melayu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(106,'Balochi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(107,'Bambara');
INSERT INTO wf_languages(language_id,language_name)
VALUES(108,'Bandjabi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(109,'Bangla');
INSERT INTO wf_languages(language_id,language_name)
VALUES(110,'Bantu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(120,'Bapounou');
INSERT INTO wf_languages(language_id,language_name)
VALUES(130,'Belarusian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(140,'Bhojpuri');
INSERT INTO wf_languages(language_id,language_name)
VALUES(150,'Bislama');
INSERT INTO wf_languages(language_id,language_name)
VALUES(160,'Bokmal Norwegian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(170,'Bosnian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(180,'Bulgarian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(190,'Burmese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(200,'Cantonese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(210,'Castilian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(220,'Castilian Spanish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(230,'Catalan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(240,'Chamorro');
INSERT INTO wf_languages(language_id,language_name)
VALUES(250,'Chichwea');
INSERT INTO wf_languages(language_id,language_name)
VALUES(260,'Chilomwe');
INSERT INTO wf_languages(language_id,language_name)
VALUES(270,'Chinese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(280,'Chinyanja');
INSERT INTO wf_languages(language_id,language_name)
VALUES(290,'Chisena');
INSERT INTO wf_languages(language_id,language_name)
VALUES(300,'Chitonga');
INSERT INTO wf_languages(language_id,language_name)
VALUES(310,'Chitumbuka');
INSERT INTO wf_languages(language_id,language_name)
VALUES(320,'Chiyao');
INSERT INTO wf_languages(language_id,language_name)
VALUES(330,'Cisena');
INSERT INTO wf_languages(language_id,language_name)
VALUES(340,'Creole');
INSERT INTO wf_languages(language_id,language_name)
VALUES(350,'Crioulo');
INSERT INTO wf_languages(language_id,language_name)
VALUES(360,'Croatian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(370,'Czech');
INSERT INTO wf_languages(language_id,language_name)
VALUES(380,'Dagomba');
INSERT INTO wf_languages(language_id,language_name)
VALUES(390,'Danish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(400,'Djerma');
INSERT INTO wf_languages(language_id,language_name)
VALUES(410,'Dutch');
INSERT INTO wf_languages(language_id,language_name)
VALUES(420,'Dzongkha');
INSERT INTO wf_languages(language_id,language_name)
VALUES(430,'Echuwabo');
INSERT INTO wf_languages(language_id,language_name)
VALUES(440,'Elomwe');
INSERT INTO wf_languages(language_id,language_name)
VALUES(450,'Emakhuwa');
INSERT INTO wf_languages(language_id,language_name)
VALUES(460,'English');
INSERT INTO wf_languages(language_id,language_name)
VALUES(470,'Estonian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(480,'Ewe');
INSERT INTO wf_languages(language_id,language_name)
VALUES(490,'Fang');
INSERT INTO wf_languages(language_id,language_name)
VALUES(500,'Faroese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(510,'Farsi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(520,'Fijian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(530,'Filipino');
INSERT INTO wf_languages(language_id,language_name)
VALUES(540,'Finnish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(550,'Fon and Yoruba');
INSERT INTO wf_languages(language_id,language_name)
VALUES(560,'French');
INSERT INTO wf_languages(language_id,language_name)
VALUES(570,'Frisian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(580,'Fula');
INSERT INTO wf_languages(language_id,language_name)
VALUES(590,'Futunian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(600,'Fuzhou');
INSERT INTO wf_languages(language_id,language_name)
VALUES(610,'Gagauz');
INSERT INTO wf_languages(language_id,language_name)
VALUES(620,'Galician');
INSERT INTO wf_languages(language_id,language_name)
VALUES(630,'Gan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(640,'Garifuna');
INSERT INTO wf_languages(language_id,language_name)
VALUES(650,'Georgian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(660,'German');
INSERT INTO wf_languages(language_id,language_name)
VALUES(670,'Greek');
INSERT INTO wf_languages(language_id,language_name)
VALUES(680,'Greenlandic');
INSERT INTO wf_languages(language_id,language_name)
VALUES(690,'Guaragigna');
INSERT INTO wf_languages(language_id,language_name)
VALUES(700,'Guavani');
INSERT INTO wf_languages(language_id,language_name)
VALUES(710,'Hassaniya');
INSERT INTO wf_languages(language_id,language_name)
VALUES(720,'Hausa');
INSERT INTO wf_languages(language_id,language_name)
VALUES(730,'Hebrew');
INSERT INTO wf_languages(language_id,language_name)
VALUES(740,'Hindi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(750,'Hindustani');
INSERT INTO wf_languages(language_id,language_name)
VALUES(760,'Hokkien');
INSERT INTO wf_languages(language_id,language_name)
VALUES(770,'Hungarian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(780,'Icelandic');
INSERT INTO wf_languages(language_id,language_name)
VALUES(790,'Igbo');
INSERT INTO wf_languages(language_id,language_name)
VALUES(800,'I-Kiribati');
INSERT INTO wf_languages(language_id,language_name)
VALUES(810,'Indonesian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(820,'Irish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(830,'IsiXhosa');
INSERT INTO wf_languages(language_id,language_name)
VALUES(840,'IsiZulu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(850,'Italian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(860,'Japanese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(870,'Jola');
INSERT INTO wf_languages(language_id,language_name)
VALUES(880,'Kabye');
INSERT INTO wf_languages(language_id,language_name)
VALUES(890,'Kalanga');
INSERT INTO wf_languages(language_id,language_name)
VALUES(900,'Kazakh');
INSERT INTO wf_languages(language_id,language_name)
VALUES(910,'Khalkha Mongol');
INSERT INTO wf_languages(language_id,language_name)
VALUES(920,'Khmer');
INSERT INTO wf_languages(language_id,language_name)
VALUES(930,'Kikongo');
INSERT INTO wf_languages(language_id,language_name)
VALUES(940,'kingwana');
INSERT INTO wf_languages(language_id,language_name)
VALUES(950,'Kinyarwanda');
INSERT INTO wf_languages(language_id,language_name)
VALUES(960,'Kirundi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(970,'Kiswahili');
INSERT INTO wf_languages(language_id,language_name)
VALUES(980,'Korean');
INSERT INTO wf_languages(language_id,language_name)
VALUES(990,'Kunama');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1000,'Kurdish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1100,'Kyrgyz');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1110,'Lao');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1120,'Latin');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1130,'Latvian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1140,'Lingala');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1150,'Lithuanian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1160,'Luri');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1170,'Luxembourgish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1180,'Macedonian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1190,'Magar');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1200,'Mahorian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1210,'Maithali');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1220,'Malagasy');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1230,'Malay');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1240,'Malayalam');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1250,'Maldivian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1260,'Maltese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1270,'Mandarin');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1280,'Mandarin Chinese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1290,'Mandinka');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1300,'Manx Gaelic');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1310,'Maori');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1320,'Marshallese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1330,'Mayan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1340,'Melanesian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1350,'Mina');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1360,'Minnan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1370,'Mirandese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1390,'Monegasque');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1400,'Motu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1420,'Nahua');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1440,'Nepali');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1450,'Newar');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1470,'Nubian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1480,'Nynorsk Norwegian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1500,'Oromigna');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1520,'Panjabi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1530,'Papiamento');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1540,'Pashtu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1560,'Polish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1570,'Polynesian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1590,'Pulaar');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1600,'Punjabi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1610,'Quechua');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1630,'Romani');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1650,'Russian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1660,'Samoan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1680,'Sara');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1690,'Sekgalagadi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1710,'Serbian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1730,'Setswana');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1740,'Shanghaiese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1760,'Sindhi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1770,'Sinhala');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1780,'Siswati');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1800,'Slovak');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1820,'Slovenian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1830,'Somali');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1850,'Spanish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1860,'Swahili');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1880,'Taiwanese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1890,'Tajik');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1910,'Tamil');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1920,'Telugu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1940,'Tetum');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1950,'Thai');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1970,'Tigre');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1990,'Tobi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2000,'Tokelauan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2150,'Tshiluba');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2200,'Turkic');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2300,'Turkmen');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2350,'Ukrainian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2400,'Urdu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2450,'Uzbek');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2500,'Vietnamese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2550,'Wallisian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2600,'Welsh');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2650,'Wolof');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2700,'Xhosa');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2750,'Xiang');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2800,'Xichangana');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2850,'Yezidi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2900,'Yoruba');
INSERT INTO wf_languages(language_id,language_name)
VALUES(3000,'Zulu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1380,'Moldovan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1410,'Myene');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1430,'Nauruan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1460,'Niuean');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1490,'Nzebi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1510,'Palauian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1550,'Persian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1580,'Portuguese');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1620,'Roma');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1640,'Romanian');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1670,'Sangho');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1700,'Sepedi');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1720,'Sesotho');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1750,'Shikomoro');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1790,'Slavic');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1810,'Slovene');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1840,'Soninke');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1870,'Swedish');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1900,'Tamang');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1930,'Teochew');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1960,'Tharu');
INSERT INTO wf_languages(language_id,language_name)
VALUES(1980,'Tigrinya');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2100,'Tongan');
INSERT INTO wf_languages(language_id,language_name)
VALUES(2250,'Turkish');

-- Populate wf_countries
INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(2,21,'Canada','','Northern North America','Ottawa',9984670,202080,0,'Atlantic Ocean',5959,'Mount Logan','1-Jul-1867','Canada Day','1-Jul',33098932,0.88,80.22,38.9,1331,'varies from temperate in south to subarctic and arctic in north','CA','.ca','CAD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(506,13,'Republic of Costa Rica','Costa Rica','Central America','San Jose',51100,1290,0,'Pacific Ocean',3810,'Cerro Chirripo','15-Sep-1821','Independence Day','15-Sep',4075261,1.45,77.02,26.4,156,'tropical and subtropical; dry season (December to April); rainy season (May to November); cooler in highlands','CS','.cr','CRC');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(238,11,'Republic of Cape Verde','Cape Verde','Western Africa','Praia',4033,965,0,'Atlantic Ocean',2829,'Mt. Fogo','5-Jul-1975','Independence Day','5-Jul',420979,0.64,70.73,19.8,7,'temperate; warm, dry summer; precipitation meager and very erratic','CV','.cv','CVE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(299,21,'Greenland','','Northern North America','Nuuk',2166086,44087,0,'Atlantic Ocean',3700,'Gunnbjorn','','Longest Day','21-Jun',56361,-0.03,69.94,34,14,'arctic to subarctic; cool summers, cold winters','GL','.gl','DKK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1809,29,'Dominican Republic','The Dominican','Caribbean','Santo Domingo',48730,1288,-46,'Lago Enriquillo',3175,'Pico Duarte','27-Feb-1844','Independence Day','27-Feb',9183984,1.47,71.73,24.1,32,'tropical maritime; little seasonal temperature variation; seasonal variation in rainfall','DR','.do','DOP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(291,14,'State of Eritrea','Eritrea','Eastern Africa','Asmara',121320,2234,-75,'near Kulul within the Denakil depression',3018,'Soira','24-May-1993','Independence Day','24-May',4786994,2.47,59.03,17.8,17,'hot, dry desert strip along Red Sea coast; cooler and wetter in the central highlands (up to 61 cm of rainfall annually, heaviest June to September); semiarid in western hills and lowlands','ER','.er','ERN');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(251,14,'Federal Democratic Republic of Ethiopia','Ethiopia','Eastern Africa','Addis Ababa',1127127,0,-125,'Denakil Depression',4620,'Ras Dejen','','National Day','28-May',74777981,2.31,49.03,17.8,82,'tropical monsoon with wide topographic-induced variation','ET','.et','ETB');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(38,39,'The Holy See (State of the Vatican City)','Holy See (Vatican City)','Southern Europe','Vatican City',0,0,19,'unnamed location',75,'unnamed location','11-Feb-1929','Coronation Day of Pope BENEDICT XVI','24-Apr',932,0.01,'','',0,'temperate; mild, rainy winters (September to May) with hot, dry summers (May to September)','VT','.va','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(34,39,'Kingdom of Spain','Spain','Southwestern Europe','Madrid',504782,4964,0,'Atlantic Ocean',3718,'Pico de Teide','','National Day','12-Oct',40397842,0.13,79.65,39.9,157,'temperate; clear, hot summers in interior, more moderate and cloudy along coast; cloudy, cold winters in interior, partly cloudy and cool along coast','SP','.es','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(378,39,'Republic of San Marino','San Marino','Southern Europe','San Marino',61,0,55,'Torrente Ausa',755,'Monte Titano','3 September A.D. 301','Founding of the Republic','3-Sep',29251,1.26,81.71,40.6,0,'Mediterranean; mild to cool winters; warm, sunny summers','SM','.sm','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(994,145,'Republic of Azerbaijan','Azerbaijan','Southwestern Asia','Baku',86600,0,-28,'Caspian Sea',4485,'Bazarduzu Dagi','30-Aug-1991','Founding of the Democratic Republic of Azerbaijan','28-May',7961619,0.66,63.85,27.7,45,'dry, semiarid steppe','AJ','.az','AZM');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(423,155,'Principality of Liechtenstein','Liechtenstein','Central Europe','Vaduz',160,0,430,'Ruggeller Riet',2599,'Vorder-Grauspitz','12-Jul-1806','Assumption Day','15-Aug',33987,0.78,79.68,39.6,0,'continental; cold, cloudy winters with frequent snow or rain; cool to moderately warm, cloudy, humid summers','LS','.li','CHF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(93,34,'Islamic Republic of Afghanistan','Afghanistan','Southern Asia','Kabul',647500,0,258,'Amu Darya',7485,'Nowshak','19-Aug-1919','Independence Day','19-Aug',31056997,2.67,43.34,17.6,46,'arid to semiarid; cold winters and hot summers','AF','.af','AFA');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(355,39,'Republic of Albania','Albania','Southeastern Europe','Tirana',28748,362,0,'Adriatic Sea',2764,'Maja e Korabit (Golem Korab)','28-Nov-1912','Independence Day','28-Nov',3581655,0.52,77.43,28.9,11,'mild temperate; cool, cloudy, wet winters; hot, clear, dry summers; interior is cooler and wetter','AL','.al','ALL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(599,29,'Netherlands Antilles','','Caribbean','Willemstad',960,364,0,'Caribbean Sea',862,'Mount Scenery','','Queens Day','30-Apr',221736,0.79,76.03,32.8,5,'tropical; ameliorated by northeast trade winds','NT','.an','ANG');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(54,5,'Argentine Republic','Argentina','Southern South America','Buenos Aires',2766890,4989,-105,'Laguna del Carbon',6960,'Cerro Aconcagua','9-Jul-1816','Revolution Day','25-May',39921833,0.96,76.12,29.7,1333,'mostly temperate; arid in southeast; subantarctic in southwest','AR','.ar','ARS');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(688,9,'Tuvalu','','Oceania','Funafuti',26,24,0,'Pacific Ocean',5,'unnamed location','1-Oct-1978','Independence Day','1-Oct',11810,1.51,68.32,24.6,1,'tropical; moderated by easterly trade winds (March to November); westerly gales and heavy rain (November to March)','TV','.tv','AUD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(67,35,'Territory of Cocos (Keeling) Islands','Cocos (Keeling) Islands','Southeastern Asia','West Island',14,26,0,'Indian Ocean',5,'unnamed location','','Australia Day','26-Jan',574,0,NULL,NULL,1,'tropical with high humidity, moderated by the southeast trade winds for about nine months of the year','CK','.cc','AUD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(61,9,'Commonwealth of Australia','Australia','Oceania','Canberra',7686850,25760,-15,'Lake Eyre',2229,'Mount Kosciuszko','1-Jan-1901','Australia Day','26-Jan',20264082,0.85,80.5,36.9,450,'generally arid to semiarid; temperate in south and east; tropical in north','AS','.au','AUD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(671,9,'Territory of Norfolk Island','Norfolk Island','Oceania','Kingston',35,32,0,'Pacific Ocean',319,'Mount Bates','','Bounty Day','8-Jun',1828,-.01,NULL,NULL,1,'subtropical; mild, little seasonal temperature variation','NF','.nf','AUD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(618,35,'Territory of Christmas Island','Christmas Island','Southeastern Asia','The Settlement',135,139,0,'Indian Ocean',361,'Murray Hill',NULL,'Australia Day','26-Jan',1493,0,NULL,NULL,1,'tropical with a wet and dry season; heat and humidity moderated by trade winds; wet season (December to April)','KT','.cx','AUD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(686,9,'Republic of Kiribati','Kiribati','Oceania','Tarawa',811,1143,0,'Pacific Ocean',81,'unnamed location','12-Jul-1979','Independence Day','12-Jul',105432,2.24,62.08,20.2,19,'tropical; marine, hot and humid, moderated by trade winds','KR','.ki','AUD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(357,145,'Republic of Cyprus','Cyprus','Middle East','Nicosia',9250,648,0,'Mediterranean Sea',1951,'Mount Olympus','16-Aug-1960','Independence Day','1-Oct',784301,0.53,77.82,34.9,16,'temperate; Mediterranean with hot, dry summers and cool winters','CY','.cy','CYP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(297,29,'Aruba','','Caribbean','Oranjestad',193,69,0,'Caribbean Sea',188,'Mount Jamanota',NULL,'Flag Day','18-Mar',71891,0.44,79.28,38.5,1,'tropical marine','AA','.aw','AWG');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(387,39,'Bosnia and Herzegovina','','Southeastern Europe','Sarajevo',51129,20,0,'Adriatic Sea',2386,'Maglic','1-Mar-1992','National Day','25-Nov',4498976,1.35,78,38.4,27,'hot summers and cold winters; areas of high elevation have short, cool summers and long, severe winters; mild, rainy winters along coast','BK','.ba','BAM');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(257,17,'Republic of Burundi','Burundi','Central Africa','Bujumbura',27830,0,772,'Lake Tanganyika',2670,'Heha','1-Jul-1962','Independence Day','1-Jul',8090068,3.7,50.81,16.6,8,'equatorial; high plateau with considerable altitude variation','BY','.bi','BIF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1441,21,'Bermuda','','North America','Hamilton',53,103,0,'Atlantic Ocean',76,'Town Hill',NULL,'Bermuda Day','24-May',65773,0.61,77.96,40.2,1,'subtropical; mild, humid; gales, strong winds common in winter','BD','.bm','BMD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(673,35,'Negara Brunei Darussalam','Brunei','Southeastern Asia, bordering the South China Sea and Malaysia','Bandar Seri Begawan',5770,161,0,'South China Sea',1850,'Bukit Pagon','1-Jan-1984','National Day','23-Feb',379444,1.87,75.01,27.4,2,'tropical; hot, humid, rainy','BX','.bn','BND');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(591,5,'Republic of Bolivia','Bolivia','South America','La Paz',1098580,0,90,'Rio Paraguay',6542,'Nevado Sajama','6-Aug-1825','Independence Day','6-Aug',8989046,1.45,65.84,21.8,1067,'varies with altitude; humid and tropical to cold and semiarid','BL','.bo','BOB');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(55,5,'Federative Republic of Brazil','Brazil','Eastern South America','Brasilia',8511965,7491,0,'Atlantic Ocean',3014,'Pico da Neblina','7-Sep-1822','Independence Day','7-Sep',188078227,1.04,71.97,28.2,4223,'mostly tropical, but temperate in south','BR','.br','BRL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(975,34,'Kingdom of Bhutan','Bhutan','Southern Asia','Thimphu',47000,0,97,'Drangme Chhu',7553,'Kula Kangri','8-Aug-1949','National Day','17-Dec',2279723,2.1,54.78,20.4,2,'varies; tropical in southern plains; cool winters and hot summers in central valleys; severe winters and cool summers in Himalayas','BT','.bt','BTN');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(375,151,'Republic of Belarus','Belarus','Eastern Europe','Minsk',207600,0,90,'Nyoman River',346,'Dzyarzhynskaya Hara','25-Aug-1991','Independence Day','3-Jul',10293011,-0.06,69.08,37.2,101,'cold winters, cool and moist summers; transitional between continental and maritime','BO','.by','BYB');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(501,13,'Belize','','Central America','Belmopan',22966,386,0,'Caribbean Sea',1160,'Victoria Peak','21-Sep-1981','Independence Day','21-Sep',287730,2.31,68.3,19.6,43,'tropical; very hot and humid; rainy season (May to November); dry season (February to May)','BH','.bz','BZD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1246,29,'Barbados','','Caribbean','Bridgetown',431,97,0,'Atlantic Ocean',336,'Mount Hillaby','30-Nov-1966','Independence Day','30-Nov',279912,0.37,72.79,34.6,1,'tropical; rainy season (June to October)','BB','.bb','BBD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(243,17,'Democratic Republic of the Congo','','Central Africa','Kinshasa',2345410,37,0,'Atlantic Ocean',5110,'Pic Marguerite on Mont Ngaliema','30-Jun-1960','Independence Day','30-Jun',62660551,3.07,51.46,16.2,232,'tropical; hot and humid in equatorial river basin; cooler and drier in southern highlands','CG','.cd','CDF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(264,18,'Republic of Namibia','Namibia','Southern Africa','Windhoek',825418,1572,0,'Atlantic Ocean',2606,'Konigstein','21-Mar-1990','Independence Day','21-Mar',2044147,0.59,43.39,20,136,'desert; hot, dry; rainfall sparse and erratic','WA','.na','NAD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(280,5,'South Georgia and the South Sandwich Islands','','Southern South America',NULL,3903,NULL,0,'Atlantic Ocean',2934,'Mount Paget',NULL,NULL,NULL,0,NULL,NULL,NULL,0,'variable, with mostly westerly winds throughout the year interspersed with periods of calm; nearly all precipitation falls as snow','SX','.gs','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(12,9,'Coral Sea Islands Territory','Coral Sea Islands','Oceania',NULL,3,3095,0,'Pacific Ocean',6,'unnamed location on Cato Island',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tropical','CR','','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(300,29,'Navassa Island','','Caribbean',NULL,5,8,0,'Caribbean Sea',77,'unnamed location on southwest side',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'marine, tropical','BQ','','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(672,9,'Antarctica','','continent mostly south of the Antarctic Circle',NULL,14000000000,17968,-2555,'Bentley Subglacial Trench',4897,'Vinson Massif',NULL,NULL,NULL,0,NULL,NULL,NULL,28,'severe low temperatures vary with latitude, elevation, and distance from the ocean; East Antarctica is colder than West Antarctica because of its higher elevation; Antarctic Peninsula has the most moderate climate; higher temperatures occur in January along the coast and average slightly below freezing','AY','.aq','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(2000,35,'Territory of Ashmore and Cartier Islands','Ashmore and Cartier Islands','Southeastern Asia',NULL,5,74,0,'Indian Ocean',3,'unnamed location',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'tropical','AT','','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(208,35,'Spratly Islands','','Southeastern Asia',NULL,5,926,0,'South China Sea',4,'unnamed location on Southwest Cay',NULL,NULL,NULL,0,NULL,NULL,NULL,3,'tropical','PG','','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(207,35,'Paracel Islands','','Southeastern Asia',NULL,NULL,518,0,'South China Sea',14,'unnamed location',NULL,NULL,NULL,0,NULL,NULL,NULL,0,'tropical','PF','','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(996,143,'Kyrgyz Republic','Kyrgyzstan','Central Asia','Bishkek',198500,0,132,'Kara-Daryya',7439,'Jengish Chokusu','31-Aug-1991','Independence Day','31-Aug',5213898,1.32,68.49,23.6,37,'dry continental to polar in high Tien Shan; subtropical in southwest (Fergana Valley); temperate in northern foothill zone','KG','.kg','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(204,154,'Jan Mayen','','Northern Europe',NULL,373,124,0,'Norwegian Sea',2277,'Haakon VII Toppen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'arctic maritime with frequent storms and persistent fog','JN','','NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(500,5,'Falkland Islands','','Falkland Islands','Stanley',12173,1288,0,'Atlantic Ocean',705,'Mount Usborne','','Liberation Day','14-Jun',2967,2.44,NULL,NULL,5,'cold marine; strong westerly winds, cloudy, humid; rain occurs on more than half of days in year; average annual rainfall is 24 inches in Stanley; occasional snow all year, except in January and February, but does not accumulate','FK','.fk','FKP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(44,155,'United Kingdom of Great Britain and Northern Ireland','United Kingdom','Western Europe','London',244820,12429,-4,'The Fens',1343,'Ben Nevis','10th century',NULL,NULL,60609153,0.28,78.54,39.3,471,'temperate; moderated by prevailing southwest winds over the North Atlantic Current; more than one-half of the days are overcast','UK','.uk','GBP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(203,155,'Bailiwick of Jersey','Jersey','Western Europe','Saint Helier',116,70,0,'Atlantic Ocean',143,'unnamed location','','Liberation Day','9-May',91084,0.28,79.38,41.4,1,'temperate; mild winters and cool summers','JE','.je','GBP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(202,155,'Isle of Man','','Western Europe','Douglas',572,160,0,'Irish Sea',621,'Snaefell','','Tynwald Day','5-Jul',75441,0.52,78.49,39.6,1,'temperate; cool summers and mild winters; overcast about one-third of the time','IM','.im','GBP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(350,39,'Gibraltar','','Southwestern Europe','Gibraltar',7,12,0,'Mediterranean Sea',426,'Rock of Gibraltar','','National Day','10-Sep',27928,0.14,79.8,39.8,1,'Mediterranean with mild winters and warm summers','GI','.gi','GIP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(502,13,'Republic of Guatemala','Guatemala','Central America','Guatemala',108890,400,0,'Pacific Ocean',4211,'Volcan Tajumulco','15-Sep-1821','Independence Day','15-Sep',12293545,2.27,69.38,18.9,449,'tropical; hot, humid in lowlands; cooler in highlands','GT','.gt','GTQ');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(592,5,'Co-operative Republic of Guyana','Guyana','Northern South America','Georgetown',214970,459,0,'Atlantic Ocean',2835,'Mount Roraima','26-May-1966','Republic Day','23-Feb',767245,0.25,65.86,27.4,69,'tropical; hot, humid, moderated by northeast trade winds; two rainy seasons (May to August, November to January)','GY','.gy','GYD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(968,145,'Sultanate of Oman','Oman','Middle East','Muscat',212460,2092,0,'Arabian Sea',2980,'Jabal Shams','7-Jul-1904','Birthday of Sultan QABOOS','18-Nov',3102229,3.28,73.37,19,137,'dry desert; hot, humid along coast; hot, dry interior; strong southwest summer monsoon (May to September) in far south','MU','.om','OMR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(63,35,'Republic of the Philippines','Philippines','Southeastern Asia','Manila',300000,36289,0,'Philippine Sea',2954,'Mount Apo','12-Jun-1898','Independence Day','4-Jul',89468677,1.8,70.21,22.5,256,'tropical marine; northeast monsoon (November to April); southwest monsoon (May to October)','RP','.ph','PHP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(250,17,'Republic of Rwanda','Rwanda','Central Africa','Kigali',26338,0,950,'Rusizi River',4519,'Volcan Karisimbi','1-Jul-1962','Independence Day','1-Jul',8648248,2.43,47.3,18.6,9,'temperate; two rainy seasons (February to April, November to January); mild in mountains with frost and snow possible','RW','.rw','RWF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(13,9,'Cook Islands','','Oceania','Avarua',240,120,0,'Pacific Ocean',652,'Te Manga','','Constitution Day','first Monday in August',21388,NULL,NULL,NULL,9,'tropical; moderated by trade winds','CW','.ck','NZD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(683,9,'Niue','','Oceania','Alofi',260,64,0,'Pacific Ocean',68,'unnamed location','19-Oct-1974','Waitangi Day','6-Feb',2166,0.01,NULL,NULL,1,'tropical; modified by southeast trade winds','NE','.nu','NZD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(206,9,'Pitcairn, Henderson, Ducie, and Oeno Islands','Pitcairn Islands','Oceania','Adamstown',47,51,0,'Pacific Ocean',347,'Pawala Valley Ridge','','Birthday of Queen ELIZABETH II','second Saturday in June',45,-0.01,NULL,NULL,0,'tropical; hot and humid; modified by southeast trade winds; rainy season (November to March)','PC','.pn','NZD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(64,9,'New Zealand','','Oceania','Wellington',268680,15134,0,'Pacific Ocean',3754,'Aoraki-Mount Cook','26-Sep-1907','Waitangi Day','6-Feb',4076140,0.99,78.81,33.9,117,'temperate with sharp regional contrasts','NZ','.nz','NZD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(51,5,'Republic of Peru','Peru','Western South America','Lima',1285220,2414,0,'Pacific Ocean',6768,'Nevado Huascaran','28-Jul-1821','Independence Day','28-Jul',28302603,1.32,69.84,25.3,246,'varies from tropical in east to dry desert in west; temperate to frigid in Andes','PE','.pe','PEN');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(675,9,'Independent State of Papua New Guinea','Papua New Guinea','Oceania','Port Moresby',462840,5152,0,'Pacific Ocean',4509,'Mount Wilhelm','16-Sep-1975','Independence Day','16-Sep',5670544,2.21,65.28,21.2,572,'tropical; northwest monsoon (December to March), southeast monsoon (May to October); slight seasonal temperature variation','PP','.pg','PGK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(595,5,'Republic of Paraguay','Paraguay','Central South America','Asuncion',406750,0,46,'junction of Rio Paraguay and Rio Parana',842,'Cerro Pero','14-May-1811','Independence Day','15-May',6506464,2.45,75.1,21.3,880,'subtropical to temperate; substantial rainfall in the eastern portions, becoming semiarid in the far west','PA','.py','PYG');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(966,145,'Kingdom of Saudi Arabia','Saudi Arabia','Middle East','Riyadh',1960582,2640,0,'Persian Gulf',3133,'Jabal Sawda','23-Sep-1932','Unification of the Kingdom','23-Sep',27019731,2.18,75.67,21.4,202,'harsh, dry desert with great temperature extremes','SA','.sa','SAR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(677,9,'Solomon Islands','','Oceania','Honiara',28450,5313,0,'Pacific Ocean',2447,'Mount Makarakomburu','7-Jul-1978','Independence Day','7-Jul',552438,2.61,72.91,18.9,34,'tropical monsoon; few extremes of temperature and weather','BP','.sb','SBD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(248,9,'Republic of Seychelles','Seychelles','Oceania','Victoria',455,491,0,'Indian Ocean',905,'Morne Seychellois','29-Jun-1976','Constitution Day','18-Jun',81541,0.43,72.08,28.1,15,'tropical marine; humid; cooler season during southeast monsoon (late May to September); warmer season during northwest monsoon (March to May)','SE','.sc','SCR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(290,11,'Saint Helena','','islands in the South Atlantic Ocean','Jamestown',413,60,0,'Atlantic Ocean',818,'Mount Actaeon','','Birthday of Queen ELIZABETH II','second Saturday in June',7502,0.56,77.93,36,1,'tropical marine; mild, tempered by trade winds','SH','.sh','SHP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(3,143,'Republic of Kazakhstan','Kazakhstan','Central Asia','Astana',2717300,0,-132,'Vpadina Kaundy',6995,'Khan Tangiri Shyngy','16-Dec-1991','Independence Day','16-Dec',15233244,0.33,66.89,28.8,160,'continental, cold winters and hot summers, arid and semiarid','KZ','.kz','KZT');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(94,34,'Democratic Socialist Republic of Sri Lanka','Sri Lanka','Southern Asia','Colombo',65610,1340,0,'Indian Ocean',2524,'Pidurutalagala','4-Feb-1948','Independence Day','4-Feb',20222240,0.78,73.41,29.8,16,'tropical monsoon; northeast monsoon (December to March); southwest monsoon (June to October)','CE','.lk','LKR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(995,145,'Georgia','','Southwestern Asia','Tbilisi',69700,310,0,'Black Sea',5201,'Mt a Shkhara','9-Apr-1991','Independence Day','9-Apr',4661473,-0.34,76.09,37.7,25,'warm and pleasant; Mediterranean-like on Black Sea coast','GG','.ge','GEL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(266,18,'Kingdom of Lesotho','Lesotho','Southern Africa','Maseru',30355,0,1400,'junction of the Orange and Makhaleng Rivers',3482,'Thabana Ntlenyana','4-Oct-1966','Independence Day','4-Oct',2022331,-0.46,34.4,20.3,28,'temperate; cool to cold, dry winters; hot, wet summers','LT','.ls','LSL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(283,15,'Western Sahara','','Northern Africa','',266000,1110,-55,'Sebjet Tah',463,'unnamed location',NULL,NULL,NULL,273008,NULL,NULL,NULL,11,'hot, dry desert; rain is rare; cold offshore air currents produce fog and heavy dew','WI','.eh','MAD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(373,151,'Republic of Moldova','Moldova','Eastern Europe','Chisinau',33843,0,2,'Dniester River',430,'Dealul Balanesti','27-Aug-1991','Independence Day','27-Aug',4466706,0.28,65.65,32.3,15,'moderate winters, warm summers','MD','.md','MDL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(389,39,'Republic of Macedonia','Macedonia','Southeastern Europe','Skopje',25333,0,50,'Vardar River',2764,'Golem Korab','8-Sep-1991','Uprising Day','2-Aug',2050554,0.26,73.97,34.1,17,'warm, dry summers and autumns; relatively cold winters with heavy snowfall','MK','.mk','MKD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(2001,35,'Union of Burma','Burma','Southeastern Asia','Rangoon',678500,1930,0,'Andaman Sea',5881,'Hkakabo Razi','4-Jan-1948','Independence Day','4-Jan',47382633,0.81,60.97,27,84,'tropical monsoon; cloudy, rainy, hot, humid summers (southwest monsoon, June to September; less cloudy, scant rainfall, mild temperatures, lower humidity during winter (northeast monsoon, December to April)','','.mm','MMK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(976,30,'Mongolia','','Northern Asia','Ulaanbaatar',1564116,0,518,'Hoh Nuur',4374,'Nayramadlin Orgil','11-Jul-1921','Independence Day','11-Jul',2832224,1.46,64.89,24.6,48,'desert; continental (large daily and seasonal temperature ranges)','MG','.mn','MNT');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(853,30,'Macau Special Administrative Region','Macau','Eastern Asia','',28,41,0,'South China Sea',172,'Coloane Alto','','National Day','1-Oct',453125,0.86,82.19,36.1,1,'subtropical; marine with cool winters, warm summers','MC','.mo','MOP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(356,39,'Republic of Malta','Malta','Southern Europe','Valletta',316,197,0,'Mediterranean Sea',253,'Ta Dmejrek','21-Sep-1964','Independence Day','21-Sep',400214,0.42,79.01,38.7,1,'Mediterranean; mild, rainy winters; hot, dry summers','MT','.mt','MTL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(265,18,'Republic of Malawi','Malawi','Southern Africa','Lilongwe',118480,0,37,'junction of the Shire River and international boundary with Mozambique',3002,'Sapitwa','6-Jul-1964','Independence Day','6-Jul',13013926,2.38,41.7,16.5,42,'sub-tropical; rainy season (November to May); dry season (May to November)','MI','.mw','MWK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(52,13,'United Mexican States','Mexico','Middle America','Mexico',1972550,9330,-10,'Laguna Salada',5700,'Volcan Pico de Orizaba','16-Sep-1810','Independence Day','16-Sep',107449525,1.16,75.41,25.3,1832,'varies from tropical to desert','MX','.mx','MXN');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(60,35,'Malaysia','','Southeastern Asia','Kuala Lumpur',329750,4675,0,'Indian Ocean',4100,'Gunung Kinabalu','31-Aug-1957','Independence Day','31-Aug',24385858,1.78,72.5,24.1,117,'tropical; annual southwest (April to October) and northeast (October to February) monsoons','MY','.my','MYR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(961,145,'Lebanese Republic','Lebanon','Middle East','Beirut',10400,225,0,'Mediterranean Sea',3088,'Qurnat as Sawda','22-Nov-1943','Independence Day','22-Nov',3874050,1.23,72.88,27.8,7,'Mediterranean; mild to cool, wet winters with hot, dry summers; Lebanon mountains experience heavy winter snows','LE','.lb','LBP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(258,18,'Republic of Mozambique','Mozambique','Southeastern Africa','Maputo',801590,2470,0,'Indian Ocean',2436,'Monte Binga','25-Jun-1975','Independence Day','25-Jun',19686505,1.38,39.82,18.3,158,'tropical to subtropical','MZ','.mz','MZM');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(681,9,'Territory of the Wallis and Futuna Islands','Wallis and Futuna','Oceania','Mata-Utu',274,129,0,'Pacific Ocean',765,'Mont Singavi','','Bastille Day','14-Jul',16025,NULL,NULL,NULL,2,'tropical; hot, rainy season (November to April); cool, dry season (May to October); rains 2,500-3,000 mm per year (80% humidity); average temperature 26.6 degrees C','WF','.wf','XPF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(689,9,'Overseas Lands of French Polynesia','French Polynesia','Oceania','Papeete',4167,2525,0,'Pacific Ocean',2241,'Mont Orohena','','Bastille Day','14-Jul',274578,1.48,76.1,27.9,50,'tropical, but moderate','FP','.pf','XPF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(27,18,'Republic of South Africa','South Africa','Southern Africa','Pretoria',1219912,2798,0,'Atlantic Ocean',3408,'Njesuthi','31-May-1910','Freedom Day','27-Apr',44187637,-0.4,42.73,24.1,728,'mostly semiarid; subtropical along east coast; sunny days, cool nights','SF','.za','ZAR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(260,18,'Republic of Zambia','Zambia','Southern Africa','Lusaka',752614,0,329,'Zambezi river',2301,'unnamed location in Mafinga Hills','24-Oct-1964','Independence Day','24-Oct',11502010,2.11,40.03,16.5,109,'tropical; modified by altitude; rainy season (October to April)','ZA','.zm','ZMK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(263,18,'Republic of Zimbabwe','Zimbabwe','Southern Africa','Harare',390580,0,162,'junction of the Runde and Save rivers',2592,'Inyangani','18-Apr-1980','Independence Day','18-Apr',12236805,0.62,39.29,19.9,404,'tropical; moderated by altitude; rainy season (November to March)','ZI','.zw','ZWD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(505,13,'Republic of Nicaragua','Nicaragua','Central America','Managua',129494,910,0,'Pacific Ocean',2438,'Mogoton','15-Sep-1821','Independence Day','15-Sep',5570129,1.89,70.63,20.9,176,'tropical in lowlands, cooler in highlands','NU','.ni','NIO');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(977,34,'Kingdom of Nepal','Nepal','Southern Asia','Kathmandu',147181,0,70,'Kanchan Kalan',8850,'Mount Everest','2-Nov-1904','Birthday of King GYANENDRA','7-Jul',28287147,2.17,60.18,20.3,48,'varies from cool summers and severe winters in north to subtropical summers and mild winters in south','NP','.np','NPR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(690,9,'Tokelau','','Oceania','',10,101,0,'Pacific Ocean',5,'unnamed location','','Waitangi Day','6-Feb',1392,-0.01,NULL,NULL,0,'tropical; moderated by trade winds (April to November)','TL','.tk','NZD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1,21,'United States of America','United States','North America','Washington, DC',9631420,19924,-86,'Death Valley',6194,'Mount McKinley','4-Jul-1776','Independence Day','4-Jul',298444215,0.91,77.85,36.5,14893,'mostly temperate, but tropical in Hawaii and Florida, arctic in Alaska, semiarid in the great plains west of the Mississippi River, and arid in the Great Basin of the southwest; low winter temperatures in the northwest are ameliorated occasionally in January and February by warm chinook winds from the eastern slopes of the Rocky Mountains','US','.us','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(852,30,'Hong Kong Special Administrative Region','Hong Kong','Eastern Asia','',1092,733,0,'South China Sea',958,'Tai Mo Shan','','National Day','1-Oct',6940432,0.59,81.59,40.7,3,'subtropical monsoon; cool and humid in winter, hot and rainy from spring through summer, warm and sunny in fall','HK','.hk','HKD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(15,18,'Europa Island','','Southern Africa','',28,22,0,'Indian Ocean',24,'unnamed location',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'tropical','EU',NULL,'NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(92,34,'Islamic Republic of Pakistan','Pakistan','Southern Asia','Islamabad',803940,1046,0,'Indian Ocean',8611,'K2','14-Aug-1947','Republic Day','23-Mar',165803560,2.09,63.39,19.8,134,'mostly hot, dry desert; temperate in northwest; arctic in north','PK','.pk','PKR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(20,15,'Arab Republic of Egypt','Egypt','Northern Africa','Cairo',1001450,2450,-133,'Qattara Depression',2629,'Mount Catherine','28-Feb-1922','Revolution Day','23-Jul',78887007,1.75,71.29,24,87,'desert; hot, dry summers with moderate winters','EG','.eg','EGP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(385,39,'Republic of Croatia','Croatia','Southeastern Europe','Zagreb',56542,5835,0,'Adriatic Sea',1830,'Dinara','25-Jun-1991','Independence Day','8-Oct',4494749,-0.03,74.68,40.3,68,'Mediterranean and continental; continental climate predominant with hot summers and cold winters; mild winters, dry summers along coast','HR','.hr','HRK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(509,29,'Republic of Haiti','Haiti','Caribbean','Port-au-Prince',27750,1771,0,'Caribbean Sea',2680,'Chaine de la Selle','1-Jan-1804','Independence Day','1-Jan',8308504,2.3,53.23,18.2,12,'tropical; semiarid where mountains in east cut off trade winds','HA','.ht','HTG');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(91,34,'Republic of India','India','Southern Asia','New Delhi',3287590,7000,0,'Indian Ocean',8598,'Kanchenjunga','15-Aug-1947','Republic Day','26-Jan',1095351995,1.38,64.71,24.9,334,'varies from tropical monsoon in south to temperate in north','IN','.in','INR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(98,34,'Islamic Republic of Iran','Iran','Middle East','Tehran',2,2440,-28,'Caspian Sea',5671,'Kuh-e Damavand','1-Apr-1979','Republic Day','1-Apr',68688433,1.1,70.26,24.8,310,'mostly arid or semiarid, subtropical along Caspian coast','IR','.ir','IRR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1876,29,'Jamaica','','Caribbean','Kingston',10991,1022,0,'Caribbean Sea',2256,'Blue Mountain Peak','6-Aug-1962','Independence Day','6-Aug',2758124,0.8,73.24,23,35,'tropical; hot, humid; temperate interior','JM','.jm','JMD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(254,14,'Republic of Kenya','Kenya','Eastern Africa','Nairobi',582650,536,0,'Indian Ocean',5199,'Mount Kenya','12-Dec-1963','Independence Day','12-Dec',34707817,2.57,48.93,18.2,224,'varies from tropical along coast to arid in interior','KE','.ke','KES');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(855,35,'Kingdom of Cambodia','Cambodia','Southeastern Asia','Phnom Penh',181040,443,0,'Gulf of Thailand',1810,'Phnum Aoral','9-Nov-1953','Independence Day','9-Nov',13881427,1.78,59.29,20.6,20,'tropical; rainy, monsoon season (May to November); dry season (December to April); little seasonal temperature variation','CB','.kh','KHR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(269,18,'Union of the Comoros','Comoros','Southern Africa','Moroni',2170,340,0,'Indian Ocean',2360,'Le Kartala','6-Jul-1975','Independence Day','6-Jul',690948,2.87,62.33,18.6,4,'tropical marine; rainy season (November to May)','CN','.km','KMF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(82,30,'Republic of Korea','South Korea','Eastern Asia','Seoul',98480,2413,0,'Sea of Japan',1950,'Halla-san','15-Aug-1945','Liberation Day','15-Aug',48846823,0.42,77.04,35.2,108,'temperate, with rainfall heavier in summer than winter','KS','.kr','KRW');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1345,29,'Cayman Islands','','Caribbean','George Town',262,160,0,'Caribbean Sea',43,'The Bluff','','Constitution Day','first Monday in July',45436,2.56,80.07,37.2,3,'tropical marine; warm, rainy summers (May to October) and cool, relatively dry winters (November to April)','CJ','.ky','KYD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(850,30,'Democratic Peoples Republic of Korea','North Korea','Eastern Asia','Pyongyang',120540,2495,0,'Sea of Japan',2744,'Paektu-san','15-Aug-1945','Founding of the Democratic Peoples Republic of Korea','9-Sep',23113019,0.84,71.65,32,79,'temperate with rainfall concentrated in summer','KN','.kp','KPW');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(964,145,'Republic of Iraq','Iraq','Middle East','Baghdad',437072,58,0,'Persian Gulf',3611,'unnamed peak','28-Jun-2004',NULL,NULL,26783383,2.66,69.01,19.7,111,'mostly desert; mild to cool winters with dry, hot, cloudless summers; northern mountainous regions along Iranian and Turkish borders experience cold winters with occasionally heavy snows that melt in early spring, sometimes causing extensive flooding in central and southern Iraq','IZ','.iq','NID');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(508,21,'Territorial Collectivity of Saint Pierre and Miquelon','Saint Pierre and Miquelon','Northern North America','Saint-Pierre',242,120,0,'Atlantic Ocean',240,'Morne de la Grande Montagne','','Bastille Day','14-Jul',7026,0.17,78.61,34.1,2,'cold and wet, with much mist and fog; spring and autumn are windy','SB','.pm','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(262,18,'Department of Reunion','Reunion','Southern Africa','Saint-Denis',2517,207,0,'Indian Ocean',3069,'Piton des Neiges','','Bastille Day','14-Jul',787584,1.34,74.18,26.9,2,'tropical, but temperature moderates with elevation; cool and dry (May to November), hot and rainy (November to April)','RE','.re','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(590,29,'Department of Guadeloupe','Guadeloupe','Caribbean','Basse-Terre',1780,306,0,'Caribbean Sea',1484,'Soufriere','','Bastille Day','14-Jul',452776,0.88,78.06,32.2,9,'subtropical tempered by trade winds; moderately high humidity','GP','.gp','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(376,39,'Principality of Andorra','Andorra','Southwestern Europe','Andorra la Vella',468,0,840,'Riu Runer',2946,'Coma Pedrosa','1-Jul-1903','Our Lady of Meritxell Day','8-Sep',71201,0.89,83.51,40.9,0,'temperate; snowy, cold winters and warm, dry summers','AN','.ad','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(351,39,'Portuguese Republic','Portugal','Southwestern Europe','Lisbon',92391,1793,0,'Atlantic Ocean',2351,'Ponta do Pico','5-Oct-1910','Portugal Day','10-Jun',10605870,0.36,77.7,38.5,66,'maritime temperate; cool and rainy in north, warmer and drier in south','PO','.pt','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(381,39,'Republic of Montenegro','Montenegro','Southeastern Europe','Cetinje',14026,294,0,'Adriatic Sea',2522,'Bobotov Kuk','3-Jun-2006','National Day','13-Jul',630548,3.5,NULL,NULL,5,'Mediterranean climate, hot dry summers and autumns and relatively cold winters with heavy snowfalls inland','MJ','','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(270,18,'Territorial Collectivity of Mayotte','Mayotte','Southern Africa','Mamoutzou',374,185,0,'Indian Ocean',660,'Benara','','Bastille Day','14-Jul',201234,3.77,61.76,17,1,'tropical; marine; hot, humid, rainy season during northeastern monsoon (November to May); dry season is cooler (May to November)','MF','.yt','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(596,29,'Department of Martinique','Martinique','Caribbean','Fort-de-France',1100,350,0,'Caribbean Sea',1397,'Montagne Pelee','','Bastille Day','14-Jul',436131,0.72,79.18,34.1,2,'tropical; moderated by trade winds; rainy season (June to October); vulnerable to devastating cyclones (hurricanes) every eight years on average; average temperature 17.3 degrees C; humid','MB','.mq','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(679,9,'Republic of the Fiji Islands','Fiji','Oceania','Suva',18270,1129,0,'Pacific Ocean',1324,'Tomanivi','10-Oct-1970','Independence Day','second Monday of October',905949,1.4,69.82,24.6,28,'tropical marine; only slight seasonal temperature variation','FJ','.fj','FJD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(213,15,'Peoples Democratic Republic of Algeria','Algeria','Northern Africa','Algiers',2381740,998,-40,'Chott Melrhir',3003,'Tahat','5-Jul-1962','Revolution Day','1-Nov',32930091,1.22,73.26,24.9,137,'arid to semiarid','AG','.dz','DZD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(245,11,'Republic of Guinea-Bissau','Guinea-Bissau','Western Africa','Bissau',36120,350,0,'Atlantic Ocean',300,'unnamed location','24-Sep-1973','Independence Day','24-Sep',1442029,2.07,46.87,19,28,'tropical; generally hot and humid; monsoonal-type rainy season (June to November) with southwesterly winds; dry season (December to May) with northeasterly harmattan winds','PU','.gw','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(676,9,'Kingdom of Tonga','Tonga','Oceania','Nuku alofa',748,419,0,'Pacific Ocean',1033,'unnamed location on Kao Island','4-Jun-1970','Emancipation Day','4-Jun',114689,2.01,69.82,20.7,6,'tropical; modified by trade winds; warm season (December to May), cool season (May to December)','TN','.to','TOP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(240,11,'Republic of Equatorial Guinea','Equatorial Guinea','Western Africa','Malabo',28051,296,0,'Atlantic Ocean',3008,'Pico Basile','12-Oct-1968','Independence Day','12-Oct',540109,2.05,49.54,18.8,4,'tropical; always hot, humid','EK','.gq','XAF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1784,29,'Saint Vincent and the Grenadines','','Caribbean','Kingstown',389,84,0,'Caribbean Sea',1234,'La Soufriere','27-Oct-1979','Independence Day','27-Oct',117848,0.26,73.85,26.9,6,'tropical; little seasonal temperature variation; rainy season (May to November)','VC','.vc','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1869,29,'Federation of Saint Kitts and Nevis','Saint Kitts and Nevis','Caribbean','Basseterre',261,135,0,'Caribbean Sea',1156,'Mount Liamuiga','19-Sep-1983','Independence Day','19-Sep',39129,0.5,72.4,27.8,2,'tropical, tempered by constant sea breezes; little seasonal temperature variation; rainy season (May to November)','SC','.kn','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(236,17,'Central African Republic','','Central Africa','Bangui',622984,0,335,'Oubangui River',1420,'Mont Ngaoui','13-Aug-1960','Republic Day','1-Dec',4303356,1.53,43.54,18.4,50,'tropical; hot, dry winters; mild to hot, wet summers','CT','.cf','XAF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1473,29,'Grenada','','Caribbean','Saint Georges',344,121,0,'Caribbean Sea',840,'Mount Saint Catherine','7-Feb-1974','Independence Day','7-Feb',89703,0.26,64.87,21.7,3,'tropical; tempered by northeast trade winds','GJ','.gd','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1767,29,'Commonwealth of Dominica','Dominica','Caribbean','Roseau',754,148,0,'Caribbean Sea',1447,'Morne Diablatins','3-Nov-1978','Independence Day','3-Nov',68910,-0.08,74.87,30.1,2,'tropical; moderated by northeast trade winds; heavy rainfall','DO','.dm','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1264,29,'Anguilla','','Caribbean','The Valley',102,61,0,'Caribbean Sea',65,'Crocus Hill','','Anguilla Day','30-May',13477,1.57,77.28,31.2,3,'tropical; moderated by northeast trade winds','AV','.ai','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1268,29,'Antigua and Barbuda','','Caribbean','Saint Johns',443,153,0,'Caribbean Sea',402,'Boggy Peak','1-Nov-1981','Independence Day (National Day)','1-Nov',69108,0.55,72.16,30,3,'tropical maritime','AC','.ag','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1664,29,'Montserrat','','Caribbean','Plymouth',102,40,0,'Caribbean Sea',930,'lava dome in Englishs Crater','','Birthday of Queen ELIZABETH II','second Saturday in June',9439,1.05,78.85,28.9,1,'tropical; little daily or seasonal temperature variation','MH','.ms','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(255,14,'United Republic of Tanzania','Tanzania','Eastern Africa','Dar es Salaam',945087,1424,0,'Indian Ocean',5895,'Kilimanjaro','26-Apr-1964','Union Day','26-Apr',37445392,1.83,45.64,17.7,123,'varies from tropical along coast to temperate in highlands','TZ','.tz','TZS');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(386,39,'Republic of Slovenia','Slovenia','Central Europe','Ljubljana',20273,47,0,'Adriatic Sea',2864,'Triglav','25-Jun-1991','Independence Day','25-Jun',2010347,-0.05,76.33,40.6,14,'Mediterranean climate on the coast, continental climate with mild to hot summers and cold winters in the plateaus and valleys to the east','SI','.si','SIT');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(268,18,'Kingdom of Swaziland','Swaziland','Southern Africa','Mbabane',17363,0,21,'Great Usutu River',1862,'Emlembe','6-Sep-1968','Independence Day','6-Sep',1136334,-0.23,32.62,18.5,18,'varies from tropical to near temperate','WZ','.sz','SZL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(993,143,'Turkmenistan','','Central Asia','Ashgabat',488100,0,-81,'Vpadina Akchanaya',3139,'Gora Ayribaba','27-Oct-1991','Independence Day','27-Oct',5042920,1.83,61.83,21.8,39,'subtropical desert','TX','.tm','TMM');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(256,14,'Republic of Uganda','Uganda','Eastern Africa','Kampala',236040,0,621,'Lake Albert',5110,'Margherita Peak on Mount Stanley','9-Oct-1962','Independence Day','9-Oct',28195754,3.37,52.67,15,28,'tropical; generally rainy with two dry seasons (December to February, June to August); semiarid in northeast','UG','.ug','UGX');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(31,155,'Kingdom of the Netherlands','Netherlands','Western Europe','Amsterdam',41526,451,-7,'Zuidplaspolder',322,'Vaalserberg','23-Jan-1579','Queens Day','30-Apr',16491461,0.49,78.96,39.4,27,'temperate; marine; cool summers and mild winters','NL','.nl','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(992,143,'Republic of Tajikistan','Tajikistan','Central Asia','Dushanbe',143100,0,300,'Syr Darya',7495,'Qullai Ismoili Somoni','9-Sep-1991','Independence Day','9-Sep',7320815,2.19,64.94,20,45,'midlatitude continental, hot summers, mild winters; semiarid to polar in Pamir Mountains','TI','.tj','TJS');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1340,29,'United States Virgin Islands','Virgin Islands','Caribbean','Charlotte Amalie',1910,188,0,'Caribbean Sea',475,'Crown Mountain','','Transfer Day','27-Mar',108605,-0.12,79.05,37.1,2,'subtropical, tempered by easterly trade winds, relatively low humidity, little seasonal temperature variation; rainy season September to November','VQ','.vi','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1284,29,'British Virgin Islands','','Caribbean','Road Town',153,80,0,'Caribbean Sea',521,'Mount Sage','','Territory Day','1-Jul',23098,1.97,76.68,31.4,3,'subtropical; humid; temperatures moderated by trade winds','VI','.vg','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(244,18,'Republic of Angola','Angola','Southern Africa','Luanda',1246700,1600,0,'Atlantic Ocean',2620,'Morro de Moco','11-Nov-1975','Independence Day','11-Nov',12127071,2.45,38.62,18,243,'semiarid in south and along coast to Luanda; north has cool, dry season (May to October) and hot, rainy season (November to April)','AO','.ao','AOA');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1649,29,'Turks and Caicos Islands','','Caribbean','Grand Turk',430,389,0,'Caribbean Sea',49,'Blue Hills','','Constitution Day','30-Aug',21152,2.82,74.73,27.5,8,'tropical; marine; moderated by trade winds; sunny and relatively dry','TK','.tc','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(692,9,'Republic of the Marshall Islands','Marshall Islands','Oceania','Majuro',11854,370,0,'Pacific Ocean',10,'unnamed location','1-Oct-1986','Constitution Day','1-May',60422,2.25,70.31,20.3,15,'tropical; hot and humid; wet season May to November; islands border typhoon belt','RM','.mh','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1671,9,'Territory of Guam','Guam','Oceania','Hagatna',541,126,0,'Pacific Ocean',406,'Mount Lamlam','','Discovery Day','first Monday in March',171019,1.43,78.58,28.6,5,'tropical marine; generally warm and humid, moderated by northeast trade winds; dry season (January to June), rainy season (July to December); little seasonal temperature variation','GQ','.gu','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(691,9,'Federated States of Micronesia','','Oceania','Palikir',702,6112,0,'Pacific Ocean',791,'Dolohmwar','3-Nov-1986','Constitution Day','10-May',108004,-0.11,70.05,20.9,6,'tropical; heavy year-round rainfall, especially in the eastern islands; located on southern edge of the typhoon belt with occasionally severe damage','FM','.fm','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(503,13,'Republic of El Salvador','El Salvador','Central America','San Salvador',21040,307,0,'Pacific Ocean',2730,'Cerro El Pital','15-Sep-1821','Independence Day','15-Sep',6822378,1.72,71.49,21.8,76,'tropical; rainy season (May to October); dry season (November to April); tropical on coast; temperate in uplands','ES','.sv','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(593,5,'Republic of Ecuador','Ecuador','Western South America','Quito',283560,2237,0,'Pacific Ocean',6267,'Chimborazo','24 May 1822','Independence Day','10-Aug',13547510,1.5,76.42,23.6,285,'tropical along coast, becoming cooler inland at higher elevations; tropical in Amazonian jungle lowlands','EC','.ec','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1670,9,'Commonwealth of the Northern Mariana Islands','Northern Mariana Islands','Oceania','Saipan',477,1482,0,'Pacific Ocean',965,'unnamed location on Agrihan','','Commonwealth Day','8-Jan',82459,2.54,76.09,29.5,5,'tropical marine; moderated by northeast trade winds, little seasonal temperature variation; dry season December to June, rainy season July to October','CQ','.mp','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(684,9,'Territory of American Samoa','American Samoa','Oceania','Pago Pago',199,116,0,'Pacific Ocean',964,'Lata Mountain','','Flag Day','17-Apr',57794,-0.19,76.05,23.2,3,'tropical marine, moderated by southeast trade winds; annual rainfall averages about 3 m; rainy season (November to April), dry season (May to October); little seasonal temperature variation','AQ','.as','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(239,11,'Democratic Republic of Sao Tome and Principe','Sao Tome and Principe','Western Africa','Sao Tome',1001,209,0,'Atlantic Ocean',2024,'Pico de Sao Tome','12-Jul-1975','Independence Day','12-Jul',193413,3.15,67.31,16.2,2,'tropical; hot, humid; one rainy season (October to May)','TP','.st','STD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(598,5,'Oriental Republic of Uruguay','Uruguay','Southern South America','Montevideo',176220,660,0,'Atlantic Ocean',514,'Cerro Catedral','25-Aug-1825','Independence Day','25-Aug',3431932,0.46,76.33,32.7,64,'warm temperate; freezing temperatures almost unknown','UY','.uy','UYU');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(998,143,'Republic of Uzbekistan','Uzbekistan','Central Asia','Tashkent',447400,0,-12,'Sariqarnish Kuli',4301,'Adelunga Toghi','1-Sep-1991','Independence Day','1-Sep',27307134,1.7,64.58,22.7,79,'mostly midlatitude desert, long, hot summers, mild winters; semiarid grassland in east','UZ','.uz','UZS');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(58,5,'Bolivarian Republic of Venezuela','Venezuela','Northern South America','Caracas',912050,2800,0,'Caribbean Sea',5007,'Pico Bolivar','5-Jul-1811','Independence Day','5-Jul',25730435,1.38,74.54,26,370,'tropical; hot, humid; more moderate in highlands','VE','.ve','VEB');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(678,9,'Republic of Vanuatu','Vanuatu','Oceania','Port-Vila',12200,2528,0,'Pacific Ocean',1877,'Tabwemasana','30-Jul-1980','Independence Day','30-Jul',208869,1.49,62.85,23,31,'tropical; moderated by southeast trade winds from May to October; moderate rainfall from November to April; may be affected by cyclones from December to April','NH','.vu','VUV');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(48,151,'Republic of Poland','Poland','Central Europe','Warsaw',312685,491,-2,'near Raczki Elblaskie',2499,'Rysy','11-Nov-1918','Constitution Day','3-May',38536869,-0.05,74.97,37,123,'temperate with cold, cloudy, moderately severe winters with frequent precipitation; mild summers with frequent showers and thundershowers','PL','.pl','PLN');
-- *******************

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(670,35,'Democratic Republic of Timor-Leste','East Timor','Southeastern Asia','Dili',15007,706,0,'Timor Sea',2963,'Foho Tatamailau','28-Nov-1975','Independence Day','28-Nov',1062777,2.08,66.26,20.8,8,'tropical; hot, humid; distinct rainy and dry seasons','TT','.tl','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(46,154,'Kingdom of Sweden','Sweden','Northern Europe','Stockholm',449964,3218,-2,'reclaimed bay of Lake Hammarsjon',2111,'Kebnekaise','6-Jun-1523','Flag Day','6-Jun',9016596,0.16,80.51,40.9,255,'temperate in south with cold, cloudy winters and cool, partly cloudy summers; subarctic in north','SW','.se','SEK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(421,151,'Slovak Republic','Slovakia','Central Europe','Bratislava',48845,0,94,'Bodrok River',2655,'Gerlachovsky Stit','1-Jan-1993','Constitution Day','1-Sep',5439448,0.15,74.73,35.8,34,'temperate; cool summers; cold, cloudy, humid winters','LO','.sk','SKK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1758,29,'Saint Lucia','','Caribbean','Castries',616,158,0,'Caribbean Sea',950,'Mount Gimie','22-Feb-1979','Independence Day','22-Feb',168458,1.29,73.84,25.2,2,'tropical, moderated by northeast trade winds; dry season January to April, rainy season May to August','ST','.lc','XCD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(205,18,'Juan de Nova Island','','Southern Africa',NULL,4,24,0,'Indian Ocean',10,'unnamed location',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'tropical','JU',NULL,'NONE');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(230,18,'Republic of Mauritius','Mauritius','Southern Africa','Port Louis',2040,177,0,'Indian Ocean',828,'Mont Piton','12-Mar-1968','Independence Day','12-Mar',1240827,0.82,72.63,30.8,6,'tropical, modified by southeast trade winds; warm, dry winter (May to November); hot, wet, humid summer (November to May)','MP','.mu','MUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(47,154,'Kingdom of Norway','Norway','Northern Europe','Oslo',324220,25148,0,'Norwegian Sea',2469,'Galdhopiggen','7-Jun-1905','Constitution Day','17-May',4610820,0.38,79.54,38.4,100,'temperate along coast, modified by North Atlantic Current; colder interior with increased precipitation and colder summers; rainy year-round on west coast','NO','.no','NOK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(53,29,'Republic of Cuba','Cuba','Caribbean','Havana',110860,3735,0,'Caribbean Sea',2005,'Pico Turquino','20-May-1902','Independence Day','20-May',11382820,0.31,77.41,35.9,170,'tropical; moderated by trade winds; dry season (November to April); rainy season (May to October)','CU','.cu','CUP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(56,5,'Republic of Chile','Chile','Southern South America','Santiago',756950,6435,0,'Pacific Ocean',6880,'Nevado Ojos del Salado','18-Sep-1810','Independence Day','18-Sep',16134219,0.94,76.77,30.4,363,'temperate; desert in north; Mediterranean in central region; cool and damp in south','CI','.cl','CLP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(57,5,'Republic of Colombia','Colombia','Northern South America','Bogota',1138910,3208,0,'Pacific Ocean',5775,'Pico Cristobal Colon','20-Jul-1810','Independence Day','20-Jul',43593035,1.46,71.99,26.3,981,'tropical along coast and eastern plains; cooler in highlands','CO','.co','COP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(62,35,'Republic of Indonesia','Indonesia','Southeastern Asia','Jakarta',1919440,54716,0,'Indian Ocean',5030,'Puncak Jaya','17-Aug-1945','Independence Day','17-Aug',245452739,1.41,69.87,26.8,668,'tropical; hot, humid; more moderate in highlands','ID','.id','IDR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(65,35,'Republic of Singapore','Singapore','Southeastern Asia','Singapore',693,193,0,'Singapore Strait',166,'Bukit Timah','9-Aug-1965','National Day','9-Aug',4492150,1.42,81.71,37.3,9,'tropical; hot, humid, rainy; two distinct monsoon seasons - Northeastern monsoon (December to March) and Southwestern monsoon (June to September); inter-monsoon - frequent afternoon and early evening thunderstorms','SN','.sg','SGD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(39,39,'Italian Republic','Italy','Southern Europe','Rome',301230,7600,0,'Mediterranean Sea',4748,'Mont Blanc','17-Mar-1861','Republic Day','2-Jun',58133509,0.04,79.81,42.2,135,'predominantly Mediterranean; Alpine in far north; hot, dry in south','IT','.it','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(49,155,'Federal Republic of Germany','Germany','Central Europe','Berlin',357021,2389,-4,'Neuendorf bei Wilster',2963,'Zugspitze','15-Mar-1991','Unity Day','3-Oct',82422299,-0.02,78.8,42.6,552,'temperate and marine; cool, cloudy, wet winters and summers; occasional warm mountain (foehn) wind','GM','.de','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(36,151,'Republic of Hungary','Hungary','Central Europe','Budapest',93030,0,78,'Tisza River',1014,'Kekes','27-Sep-1902','Saint Stephens Day','20-Aug',9981334,-0.25,72.66,38.7,44,'temperate; cold, cloudy, humid winters; warm summers','HU','.hu','HUF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(32,155,'Kingdom of Belgium','Belgium','Western Europe','Brussels',30528,67,0,'North Sea',694,'Signal de Botrange','4-Oct-1830','','21-Jul',10379067,0.13,78.77,40.9,43,'temperate; mild winters, cool summers; rainy, humid, cloudy','BE','.be','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(33,155,'French Republic','France','Western Europe','Paris',547030,3427,-2,'Rhone River delta',4807,'Mont Blanc','','Bastille Day','14-Jul',60876136,0.35,79.73,39.1,479,'generally cool winters and mild summers, but mild winters and hot summers along the Mediterranean; occasional strong, cold, dry, north-to-northwesterly wind known as mistral','FR','.fr','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(7,151,'Russian Federation','Russia','Northern Asia','Moscow',17075200,37653,-28,'Caspian Sea',5633,'Gora El brus','24-Aug-1991','Russia Day','12-Jun',142893540,-0.37,67.08,38.4,1730,'ranges from steppes in the south through humid continental in much of European Russia; subarctic in Siberia to tundra climate in the polar north; winters vary from cool along Black Sea coast to frigid in Siberia; summers vary from warm in the steppes to cool along Arctic coast','RS','.ru','RUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(45,154,'Kingdom of Denmark','Denmark','Northern Europe','Copenhagen',43094,7314,-7,'Lammefjord',173,'Yding Skovhoej','','Constitution Day','5-Jun',5450661,0.33,77.79,39.8,97,'temperate; humid and overcast; mild, windy winters and cool summers','DA','.dk','DKK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(41,155,'Swiss Confederation','Switzerland','Central Europe','Bern',41290,0,195,'Lake Maggiore',4634,'Dufourspitze','1-Aug-1291','Founding of the Swiss Confederation','1-Aug',7523934,0.43,80.51,40.1,65,'temperate, but varies with altitude; cold, cloudy, rainy/snowy winters; cool to warm, cloudy, humid summers with occasional showers','SZ','.ch','CHF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(43,155,'Republic of Austria','Austria','Central Europe','Vienna',83870,0,115,'Neusiedler See',3798,'Grossglockner','17-Sep-1156','National Day','26-Oct',8192880,0.09,79.07,40.9,55,'temperate; continental, cloudy; cold winters with frequent rain and some snow in lowlands and snow in mountains; moderate summers with occasional showers','AU','.at','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(209,154,'Svalbard','','Northern Europe','Longyearbyen',62049,3587,0,'Arctic Ocean',1717,'Newtontoppen',NULL,NULL,NULL,2701,-0.02,NULL,NULL,4,'arctic, tempered by warm North Atlantic Current; cool summers, cold winters; North Atlantic Current flows along west and north coasts of Spitsbergen, keeping water open and navigable most of the year','SV','.sj','NOK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(81,30,'Japan','','Eastern Asia','Tokyo',377835,29751,-4,'Hachiro-gata',3776,'Mount Fuji','660 B.C.','Birthday of Emperor AKIHITO','23-Dec',127463611,0.02,81.25,42.9,173,'varies from tropical in south to cool temperate in north','JA','.jp','JPY');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(84,35,'Socialist Republic of Vietnam','Vietnam','Southeastern Asia','Hanoi',329560,3444,0,'South China Sea',3144,'Fan Si Pan','2-Sep-1945','Independence Day','2-Sep',84402966,1.02,70.85,25.9,28,'tropical in south; monsoonal in north with hot, rainy season (May to September) and warm, dry season (October to March)','VM','.vn','VND');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(86,30,'Peoples Republic of China','China','Eastern Asia','Beijing',9596960,14500,-154,'Turpan Pendi',8850,'Mount Everest','1-Oct-1949','Anniversary of the Founding of the Peoples Republic of China','1-Oct',1313973713,0.59,72.58,32.7,489,'extremely diverse; tropical in south to subarctic in north','CH','.cn','CNY');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(90,151,'Republic of Turkey','Turkey','Southeastern Europe','Ankara',780580,7200,0,'Mediterranean Sea',5166,'Mount Ararat','29-Oct-1923','Republic Day','29-Oct',70413958,1.06,72.62,28.1,120,'temperate; hot, dry summers with mild, wet winters; harsher in interior','TU','.tr','YTL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(298,154,'Faroe Islands','','Northern Europe','Torshavn',1399,1117,0,'Atlantic Ocean',882,'Slaettaratindur','','Olaifest','29-Jul',47246,0.58,79.35,35,1,'mild winters, cool summers; usually overcast; foggy, windy','FO','.fo','DKK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(22,155,'Bailiwick of Guernsey','Guernsey','Western Europe','Saint Peter Port',78,50,0,'Atlantic Ocean',114,'unnamed location','','Liberation Day','9-May',65409,0.26,80.42,41.3,2,'temperate with mild winters and cool summers; about 50% of days are overcast','GK','.gg','GBP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(30,39,'Hellenic Republic','Greece','Southern Europe','Athens',131940,13676,0,'Mediterranean Sea',2917,'Mount Olympus','2-Jan-1905','Independence Day','25-Mar',10688058,0.18,79.24,40.8,82,'temperate; mild, wet winters; hot, dry summers','GR','.gr','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(228,11,'Togolese Republic','Togo','Western Africa','Lome',56785,56,0,'Atlantic Ocean',986,'Mont Agou','27-Apr-1960','Independence Day','27-Apr',5548702,2.72,57.42,18.3,9,'tropical; hot, humid in south; semiarid in north','TO','.tg','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(229,11,'Republic of Benin','Benin','Western Africa','Porto-Novo',112620,121,0,'Atlantic Ocean',658,'Mont Sokbaro','1-Aug-1960','National Day','1-Aug',7862944,2.73,53.04,17.6,5,'tropical; hot, humid in south; semiarid in north','BN','.bj','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(267,18,'Republic of Botswana','Botswana','Southern Africa','Gaborone',600370,0,513,'junction of the Limpopo and Shashe Rivers',1489,'Tsodilo Hills','30-Sep-1966','Independence Day','30-Sep',1639833,-0.04,33.74,19.4,85,'semiarid; warm winters and hot summers','BC','.bw','BWP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(66,35,'Kingdom of Thailand','Thailand','Southeastern Asia','Bangkok',514000,3219,0,'Gulf of Thailand',2576,'Doi Inthanon','22-May-1903','Birthday of King PHUMIPHON','5-Dec',64631595,0.68,72.25,31.9,108,'tropical; rainy, warm, cloudy southwest monsoon (mid-May to September); dry, cool northeast monsoon (November to mid-March); southern isthmus always hot and humid','TH','.th','THB');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(253,14,'Republic of Djibouti','Djibouti','Eastern Africa','Djibouti',23000,314,-155,'Lac Assal',2028,'Moussa Ali','27-Jun-1977','Independence Day','27-Jun',486530,2.02,43.17,18.2,13,'desert; torrid, dry','DJ','.dj','DJF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(218,15,'Great Socialist Peoples Libyan Arab Jamahiriya','Libya','Northern Africa','Tripoli',1759540,1770,-47,'Sabkhat Ghuzayyil',2267,'Bikku Bitti','24-Dec-1951','Revolution Day','1-Sep',5900754,2.3,76.69,23,139,'Mediterranean along coast; dry, extreme desert interior','LY','.ly','LYD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(40,151,'Romania','','Southeastern Europe','Bucharest',237500,225,0,'Black Sea',2544,'Moldoveanu','30-Dec-1947','Unification Day','1-Dec',22303552,-0.12,71.63,36.6,61,'temperate; cold, cloudy winters with frequent snow and fog; sunny summers with frequent showers and thunderstorms','RO','.ro','RON');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(222,15,'Islamic Republic of Mauritania','Mauritania','Northern Africa','Nouakchott',1030700,754,-5,'Sebkhet Te-n-Dghamcha',915,'Kediet Ijill','28-Nov-1960','Independence Day','28-Nov',3177388,2.88,53.12,17,24,'desert; constantly hot, dry, dusty','MR','.mr','MRO');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(226,11,'Burkina Faso','','Western Africa','Ouagadougou',274200,0,200,'Mouhoun River',749,'Tena Kourou','5-Aug-1960','Republic Day','11-Dec',13902972,3,48.85,16.5,33,'tropical; warm, dry winters; hot, wet summers','UV','.bf','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(261,18,'Republic of Madagascar','Madagascar','Southern Africa','Antananarivo',587040,4828,0,'Indian Ocean',2876,'Maromokotro','26-Jun-1960','Independence Day','26-Jun',18595469,3.03,57.34,17.5,116,'tropical along coast, temperate inland, arid in south','MA','.mg','MGA');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(224,11,'Republic of Guinea','Guinea','Western Africa','Conakry',245857,320,0,'Atlantic Ocean',1752,'Mont Nimba','2-Oct-1958','Independence Day','2-Oct',9690222,2.63,49.5,17.7,16,'generally hot and humid; monsoonal-type rainy season (June to November) with southwesterly winds; dry season (December to May) with northeasterly harmattan winds','GV','.gn','GNF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(234,11,'Federal Republic of Nigeria','Nigeria','Western Africa','Abuja',923768,853,0,'Atlantic Ocean',2419,'Chappal Waddi','1-Oct-1960','Independence Day','1-Oct',131859731,2.38,47.08,18.7,70,'varies; equatorial in south, tropical in center, arid in north','NI','.ng','NGN');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(231,11,'Republic of Liberia','Liberia','Western Africa','Monrovia',111370,579,0,'Atlantic Ocean',1380,'Mount Wuteve','26-Jul-1847','Independence Day','26-Jul',3042004,4.91,39.65,18.1,53,'tropical; hot, humid; dry winters with hot days and cool to cold nights; wet, cloudy summers with frequent heavy showers','LI','.lr','LRD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(377,155,'Principality of Monaco','Monaco','Western Europe','Monaco',2,4,0,'Mediterranean Sea',140,'Mont Agel','19-Nov-1903','National Day','19-Nov',32543,0.4,79.69,45.4,0,'Mediterranean with mild, wet winters and hot, dry summers','MN','.mc','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(212,15,'Kingdom of Morocco','Morocco','Northern Africa','Rabat',446550,1835,-55,'Sebkha Tah',4165,'Jebel Toubkal','2-Mar-1956','Throne Day','30-Jul',33241259,1.55,70.94,23.9,60,'Mediterranean, becoming more extreme in the interior','MO','.ma','MAD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(216,15,'Tunisian Republic','Tunisia','Northern Africa','Tunis',163610,1148,-17,'Shatt al Gharsah',1544,'Jebel ech Chambi','20-Mar-1956','Independence Day','20-Mar',10175014,0.99,75.12,27.8,30,'temperate in north with mild, rainy winters and hot, dry summers; desert in south','TS','.tn','TND');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(232,11,'Republic of Sierra Leone','Sierra Leone','Western Africa','Freetown',71740,402,0,'Atlantic Ocean',1948,'Loma Mansa','27-Apr-1961','Independence Day','27-Apr',6005250,2.3,40.22,17.4,10,'tropical; hot, humid; summer rainy season (May to December); winter dry season (December to April)','SL','.sl','SLL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(233,11,'Republic of Ghana','Ghana','Western Africa','Accra',239460,539,0,'Atlantic Ocean',880,'Mount Afadjato','6-Mar-1957','Independence Day','6-Mar',22409572,2.07,58.87,19.9,12,'tropical; warm and comparatively dry along southeast coast; hot and humid in southwest; hot and dry in north','GH','','GHC');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(235,17,'Republic of Chad','Chad','Central Africa','N Djamena',1284000000,0,160,'Djourab Depression',3415,'Emi Koussi','11-Aug-1960','Independence Day','11-Aug',9944201,2.93,47.52,16,51,'tropical in south, desert in north','CD','.td','XAF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(353,155,'Republic of Ireland','Ireland','Western Europe','Dublin',70280,1448,0,'Atlantic Ocean',1041,'Carrauntoohil','6-Dec-1921','Saint Patricks Day','17-Mar',4062235,1.15,77.73,34,36,'temperate maritime; modified by North Atlantic Current; mild winters, cool summers; consistently humid; overcast about half the time','EI','.ie','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(220,11,'Republic of The Gambia','The Gambia','Western Africa','Banjul',11300,80,0,'Atlantic Ocean',53,'unnamed location','18-Feb-1965','Independence Day','18-Feb',1641564,2.84,54.14,17.7,1,'tropical; hot, rainy season (June to November); cooler, dry season (November to May)','GA','.gm','GMD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(221,11,'Republic of Senegal','Senegal','Western Africa','Dakar',196190,531,0,'Atlantic Ocean',581,'unnamed feature near Nepen Diakha','4-Apr-1960','Independence Day','4-Apr',11987121,2.34,59.25,19.1,20,'tropical; hot, humid; rainy season (May to November) has strong southeast winds; dry season (December to April) dominated by hot, dry, harmattan wind','SG','.sn','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(225,11,'Republic of Cote d Ivoire','Cote d Ivoire','Western Africa','Yamoussoukro',322460,515,0,'Gulf of Guinea',1752,'Mont Nimba','7-Aug-1960','Independence Day','7-Aug',17654843,2.03,48.82,19.2,35,'tropical along coast, semiarid in far north; three seasons - warm and dry (November to March), hot and dry (March to May), hot and wet (June to October)','IV','.ci','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(358,154,'Republic of Finland','Finland','Northern Europe','Helsinki',338145,1250,0,'Baltic Sea',1328,'Haltiatunturi','6-Dec-1917','Independence Day','6-Dec',5231372,0.14,78.5,41.3,148,'cold temperate; potentially subarctic but comparatively mild because of moderating influence of the North Atlantic Current, Baltic Sea, and more than 60,000 lakes','FI','.fi','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(223,11,'Republic of Mali','Mali','Western Africa','Bamako',1240000000,0,23,'Senegal River',1155,'Hombori Tondo','22-Sep-2001','Independence Day','22-Sep',11716829,2.63,49,15.8,28,'subtropical to arid; hot and dry (February to June); rainy, humid, and mild (June to November); cool and dry (November to February)','ML','.ml','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(374,145,'Republic of Armenia','Armenia','Southwestern Asia','Yerevan',29800,0,400,'Debed River',4090,'Aragats Lerrnagagat','21-Sep-1991','Independence Day','21-Sep',2976372,-0.19,71.84,30.4,16,'highland continental, hot summers, cold winters','AM','.am','AMD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(227,11,'Republic of Niger','Niger','Western Africa','Niamey',1267000000,0,200,'Niger River',2022,'Mont Bagzane','3-Aug-1960','Republic Day','18-Dec',12525094,2.92,43.76,16.5,27,'desert; mostly hot, dry, dusty; tropical in extreme south','NG','.ne','XOF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(249,15,'Republic of the Sudan','Sudan','Northern Africa','Khartoum',2505810,853,0,'Red Sea',3187,'Kinyeti','1-Jan-1956','Independence Day','1-Jan',41236378,2.55,58.92,18.3,86,'tropical in south; arid desert in north; rainy season varies by region (April to November)','SU','.sd','SDD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(352,155,'Grand Duchy of Luxembourg','Luxembourg','Western Europe','Luxembourg',2586,0,133,'Moselle River',559,'Buurgplaatz','12-Jan-1905','National Day','23-Jun',474413,1.23,78.89,38.7,2,'modified continental with mild winters, cool summers','LU','.lu','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(252,14,'Somalia','','Eastern Africa','Mogadishu',637657,3025,0,'Indian Ocean',2416,'Shimbiris','1-Jul-1960','Foundation of the Somali Republic','1-Jul',8863338,2.85,48.47,17.6,64,'principally desert; northeast monsoon (December to February), moderate temperatures in north and very hot in south; southwest monsoon (May to October), torrid in the north and hot in the south, irregular rainfall, hot and humid periods (tangambili) between monsoons','SO','.so','SOS');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(507,13,'Republic of Panama','Panama','Central America','Panama',78200,2490,0,'Pacific Ocean',3475,'Volcan de Chiriqui','3-Nov-1903','Independence Day','3-Nov',3191319,1.6,75.22,26.1,109,'tropical maritime; hot, humid, cloudy; prolonged rainy season (May to January), short dry season (January to May)','PM','.pa','PAB');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(597,5,'Republic of Suriname','Suriname','South America','Paramaribo',163270,386,-2,'unnamed location',1230,'Juliana Top','25-Nov-1975','Independence Day','25-Nov',439117,0.2,69.01,26.5,47,'tropical; moderated by trade winds','NS','.sr','SRD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(674,9,'Republic of Nauru','Nauru','Oceania','no official capital',21,30,0,'Pacific Ocean',61,'unnamed location','31-Jan-1968','Independence Day','31-Jan',13287,1.81,63.08,20.6,1,'tropical with a monsoonal pattern; rainy season (November to February)','NR','.nr','AUD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(242,11,'Republic of the Congo','Congo','Western Africa','Brazzaville',342000,169,0,'Atlantic Ocean',903,'Mount Berongou','15-Aug-1960','Independence Day','15-Aug',3702314,2.6,52.8,16.6,32,'tropical; rainy season (March to June); dry season (June to October); persistent high temperatures and humidity; particularly enervating climate astride the Equator','CF','.cg','XAF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(380,151,'Ukraine','','Eastern Europe','Kiev',603700,2782,0,'Black Sea',2061,'Hora Hoverla','24-Aug-1991','Independence Day','24-Aug',46710816,-0.6,69.98,39.2,537,'temperate continental; Mediterranean only on the southern Crimean coast; precipitation disproportionately distributed, highest in west and north, lesser in east and southeast; winters vary from cool along the Black Sea to cold farther inland; summers are warm across the greater part of the country, hot in the south','UP','.ua','UAH');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(420,151,'Czech Republic','Czech Republic','Central Europe','Prague',78866,0,115,'Elbe River',1602,'Snezka','1-Jan-1993','Czech Founding Day','28-Oct',10235455,-0.06,76.22,39.3,121,'temperate; cool summers; cold, cloudy, humid winters','EZ','.cz','CZK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(504,13,'Republic of Honduras','Honduras','Central America','Tegucigalpa',112090,820,0,'Caribbean Sea',2870,'Cerro Las Minas','15-Sep-1821','Independence Day','15-Sep',7326496,2.16,69.33,19.5,116,'subtropical in lowlands, temperate in mountains','HO','.hn','HNL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(963,145,'Syrian Arab Republic','Syria','Middle East','Damascus',185180,193,-200,'unnamed location near Lake Tiberias',2814,'Mount Hermon','17-Apr-1946','Independence Day','17-Apr',18881361,2.3,70.32,20.7,92,'mostly desert; hot, dry, sunny summers (June to August) and mild, rainy winters (December to February) along coast; cold weather with snow or sleet periodically in Damascus','SY','.sy','SYP');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(237,11,'Republic of Cameroon','Cameroon','Western Africa','Yaounde',475440,402,0,'Atlantic Ocean',4095,'Fako','1-Jan-1960','Republic Day','20-May',17340702,2.04,51.16,18.9,47,'varies with terrain, from tropical along coast to semiarid and hot in north','CM','.cm','XAF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1242,29,'Commonwealth of The Bahamas','The Bahamas','Caribbean','Nassau',13940,3542,0,'Atlantic Ocean',63,'Mount Alvernia, on Cat Island','10-Jul-1973','Independence Day','10-Jul',303770,0.64,65.6,27.8,64,'tropical marine; moderated by warm waters of Gulf Stream','BF','.bs','BSD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1787,29,'Commonwealth of Puerto Rico','Puerto Rico','Caribbean','San Juan',13790,501,0,'Caribbean Sea',1339,'Cerro de Punta','','US Independence Day','4-Jul',3927188,0.4,78.4,34.7,30,'tropical marine, mild; little seasonal temperature variation','RQ','.pr','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(886,30,'Taiwan','','Eastern Asia','Taipei',35980,1566,0,'South China Sea',3952,'Yu Shan','','Republic Day','10-Oct',23036087,0.61,77.43,34.6,42,'tropical; marine; rainy season during southwest monsoon (June to August); cloudiness is persistent and extensive all year','TW','.tw','TWD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(960,34,'Republic of Maldives','Maldives','Southern Asia','Male',300,644,0,'Indian Ocean',2,'unnamed location','26-Jul-1965','Independence Day','26-Jul',359008,2.78,64.41,17.9,5,'tropical; hot, humid; dry, northeast monsoon (November to March); rainy, southwest monsoon (June to August)','MV','.mv','MVR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(962,145,'Hashemite Kingdom of Jordan','Jordan','Middle East','Amman',92300,26,-408,'Dead Sea',1734,'Jabal Ram','25-May-1946','Independence Day','25-May',5906760,2.49,78.4,23,17,'mostly arid desert; rainy season in west (November to April)','JO','.jo','JOD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(359,39,'Republic of Bulgaria','Bulgaria','Southeastern Europe','Sofia',110910,354,0,'Black Sea',2925,'Musala','3-Mar-1878','Liberation Day','3-Mar',7385367,-0.86,72.3,40.8,213,'temperate; cold, damp winters; hot, dry summers','BU','.bg','BGL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(370,151,'Republic of Lithuania','Lithuania','Eastern Europe','Vilnius',65200,90,0,'Baltic Sea',294,'Juozapines Kalnas','6-Sep-1991','Independence Day','11-Mar',3585906,-0.3,74.2,38.2,95,'transitional, between maritime and continental; wet, moderate winters and summers','LH','.lt','LTL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(371,151,'Republic of Latvia','Latvia','Eastern Europe','Riga',64589,531,0,'Baltic Sea',312,'Gaizinkalns','21-Aug-1991','Independence Day','18-Nov',2274735,-0.67,71.33,39.4,47,'maritime; wet, moderate winters','LG','.lv','LVL');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(1868,29,'Republic of Trinidad and Tobago','Trinidad and Tobago','Caribbean','Port-of-Spain',5128,362,0,'Caribbean Sea',940,'El Cerro del Aripo','31-Aug-1962','Independence Day','31-Aug',1065842,-0.87,66.76,31.2,6,'tropical; rainy season (June to December)','TD','.tt','TTD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(685,9,'Independent State of Samoa','Samoa','Oceania','Apia',2944,403,0,'Pacific Ocean',1857,'Mauga Silisili','1-Jan-1962','Independence Day Celebration','1-Jun',176908,-0.2,71,25.2,4,'tropical; rainy season (November to April), dry season (May to October)','WS','.ws','SAT');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(594,5,'Department of Guiana','French Guiana','Northern South America','Cayenne',91000,378,0,'Atlantic Ocean',851,'Bellevue de lInini','','Bastille Day','14-Jul',199509,1.96,77.27,28.6,11,'tropical; hot, humid; little seasonal temperature variation','FG','.gf','EUR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(965,145,'State of Kuwait','Kuwait','Middle East','Kuwait',17820,499,0,'Persian Gulf',306,'unnamed location','19-Jun-1961','National Day','25-Feb',2418393,3.52,77.2,25.9,7,'dry desert; intensely hot summers; short, cool winters','KU','.kw','KD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(880,34,'Peoples Republic of Bangladesh','Bangladesh','Southern Asia','Dhaka',144000,580,0,'Indian Ocean',1230,'Keokradong','16-Dec-1971','Independence Day','26-Mar',147365352,2.09,62.46,22.2,16,'tropical; mild winter (October to March); hot, humid summer (March to June); humid, warm rainy monsoon (June to October)','BG','.bd','BDT');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(354,154,'Republic of Iceland','Iceland','Northern Europe','Reykjavik',103000,4970,0,'Atlantic Ocean',2110,'Hvannadalshnukur','1-Dec-1918','Independence Day','17-Jun',299388,0.87,80.31,34.2,97,'temperate; moderated by North Atlantic Current; mild, windy winters; damp, cool summers','IC','.is','ISK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(241,11,'Gabonese Republic','Gabon','Western Africa','Libreville',267667,885,0,'Atlantic Ocean',1575,'Mont Iboundji','17-Aug-1960','Founding of the Gabonese Democratic Party','12-Mar',1424906,2.13,54.49,18.6,56,'tropical; always hot, humid','GB','.ga','XAF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(687,9,'Territory of New Caledonia and Dependencies','New Caledonia','Oceania','Noumea',19060,2254,0,'Pacific Ocean',1628,'Mont Panie','','Bastille Day','14-Jul',219246,1.24,74.27,27.8,25,'tropical; modified by southeast trade winds; hot, humid','NC','.nc','XPF');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(974,145,'State of Qatar','Qatar','Middle East','Doha',11437,563,0,'Persian Gulf',103,'Qurayn Abu al Bawl','3-Sep-1971','Independence Day','3-Sep',885359,2.5,73.9,31.7,5,'arid; mild, pleasant winters; very hot, humid summers','QA','.qa','QAR');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(971,145,'United Arab Emirates','Al Imarat al Arabiyah al Muttahidah','Middle East','Abu Dhabi',82880,1318,0,'Persian Gulf',1527,'Jabal Yibir','2-Dec-1971','Independence Day','2-Dec',2602713,1.52,75.44,28.1,35,'desert','AE','.ae','AED');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(972,145,'State of Israel','Israel','Middle East','Jerusalem',20770,273,-408,'Dead Sea',1208,'Har Meron','14-May-1948','Independence Day','14-May',6352117,1.18,79.46,29.6,51,'temperate; hot and dry in southern and eastern desert areas','IS','.il','ILS');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(973,145,'Kingdom of Bahrain','Bahrain','Middle East','Manama',665,161,0,'Persian Gulf',122,'Jabal ad Dukhan','15-Aug-1971','National Day','16-Dec',698585,1.45,74.45,29.4,3,'arid; mild, pleasant winters; very hot, humid summers','BA','.bh','BHD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(372,151,'Republic of Estonia','Estonia','Eastern Europe','Tallinn',45226,3794,0,'Baltic Sea',318,'Suur Munamagi','20-Aug-1991','Independence Day','20-Aug',1324333,-0.64,72.04,39.3,26,'maritime, wet, moderate winters, cool summers','EN','.ee','EEK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(856,35,'Lao Peoples Democratic Republic','Laos','Southeastern Asia','Vientiane',236800,0,70,'Mekong River',2817,'Phou Bia','19-Jul-1949','Republic Day','2-Dec',6368481,2.39,55.49,18.9,44,'tropical monsoon; rainy season (May to November); dry season (December to April)','LA','.la','LAK');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(680,9,'Republic of Palau','Palau','Oceania','Koror',458,1519,0,'Pacific Ocean',242,'Mount Ngerchelchuus','1-Oct-1994','Constitution Day','9-Jul',20579,1.31,70.42,31.7,3,'tropical; hot and humid; wet season May to November','PS','.pw','USD');

INSERT INTO wf_countries (COUNTRY_ID,REGION_ID,COUNTRY_NAME,COUNTRY_TRANSLATED_NAME,LOCATION,CAPITOL,AREA,COASTLINE,LOWEST_ELEVATION,LOWEST_ELEV_NAME,HIGHEST_ELEVATION,HIGHEST_ELEV_NAME,DATE_OF_INDEPENDENCE,NATIONAL_HOLIDAY_NAME,NATIONAL_HOLIDAY_DATE,POPULATION,POPULATION_GROWTH_RATE,LIFE_EXPECT_AT_BIRTH,MEDIAN_AGE,AIRPORTS,CLIMATE,FIPS_ID,INTERNET_EXTENSION,CURRENCY_CODE)
VALUES(967,145,'Republic of Yemen','Yemen','Middle East','Sanaa',527970,1906,0,'Arabian Sea',3760,'Jabal an Nabi Shu ayb','22-May-1990','Unification Day','22-May',21456188,3.46,62.12,16.6,45,'mostly desert; hot and humid along west coast; temperate in western mountains affected by seasonal monsoon; extraordinarily hot, dry, harsh desert in east','YM','.ye','YER');

-- Populate wf_spoken_Languages
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(39,1810,'N','Slovene-speaking minority in the Trieste-Gorizia area');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(225,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,80,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,1000,'QY','official in Kurdish regions');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,100,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(964,90,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(81,860,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(203,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(203,1580,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(204,0,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(962,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(205,0,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(254,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(254,970,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(996,1100,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(996,1650,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(850,980,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(686,800,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(686,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(82,980,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(82,460,'N','English widely taught in junior high and high school');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(618,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(618,270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(618,1230,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(965,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(965,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(3,900,'QY','Qazaq, state language');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(3,1650,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(856,1110,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(856,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(856,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(961,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(961,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(961,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(961,90,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(371,1130,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(371,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(371,1150,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(370,1150,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(370,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(370,1560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(231,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(421,1800,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(421,770,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(421,1620,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(421,2350,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(423,660,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(266,1720,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(266,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(266,3000,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(266,2700,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(352,1170,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(352,660,'QY','administrative language');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(352,560,'QY','administrative language');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(218,80,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(218,850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(218,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(261,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(261,1220,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(596,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(596,340,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(853,200,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(853,1270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(853,760,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(373,1380,'Y','virtually the same as the Romanian language');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(373,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(373,610,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(270,1200,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(270,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(976,910,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(976,220,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(976,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1664,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(265,250,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(265,280,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(265,320,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(265,310,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(265,290,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(265,260,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(265,300,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(381,1710,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(389,1180,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(389,40,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(389,2250,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(389,1620,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(389,1710,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(223,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(223,107,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(377,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(377,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(377,850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(377,1390,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(212,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(212,560,'QY','French often the language of business, government, and diplomacy');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(230,340,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(230,140,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(230,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(230,460,'Y','official; spoken by less than 1% of the population');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(222,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(222,1590,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(222,1840,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(222,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(222,710,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(222,2650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(356,1260,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(356,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(968,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(968,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(968,106,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(968,2400,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(960,1250,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(960,460,'QY','English spoken by most government officials');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(52,1850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,105,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,1910,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,1250,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,1520,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(258,450,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(258,1580,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(258,440,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(258,430,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(687,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(683,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(671,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(227,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(227,720,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(227,400,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(678,460,'N','local languages (more than 100)');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(678,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(234,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(234,720,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(234,2900,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(234,790,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(31,410,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(31,570,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(47,160,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(47,1480,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,1440,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,1210,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,1960,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,1900,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,1190,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,460,'N','note: many in government and business also speak English');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(674,460,'QY','English widely understood, spoken, and used for most government and commercial purposes');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(597,410,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(597,460,'QY',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(599,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(599,410,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(599,340,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(505,1850,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(64,1310,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(595,700,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(206,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(51,1610,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(51,101,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(208,0,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(92,1600,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(92,1760,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(92,1540,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(92,2400,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(92,106,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(92,460,'Y','official and lingua franca of Pakistani elite and most government ministries');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(48,1560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(507,1850,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(507,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(351,1580,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(351,1370,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(675,1340,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(675,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(680,1510,'QY','Palauan 64.7 percent official in all islands except Sonsoral - Sonsoralese and English are official, Tobi - Tobi and English are official, and Angaur- Angaur, Japanese, and English are official');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(680,530,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(680,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(680,270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(680,860,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(245,1580,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(245,350,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(974,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(974,460,'QY','English commonly used as a second language');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(262,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(262,340,'QY','Creole widely used');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(692,1320,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(692,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(40,1640,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(40,770,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(40,660,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(63,530,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(63,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1787,1850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1787,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(7,1650,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(250,950,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(250,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(250,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(250,970,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(966,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(508,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1869,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(248,340,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(248,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(27,840,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(27,830,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(27,30,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(27,1700,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(27,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(27,1730,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(27,1720,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(221,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(221,2650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(221,1590,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(221,870,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(221,1290,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(290,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(386,1820,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(232,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(378,850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(65,1270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(65,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(65,1230,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(65,760,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(65,200,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(65,1930,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(65,1910,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(252,1830,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(252,80,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(252,850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(252,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(34,220,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(34,230,'QY','Castilian is the official language nationwide; the other languages are official regionally');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(34,620,'QY','Castilian is the official language nationwide; the other languages are official regionally');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1758,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1758,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(249,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(249,1470,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(249,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(209,1480,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(209,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(46,1870,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(280,0,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(963,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(963,1000,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(963,90,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(963,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(963,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(41,660,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(41,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(41,850,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(41,40,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(41,1580,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(41,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1868,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1868,740,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1868,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1868,1850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1868,270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(66,1950,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(66,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(992,1890,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(992,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1649,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(690,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(676,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(228,480,'QY','the two major African languages in the south');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(228,1350,'QY','the two major African languages in the south');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(228,380,'QY','major African languages in the north');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(239,1580,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(297,410,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(297,1530,'N','(a Spanish, Portuguese, Dutch, English dialect)');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(297,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(297,1850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1268,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(971,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(971,1550,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(971,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(971,740,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(971,2400,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(93,1550,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(93,1540,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(93,2450,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(93,2300,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(213,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(213,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(994,103,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(994,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(994,90,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(355,40,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(355,670,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(355,1630,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(355,1790,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(374,90,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(374,2850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(374,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(376,230,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(376,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(376,210,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(376,1580,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(244,1580,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(244,110,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(684,1660,'Y','(closely related to Hawaiian and other Polynesian languages) note: most people are bilingual');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(684,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(684,2100,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(54,1850,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(54,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(54,850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(54,660,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(54,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(61,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(61,270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(61,850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(2000,0,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(43,660,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(43,1810,'QY','official in Carinthia');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(43,360,'QY','official in Burgenland');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(43,770,'QY','official in Burgenland');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1264,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(672,0,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(973,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(973,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(973,510,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(973,2400,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1246,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(267,1730,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(267,890,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(267,1690,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(267,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1441,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1441,1580,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(32,410,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(32,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(32,660,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1242,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1242,340,'QY','among Haitian immigrants');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(880,109,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(880,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(501,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(501,1850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(501,1330,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(501,640,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(501,340,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(387,170,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(387,360,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(387,1710,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(591,1850,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(591,1610,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(591,101,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(2001,190,'N','minority ethnic groups have their own languages');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(229,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(229,550,'N','most common vernaculars in south');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(375,130,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(375,1650,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(677,460,'Y','English is official but spoken by only 1%-2% of the population  Note: 120 indigenous languages');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(677,1340,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(300,0,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(55,1580,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(55,1850,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(55,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(55,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(975,420,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(359,180,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(359,2250,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(359,1620,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(673,1230,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(673,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(673,270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(257,960,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(257,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(257,1860,'N','(along Lake Tanganyika and in the Bujumbura area)');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(2,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(2,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(855,920,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(855,560,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(855,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(235,1680,'N','in south');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(235,80,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(94,1910,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(94,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(242,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(242,1140,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(242,930,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(243,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(243,1140,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(243,940,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(243,930,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(243,2150,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(86,270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(86,1270,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(86,200,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(86,1740,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(86,1360,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(86,2750,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(86,630,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(56,1850,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1345,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(67,1230,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(67,460,'N',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(237,460,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(237,560,'Y',NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(269,80,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(269,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(269,1750,'N','(a blend of Swahili and Arabic)');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(57,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1670,530,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1670,240,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1670,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(506,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(236,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(236,1670,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(238,1580,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(238,350,'N','(a blend of Portuguese and West African words)');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(13,1310,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(357,670,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(357,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(45,390,'N','note: English is the predominant second language');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(45,680,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(253,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(253,80,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(253,1830,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(253,20,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1767,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1767,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1809,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(593,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(593,1610,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(593,50,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(20,80,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(20,460,'N','English and French widely understood by educated classes');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(20,560,'N','English and French widely understood by educated classes');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(353,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(353,820,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(240,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(240,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(240,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(240,490,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(372,470,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(372,1650,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(291,20,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(291,80,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(291,1970,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(291,990,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(291,1980,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(503,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(503,1420,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(251,60,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(251,1980,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(251,1500,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(251,690,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(251,1830,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(251,80,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(251,460,'N','(major foreign language taught in schools)');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(15,0,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(420,370,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(594,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(358,540,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(358,1870,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(679,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(679,520,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(679,750,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(500,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(691,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(298,500,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(298,390,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(689,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(689,1570,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(33,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(220,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(220,1290,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(220,2650,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(220,580,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(241,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(241,490,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(241,1410,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(241,1490,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(241,120,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(241,108,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(995,650,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(995,1650,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(995,90,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(233,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(233,480,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(350,460,'N','used in schools and for official purposes');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(350,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(350,850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(350,1580,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1473,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1473,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(22,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(22,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(299,680,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(299,390,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(299,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(49,660,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(590,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(590,340,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1671,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1671,240,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1671,530,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(30,670,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(30,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(30,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(502,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(502,50,'N','(23 officially recognized Amerindian languages, including Quiche, Cakchiquel, Kekchi, Mam, Garifuna, and Xinca)');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(224,560,'Y','note - each ethnic group has its own language');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(592,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(592,50,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(592,340,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(592,740,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(592,2400,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(509,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(509,340,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(852,270,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(852,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(504,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(504,50,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(385,360,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(385,1710,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(385,850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(385,370,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(385,1800,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(36,770,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(354,780,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(354,660,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(62,104,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(62,410,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(202,1300,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(91,460,'N','English enjoys associate status but is the most important language for national, political, and commercial communication');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(91,740,'Y','Hindi is the national language and primary tongue of 30% of the people');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(98,2200,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(98,1000,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(98,106,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(98,2250,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(972,730,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(972,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(39,850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(39,660,'N','parts of Trentino-Alto Adige region are predominantly German speaking');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(39,560,'N','small French-speaking minority in Valle d Aosta region');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(216,80,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(216,560,'QY','commerce');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(670,1940,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(670,1580,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(670,810,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(670,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(90,2250,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(90,1000,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(688,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(688,1660,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(886,1880,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(993,2300,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(993,2450,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(255,970,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(255,460,'QY','primary language of commerce, administration, and higher education');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(255,80,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(256,1860,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(44,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(380,2350,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(598,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(598,990,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(998,1650,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(998,1890,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1784,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(58,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(84,2500,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(84,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(84,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(84,270,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(84,920,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1340,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1340,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1340,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(38,850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(38,1120,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(38,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(264,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(264,30,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(264,660,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(681,2550,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(681,590,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(681,560,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(283,710,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(283,80,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(685,1660,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(685,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(268,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(268,1780,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(967,80,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(260,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(263,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(235,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(94,1770,'Y','note: English is commonly used in government and is spoken competently by about 10% of the population');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1670,270,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(12,0,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(506,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(53,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(13,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(357,2250,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(45,500,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(45,660,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(385,770,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(385,660,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(354,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(62,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(202,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(98,1550,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(98,1160,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(98,80,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(972,80,'QY','Arabic used officially for Arab minority');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1876,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(962,460,'N','English widely understood among upper and middle classes');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,1920,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(60,1950,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(258,2800,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(258,290,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(683,1460,'Y','a Polynesian language closely related to Tongan and Samoan');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,140,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(977,1450,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(674,1430,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(599,1530,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(599,1850,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(64,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(595,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(51,1850,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(207,0,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(690,2000,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(676,2100,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(228,880,'QY','major African languages in the north');
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(886,1280,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(993,1650,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(255,1860,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(256,460,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(44,2600,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(380,1650,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(226,560,'Y', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(998,2450,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1784,460,'N', NULL);
INSERT INTO wf_spoken_languages(country_id,language_id,official,comments)
VALUES(1284,460,'Y', NULL);

CREATE TABLE  "F_CUSTOMERS"
   ("ID" NUMBER(5,0),
    "FIRST_NAME" VARCHAR2(25) CONSTRAINT "F_CSR_FIRST_NAME_NN" NOT NULL ENABLE,
    "LAST_NAME" VARCHAR2(35) CONSTRAINT "F_CSR_LAST_NAME_NN" NOT NULL ENABLE,
    "ADDRESS" VARCHAR2(50) CONSTRAINT "F_CSRS_ADDRESS_NN" NOT NULL ENABLE,
    "CITY" VARCHAR2(30) CONSTRAINT "F_CSR_CITY_NN" NOT NULL ENABLE,
    "STATE" VARCHAR2(20) CONSTRAINT "F_CSR_STATE_NN" NOT NULL ENABLE,
    "ZIP" NUMBER(10,0) CONSTRAINT "F_CSR_ZIP_NN" NOT NULL ENABLE,
    "PHONE_NUMBER" VARCHAR2(10) CONSTRAINT "F_CSR_PHONE_NUMB_NN" NOT NULL ENABLE,
     CONSTRAINT "F_CSR_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_PROMOTIONAL_MENUS"
   ("CODE" VARCHAR2(3),
    "NAME" VARCHAR2(30) CONSTRAINT "F_PMU_NAME_NN" NOT NULL ENABLE,
    "START_DATE" DATE CONSTRAINT "F_PMU_START_DATE_NN" NOT NULL ENABLE,
    "END_DATE" DATE,
    "GIVE_AWAY" VARCHAR2(80),
     CONSTRAINT "F_PMU_CODE_PK" PRIMARY KEY ("CODE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_REGULAR_MENUS"
   ("CODE" VARCHAR2(3),
    "TYPE" VARCHAR2(30) CONSTRAINT "F_RMU_TYPE_NN" NOT NULL ENABLE,
    "HOURS_SERVED" VARCHAR2(30) CONSTRAINT "F_RMU_HOURS_SERVED_NN" NOT NULL ENABLE,
     CONSTRAINT "F_RMU_CODE_PK" PRIMARY KEY ("CODE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_FOOD_ITEMS"
   ("FOOD_ITEM_NUMBER" NUMBER(5,0),
    "DESCRIPTION" VARCHAR2(100) CONSTRAINT "F_FIM_DESC_NN" NOT NULL ENABLE,
    "PRICE" NUMBER(8,2) CONSTRAINT "F_FIM_PRICE_NN" NOT NULL ENABLE,
    "REGULAR_CODE" VARCHAR2(3),
    "PROMO_CODE" VARCHAR2(3),
     CONSTRAINT "F_FIM_FOOD_ITEM_NUMBER_PK" PRIMARY KEY ("FOOD_ITEM_NUMBER")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_STAFFS"
   ("ID" NUMBER(5,0),
    "FIRST_NAME" VARCHAR2(25) CONSTRAINT "F_STF_FIRST_NAME_NN" NOT NULL ENABLE,
    "LAST_NAME" VARCHAR2(35) CONSTRAINT "F_STF_LAST_NAME_NN" NOT NULL ENABLE,
    "BIRTHDATE" DATE CONSTRAINT "F_STF_BIRTHDATE_NN" NOT NULL ENABLE,
    "SALARY" NUMBER(8,2) CONSTRAINT "F_STF_SALARY_NN" NOT NULL ENABLE,
    "OVERTIME_RATE" NUMBER(5,2),
    "TRAINING" VARCHAR2(50),
    "STAFF_TYPE" VARCHAR2(20) CONSTRAINT "F_STF_STAFF_TYPE_NN" NOT NULL ENABLE,
    "MANAGER_ID" NUMBER(5,0),
    "MANAGER_BUDGET" NUMBER(8,2),
    "MANAGER_TARGET" NUMBER(8,2),
     CONSTRAINT "F_STF_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_ORDERS"
   ("ORDER_NUMBER" NUMBER(5,0),
    "ORDER_DATE" DATE CONSTRAINT "F_ODR_ORDER_DATE_NN" NOT NULL ENABLE,
    "ORDER_TOTAL" NUMBER(8,2),
    "CUST_ID" NUMBER(5,0) CONSTRAINT "F_ODR_CUST_ID_NN" NOT NULL ENABLE,
    "STAFF_ID" NUMBER(5,0) CONSTRAINT "F_ODR_STAFF_ID_NN" NOT NULL ENABLE,
     CONSTRAINT "F_ODR_ORDER_NUMBER_PK" PRIMARY KEY ("ORDER_NUMBER")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_ORDER_LINES"
   ("ORDER_NUMBER" NUMBER(5,0),
    "FOOD_ITEM_NUMBER" NUMBER(5,0),
    "QUANTITY" NUMBER(3,0) CONSTRAINT "F_OLE_QUANTITY_NN" NOT NULL ENABLE,
     CONSTRAINT "F_OLE_PK" PRIMARY KEY ("ORDER_NUMBER", "FOOD_ITEM_NUMBER")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_SHIFTS"
   ("CODE" NUMBER(5,0),
    "DESCRIPTION" VARCHAR2(100) CONSTRAINT "F_SFT_DESC_NN" NOT NULL ENABLE,
     CONSTRAINT "F_SFT_CODE_PK" PRIMARY KEY ("CODE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "F_SHIFT_ASSIGNMENTS"
   ("CODE" NUMBER(5,0),
    "ID" NUMBER(5,0),
    "SHIFT_ASSIGN_DATE" DATE CONSTRAINT "F_SAT_SHIFT_ASSIGN_DATE_NN" NOT NULL ENABLE,
     CONSTRAINT "F_SAT_PK" PRIMARY KEY ("CODE", "ID")
  USING INDEX  ENABLE
   );

ALTER TABLE  "F_FOOD_ITEMS" ADD CONSTRAINT "F_FIM_PROMO_CODE_FK" FOREIGN KEY ("PROMO_CODE")
      REFERENCES  "F_PROMOTIONAL_MENUS" ("CODE") ENABLE;

ALTER TABLE  "F_FOOD_ITEMS" ADD CONSTRAINT "F_FIM_REGULAR_CODE_FK" FOREIGN KEY ("REGULAR_CODE")
      REFERENCES  "F_REGULAR_MENUS" ("CODE") ENABLE;

ALTER TABLE  "F_ORDERS" ADD CONSTRAINT "F_ODR_CUST_ID_FK" FOREIGN KEY ("CUST_ID")
      REFERENCES  "F_CUSTOMERS" ("ID") ENABLE;

ALTER TABLE  "F_ORDERS" ADD CONSTRAINT "F_ODR_STAFF_ID_FK" FOREIGN KEY ("STAFF_ID")
      REFERENCES  "F_STAFFS" ("ID") ENABLE;

ALTER TABLE  "F_ORDER_LINES" ADD CONSTRAINT "F_OLE_FOOD_ITEM_NUMBER_FK" FOREIGN KEY ("FOOD_ITEM_NUMBER")
      REFERENCES  "F_FOOD_ITEMS" ("FOOD_ITEM_NUMBER") ENABLE;

ALTER TABLE  "F_ORDER_LINES" ADD CONSTRAINT "F_OLE_ORDER_NUMBER_FK" FOREIGN KEY ("ORDER_NUMBER")
      REFERENCES  "F_ORDERS" ("ORDER_NUMBER") ENABLE;

ALTER TABLE  "F_SHIFT_ASSIGNMENTS" ADD CONSTRAINT "F_SAT_CODE_FK" FOREIGN KEY ("CODE")
      REFERENCES  "F_SHIFTS" ("CODE") ENABLE;

ALTER TABLE  "F_SHIFT_ASSIGNMENTS" ADD CONSTRAINT "F_SAT_ID_FK" FOREIGN KEY ("ID")
      REFERENCES  "F_STAFFS" ("ID") ENABLE;

--Populate f_customer table
INSERT INTO f_customers(id,first_name,last_name,address,city,state,zip,phone_number)
VALUES(123,'Cole','Bee','123 Main Street','Orlando','FL',32838,'4075558234');
INSERT INTO f_customers(id,first_name,last_name,address,city,state,zip,phone_number)
VALUES(456,'Zoe','Twee','1009 Oliver Avenue','Boston','MA',12889,'7098675309');
--Populate f_promotional_menus table
INSERT INTO f_promotional_menus(code,name,start_date,end_date,give_away)
VALUES('100','Back to School',TO_DATE('09-01-2004','mm-dd-yyyy'),TO_DATE('09-30-2004','mm-dd-yyyy'),'ballpen and highlighter');
INSERT INTO f_promotional_menus(code,name,start_date,end_date,give_away)
VALUES('110','Valentines Special',TO_DATE('02-10-2004','mm-dd-yyyy'),TO_DATE('02-15-2004','mm-dd-yyyy'),'small box of chocolates');
--Populate f_regular_menus table
INSERT INTO f_regular_menus(code,type,hours_served)
VALUES('10','Breakfast','6-11am');
INSERT INTO f_regular_menus(code,type,hours_served)
VALUES('20','Lunch/Dinner','11-9pm');
--Populate f_food_items table
INSERT INTO f_food_items(food_item_number,description,price,regular_code,promo_code)
VALUES(90,'Fries',1.09,'20',NULL);
INSERT INTO f_food_items(food_item_number,description,price,regular_code,promo_code)
VALUES(93,'Strawberry Shake',3.59,NULL,'110');
--Populate f_staffs table
INSERT INTO f_staffs(id,first_name,last_name,birthdate,salary,overtime_rate,training,staff_type,manager_id,manager_budget,manager_target)
VALUES(12,'Sue','Doe',TO_DATE('07-01-1980','mm-dd-yyyy'),6.75,10.25,NULL,'Order Taker',19,NULL,NULL);
INSERT INTO f_staffs(id,first_name,last_name,birthdate,salary,overtime_rate,training,staff_type,manager_id,manager_budget,manager_target)
VALUES(9,'Bob','Miller',TO_DATE('03-19-1979','mm-dd-yyyy'),10,NULL,'Grill','Cook',19,NULL,NULL);
INSERT INTO f_staffs(id,first_name,last_name,birthdate,salary,overtime_rate,training,staff_type,manager_id,manager_budget,manager_target)
VALUES(19,'Monique','Tuttle',TO_DATE('03-30-1969','mm-dd-yyyy'),60,NULL,NULL,'Manager',NULL,50000,70000);
--Populate f_orders table
INSERT INTO f_orders(order_number,order_date,order_total,cust_id,staff_id)
VALUES(5678,TO_DATE('12-10-2002','mm-dd-yyyy'),103.02,123,12);
--Populate f_order_lines table
INSERT INTO f_order_lines(order_number,food_item_number,quantity)
VALUES(5678,90,2);
--Populate f_shifts table
INSERT INTO f_shifts(code,description)
VALUES(1,'8am to 12pm');
INSERT INTO f_shifts(code,description)
VALUES(2,'6pm to 10pm');
--Populate f_shift_assignments table
INSERT INTO f_shift_assignments(code,id,shift_assign_date)
VALUES(1,12,TO_DATE('05-06-2004','mm-dd-yyyy'));

CREATE TABLE  "D_CDS"
   ("CD_NUMBER" NUMBER(5,0),
    "TITLE" VARCHAR2(50) CONSTRAINT "D_CDS_TITLE_NN" NOT NULL ENABLE,
    "PRODUCER" VARCHAR2(50) CONSTRAINT "D_CDS_PRODUCER_NN" NOT NULL ENABLE,
    "YEAR" VARCHAR2(4) CONSTRAINT "D_CDS_YEAR_NN" NOT NULL ENABLE,
     CONSTRAINT "D_CDS_CD_NUMBER_PK" PRIMARY KEY ("CD_NUMBER")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_CLIENTS"
   ("CLIENT_NUMBER" NUMBER(5,0),
    "FIRST_NAME" VARCHAR2(25) CONSTRAINT "D_CLT_FIST_NAME_NN" NOT NULL ENABLE,
    "LAST_NAME" VARCHAR2(30) CONSTRAINT "D_CLT_LAST_NAME_NN" NOT NULL ENABLE,
    "PHONE" NUMBER(15,0) CONSTRAINT "D_CLT_PHONE_NN" NOT NULL ENABLE,
    "EMAIL" VARCHAR2(50),
     CONSTRAINT "D_CLT_CLIENT_NUMBER_PK" PRIMARY KEY ("CLIENT_NUMBER")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_PACKAGES"
   ("CODE" NUMBER(10,0),
    "LOW_RANGE" NUMBER(6,0) CONSTRAINT "D_PKE_LOW_RANGE_NN" NOT NULL ENABLE,
    "HIGH_RANGE" NUMBER(6,0) CONSTRAINT "D_PKE_HIGH_RANGE_NN" NOT NULL ENABLE,
     CONSTRAINT "D_PKE_CODE_PK" PRIMARY KEY ("CODE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_THEMES"
   ("CODE" NUMBER(10,0),
    "DESCRIPTION" VARCHAR2(100) CONSTRAINT "D_TME_DESC_NN" NOT NULL ENABLE,
     CONSTRAINT "D_TME_CODE_PK" PRIMARY KEY ("CODE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_VENUES"
   ("ID" NUMBER(5,0),
    "LOC_TYPE" VARCHAR2(30) CONSTRAINT "D_VNE_LOC_TYPE_NN" NOT NULL ENABLE,
    "ADDRESS" VARCHAR2(100) CONSTRAINT "D_VNE_ADDRESS_NN" NOT NULL ENABLE,
    "RENTAL_FEE" VARCHAR2(50) CONSTRAINT "D_VNE_RENTAL_FEE_NN" NOT NULL ENABLE,
    "COMMENTS" VARCHAR2(100),
     CONSTRAINT "D_VNE_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_EVENTS"
   ("ID" NUMBER(5,0),
    "NAME" VARCHAR2(50) CONSTRAINT "D_EVE_NAME_NN" NOT NULL ENABLE,
    "EVENT_DATE" DATE CONSTRAINT "D_EVE_EVENT_DATE_NN" NOT NULL ENABLE,
    "DESCRIPTION" VARCHAR2(50),
    "COST" NUMBER(8,2) CONSTRAINT "D_EVE_COST_NN" NOT NULL ENABLE,
    "VENUE_ID" NUMBER(5,0) CONSTRAINT "D_EVE_VENUE_ID_NN" NOT NULL ENABLE,
    "PACKAGE_CODE" NUMBER(5,0) CONSTRAINT "D_EVE_PACKAGE_CODE_NN" NOT NULL ENABLE,
    "THEME_CODE" NUMBER(10,0) CONSTRAINT "D_EVE_THEME_CODE_NN" NOT NULL ENABLE,
    "CLIENT_NUMBER" NUMBER(5,0) CONSTRAINT "D_EVE_CLIENT_NUMBER_NN" NOT NULL ENABLE,
     CONSTRAINT "D_EVE_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_PARTNERS"
   ("ID" NUMBER(5,0),
    "FIRST_NAME" VARCHAR2(25) CONSTRAINT "D_PTR_FIRST_NAME_NN" NOT NULL ENABLE,
    "LAST_NAME" VARCHAR2(30) CONSTRAINT "D_PTR_LAST_NAME_NN" NOT NULL ENABLE,
    "EXPERTISE" VARCHAR2(25),
    "SPECIALTY" VARCHAR2(25),
    "AUTH_EXPENSE_AMT" NUMBER(8,2),
    "MANAGER_ID" NUMBER(5,0),
    "PARTNER_TYPE" VARCHAR2(25) CONSTRAINT "D_PTR_PARTNER_TYPE_NN" NOT NULL ENABLE,
     CONSTRAINT "D_PTR_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_JOB_ASSIGNMENTS"
   ("PARTNER_ID" NUMBER(5,0),
    "EVENT_ID" NUMBER(5,0),
    "JOB_DATE" DATE CONSTRAINT "D_JAT_JOB_DATE_NN" NOT NULL ENABLE,
    "STATUS" VARCHAR2(50),
     CONSTRAINT "D_JAT_PK" PRIMARY KEY ("PARTNER_ID", "EVENT_ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_TYPES"
   ("CODE" NUMBER(10,0),
    "DESCRIPTION" VARCHAR2(50) CONSTRAINT "D_TPE_DESC_NN" NOT NULL ENABLE,
     CONSTRAINT "D_TPE_CODE_PK" PRIMARY KEY ("CODE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_SONGS"
   ("ID" NUMBER(5,0),
    "TITLE" VARCHAR2(50) CONSTRAINT "D_SNG_TITLE_NN" NOT NULL ENABLE,
    "DURATION" VARCHAR2(20),
    "ARTIST" VARCHAR2(20),
    "TYPE_CODE" NUMBER(5,0) CONSTRAINT "D_SNG_TYPE_CODE_NN" NOT NULL ENABLE,
     CONSTRAINT "D_SNG_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_PLAY_LIST_ITEMS"
   ("EVENT_ID" NUMBER(5,0),
    "SONG_ID" NUMBER(5,0),
    "COMMENTS" VARCHAR2(80),
     CONSTRAINT "D_PLM_PK" PRIMARY KEY ("EVENT_ID", "SONG_ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "D_TRACK_LISTINGS"
   ("SONG_ID" NUMBER(5,0),
    "CD_NUMBER" NUMBER(5,0),
    "TRACK" NUMBER(2,0) CONSTRAINT "D_TLG_TRACK_NUMBER_NN" NOT NULL ENABLE,
     CONSTRAINT "D_TLG_PK" PRIMARY KEY ("SONG_ID", "CD_NUMBER")
  USING INDEX  ENABLE
   );

ALTER TABLE  "D_EVENTS" ADD CONSTRAINT "D_EVE_CLIENT_NUMBER_FK" FOREIGN KEY ("CLIENT_NUMBER")
      REFERENCES  "D_CLIENTS" ("CLIENT_NUMBER") ENABLE;
ALTER TABLE  "D_EVENTS" ADD CONSTRAINT "D_EVE_PACKAGE_CODE_FK" FOREIGN KEY ("PACKAGE_CODE")
      REFERENCES  "D_PACKAGES" ("CODE") ENABLE;
ALTER TABLE  "D_EVENTS" ADD CONSTRAINT "D_EVE_THEME_CODE_FK" FOREIGN KEY ("THEME_CODE")
      REFERENCES  "D_THEMES" ("CODE") ENABLE;
ALTER TABLE  "D_EVENTS" ADD CONSTRAINT "D_EVE_VENUE_ID_FK" FOREIGN KEY ("VENUE_ID")
      REFERENCES  "D_VENUES" ("ID") ENABLE;
ALTER TABLE  "D_JOB_ASSIGNMENTS" ADD CONSTRAINT "D_JAT_EVENT_ID_FK" FOREIGN KEY ("EVENT_ID")
      REFERENCES  "D_EVENTS" ("ID") ENABLE;
ALTER TABLE  "D_JOB_ASSIGNMENTS" ADD CONSTRAINT "D_JAT_PARTNER_ID_FK" FOREIGN KEY ("PARTNER_ID")
      REFERENCES  "D_PARTNERS" ("ID") ENABLE;
ALTER TABLE  "D_PLAY_LIST_ITEMS" ADD CONSTRAINT "D_PLM_EVENT_ID_FK" FOREIGN KEY ("EVENT_ID")
      REFERENCES  "D_EVENTS" ("ID") ENABLE;
ALTER TABLE  "D_PLAY_LIST_ITEMS" ADD CONSTRAINT "D_PLM_SONG_ID_FK" FOREIGN KEY ("SONG_ID")
      REFERENCES  "D_SONGS" ("ID") ENABLE;
ALTER TABLE  "D_SONGS" ADD CONSTRAINT "D_SNG_TYPE_CODE_FK" FOREIGN KEY ("TYPE_CODE")
      REFERENCES  "D_TYPES" ("CODE") ENABLE;
ALTER TABLE  "D_TRACK_LISTINGS" ADD CONSTRAINT "D_TLG_CD_NUMBER_FK" FOREIGN KEY ("CD_NUMBER")
      REFERENCES  "D_CDS" ("CD_NUMBER") ENABLE;
ALTER TABLE  "D_TRACK_LISTINGS" ADD CONSTRAINT "D_TLG_SONG_ID_FK" FOREIGN KEY ("SONG_ID")
      REFERENCES  "D_SONGS" ("ID") ENABLE;

CREATE INDEX  "D_CDS_IDX" ON  "D_CDS" ("TITLE");
CREATE INDEX  "SONG_ID_IDX" ON  "D_TRACK_LISTINGS" ("SONG_ID");

-- populate tabes
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(90,'The Celebrants Live in Concert','Old Town Records','1997');
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(91,'Party Music for All Occasions','The Music Man','2000');
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(92,'Back to the Shire','Middle Earth Records','2002');
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(93,'Songs from My Childhood','Old Town Records','1999');
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(94,'Carpe Diem','R & B Inc.','2000');
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(95,'Here Comes the Bride','The Music Man','2001');
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(96,'Graduation Songbook','Tunes Are Us','1998');
INSERT INTO d_cds(cd_number,title,producer,year)
VALUES(98,'Whirled Peas','Old Town Records','2004');

INSERT INTO d_clients(client_number,first_name,last_name,phone,email)
VALUES(5922,'Hiram','Peters',3715832249,'hpeters@yahoo.com');
INSERT INTO d_clients(client_number,first_name,last_name,phone,email)
VALUES(5857,'Serena','Jones',7035335900,'serena.jones@jones.com');
INSERT INTO d_clients(client_number,first_name,last_name,phone,email)
VALUES(6133,'Lauren','Vigil',4072220090,'lbv@lbv.net');

INSERT INTO d_packages(code,low_range,high_range)
VALUES(79,500,2500);
INSERT INTO d_packages(code,low_range,high_range)
VALUES(87,2501,5000);
INSERT INTO d_packages(code,low_range,high_range)
VALUES(112,5001,10000);
INSERT INTO d_packages(code,low_range,high_range)
VALUES(200,10001,15000);

INSERT INTO d_themes(code,description)
VALUES(200,'Tropical');
INSERT INTO d_themes(code,description)
VALUES(220,'Carnival');
INSERT INTO d_themes(code,description)
VALUES(240,'Sixties');
INSERT INTO d_themes(code,description)
VALUES(110,'Classic');
INSERT INTO d_themes(code,description)
VALUES(198,'Mardi Gras');
INSERT INTO d_themes(code,description)
VALUES(454,'Eighties');
INSERT INTO d_themes(code,description)
VALUES(340,'Football');
INSERT INTO d_themes(code,description)
VALUES(502,'Fairy Tale');

INSERT INTO d_venues(id,loc_type,address,rental_fee,comments)
VALUES(100,'Private Home','52 West End Drive, Los Angeles, CA 90210','0','Large kitchen, spacious lawn');
INSERT INTO d_venues(id,loc_type,address,rental_fee,comments)
VALUES(105,'Private Home','123 Magnolia Road, Hudson, N.Y. 11220','0','3 level townhouse, speakers on all floors');
INSERT INTO d_venues(id,loc_type,address,rental_fee,comments)
VALUES(101,'Private Home','4 Primrose Lane, Chevy Chase, MD 22127','0','Gazebo, multi-level deck');
INSERT INTO d_venues(id,loc_type,address,rental_fee,comments)
VALUES(95,'School Hall','4 Mahogany Drive, Boston, MA 10010','75/hour','School closes at 10pm');
INSERT INTO d_venues(id,loc_type,address,rental_fee,comments)
VALUES(99,'National Park','87 Park Avenue, San Diego, CA 28978','400/flat fee','Bring generators');
INSERT INTO d_venues(id,loc_type,address,rental_fee,comments)
VALUES(220,'Hotel','200 Pennsylvania Ave, Washington D.C. 09002','300/per person','Classy affair, tight security, private entrance for vendors');

INSERT INTO d_events(client_number,id,name,event_date,description,cost,venue_id,package_code,theme_code)
VALUES(5922,100,'Peters Graduation',TO_DATE('05-14-2004','mm-dd-yyyy'),'Party for 200, red, white, blue motif',8000,100,112,200);
INSERT INTO d_events(client_number,id,name,event_date,description,cost,venue_id,package_code,theme_code)
VALUES(6133,105,'Vigil wedding',TO_DATE('04-28-2004','mm-dd-yyyy'),'Black tie at Four Season hotel',10000,220,200,200);

INSERT INTO d_partners(id,first_name,last_name,expertise,specialty,auth_expense_amt,manager_id,partner_type)
VALUES(11,'Jennifer','cho','Weddings','All Types',NULL,33,'Wedding Coordinator');
INSERT INTO d_partners(id,first_name,last_name,expertise,specialty,auth_expense_amt,manager_id,partner_type)
VALUES(22,'Jason','Tsang',NULL,'Hip Hop',NULL,33,'Disk Jockey');
INSERT INTO d_partners(id,first_name,last_name,expertise,specialty,auth_expense_amt,manager_id,partner_type)
VALUES(33,'Allison','Plumb','Event Planning',NULL,300000,33,'Manager');

INSERT INTO d_job_assignments(partner_id,event_id,job_date,status)
VALUES(11,105,TO_DATE('02-02-2004','mm-dd-yyyy'),'Visited');

INSERT INTO d_types(code,description)
VALUES(1,'Jazz');
INSERT INTO d_types(code,description)
VALUES(12,'Pop');
INSERT INTO d_types(code,description)
VALUES(40,'Reggae');
INSERT INTO d_types(code,description)
VALUES(88,'Country');
INSERT INTO d_types(code,description)
VALUES(77,'New Age');

INSERT INTO d_songs(id,title,duration,artist,type_code)
VALUES(45,'Its Finally Over','5 min','The Hobbits',12);
INSERT INTO d_songs(id,title,duration,artist,type_code)
VALUES(46,'Im Going to Miss My Teacher','2 min','Jane Pop',12);
INSERT INTO d_songs(id,title,duration,artist,type_code)
VALUES(47,'Hurrah for Today','3 min','The Jubilant Trio',77);
INSERT INTO d_songs(id,title,duration,artist,type_code)
VALUES(48,'Meet Me At the Altar','6 min','Bobby West',1);
INSERT INTO d_songs(id,title,duration,artist,type_code)
VALUES(49,'Lets Celebrate','8 min','The Celebrants',77);
INSERT INTO d_songs(id,title,duration,artist,type_code)
VALUES(50,'All These Years','10 min','Diana Crooner',88);

INSERT INTO d_play_list_items(event_id,song_id,comments)
VALUES(100,45,'Play late');
INSERT INTO d_play_list_items(event_id,song_id,comments)
VALUES(100,46,NULL);
INSERT INTO d_play_list_items(event_id,song_id,comments)
VALUES(100,47,'Play early');
INSERT INTO d_play_list_items(event_id,song_id,comments)
VALUES(105,48,'Play after cake cutting');
INSERT INTO d_play_list_items(event_id,song_id,comments)
VALUES(105,49,'Play first');
INSERT INTO d_play_list_items(event_id,song_id,comments)
VALUES(105,47,'Play for the father');

INSERT INTO d_track_listings(song_id,cd_number,track)
VALUES(45,92,1);
INSERT INTO d_track_listings(song_id,cd_number,track)
VALUES(46,93,1);
INSERT INTO d_track_listings(song_id,cd_number,track)
VALUES(47,91,2);
INSERT INTO d_track_listings(song_id,cd_number,track)
VALUES(48,95,5);
INSERT INTO d_track_listings(song_id,cd_number,track)
VALUES(49,91,3);

CREATE TABLE  "REGIONS"
   ("REGION_ID" NUMBER CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE,
    "REGION_NAME" VARCHAR2(25),
    CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
    USING INDEX  ENABLE
   );
   
CREATE TABLE  "COUNTRIES"
   ("COUNTRY_ID" CHAR(2) CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE,
    "COUNTRY_NAME" VARCHAR2(40),
    "REGION_ID" NUMBER,
     CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   );

ALTER TABLE  "COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	REFERENCES  "REGIONS" ("REGION_ID") ENABLE;
   
CREATE TABLE  "LOCATIONS"
   ("LOCATION_ID" NUMBER(4,0),
    "STREET_ADDRESS" VARCHAR2(40),
    "POSTAL_CODE" VARCHAR2(12),
    "CITY" VARCHAR2(30) CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE,
    "STATE_PROVINCE" VARCHAR2(25),
    "COUNTRY_ID" CHAR(2),
    CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
    USING INDEX  ENABLE
   );
   
ALTER TABLE  "LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	REFERENCES  "COUNTRIES" ("COUNTRY_ID") ENABLE;
CREATE INDEX  "LOC_CITY_IX" ON  "LOCATIONS" ("CITY");
CREATE INDEX  "LOC_COUNTRY_IX" ON  "LOCATIONS" ("COUNTRY_ID");
CREATE INDEX  "LOC_STATE_PROVINCE_IX" ON  "LOCATIONS" ("STATE_PROVINCE");

CREATE TABLE  "DEPARTMENTS"
   ("DEPARTMENT_ID" NUMBER(4,0),
    "DEPARTMENT_NAME" VARCHAR2(30) CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE,
    "MANAGER_ID" NUMBER(6,0),
    "LOCATION_ID" NUMBER(4,0),
     CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX  ENABLE
   );
 
ALTER TABLE  "DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	REFERENCES  "LOCATIONS" ("LOCATION_ID") ENABLE;

CREATE INDEX  "DEPT_LOCATION_IX" ON  "DEPARTMENTS" ("LOCATION_ID");
	
CREATE TABLE  "JOBS"
   ("JOB_ID" VARCHAR2(10),
    "JOB_TITLE" VARCHAR2(35) CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE,
    "MIN_SALARY" NUMBER(6,0),
    "MAX_SALARY" NUMBER(6,0),
     CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX  ENABLE
   );
	
CREATE TABLE  "EMPLOYEES"
   ("EMPLOYEE_ID" NUMBER(6,0),
    "FIRST_NAME" VARCHAR2(20),
    "LAST_NAME" VARCHAR2(25) CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE,
    "EMAIL" VARCHAR2(25) CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE,
    "PHONE_NUMBER" VARCHAR2(20),
    "HIRE_DATE" DATE CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE,
    "JOB_ID" VARCHAR2(10) CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE,
    "SALARY" NUMBER(8,2),
    "COMMISSION_PCT" NUMBER(2,2),
    "MANAGER_ID" NUMBER(6,0),
    "DEPARTMENT_ID" NUMBER(4,0),
	"BONUS" VARCHAR2(5),
     CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE,
     CONSTRAINT "EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX  ENABLE,
     CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX  ENABLE
  );
  
ALTER TABLE  "EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	REFERENCES  "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
ALTER TABLE  "EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	REFERENCES  "JOBS" ("JOB_ID") ENABLE;
ALTER TABLE  "EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	REFERENCES  "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
ALTER TABLE  "DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	REFERENCES  "EMPLOYEES" ("EMPLOYEE_ID") DISABLE;
CREATE INDEX  "EMP_DEPARTMENT_IX" ON  "EMPLOYEES" ("DEPARTMENT_ID");
CREATE INDEX  "EMP_JOB_IX" ON  "EMPLOYEES" ("JOB_ID");
CREATE INDEX  "EMP_MANAGER_IX" ON  "EMPLOYEES" ("MANAGER_ID");
CREATE INDEX  "EMP_NAME_IX" ON  "EMPLOYEES" ("LAST_NAME", "FIRST_NAME");

CREATE TABLE  "JOB_GRADES"
   ("GRADE_LEVEL" VARCHAR2(3),
    "LOWEST_SAL" NUMBER,
    "HIGHEST_SAL" NUMBER
   );

CREATE TABLE  "JOB_HISTORY"
   ("EMPLOYEE_ID" NUMBER(6,0) CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE,
    "START_DATE" DATE CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE,
    "END_DATE" DATE CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE,
    "JOB_ID" VARCHAR2(10) CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE,
    "DEPARTMENT_ID" NUMBER(4,0),
     CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE,
     CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE")
  USING INDEX  ENABLE
   );

ALTER TABLE  "JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	REFERENCES  "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
-- the folowing FK constraint is disabled as table contains historical data for employees that are not in the current employees table
ALTER TABLE  "JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES  "EMPLOYEES" ("EMPLOYEE_ID") DISABLE;
ALTER TABLE  "JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES  "JOBS" ("JOB_ID") ENABLE;
CREATE INDEX  "JHIST_DEPARTMENT_IX" ON  "JOB_HISTORY" ("DEPARTMENT_ID");
CREATE INDEX  "JHIST_EMPLOYEE_IX" ON  "JOB_HISTORY" ("EMPLOYEE_ID");
CREATE INDEX  "JHIST_JOB_IX" ON  "JOB_HISTORY" ("JOB_ID");

--populate regions table
INSERT INTO regions (region_id, region_name)
Values(1,'Europe');
INSERT INTO regions (region_id, region_name)
Values(2,'Americas');
INSERT INTO regions (region_id, region_name)
Values(3,'Asia');
INSERT INTO regions (region_id, region_name)
Values(4,'Middle East and Africa');

--populate countries table
INSERT INTO countries (country_id, country_name, region_id)
Values('CA','Canada',2);
INSERT INTO countries (country_id, country_name, region_id)
Values('DE','Germany',1);
INSERT INTO countries (country_id, country_name, region_id)
Values('UK','United Kingdom',1);
INSERT INTO countries (country_id, country_name, region_id)
Values('US','United States of America',2);

--populate locations table
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
Values(1800,'460 Bloor St. W.','ON M5S 1X8','Toronto','Ontario','CA');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
Values(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
Values(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
Values(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
Values(1700,'2004 Charade Rd','98199','Seattle','Washington','US');

--populate departments table
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(10,'Administration',200,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(20,'Marketing',201,1800);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(50,'Shipping',124,1500);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(60,'IT',103,1400);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(80,'Sales',149,2500);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(90,'Executive',100,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(110,'Accounting',205,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id)
Values(190,'Contracting',null,1700);

--populate jobs table
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('AD_PRES','President',20000,40000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('AD_VP','Administration Vice President',15000,30000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('SA_MAN','Sales Manager',10000,20000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('SA_REP','Sales Representative',6000,12000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('ST_MAN','Stock Manager',5500,8500);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('ST_CLERK','Stock Clerk',2000,5000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('IT_PROG','Programmer',4000,10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
Values('MK_REP','Marketing Representative',4000,9000);

--populate employees table
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(100,'Steven','King','SKING','515.123.4567',TO_DATE('1987-06-17','yyyy-mm-dd'),'AD_PRES',24000,null,null,90);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(101,'Neena','Kochhar','NKOCHHAR','515.123.4568',TO_DATE('1989-09-21','yyyy-mm-dd'),'AD_VP',17000,null,100,90 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(102,'Lex','De Haan','LDEHAAN','515.123.4569',TO_DATE('1993-01-13','yyyy-mm-dd'),'AD_VP',17000,null,100,90 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(200,'Jennifer','Whalen','JWHALEN','515.123.4444',TO_DATE('1987-09-17','yyyy-mm-dd'),'AD_ASST',4400,null,101,10 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(205,'Shelley','Higgins','SHIGGINS','515.123.8080',TO_DATE('1994-06-07','yyyy-mm-dd'),'AC_MGR',12000,null,101,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(206,'William','Gietz','WGIETZ','515.123.8181',TO_DATE('1994-06-07','yyyy-mm-dd'),'AC_ACCOUNT',8300,null,205,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',TO_DATE('2000-01-29','yyyy-mm-dd'),'SA_MAN',10500,.2,100,80, '1500' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(174,'Ellen','Abel','EABEL','011.44.1644.429267',TO_DATE('1996-05-11','yyyy-mm-dd'),'SA_REP',11000,.3,149,80,'1700' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',TO_DATE('1998-03-24','yyyy-mm-dd'),'SA_REP',8600,.2,149,80,'1250' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(178,'Kimberely','Grant','KGRANT','011.44.1644.429263',TO_DATE('1999-05-24','yyyy-mm-dd'),'SA_REP',7000,.15,149,null );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(124,'Kevin','Mourgos','KMOURGOS','650.123.5234',TO_DATE('1999-11-16','yyyy-mm-dd'),'ST_MAN',5800,null,100,50);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(141,'Trenna','Rajs','TRAJS','650.121.8009',TO_DATE('1995-10-17','yyyy-mm-dd'),'ST_CLERK',3500,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(142,'Curtis','Davies','CDAVIES','650.121.2994',TO_DATE('1997-01-29','yyyy-mm-dd'),'ST_CLERK',3100,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(143,'Randall','Matos','RMATOS','650.121.2874',TO_DATE('1998-03-15','yyyy-mm-dd'),'ST_CLERK',2600,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(144,'Peter','Vargas','PVARGAS','650.121.2004',TO_DATE('1998-07-09','yyyy-mm-dd'),'ST_CLERK',2500,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(103,'Alexander','Hunold','AHUNOLD','590.423.4567',TO_DATE('1990-01-03','yyyy-mm-dd'),'IT_PROG',9000,null,102,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(104,'Bruce','Ernst','BERNST','590.423.4568',TO_DATE('1991-05-21','yyyy-mm-dd'),'IT_PROG',6000,null,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(107,'Diana','Lorentz','DLORENTZ','590.423.5567',TO_DATE('1999-02-07','yyyy-mm-dd'),'IT_PROG',4200,null,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(201,'Michael','Hartstein','MHARTSTE','515.123.5555',TO_DATE('1996-02-17','yyyy-mm-dd'),'MK_MAN',13000,null,100,20 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(202,'Pat','Fay','PFAY','603.123.6666',TO_DATE('1997-08-17','yyyy-mm-dd'),'MK_REP',6000,null,201,20 );

--populate job_history table
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(200,TO_DATE('09-17-1987','mm-dd-yyyy'),TO_DATE('06-17-1993','mm-dd-yyyy'),'AD_ASST',90 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(101,TO_DATE('10-28-1993','mm-dd-yyyy'),TO_DATE('03-15-1997','mm-dd-yyyy'),'AC_MGR',110 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(200,TO_DATE('07-01-1994','mm-dd-yyyy'),TO_DATE('12-31-1998','mm-dd-yyyy'),'AC_ACCOUNT',90 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(101,TO_DATE('09-21-1989','mm-dd-yyyy'),TO_DATE('10-27-1993','mm-dd-yyyy'),'AC_ACCOUNT',110 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(176,TO_DATE('01-01-1999','mm-dd-yyyy'),TO_DATE('12-31-1999','mm-dd-yyyy'),'SA_MAN',80 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(176,TO_DATE('03-24-1998','mm-dd-yyyy'),TO_DATE('12-31-1998','mm-dd-yyyy'),'SA_REP',80 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(122,TO_DATE('01-01-1999','mm-dd-yyyy'),TO_DATE('12-31-1999','mm-dd-yyyy'),'ST_CLERK',50 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(114,TO_DATE('03-24-1998','mm-dd-yyyy'),TO_DATE('12-31-1999','mm-dd-yyyy'),'ST_CLERK',50 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(102,TO_DATE('01-13-1993','mm-dd-yyyy'),TO_DATE('07-24-1998','mm-dd-yyyy'),'IT_PROG',60 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id)
VALUES(201,TO_DATE('02-17-1996','mm-dd-yyyy'),TO_DATE('12-19-1999','mm-dd-yyyy'),'MK_REP',20 );

--populate job_grades table
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal)
VALUES('A',1000,2999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal)
VALUES('B',3000,5999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal)
VALUES('C',6000,9999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal)
VALUES('D',10000,14999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal)
VALUES('E',15000,24999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal)
VALUES('F',25000,40000);

ALTER TABLE  "DEPARTMENTS" ENABLE CONSTRAINT "DEPT_MGR_FK";

CREATE OR REPLACE FORCE VIEW  "EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") 
	AS SELECT
		e.employee_id, e.job_id, e.manager_id, e.department_id,
		d.location_id,
		l.country_id,
		e.first_name, e.last_name, e.salary, e.commission_pct,
		d.department_name,
		j.job_title,
		l.city, l.state_province,
		c.country_name,
		r.region_name
    FROM
        employees e,
        departments d,
        jobs j,
        locations l,
        countries c,
        regions r
    WHERE
        e.department_id = d.department_id
        AND d.location_id = l.location_id
        AND l.country_id = c.country_id
        AND c.region_id = r.region_id
        AND j.job_id = e.job_id
    WITH READ ONLY;
	
-- Drop sequences if they exist	
DROP SEQUENCE "DEPARTMENTS_SEQ";
DROP SEQUENCE "EMPLOYEES_SEQ";
DROP SEQUENCE "LOCATIONS_SEQ";

--Create sequence for departments PK				
CREATE SEQUENCE "DEPARTMENTS_SEQ"  
	MINVALUE 1 
	MAXVALUE 9990 
	INCREMENT BY 10 
	START WITH 280 
	NOCACHE  NOORDER  NOCYCLE;

--Create sequence for employees PK	
CREATE SEQUENCE "EMPLOYEES_SEQ"  
	MINVALUE 1 
	MAXVALUE 9999999999999999999999999999 
	INCREMENT BY 1 
	START WITH 207 
	NOCACHE  NOORDER  NOCYCLE;

--Create sequence for locations PK	
CREATE SEQUENCE "LOCATIONS_SEQ"  
	MINVALUE 1 
	MAXVALUE 9900 
	INCREMENT BY 100 
	START WITH 3300 
	NOCACHE  NOORDER  NOCYCLE;