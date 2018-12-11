SELECT COUNT(*)
FROM Category
WHERE itemID IN (SELECT itemID
		 FROM Bid
		 WHERE amount>1000);
