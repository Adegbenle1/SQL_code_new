DROP TABLE IF EXISTS attend;
DROP TABLE IF EXISTS requires;
DROP TABLE IF EXISTS test;
DROP TABLE IF EXISTS Lectures;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Assistants;
DROP TABLE IF EXISTS Professors;

CREATE DATABASE Unischema;
use Unischema;
CREATE TABLE Students
       (StudNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Semester       INTEGER,
        birthdate      date);

CREATE TABLE Professors
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Level          CHAR(2) CHECK (Level in ('C2', 'C3', 'C4')),
        Room           INTEGER UNIQUE,
        birthdate      date);

CREATE TABLE Assistants
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Area           VARCHAR(30),
        birthdate      date,
        Boss           INTEGER REFERENCES professors);

CREATE TABLE Lectures
       (LectureNr      INTEGER PRIMARY KEY,
        Titel          VARCHAR(30),
        WeeklyHours    INTEGER,
        GivenBy        INTEGER REFERENCES Professors);

CREATE TABLE attend
       (StudNr         INTEGER REFERENCES Students ON DELETE CASCADE,
        LectureNr      INTEGER REFERENCES Lectures ON DELETE CASCADE,
        PRIMARY KEY    (StudNr, LectureNr));

CREATE TABLE requires
       (predecessor    INTEGER REFERENCES Lectures ON DELETE CASCADE,
        successor      INTEGER REFERENCES Lectures ON DELETE NO ACTION,
        PRIMARY KEY    (predecessor, successor));

CREATE TABLE test
       (StudNr         INTEGER REFERENCES Students ON DELETE CASCADE,
        LectureNr      INTEGER REFERENCES Lectures,
        PersNr         INTEGER REFERENCES Professors,
        Grade          NUMERIC(2,1) CHECK (Grade between 0.7 and 5.0),
        PRIMARY KEY    (StudNr, LectureNr));


INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (24002, 'Xenokrates', 18, '1989-03-14'); 
 
INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (25403, 'Jonas', 12, '1994-01-14'); 
 
INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (26120, 'Fichte', 10, '1984-05-12'); 

INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (26830, 'Aristoxenos', 8, '1993-06-25'); 
 
INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (27550, 'Schopenhauer', 6, '1995-11-03'); 

INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (28106, 'Carnap', 3, '1990-08-30'); 
 
INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (29120, 'Theophrastos', 2, '1994-01-14'); 
 
INSERT INTO Students(StudNr, Name, Semester, birthdate) 
VALUES (29555, 'Feuerbach', 2, '1993-07-01'); 
 


INSERT INTO Professors(PersNr, Name, Level, Room, birthdate) 
VALUES (2125, 'Sokrates', 'C4', 226, '1975-03-17'); 

INSERT INTO Professors(PersNr, Name, Level, Room, birthdate) 
VALUES (2126, 'Russel', 'C4', 232, '1979-01-27');  
 
INSERT INTO Professors(PersNr, Name, Level, Room, birthdate) 
VALUES (2127, 'Kopernikus', 'C3', 310, '1982-01-01'); 
 
INSERT INTO Professors(PersNr, Name, Level, Room, birthdate) 
VALUES (2133, 'Popper', 'C3', 052, '1965-02-20'); 
 
INSERT INTO Professors(PersNr, Name, Level, Room, birthdate) 
VALUES (2134, 'Augustinus', 'C3', 309, '1977-03-17'); 
 
INSERT INTO Professors(PersNr, Name, Level, Room, birthdate) 
VALUES (2136, 'Curie', 'C4', 036, '1985-12-24'); 
 
INSERT INTO Professors(PersNr, Name, Level, Room, birthdate) 
VALUES (2137, 'Kant', 'C4', 007, '1969-08-03'); 
 
 
 
INSERT INTO Assistants(PersNr, Name, Area, Boss, birthdate) 
VALUES (3002, 'Platon', 'Ideenlehre', 2125, '1988-10-23'); 
 
INSERT INTO Assistants(PersNr, Name, Area, Boss, birthdate) 
VALUES (3003, 'Aristoteles', 'Syllogistik', 2125, '1985-11-28'); 
 
INSERT INTO Assistants(PersNr, Name, Area, Boss, birthdate) 
VALUES (3004, 'Wittgenstein', 'Sprachtheorie', 2126, '1982-3-25'); 
 
INSERT INTO Assistants(PersNr, Name, Area, Boss, birthdate) 
VALUES (3005, 'Rhetikus', 'Planetenbewegung', 2127, '1989-9-15'); 
 
INSERT INTO Assistants(PersNr, Name, Area, Boss, birthdate) 
VALUES (3006, 'Newton', 'Keplersche Gesetze', 2127, '1981-7-30'); 
 
INSERT INTO Assistants(PersNr, Name, Area, Boss, birthdate) 
VALUES (3007, 'Spinoza', 'Gott und Natur', 2134, '1982-4-11'); 

 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5001, 'Grundzuege', 4, 2137);

INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5041, 'Ethik', 4, 2125);
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5043, 'Erkenntnistheorie', 3, 2126);
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5049, 'Maeeutik', 2, 2125);
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (4052, 'Logik', 4, 2125);
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5052, 'Wissenschaftstheorie', 3, 2126); 
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5216, 'Bioethik', 2, 2126); 
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5259, 'Der Wiener Kreis', 2, 2133); 
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (5022, 'Glaube und Wissen', 2, 2134); 
 
INSERT INTO Lectures(LectureNr, Titel, WeeklyHours, GivenBy) 
VALUES (4630, 'Die 3 Kritiken', 4, 2137); 


 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (26120, 5001); 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (27550, 5001); 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (27550, 4052); 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (28106, 5041); 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (28106, 5052); 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (28106, 5216); 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (28106, 5259); 
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (29120, 5001); 

INSERT INTO attend(StudNr, LectureNr) 
VALUES (29120, 5041); 

INSERT INTO attend(StudNr, LectureNr) 
VALUES (29120, 5049); 

INSERT INTO attend(StudNr, LectureNr) 
VALUES (29555, 5022); 

INSERT INTO attend(StudNr, LectureNr) 
VALUES (25403, 5022);  
 
INSERT INTO attend(StudNr, LectureNr) 
VALUES (29555, 5001);  
 
 
 
INSERT INTO requires(predecessor, successor) 
VALUES (5001, 5041); 
 
INSERT INTO requires(predecessor, successor) 
VALUES (5001, 5043); 
 
INSERT INTO requires(predecessor, successor) 
VALUES (5001, 5049); 
 
INSERT INTO requires(predecessor, successor) 
VALUES (5041, 5216);  

INSERT INTO requires(predecessor, successor) 
VALUES (5043, 5052);  

INSERT INTO requires(predecessor, successor) 
VALUES (5041, 5052); 
 
INSERT INTO requires(predecessor, successor) 
VALUES (5052, 5259); 
 


INSERT INTO test(StudNr, LectureNr, PersNr, Grade) 
VALUES (28106, 5001, 2126, 1.0);

INSERT INTO test(StudNr, LectureNr, PersNr, Grade) 
VALUES (25403, 5041, 2125, 2.0);

INSERT INTO test(StudNr, LectureNr, PersNr, Grade) 
VALUES (25403, 5001, 2125, 2.7);

INSERT INTO test(StudNr, LectureNr, PersNr, Grade) 
VALUES (27550, 4630, 2137, 2.0);

INSERT INTO test(StudNr, LectureNr, PersNr, Grade) 
VALUES (27550, 5043, 2137, 1.3);

INSERT INTO test(StudNr, LectureNr, PersNr, Grade) 
VALUES (27550, 5001, 2137, 1.0);


select * from professors order by birthdate DESC;
select Name, semester from Students;
select distinct level from professors;
select PersNr, Name from professors where Level like'C4';
select PersNr, Name, Level from Professors where Level = 'C3' OR Level = 'C4';
select * from students;
select name, birthdate from students where birthdate between 1987-01-01 AND 1989-01-01;
select name, birthdate from students where birthdate >= 1987-01-01 AND birthdate <= 1998-01-01;
select * from Professors where Name like 'Kant';
select * from Professors where Name like 'K%';
select avg(semester) from students;
select max(semester) from students;
select sum(semester)*count(semester) from students;
select * from professors where room is NULL;
select count(*) from students where semester < 13 and semester>=13;
select false and null;
select P.Name, P.PersNr, L.Titel from Professors P, Lectures L where P.PersNr = L.Givenby
order by P.name ASC;
select * from professors P, lectures L where P.PersNr = L.Givenby;
select P.Name, P.PersNr, L.Titel from Professors P, Lectures L where P.PersNr = L.Givenby
AND L.Titel = 'Maeeutik';
select s.studNr, s.Name, a.LectureNr, l.Titel from Students S, Lectures L, attend a where s.studNr = a.StudNr AND L.Lecturenr = a.LectureNr
order by s.studNr ASC;
(select name from Assistants) union (select name from professors);
/*select name from professors except select name from assistants;this except and intercept does not work*/
select * from students order by semester desc;

select s.name, s.semester from students s where s.Semester in (select max(s2. semester) from students s2); /* in or = works here*/
select studNr, LectureNr from attend where lectureNr = 5041;
select a.studNr, a.LectureNr from attend a where a.lectureNr in (select a2.lectureNr from attend a2 where a2.lectureNr = 5041);
select s.studNr, s.Name from Students s where s.studNr in (select a2.studNr from attend a2 where a2.lectureNr = 5041);
select P.name, p.persNr from Professors P where exists (select * from lectures l where P.persNr = l.givenby);
select Name, PersNr from professors where PersNr not in (select Givenby from Lectures);
select * from assistants;
select distinct P.Name from Professors P, assistants a where P.PersNr=a.boss and exists (select * from assistants b where b.boss =P.PersNr and a.area<>b.area); /** correlated subqueries **/
select a.* from assistants a where exists (select p.* from professors p where a.boss = p.PersNr and p.birthdate>a.birthdate); /**un-nesting correlated subqueries **/
select a.* from assistants a, professors p where a.boss = p.PersNr and p.birthdate>a.birthdate; /**un-nesting correlated subqueries **/
select S.* from students S where exists (select p.* from Professors P where S.birthdate<P.birthdate);  /**Correlated subqueries **/
select S.* from students S where S.birthdate < (select max(p.birthdate) from Professors P); /**Uncorrelated subqueries **/
select count(studNr) from Students;
select studNr, Name, semester from Students where Semester = 3;
select LectureNr, Titel from Lectures where Weeklyhours>5;
select distinct name from professors;
select name from students where name like 'a%' and '%a'; 
select name from students where name like 'a%a';
select A.Name, A.PersNr from assistants A where exists (select P.* from Professors P where P.Name = 'Sokrates'and P.PersNr = A.boss ); 
select * from attend;
select P.PersNr, P.name from professors p where exists (select S.* from students S, attend A, lectures L where S.StudNr = A.StudNr and L.Givenby = P.PersNr and L.LectureNr = A.LectureNr and S.Name = 'Fichte'); 
select L.titel from Lectures L where exists (select S.* from students S, attend A where S.StudNr = A.StudNr and S.Semester <=4);
select distinct other_s.studNr, other_s.name from Students fichte_s, attend fichte_a, attend other_a, Students other_s where fichte_s.name = 'Fichte'
and fichte_a.StudNr = fichte_s.StudNr
and other_a.LectureNr = fichte_a.LectureNr
and other_s.studNr = other_a.StudNr
and other_s.studNr <> fichte_s.StudNr;
select avg(semester) as semester_mean from students;
select avg(semester) from students s where not exists (select * from attend a where a.studNr = s.studNr);
select avg(semester) from students s where exists (select * from Professors P, lectures L,attend a where P.PersNr =L.GivenBy and
 L.LectureNr = a.LectureNr and s.StudNr = a.studNr and p.name = 'Sokrate');
select attend_count/(student_count*1.000)  as students_attend_ratio from
(select count(*) as attend_count from attend) a, (select count(*) as student_count from students) s;
select count(*) from attend a where exists (select * from students s where s.StudNr = a.StudNr);
select s.studNr, s.name, (select count(*) from attend a where a.StudNr= s.studNr) as number_lecture from students s;
select semester, min(birthdate) from students group by semester;
select P.PersNr, P.name, sum(L.weeklyHours)
from Lectures L, Professors P where P.PersNr = L.Givenby and P.Level= 'C4' 
group by P.PersNr, P.name having sum(L.weeklyHours) = 8;
select studNr, Name from Students where studNr in (select Max(studNr) from students);
select studNr, name from students order by StudNr desc Limit 1;
select s.studNr, s.name, count(a.StudNr) as No_of_lecture from students s, attend a where s.StudNr = a.StudNr
group by a.StudNr
having count(a.StudNr) > 2;
select studNr, grade, (Case when Grade <1.5 then 'very good'
					when Grade <2.5 then 'good'
                    when Grade <3.5 then 'satisfactory'
                    when Grade <4.0 then 'sufficient'
                    else 'failed' end) as performance from test;
select s.name, avg(t.grade) from students s, test t where s.studNr = t.studNr and s.name= 'Schopenhauer';
select s.name, avg(t.grade) from students s join test t on t.StudNr = s.StudNr where s.name= 'Schopenhauer';
select p.Name, p.level, count(L.givenby) as lecture_no from Professors P, Lectures L where P.PersNr = L.givenby group by L.givenby order by lecture_no DESC;
select p.Name, p.level, count(p.persNr) from Professors P join Lectures L on P.PersNr = L.givenby group by p.persNr;
select P. persNr, P.Name, count(a.studNr) as studentNr from Professors P, lectures L, attend a where p.persNr = L.givenby and L.LectureNr =a.LectureNr 
group by P.persNr 
order by studentNr DESC ; 
select name, avg(grade), count(*)
from students s left outer join test t
on s.studnr = t.studnr
where name = 'Schopenhauer'
group by name;
select persNr, name, count(lectureNr) as numLectures
from Professors p left outer join Lectures l
on p.persNr = l.givenby
where level = 'C4'
group by p.persNr, p.name
order by numLectures desc;
select a.area, count(*) as number_area from assistants a group by a.area;
select p.persNr, p.name, count(a.boss) as Interested_area_nr from professors p, assistants a 
where p.persNr = a.boss 
group by a.boss order by Interested_area_nr desc;
select s.studNr, s.Name, s.semester, (case when s.semester < 7 then 'Bachelor student'
											when s.semester < 11 then 'Masters student '
											else 'phd student' end) as Degree from students s;
select l.lectureNr from lectures l where not exists (select r.successor from requires r where r.successor = l.lectureNr);
select distinct s.studNr, name from students s, attend a where s.StudNr = a.StudNr and not exists 
(select * from attend a2 where a2.LectureNr = a.LectureNr 
and a.StudNr <>a2.StudNr);   
select * from students s where (select count(*) from lectures) = (select count(*) from attend a where a.studNr = s.studNr);
SELECT 
    p.PersNr,
    p.Name,
    t.PersNr,
    t.grade,
    t.studNr,
    s.studNr,
    s.Name
FROM
    professors p
    LEFT JOIN test t ON p.PersNr = t.PersNr
        LEFT JOIN
    students s ON t.StudNr = s.StudNr;
select studNr, name from students order by StudNr DESC limit 1;
select studNr, name from students where studNr in (select Max(StudNr) from students);
select p.persNr, p.name, count(l.lectureNr) as numberlecture from professors p join lectures l on p.persNr = l.GivenBy
group by p.persNr, p.name order by numberlecture Desc;
select l.GivenBy, p.name,count(l.lectureNr) as numberlecture from professors p join lectures l on p.persNr = l.GivenBy
group by l.GivenBy, p.name order by numberlecture Desc;
select p.persNr, p.name, count(*) as Num_of_student from (professors p join lectures l on p.PersNr = l.GivenBy)
															join attend a on a.LectureNr = l.LectureNr
                                                            group by p.persNr, p.name order by Num_of_student desc;
                                                            
								/*Sheet 09 */
select s.studNr, s.name, count(a.studNr) as Num_of_Lecture from students s left join attend a on s.StudNr = a.StudNr group by  s.studNr, s.name order by Num_of_Lecture desc;
select p.persNr , p.name , count (p. studNr )from
((select p.persNr , p.name , t. studNr from Professors p left join test t on p. persNr = t. persNr)
union
(select p.persNr , p.name , a. studNr from Professors p left join Lectures l on p. persNr = l. givenby left join attend a on l. lectureNr = a. lectureNr)) p
group by p.persNr , p. name;
select p.persNr, p.name, count(p.studNr) from 
((select p.persNr , p.name , t. studNr from Professors p left join test t on p. persNr = t. persNr)
UNION
(select p.persNr , p.name , a. studNr from Professors p left join Lectures l on p. persNr = l. givenby left join attend a on l. lectureNr = a. lectureNr)) p
group by p.persNr , p. name;
/* \Professor meeting": Move all professors to room 419.*/
update professors set room = 419;
select * from test;
select s.StudNr, s.name from students s where s.StudNr in (select s.StudNr from test t where s.studNr = t.studNr and t.grade < 2.0);
delete from students s where (select s.StudNr from test t where s.studNr = t.studNr and t.grade > 4.0);
select s.*
from Studenten s
where not exists ( select * from pruefen p
where s. MatrNr = p. MatrNr
and not exists
( select *
from hoeren h
where h. MatrNr = s. MatrNr
and h. VorlNr = p. VorlNr )
);

select l.lectureNr, l.titel, count(a.lectureNr) as cnt, s.semester from lectures l left join attend a on a.LectureNr = l.LectureNr
left join students s on s.StudNr = l.LectureNr where l.Titel = 'Wissenschaftstheorie' or 'Erkenntnistheorie'
group by l.LectureNr, l.titel, s.semester ;

select l.titel, count(*) as cnt, avg(s.semester) as sem
from Lectures l
left outer join attend a on l.lectureNr = a.lectureNr
left outer join students s on a.studNr = s.studNr
where l.weeklyhours = 3
group by l.lectureNr, l.titel
order by l.titel desc;



 