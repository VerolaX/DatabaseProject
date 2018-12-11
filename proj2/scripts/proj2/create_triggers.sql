DROP TRIGGER IF EXISTS before_insert_bid;
DROP TRIGGER IF EXISTS after_insert_bid;
DROP TRIGGER IF EXISTS before_update_time;
DROP TRIGGER IF EXISTS item_check_before;


DELIMITER // 
CREATE TRIGGER before_insert_bid BEFORE INSERT ON Bid
FOR EACH ROW
BEGIN
    # Constraint 1
    IF NEW.userID = ANY(SELECT userID FROM Item WHERE Item.itemID = NEW.itemID) THEN
	CALL `Error1: User may not bid on an item he or she is also selling.`;
    
    # Constraint 2
    ELSEIF NEW.time = ANY(SELECT Bid.time FROM Bid, Item WHERE Bid.itemID = Item.itemID AND Bid.itemID = NEW.itemID) THEN
	CALL `Error2: No auction may have two bids at the exact same time.`;
    
    # Constraint 3
    ELSEIF NEW.time > ANY(SELECT Item.ends FROM Item WHERE NEW.itemID = Item.itemID) OR NEW.time < ANY(SELECT Item.started FROM Item WHERE NEW.itemID = Item.itemID) THEN
	CALL `Error3: Bid may not be made before start time or after end time.`;
    
    # Constraint 4
    ELSEIF NEW.userID = ANY(SELECT userID FROM Bid WHERE Bid.amount = NEW.amount AND Bid.userID = NEW.userID AND Bid.itemID = NEW.itemID) THEN
	CALL `Error4: User may not bid for one item with same money amount.`;

    # Constraint 5
    ELSEIF NEW.amount <= ANY(SELECT Item.currently FROM Item WHERE NEW.itemID = Item.itemID) THEN
	CALL `Error5: Bid amount must be higher than current amount.`;

    # Constraint 6
    ELSEIF NEW.time <> ANY(SELECT timeNow FROM CurrentTime) THEN
	CALL `Error6: The bid must be placed at the current time.`;
    END IF;	
END;//


CREATE TRIGGER after_insert_bid AFTER INSERT ON Bid
FOR EACH ROW
BEGIN
    # Constraint 7
    IF NEW.amount <> ANY(SELECT Item.currently FROM Item WHERE Item.itemID = NEW.itemID) THEN
	UPDATE Item
	SET Item.currently = NEW.amount
	WHERE Item.itemID = NEW.itemID;
    END IF;
END;//


CREATE TRIGGER before_update_time BEFORE UPDATE ON CurrentTime
FOR EACH ROW
BEGIN
    IF OLD.timeNow >= NEW.timeNow THEN
	CALL `Error8: The current time can only advance forward in time.`;
    END IF;
END;//


# Constraint: The end time for a bid must be after its start time.
CREATE TRIGGER item_check_before BEFORE INSERT ON Item
FOR EACH ROW
BEGIN
    IF NEW.ends < NEW.started THEN
        CALL `Error0:The end time must be after its start time.`;
    END IF;
END;//
DELIMITER ;
