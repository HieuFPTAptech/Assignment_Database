create table Author (
	name_Author varchar(50) NOT NULL PRIMARY KEY
)

create table Category (
	name_Category varchar(50) NOT NULL PRIMARY KEY
)

create table Location (
	name_Location varchar(50) NOT NULL PRIMARY KEY,
	real_Time datetime NOT NULL CHECK(real_Time = GETDATE()),
	geolocation geometry NOT NULL,
)

create table Post (
	id_Post int NOT NULL PRIMARY KEY IDENTITY (1,1),
	title varchar(255) NOT NULL,
	content varchar(255) NOT NULL,
	external_link varchar(255) NOT NULL,
	publish datetime NOT NULL CHECK(publish <= GETDATE()),
	name_Category varchar(50) NOT NULL FOREIGN KEY REFERENCES Category(name_Category),
	name_Author varchar(50) NOT NULL FOREIGN KEY REFERENCES Author(name_Author),
	name_Location varchar(50) NOT NULL FOREIGN KEY REFERENCES Location(name_Location),
)

create table UserInfo (
	id_User int NOT NULL PRIMARY KEY IDENTITY (1,1),
	name_User varchar(50) NOT NULL,
	DOB datetime NOT NULL CHECK((GETDATE() - DOB) >= 18),
	address varchar(255) NOT NULL,
	name_Location varchar(50) NOT NULL FOREIGN KEY REFERENCES Location(name_Location),
)

create table Comment (
	id_User int NOT NULL FOREIGN KEY REFERENCES UserInfo(id_User),
	id_Post int NOT NULL FOREIGN KEY REFERENCES Post(id_Post),
	content varchar(255) NOT NULL,
)

create table Author_Category (
	name_Author varchar(50) NOT NULL UNIQUE FOREIGN KEY REFERENCES Author(name_Author),
	name_Category varchar(50) NOT NULL UNIQUE FOREIGN KEY REFERENCES Category(name_Category),

)

create table Location_Category (
	name_Location varchar(50) NOT NULL FOREIGN KEY REFERENCES Location(name_Location),
	name_Category varchar(50) NOT NULL FOREIGN KEY REFERENCES Category(name_Category),
)

drop table Author
drop table Category
drop table Author_Category
drop table Location
drop table Post
drop table UserInfo
drop table Comment
drop table Location_Category