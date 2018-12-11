SELECT COUNT(*)
FROM (SELECT COUNT(*) as count
	  FROM Category
	  GROUP BY itemID) as C
WHERE C.count = 4;
