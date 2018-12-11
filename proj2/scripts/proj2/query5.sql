SELECT COUNT(DISTINCT Item.userID) as Count
FROM Item
WHERE Item.userID IN (SELECT DISTINCT userID
		      FROM Bid);
