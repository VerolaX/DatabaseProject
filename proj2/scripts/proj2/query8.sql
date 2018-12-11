SELECT COUNT(*)
FROM (SELECT userID
      FROM (SELECT userID
	    FROM Item JOIN Category ON Item.itemID = Category.itemID
	    GROUP BY userID, category) AS J
      GROUP BY userID
      HAVING COUNT(userID) > 10) AS C;
