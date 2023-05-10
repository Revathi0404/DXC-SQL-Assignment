create database keepnotes
use  keepnotes
 

create table UserRecords
(
User_id int primary key,
User_name varchar(20),
User_added_date date,
User_password varchar(20),
User_mobile int
)

 

insert into UserRecords values (112233,'Maya','2019-01-02','Maya1214',801234567)

insert into UserRecords values (112244,'Nair','2019-01-11','Welcome',902377846)
select * from UserRecords
 

create table Note
(
note_id int primary key,
note_title varchar(30),
note_content varchar(50),
note_status varchar(20),
note_creation_date date,
User_id int references UserRecords(User_id)
)

 

insert into note values(1,'Today Tasks','1.Check emails and reply them 2.Start the pro...','InProgress','2019-01-21',112233)

insert into note values (2,'Training to plan','1.Application related 2.Technical related','Yet to Start','2019-01-31',112244),(3,'Things to have today','1.Fruits 2.More water','InProgress','2019-01-25',112244)
select * from note
 


create table category
(
categort_id int primary key,
category_name varchar(30),
category_descr varchar(30),
category_creation_date date,
category_creator int 
)

insert into category values(1,'Offical','Office related notes','2019-01-21',112233),(2,'Diet','Health related notes','2019-01-24',112244)
select * from category
 


create table reminder
(
reminder_id int primary key,
reminder_name varchar(20),
reminder_descr varchar(25),
reminder_type varchar(20),
reminder_creation_date date,
reminder_creator int
)




insert into reminder values (1,'KT reminder','Session on technical','Office Reminders','2019-02-12',112233),(2,'Personal Reminder','Pick children','Persinal Reminders','2019-02-14',112244)

 select * from reminder


create table NoteCategory
(
notecategory_id int primary key,
note_id int references note(note_id),
categort_id int references category(categort_id)
)


insert into NoteCategory values(1,1,1),(2,2,1),(3,3,2)
select * from NoteCategory


create table NoteReminder
(
notereminder_id int primary key,
note_id int references note(note_id),
reminder_id int references reminder(reminder_id)
)

 

insert into NoteReminder values(1,3,2),(2,2,1)

select * from NoteReminder

--query 1
select * from UserRecords where user_id = 112233 and user_password = 'Maya1214'
--query 2
select * from note where note_creation_date = '01/31/2019'
--query 3
select * from category where category_creation_date > '01/22/2019'
--query 4
select * from category where categort_id = (select categort_id from note where note_id = 1)
--query 5
select * from Note where user_id = 112244
--query 6
select * from Note where user_id = (select category_creator from category where categort_id = 1)
--query 7
select * from reminder where reminder_creator=(select user_id from Note where note_id=2)
--query 8
update note set note_status = 'completed' where note_id = 3
select * from note
--query 9
update Reminder set Reminder_Type = 'Personal Reminders' where reminder_creator = (select user_id from Note where note_id = 1)
select * from reminder
--query 10
delete from NoteReminder where note_id = 2
select * from NoteReminder