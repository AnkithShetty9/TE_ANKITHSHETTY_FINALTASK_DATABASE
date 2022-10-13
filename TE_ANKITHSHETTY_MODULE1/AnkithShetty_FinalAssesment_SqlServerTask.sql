drop table Healthcare 
truncate table Healthcare 
drop table Doctors 
truncate table Doctors 
---Table using Normalisation---
---create parent and child table--
create table healthcare
(
Patient_Id int primary key,
Patient_Name varchar(50),
Patient_Address varchar(50),
Disease_Identified varchar(50),
Doctor_id int
)

create table Doctors
(
Doctor_id int primary key,
Doctor_Name varchar(50),
Department_id int,
Mobile_Number float
)

create table hospital
(
hospital_address varchar(50) primary key,
hospital_id int,
location_id int 
)

---inserting values---
insert into Healthcare values(100,'John','Mangalore','Dengue',1),
(101,'Maggi','Bangalore','Leprosy',2),(102,'Julie','Moodbidri','Chikungunya',3),
(103,'Kris','Mumbai','Malaria',3),(104,'Jia','Venur','Rabies',6),(105,'Mia','Chikmangalore','Snakebite',7),
(106,'Sheela','Moodbidri','Trachoma',4),(107,'Ravi','Mangalore','Leprosy',2),(108,'Malkova','Ujire','Scabies',4),
(109,'Mel','Venur','Trematodiases',5),(110,'Manoj','Belthangady','Dengue',1),(111,'Randy','Pune','Chikungunya',3),
(112,'Jorge','Mangalore','Rabies',6),(113,'Lavanya','Ujire','Scabies',4),(114,'Vishal','Mangalore','Leprosy',2),
(115,'Manish','Belthangady','Snakebite',7),(116,'Rishab','Mangalore','Snakebite',7),(117,'Ria','Mumbai','Dengue',1),
(118,'Raj','Ujire','Scabies',4),(119,'Anviraj','Bangalore','Trematodiases',5),(120,'Shashi','Bangalore','Trematodiases',5),
(121,'Chandra','Bangalore','Dengue',1),(122,'Desmond','Pune','Trachoma',4),(123,'Kiran','Venur','Dengue',1),
(124,'Laxmi','Pune','Chikungunya',3),(125,'Ashish','Chikmangalore','Malaria',3),(126,'Mohan','Belthangady','Rabies',6)

insert into Doctors values (1,'Jeevan',301,9325784212),(2,'Mark',302,9648376849),(3,'Anderson',303,9257371846),
(4,'Jaya',304,9845284736),(5,'Lawrence',305,9327164573),(6,'Lloyd',306,9628547264),(7,'Joyal',306,9746372438)

insert into hospital values('Mangalore',10000,575001),('Bangalore',10001,472024),
('Moodbidri',10002,574217),('Mumbai',10003,217483),('venur',10004,574001),
('Chikmangalore',10005,574217),
('Ujire',10006,470832),('Pune',10007,832944),('Belthangady',10008,224217)


---foreign key reference---
Alter table Healthcare 
add constraint FK_Doctor_Id
foreign key(Doctor_id)
references Doctors

select * from Healthcare 

---foreign key reference---
Alter table Healthcare 
add constraint FK_Hospital_address
foreign key(hospital_address)
references hospital


---foreign key confirmation---
insert into Healthcare values(128,'george','mangalore','Cancer',8)

insert into Healthcare values(102,'george','Jammu','Cancer',6) 

select * from Healthcare


---Diffrent type of joins---
select H.Patient_Id ,H.Patient_Name ,H.Hospital_Address,H.Disease_Identified,H.Doctor_id,
Doc.Doctor_name,Doc.Department_id,Doc.Mobile_Number
from Healthcare as H
left join Doctors as Doc
on H.Doctor_id=Doc.Doctor_id

select H.Patient_Id ,H.Patient_Name ,H.Hospital_Address,H.Disease_Identified,H.Doctor_id,
Doc.Doctor_name,Doc.Department_id,Doc.Mobile_Number
from Healthcare as H
right join Doctors as Doc
on H.Doctor_id=Doc.Doctor_id

select H.Patient_Id ,H.Patient_Name ,H.Hospital_Address,H.Disease_Identified,H.Doctor_id,
Doc.Doctor_name,Doc.Department_id,Doc.Mobile_Number
from Healthcare as H
full join Doctors as Doc
on H.Doctor_id=Doc.Doctor_id

select H.Patient_Id ,H.Patient_Name ,H.Hospital_Address,H.Disease_Identified,H.Doctor_id,
Doc.Doctor_name,Doc.Department_id,Doc.Mobile_Number
from Healthcare as H
outer join Doctors as Doc
on H.Doctor_id=Doc.Doctor_id

---Inner Join with all 3 tables----
select H.Patient_Id ,H.Patient_Name ,H.Hospital_Address,H.Disease_Identified,H.Doctor_id,
Doc.Doctor_name,Doc.Department_id,Doc.Mobile_Number,hosp.Hospital_Address ,hosp.hospital_id, hosp.location_id
from ((Healthcare as H
inner join Doctors as Doc
on H.Doctor_id=Doc.Doctor_id)
inner join hospital as hosp
on h.hospital_address=hosp.hospital_address);


---creating views---
create view new_healthcare
as select * from Healthcare h 

select * from new_healthcare 

---DDL,DQL commands on view---

alter view new_healthcare 
as select H.Patient_Id ,H.Patient_Name ,H.Hospital_Address,H.Disease_Identified,H.Doctor_id,
Doc.Doctor_name,Doc.Department_id,Doc.Mobile_Number
from Healthcare as H
inner join Doctors as Doc
on H.Doctor_id=Doc.Doctor_id

select * from new_healthcare 



