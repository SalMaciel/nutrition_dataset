DROP TABLE food_description;
DROP TABLE food_group;
DROP TABLE langual;
DROP TABLE langual_description;
DROP TABLE nutrition_data;
DROP TABLE nutrition_definition;
DROP TABLE source_code;
DROP TABLE data_derivation_code;
DROP TABLE weight;
DROP TABLE footnote;
DROP TABLE data_source_link;
DROP TABLE data_sources;

CREATE TABLE data_source_link(
	NDB_No INT NOT NULL,
	Nutr_No INT NOT NULL,
	DataSrc_ID VARCHAR(3) NOT NULL,
	PRIMARY KEY (NDB_No),
	UNIQUE (NDB_No),
	UNIQUE (DataSrc_ID)
);

CREATE TABLE data_derivation_code(
	Deriv_Cd FLOAT NOT NULL,
	Deriv_Desc VARCHAR NOT NULL,
	PRIMARY KEY (Deriv_Cd),
	UNIQUE (Deriv_Cd)
);

CREATE TABLE langual_description(
	Factor_Code VARCHAR(5) NOT NULL,
	Description VARCHAR NOT NULL,
	PRIMARY KEY (Factor_Code),
	UNIQUE (Factor_Code)
);

CREATE TABLE food_group(
	FdGrp_Cd INT NOT NULL,
	FdGrp_Desc VARCHAR NOT NULL,
	PRIMARY KEY (FdGrp_Cd),
	UNIQUE (FdGrp_Cd)
);

CREATE TABLE nutrition_definition(
	Nutr_No INT NOT NULL,
	Units VARCHAR(2) NOT NULL,
	Tagname VARCHAR,
	NutrDesc VARCHAR NOT NULL,
	Num_Dec INT NOT NULL,
	SR_Order INT NOT NULL,
	PRIMARY KEY (Nutr_No),
	UNIQUE (Nutr_No)
);

CREATE TABLE source_code( 
	Src_Cd INT NOT NULL,
	SrcCd_Desc INT NOT NULL,
	PRIMARY KEY (Src_Cd),
	UNIQUE (Src_Cd)
);

CREATE TABLE langual(
	NDB_No INT UNIQUE NOT NULL,
	Factor_Code VARCHAR(5) UNIQUE NOT NULL,
	PRIMARY KEY (NDB_No),
	FOREIGN KEY (Factor_Code) REFERENCES langual_description(Factor_Code),
	UNIQUE (NDB_No)
);

CREATE TABLE nutrition_data(
	NDB_No INT NOT NULL,
	Nutr_No INT NOT NULL,
	Nutr_Val FLOAT NOT NULL,
	Num_Data_Pts INT NOT NULL,
	Std_Error FLOAT,
	Src_Cd INT NOT NULL,
	Deriv_Cd FLOAT,
	Ref_NDB_No FLOAT,
	Add_Nutr_Mark FLOAT,
	Num_Studies INT,
	Min FLOAT,
	Max FLOAT,
	DF FLOAT,
	Low_EB FLOAT,
	Up_EB FLOAT,
	Stat_cmt VARCHAR,
	AddMod_Date DATE,
	PRIMARY KEY (NDB_No),
	FOREIGN KEY (NDB_No) REFERENCES data_source_link(NDB_No),
	FOREIGN KEY (Nutr_No) REFERENCES nutrition_definition(Nutr_No),
	FOREIGN KEY (Src_Cd) REFERENCES source_code(Src_Cd),
	FOREIGN KEY (Deriv_Cd) REFERENCES data_derivation_code(Deriv_Cd),
	UNIQUE (NDB_No)
);

CREATE TABLE weight(
	NDB_No INT NOT NULL,
	Seq INT NOT NULL,
	Amount INT NOT NULL,
	Msre_Desc VARCHAR NOT NULL,
	Gm_Wgt FLOAT NOT NULL,
	Num_Data_Pts INT,
	Std_Dev FLOAT,
	PRIMARY KEY (NDB_No),
	UNIQUE (NDB_No)
);

CREATE TABLE footnote(
	NDB_No INT NOT NULL,
	Footnt_No INT NOT NULL,
	Footnt_Typ VARCHAR NOT NULL,
	Nutr_No INT,
	Footnt_Txt VARCHAR,
	UNIQUE (NDB_No)
);

CREATE TABLE data_sources(
	DataSrc_ID VARCHAR(5) NOT NULL,
	Authors VARCHAR(40),
	Title VARCHAR(40) NOT NULL,
	Year INT,
	Journal VARCHAR(40),
	Vol_City INT,
	Issue_State INT,
	Start_Page INT,
	End_Page INT,
	PRIMARY KEY (DataSrc_ID),
	FOREIGN KEY (DataSrc_ID) REFERENCES data_source_link(DataSrc_ID),
	UNIQUE (DataSrc_ID)
);

CREATE TABLE food_description(
	NDB_No INT NOT NULL,
	FdGrp_Cd INT NOT NULL,
	Long_Desc VARCHAR NOT NULL,
	Shrt_Desc VARCHAR NOT NULL,
	ComName VARCHAR,
	ManufacName VARCHAR,
	Survey VARCHAR,
	Ref_desc VARCHAR,
	Refuse FLOAT,
	SciName VARCHAR,
	N_Factor FLOAT,
	Pro_Factor FLOAT,
	Fat_Factor FLOAT,
	CHO_Factor FLOAT,
	PRIMARY KEY (NDB_No),
	FOREIGN KEY (NDB_No) REFERENCES weight(NDB_No),
	FOREIGN KEY (NDB_No) REFERENCES langual(NDB_No),
	FOREIGN KEY (NDB_No) REFERENCES nutrition_data(NDB_No),
	FOREIGN KEY (NDB_No) REFERENCES footnote(NDB_No),
	FOREIGN KEY (FdGrp_Cd) REFERENCES food_group(FdGrp_Cd),
	UNIQUE (NDB_No)
);