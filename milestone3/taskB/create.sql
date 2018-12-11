drop table if exists Order_History;
drop table if exists Demand;
drop table if exists Supply;
drop table if exists Registration;


create table Registration(
    account VARCHAR(255),
    password VARCHAR(255),
    registration_date DATETIME,
    phone_number VARCHAR(255),
    first_name VARCHAR(255),
    middle_init VARCHAR(255),
    last_name VARCHAR(255),

    primary key (account)
);


create table Demand(
    account VARCHAR(255),
    service_type VARCHAR(255),
    start_time DATETIME,
    end_time DATETIME,
    payment DOUBLE(100,2),
    special_requirement TEXT,

    primary key (account, start_time),
    foreign key (account) references Registration(account)
);


create table Supply(
    account VARCHAR(255),
    service_type VARCHAR(255),
    salary_requirement DOUBLE(100,2),
    start_time DATETIME,
    end_time DATETIME,

    primary key(account, start_time),
    foreign key (account) references Registration(account)
);

create table Order_History(
    orderID VARCHAR(255),
    supplier_account VARCHAR(255),
    demander_account VARCHAR(255),
    time_session VARCHAR(255),
    service_type VARCHAR(255),
    payment DOUBLE(100,2),

    primary key (orderID),
    foreign key (supplier_account) references Registration(account),
    foreign key (demander_account) references Registration(account)
);

