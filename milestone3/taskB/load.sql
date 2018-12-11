LOAD DATA LOCAL INFILE "/home/cguan3/public_html/data/reg_info.dat" INTO TABLE Registration FIELDS TERMINATED BY ",";
LOAD DATA LOCAL INFILE "/home/cguan3/public_html/data/supply.dat" INTO TABLE Supply FIELDS TERMINATED BY ",";
LOAD DATA LOCAL INFILE "/home/cguan3/public_html/data/demand.dat" INTO TABLE Demand FIELDS TERMINATED BY ",";
LOAD DATA LOCAL INFILE "/home/cguan3/public_html/data/order.dat" INTO TABLE Order_History FIELDS TERMINATED BY ",";