drop table photo;
drop table dateTable;
drop table timeTable;
drop table place;
drop table lignageModel;
drop table model;

create table dateTable (
	dateKey integer primary key,
	dateValue Date
);

create table timeTable(
	timeKey integer primary key,
	timeValue Timestamp
);

create table place(
	placeKey integer primary key,
	city varchar(100),
	country varchar(100)
);

create table model(
	modelKey integer primary key,
	modelName varchar(50),
	creator varchar(50)
);

create table lignageModel(
	modelKey integer,
	modelKeyDerivedFrom integer,
	modelHierarchy integer,
	bottomFlag NUMBER(1) NOT NULL CHECK  (bottomFlag in (0,1)),
	topFlag NUMBER(1) NOT NULL CHECK  (topFlag in (0,1))
);

alter table lignageModel add foreign key(modelKey) references model(modelKey);
alter table lignageModel add foreign key(modelKeyDerivedFrom) references model(modelKey);
alter table lignageModel add primary key(modelKey, modelKeyDerivedFrom);

create table photo(
	dateKey integer,
	timeKey integer,
	placeKey integer,
	modelKey integer
);

alter table photo add foreign key(dateKey) references dateTable(dateKey);
alter table photo add foreign key(timeKey) references timeTable(timeKey);
alter table photo add foreign key(placeKey) references place(placeKey);
alter table photo add foreign key(modelKey) references model(modelKey);
alter table photo add primary key(dateKey, timeKey, placeKey, modelKey);