----- CREATING TABLES -----

-- Quarters table
CREATE TABLE Quarters (
    Quarter_ID VARCHAR NOT NULL PRIMARY KEY,
    Year INT NOT NULL,
    Quarter INT NOT NULL);
--Check data import
SELECT * FROM Quarters;


-- Netflix_Movie_Show_List table
CREATE TABLE Netflix_Movie_Show_List (
    Media_ID INT NOT NULL PRIMARY KEY,
    Quarter_ID VARCHAR NOT NULL,
    Category_ID VARCHAR NOT NULL,
    Title VARCHAR NOT NULL,
    Premiere DATE NOT NULL,
	FOREIGN KEY (Quarter_ID) REFERENCES Quarters(Quarter_ID));
--Check data import
SELECT * FROM Netflix_Movie_Show_List;


-- Netflix_Movies_IMDB table
CREATE TABLE Netflix_Movies_IMDB (
    Media_ID INT NOT NULL PRIMARY KEY,
    Category_ID VARCHAR NOT NULL,
    IMDB_Score DECIMAL NOT NULL);
ALTER TABLE Netflix_Movies_IMDB
ADD FOREIGN KEY (Media_ID) REFERENCES Netflix_Movie_Show_List(Media_ID);
--Check data import
SELECT * FROM Netflix_Movies_IMDB;


-- Netflix_Movies_Lang table
CREATE TABLE Netflix_Movies_Lang (
    ID INT NOT NULL PRIMARY KEY,
    Media_ID INT NOT NULL,
    Category_ID VARCHAR NOT NULL,
    Language VARCHAR NOT NULL,
	FOREIGN KEY (Media_ID) REFERENCES Netflix_Movie_Show_List(Media_ID));
--Check data import
SELECT * FROM Netflix_Movies_Lang;


-- Netflix_Movies_Genre table
CREATE TABLE Netflix_Movies_Genre (
    ID INT NOT NULL PRIMARY KEY,
    Media_ID INT NOT NULL,
    Category_ID VARCHAR NOT NULL,
    Genre VARCHAR NOT NULL,
	FOREIGN KEY (Media_ID) REFERENCES Netflix_Movie_Show_List(Media_ID));
--Check data import
SELECT * FROM Netflix_Movies_Genre;


-- Netflix_Shows_Seasons table
CREATE TABLE Netflix_Shows_Seasons (
   	Media_ID INT NOT NULL PRIMARY KEY,
    Category_ID VARCHAR NOT NULL,
    No_of_Seasons INT NOT NULL,
    FOREIGN KEY (Media_ID) REFERENCES Netflix_Movie_Show_List(Media_ID));
--Check data import
SELECT * FROM Netflix_Shows_Seasons;


-- Netflix_Shows_Genre table
CREATE TABLE Netflix_Shows_Genre (
    Media_ID INT NOT NULL PRIMARY KEY,
    Category_ID VARCHAR NOT NULL,
    Genre VARCHAR NOT NULL,
    FOREIGN KEY (Media_ID) REFERENCES Netflix_Movie_Show_List(Media_ID));
--Check data import
SELECT * FROM Netflix_Shows_Genre;


-- Netflix_Stock_Prices table
CREATE TABLE Netflix_Stock_Prices (
    Date DATE NOT NULL PRIMARY KEY,
    Quarter_ID VARCHAR NOT NULL,
    Open INT NOT NULL,
    High INT NOT NULL,
    Low INT NOT NULL,
    Close INT NOT NULL,
    Adj_Close INT NOT NULL,
    Volume INT NOT NULL,
    FOREIGN KEY (Quarter_ID) REFERENCES Quarters(Quarter_ID));
--Check data import
SELECT * FROM Netflix_Stock_Prices;


-- Neflix_Rev_Sub_USC table
CREATE TABLE Neflix_Rev_Sub_USC (
    Quarter_ID VARCHAR NOT NULL PRIMARY KEY,
    Area_Name VARCHAR NOT NULL,
    Revenue DECIMAL NOT NULL,
    Rev_Quarterly_Change DECIMAL NOT NULL,
    Subscribers DECIMAL NOT NULL,
    Sub_Quarterly_Change DECIMAL NOT NULL,
    FOREIGN KEY (Quarter_ID) REFERENCES Quarters(Quarter_ID));
--Check data import
SELECT * FROM Neflix_Rev_Sub_USC;


-- Neflix_Rev_Sub_EMEA table
CREATE TABLE Neflix_Rev_Sub_EMEA (
    Quarter_ID VARCHAR NOT NULL PRIMARY KEY,
    Area_Name VARCHAR NOT NULL,
    Revenue DECIMAL NOT NULL,
    Rev_Quarterly_Change DECIMAL NOT NULL,
    Subscribers DECIMAL NOT NULL,
    Sub_Quarterly_Change DECIMAL NOT NULL,
    FOREIGN KEY (Quarter_ID) REFERENCES Quarters(Quarter_ID));
--Check data import
SELECT * FROM Neflix_Rev_Sub_EMEA;


-- Neflix_Rev_Sub_LA table
CREATE TABLE Neflix_Rev_Sub_LA (
    Quarter_ID VARCHAR NOT NULL PRIMARY KEY,
    Area_Name VARCHAR NOT NULL,
    Revenue DECIMAL NOT NULL,
    Rev_Quarterly_Change DECIMAL NOT NULL,
    Subscribers DECIMAL NOT NULL,
    Sub_Quarterly_Change DECIMAL NOT NULL,
    FOREIGN KEY (Quarter_ID) REFERENCES Quarters(Quarter_ID));
--Check data import
SELECT * FROM Neflix_Rev_Sub_LA;


-- Neflix_Rev_Sub_AP table
CREATE TABLE Neflix_Rev_Sub_AP (
    Quarter_ID VARCHAR NOT NULL PRIMARY KEY,
    Area_Name VARCHAR NOT NULL,
    Revenue DECIMAL NOT NULL,
    Rev_Quarterly_Change DECIMAL NOT NULL,
    Subscribers DECIMAL NOT NULL,
    Sub_Quarterly_Change DECIMAL NOT NULL,
    FOREIGN KEY (Quarter_ID) REFERENCES Quarters(Quarter_ID));
--Check data import
SELECT * FROM Neflix_Rev_Sub_AP;
