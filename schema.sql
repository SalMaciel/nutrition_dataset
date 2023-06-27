CREATE TABLE food_description(
	NDB_No INT(5) NOT NULL,
	FdGrp_Cd INT(4) NOT NULL,
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
	CHO_Factor float,
	PRIMARY KEY (NDB_No),
	UNIQUE (NDB_No)
);
CREATE TABLE food_group(
	FdGrp_Cd INT(4) NOT NULL,
	FdGrp_Desc VARCHAR NOT NULL,
	PRIMARY KEY (FdGrp_Cd),
	UNIQUE (FdGrp_Cd)
);

CREATE TABLE langual(
	NDB_No INT(5) UNIQUE NOT NULL,
	Factor_Code VARCHAR(5) UNIQUE NOT NULL,
	PRIMARY KEY (NDB_No),
	UNIQUE (NDB_No)
);

CREATE TABLE langual_description(
	Factor_Code VARCHAR(5) NOT NULL,
	Description VARCHAR NUOT NULL,
	PRIMARY KEY (Factor_Code),
	UNIQUE (Factor_code)
);

CREATE TABLE nutrition_data(
	NDB_No INT(5) NOT NULL,
	Nutr_No INT(3) NOT NULL,
	Nutr_Val FLOAT NOT NULL,
	Num_Data_Pts INT NOT NULL,
	Std_Error FLOAT,
	Src_Cd INT NOT NULL,
	Deriv_Cd FLOAT,
	Ref_NDB_No FLOAT,
	Add_Nutr_Mark FLOAT,
	Num_Studies INT,
	`Min` FLOAT,
	`Max` FLOAT,
	DF FLOAT,
	Low_EB FLOAT,
	Up_EB FLOAT,
	Stat_cmt VARCHAR,
	AddMod_Date DATE,
	PRIMARY KEY (NDB_No),
	UNIQUE (NDB_No)
);

CREATE TABLE nutrition_definition(
	Nutr_No INT(3) NOT NULL,
	Units VARCHAR(2) NOT NULL,
	Tagname VARCHAR,
	NutrDesc VARCHAR NOT NULL,
	Num_Dec INT(1) NOT NULL,
	SR_Order INT(5) NOT NULL,
	PRIMARY KEY (Nutr_No),
	UNIQUE (Nutr_No)
);

CREATE TABLE source_code( 
	Src_Cd INT(2) NOT NULL,
	SrcCd_Desc INT(40) NOT NULL,
	PRIMARY KEY (Src_Cd),
	UNIQUE (Src_Cd)
);

CREATE TABLE data_derivation_code(
	Deriv_Cd FLOAT NOT NULL,
	Deriv_Desc VARCHAR NOT NULL,
	PRIMARY KEY (Deriv_Cd),
	UNIQUE (Deriv_Cd)
);

CREATE TABLE weight(
	NDB_No INT(5) NOT NULL,
	Seq INT(5) NOT NULL,
	Amount INT(2) NOT NULL,
	Msre_Desc VARCHAR NOT NULL,
	Gm_Wgt FLOAT NOT NULL,
	Num_Data_Pts INT,
	Std_Dev FLOAT,
	PRIMARY KEY (NDB_No),
	UNIQUE (NDB_No)
);

CREATE TABLE footnote(
	NDB_No INT(5) NOT NULL,
	Footnt_No INT NOT NULL,
	Footnt_Typ VARCHAR NOT NULL,
	Nutr_No INT(3),
	Footnt_Txt VARCHAR,
);

CREATE TABLE data_source_link(
	NDB_No INT(5) NOT NULL,
	Nutr_No INT(3) NOT NULL,
	DataSrc_ID VARCHAR(3) NOT NULL,
	PRIMARY KEY (NDB_No),
	UNIQUE (NDB_No)
);

CREATE TABLE data_sources(
	DataSrc_ID VARCHAR(5) NOT NULL,
	Authors VARCHAR(40),
	Title VARCHAR(40) NOT NULL,
	`Year` YEAR(4),
	Journal VARCHAR(40),
	Vol_City INT(3),
	Issue_State INT(2),
	Start_Page INT(4),
	End_Page INT(4),
	PRIMARY KEY (DataSrc_ID),
	UNIQUE (DataSrc_ID)
);