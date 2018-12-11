SELECT COUNT(DISTINCT userID) as Count
FROM (SELECT userID as u
      FROM Item) as seller, User
WHERE seller.u = User.userID AND rating > 1000;
