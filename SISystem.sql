drop database if exists SISystem;
create database SISystem;

use SISystem;

create table course (
	cID			char(36) not null,
	cCode 		varchar(30) not null,
	cName		varchar(100),
	pNetID		varchar(10) not null,
	primary key (cID)
);

create table student (
	sNetID		varchar(10) not null,
	fName 		varchar(100),
	lName		varchar(100),
	stdNum		char(8),
	primary key (sNetID)
);

create table professor (
	pNetID		varchar(10) not null,
	fName 		varchar(100) not null,
	lName		varchar(100) not null,
	primary key (pNetID)
);

create table enrolled (
	sNetID		varchar(10) not null,
	cID			char(36) not null,
	primary key (sNetID, cID)
);

create table attendanceSession (
	cID			char(36) not null,
	attTime 	bigint not null,
	attDuration	int not null,
	checkInCode	char(5) not null,
	completed	bool not null default 0,
	primary key (cID, attTime)
);

create table attendance (
	attTime 	bigint not null,
	cID			char(36) not null,
	sNetID 		varchar(10) not null,
    attended	bool not null default 0,
	primary key (cID, attTime, sNetID)
);

create table administrators (
	cID    char(36) not null,
	pNetID varchar(10) not null,
	primary key (cID, pNetID)
);

/*
create table lecture (
	lecNum		int not null,
	cID			char(36) not null,
	sTime 		datetime not null,
	eTime		datetime not null,
	location	varchar(30),
	lFlag		tinyint(1),
	primary key (lecNum, cID)
);

create table question (
	qNum		int not null,
	lecNum		int not null,
	cID 		char(36) not null,
	qtext		varchar(280),
	ans			int not null,
	qFlag		tinyint(1),
	primary key (qNum, lecNum, cID)
);

create table solution (
	sNum		int not null,
	qNum		int not null,
	lecNum		int not null,
	cID			char(36) not null,
	sText		varchar(140),
	primary key	(sNum, qNum, lecNum, cID)
);

create table response (
	sNetID		varchar(10),
	qNum		int not null,
	lecNum		int not null,
	cID			char(36) not null,
	resp		int not null,
	correct		tinyint(1),
	primary key (qNum, lecNum, cID, sNetID)
);
*/
	
insert into course values 
	( 'abc49eb2-0630-4382-98b5-abcfd40627b8', 'ELEC 498', 'Design Course', '1pvb69'),
	( 'add49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 222', 'Macroeconomic Theory I', '1pvb69'),
	( 'dad49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 223', 'Macroeconomic Theory II', '1pvb69'),
	( 'dda49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 322', 'Macroeconomic Theory III', '1pvb69'),	 
	( 'bdd49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 224', 'Macroeconomic Theory IV', '1pvb69'), 
	( 'dbd49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 320', 'Macroeconomic Theory V', '1pvb69'),	 
	( 'ddb49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 330', 'Macroeconomic Theory VI', '1pvb69'),	
	( 'cdd49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 340', 'Macroeconomic Theory VII', '1pvb69'),
	( 'dcd49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 350', 'Macroeconomic Theory VIII', '1pvb69'),
	( 'ddc49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 370', 'Macroeconomic Theory IX', '1pvb69'),
	( 'edd49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 390', 'Macroeconomic Theory X', '1pvb69'),
	( 'dfd49eb2-0630-4382-98b5-lolfd40627b8', 'ECON 400', 'Macroeconomic Theory XI', '1pvb69'),
	( 'you49eb2-0630-4382-98b5-wutfd40627b8', 'ECON 360', 'Labour Economics', '15jc3'),
	( 'ree49eb2-0630-4382-98b5-reefd40627b8', 'ECON 255', 'Math Econ', '10boo3'),
	( 'boo49eb2-0630-4382-98b5-moofd40627b8', 'CMPE 333', 'Data Mining', '12hdm');

insert into student values
	( '12cjd2', 'Curtis', 'Demerah', '10090510'),
	( '12ozs', 'Omar', 'Sandarusi', '10097124'),
	( '11jlt10', 'Jonathan', 'Turcotte', '10060060');

insert into  professor values
	('1pvb69', 'Patrick', 'Van Blunt'),
	('10yfl1', 'Yan-Fei', 'Liu'),
	('15jc3', 'John', 'Cena'),
	('10boo3', 'Bob', 'Orwell'),
	('12hdm', 'Harold', 'McMaster');
	
insert into enrolled values 	
	('12cjd2', 'abc49eb2-0630-4382-98b5-abcfd40627b8'),
	('12ozs', 'abc49eb2-0630-4382-98b5-abcfd40627b8'),
	('11jlt10', 'abc49eb2-0630-4382-98b5-abcfd40627b8'),
	('12cjd2', 'you49eb2-0630-4382-98b5-wutfd40627b8'),
	('12ozs', 'ree49eb2-0630-4382-98b5-reefd40627b8'),
	('11jlt10', 'boo49eb2-0630-4382-98b5-moofd40627b8');

insert into attendanceSession values 
	('abc49eb2-0630-4382-98b5-abcfd40627b8', '1509398271000', '60000', 'afeeo', '1'),
    ('abc49eb2-0630-4382-98b5-abcfd40627b8', '1509398272000', '60000','typeo', '1');
    

insert into attendance values 
	('1509398271000', 'abc49eb2-0630-4382-98b5-abcfd40627b8', '12ozs', 1),
	('1509398271000', 'abc49eb2-0630-4382-98b5-abcfd40627b8', '12cjd2', 1),
	('1509398272000', 'abc49eb2-0630-4382-98b5-abcfd40627b8', '11jlt10', 0),
	('1509398272000', 'abc49eb2-0630-4382-98b5-abcfd40627b8', '12ozs', 0),
    ('1509398272000', 'abc49eb2-0630-4382-98b5-abcfd40627b8', '12cjd2', 1);
    
insert into administrators values
	('abc49eb2-0630-4382-98b5-abcfd40627b8', '12hdm'),
    ('abc49eb2-0630-4382-98b5-abcfd40627b8', '13asd');


/*
insert into lecture values
	('1', 'abc49eb2-0630-4382-98b5-abcfd40627b8','2017-10-16 08:30:00', '2017-10-16 09:30:00'),
	('2', 'abc49eb2-0630-4382-98b5-abcfd40627b8','2017-10-18 10:30:00', '2017-10-18 11:30:00'),
	('3', 'abc49eb2-0630-4382-98b5-abcfd40627b8','2017-10-20 14:30:00', '2017-10-20 15:30:00'),
	('1', 'ddd49eb2-0630-4382-98b5-lolfd40627b8','2017-10-19 15:30:00', '2017-10-19 16:30:00'),
	('2', 'ddd49eb2-0630-4382-98b5-lolfd40627b8',  ),
	('1',),
	('1',);
*/