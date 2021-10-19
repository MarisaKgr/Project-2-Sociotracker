-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Netflix_Movie_Show_List" (
    "Media_ID" int   NOT NULL,
    "Quarter_ID" string   NOT NULL,
    "Category_ID" string   NOT NULL,
    "Title" string   NOT NULL,
    "Premiere" date   NOT NULL,
    CONSTRAINT "pk_Netflix_Movie_Show_List" PRIMARY KEY (
        "Media_ID"
     )
);

CREATE TABLE "Netflix_Movies_IMDB" (
    "Media_ID" int   NOT NULL,
    "Category_ID" string   NOT NULL,
    "IMDB_Score" double   NOT NULL,
    CONSTRAINT "pk_Netflix_Movies_IMDB" PRIMARY KEY (
        "Media_ID"
     )
);

CREATE TABLE "Netflix_Movies_Lang" (
    "ID" int   NOT NULL,
    "Media_ID" int   NOT NULL,
    "Category_ID" string   NOT NULL,
    "Language" string   NOT NULL,
    CONSTRAINT "pk_Netflix_Movies_Lang" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Netflix_Movies_Genre" (
    "ID" int   NOT NULL,
    "Media_ID" int   NOT NULL,
    "Category_ID" string   NOT NULL,
    "Genre" string   NOT NULL,
    CONSTRAINT "pk_Netflix_Movies_Genre" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Netflix_Shows_Seasons" (
    "Media_ID" int   NOT NULL,
    "Category_ID" string   NOT NULL,
    "No_of_Seasons" int   NOT NULL,
    CONSTRAINT "pk_Netflix_Shows_Seasons" PRIMARY KEY (
        "Media_ID"
     )
);

CREATE TABLE "Netflix_Shows_Genre" (
    "Media_ID" int   NOT NULL,
    "Category_ID" string   NOT NULL,
    "Genre" string   NOT NULL,
    CONSTRAINT "pk_Netflix_Shows_Genre" PRIMARY KEY (
        "Media_ID"
     )
);

CREATE TABLE "Quarters" (
    "Quarter_ID" string   NOT NULL,
    "Year" int   NOT NULL,
    "Quarter" int   NOT NULL,
    CONSTRAINT "pk_Quarters" PRIMARY KEY (
        "Quarter_ID"
     )
);

CREATE TABLE "Netflix_Stock_Prices" (
    "Date" date   NOT NULL,
    "Quarter_ID" string   NOT NULL,
    "Open" int   NOT NULL,
    "High" int   NOT NULL,
    "Low" int   NOT NULL,
    "Close" int   NOT NULL,
    "Adj_Close" int   NOT NULL,
    "Volume" int   NOT NULL,
    CONSTRAINT "pk_Netflix_Stock_Prices" PRIMARY KEY (
        "Date"
     )
);

CREATE TABLE "Neflix_Rev_Sub_USC" (
    "Quarter_ID" string   NOT NULL,
    "Area_Name" string   NOT NULL,
    "Revenue" int   NOT NULL,
    "Rev_Quarterly_Change" double   NOT NULL,
    "Subscribers" int   NOT NULL,
    "Sub_Quarterly_Change" double   NOT NULL,
    CONSTRAINT "pk_Neflix_Rev_Sub_USC" PRIMARY KEY (
        "Quarter_ID"
     )
);

CREATE TABLE "Neflix_Rev_Sub_EMEA" (
    "Quarter_ID" string   NOT NULL,
    "Area_Name" string   NOT NULL,
    "Revenue" int   NOT NULL,
    "Rev_Quarterly_Change" double   NOT NULL,
    "Subscribers" int   NOT NULL,
    "Sub_Quarterly_Change" double   NOT NULL,
    CONSTRAINT "pk_Neflix_Rev_Sub_EMEA" PRIMARY KEY (
        "Quarter_ID"
     )
);

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE "Netflix_Movie_Show_List" ADD CONSTRAINT "fk_Netflix_Movie_Show_List_Quarter_ID" FOREIGN KEY("Quarter_ID")
REFERENCES "Quarters" ("Quarter_ID");

ALTER TABLE "Netflix_Movies_IMDB" ADD CONSTRAINT "fk_Netflix_Movies_IMDB_Media_ID_Category_ID" FOREIGN KEY("Media_ID", "Category_ID")
REFERENCES "Netflix_Movie_Show_List" ("Media_ID", "Category_ID");

ALTER TABLE "Netflix_Movies_Lang" ADD CONSTRAINT "fk_Netflix_Movies_Lang_Media_ID_Category_ID" FOREIGN KEY("Media_ID", "Category_ID")
REFERENCES "Netflix_Movie_Show_List" ("Media_ID", "Category_ID");

ALTER TABLE "Netflix_Movies_Genre" ADD CONSTRAINT "fk_Netflix_Movies_Genre_Media_ID_Category_ID" FOREIGN KEY("Media_ID", "Category_ID")
REFERENCES "Netflix_Movie_Show_List" ("Media_ID", "Category_ID");

ALTER TABLE "Netflix_Shows_Seasons" ADD CONSTRAINT "fk_Netflix_Shows_Seasons_Media_ID_Category_ID" FOREIGN KEY("Media_ID", "Category_ID")
REFERENCES "Netflix_Movie_Show_List" ("Media_ID", "Category_ID");

ALTER TABLE "Netflix_Shows_Genre" ADD CONSTRAINT "fk_Netflix_Shows_Genre_Media_ID_Category_ID" FOREIGN KEY("Media_ID", "Category_ID")
REFERENCES "Netflix_Movie_Show_List" ("Media_ID", "Category_ID");

ALTER TABLE "Netflix_Stock_Prices" ADD CONSTRAINT "fk_Netflix_Stock_Prices_Quarter_ID" FOREIGN KEY("Quarter_ID")
REFERENCES "Quarters" ("Quarter_ID");

ALTER TABLE "Neflix_Rev_Sub_USC" ADD CONSTRAINT "fk_Neflix_Rev_Sub_USC_Quarter_ID" FOREIGN KEY("Quarter_ID")
REFERENCES "Quarters" ("Quarter_ID");

ALTER TABLE "Neflix_Rev_Sub_EMEA" ADD CONSTRAINT "fk_Neflix_Rev_Sub_EMEA_Quarter_ID" FOREIGN KEY("Quarter_ID")
REFERENCES "Quarters" ("Quarter_ID");

-- Free plan table limit reached. SUBSCRIBE for more.



-- Free plan table limit reached. SUBSCRIBE for more.



