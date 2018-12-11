SELECT COUNT(DISTINCT B1.userID, B2.userID) as Count
FROM Bid as B1, Bid as B2
WHERE B1.itemID = B2.itemID AND B1.userID < B2.userID;
