--Check data import
SELECT * FROM Quarters;

SELECT * FROM Netflix_Movie_Show_List;

SELECT * FROM Netflix_Movies_IMDB;

SELECT * FROM Netflix_Movies_Lang;

SELECT * FROM Netflix_Movies_Genre;

SELECT * FROM Netflix_Shows_Seasons;

SELECT * FROM Netflix_Shows_Genre;

SELECT * FROM Netflix_Stock_Prices;

SELECT * FROM Neflix_Rev_Sub_USC;

SELECT * FROM Neflix_Rev_Sub_EMEA;

SELECT * FROM Neflix_Rev_Sub_LA;

SELECT * FROM Neflix_Rev_Sub_AP;

-- Join tables!
SELECT nms.Media_ID, nms.Quarter_ID, nms.Category_ID, nms.Title, nms.Premiere, ms.Genre, nmi.IMDB_Score, nml.Language, nss.No_of_Seasons
FROM Netflix_Movie_Show_List as nms
LEFT JOIN (
SELECT Media_ID, Category_ID, Genre FROM Netflix_Movies_Genre
UNION
SELECT Media_ID, Category_ID, Genre FROM Netflix_Shows_Genre
ORDER BY Media_ID) AS ms ON nms.Media_ID = ms.Media_ID
LEFT JOIN Netflix_Movies_IMDB as nmi ON nms.Media_ID = nmi.Media_ID
LEFT JOIN Netflix_Movies_Lang as nml ON nms.Media_ID = nml.Media_ID
LEFT JOIN Netflix_Shows_Seasons as nss ON nms.Media_ID = nss.Media_ID
;

SELECT q.Quarter_ID, nsp.min, nsp.avg, nsp.max, usc.Area_Name, usc.Revenue, usc.Rev_Quarterly_Change, usc.Subscribers, usc.Sub_Quarterly_Change
FROM Quarters as q
LEFT JOIN 
(SELECT Quarter_ID, MIN(Close), AVG(Close), MAX(Close) FROM Netflix_Stock_Prices GROUP BY Quarter_ID) AS nsp ON nsp.Quarter_ID = q.Quarter_ID
RIGHT JOIN Neflix_Rev_Sub_USC as usc ON q.Quarter_ID = usc.Quarter_ID
;

SELECT nms.Media_ID, nms.Quarter_ID, nms.Category_ID, nms.Title, nms.Premiere, ms.Genre, nmi.IMDB_Score, nml.Language, nss.No_of_Seasons, nsp.min, nsp.avg, nsp.max, usc.Area_Name, usc.Revenue, usc.Rev_Quarterly_Change, usc.Subscribers, usc.Sub_Quarterly_Change
FROM Netflix_Movie_Show_List as nms
LEFT JOIN (
SELECT Media_ID, Category_ID, Genre FROM Netflix_Movies_Genre
UNION
SELECT Media_ID, Category_ID, Genre FROM Netflix_Shows_Genre
ORDER BY Media_ID) AS ms ON nms.Media_ID = ms.Media_ID
LEFT JOIN Netflix_Movies_IMDB as nmi ON nms.Media_ID = nmi.Media_ID
LEFT JOIN Netflix_Movies_Lang as nml ON nms.Media_ID = nml.Media_ID
LEFT JOIN Netflix_Shows_Seasons as nss ON nms.Media_ID = nss.Media_ID
LEFT JOIN 
(SELECT Quarter_ID, MIN(Close), AVG(Close), MAX(Close) FROM Netflix_Stock_Prices GROUP BY Quarter_ID) AS nsp ON nsp.Quarter_ID = nms.Quarter_ID
LEFT JOIN Neflix_Rev_Sub_USC as usc ON nms.Quarter_ID = usc.Quarter_ID
ORDER BY nms.Premiere DESC;
