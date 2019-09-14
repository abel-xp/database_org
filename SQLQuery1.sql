create database abixp;

use abixp
create table kabee_project( id int not null primary key, name varchar(30),education varchar(30), hometown varchar(30), age int not null, email varchar(30) unique);

select* from kabee_project

insert into kabee_project values(205, 'bob', 'bsc_chemistry','jeref',26,'bob@gmail.com');
update kabee_project set departement_name= 'frontend' where id=206
select sum(age) from kabee_project 

alter table kabee_project add departement_id int 
select hometown,age, SUM(salary) as totalsalary from kabee_project
group by hometown,age;


select hometown,age, SUM(salary) as totalsalary, count(id) 
as total_employee from kabee_project  
group by hometown,age
having sum(salary) = 11500;

create table kabee_projectDep(depargtement_id int not null, departement_name varchar(20) not null,
location varchar(20) not null, departement_head varchar(20))insert into kabee_projectDep values (3,'back_end','sehafa','tomas')
 

 update kabee_projectDep set depargtement_id= 3 

 select * from kabee_project cross join  kabee_projectDep on 
 kabee_project.departement_id =kabee_projectDep.depargtement_id
 
 select e.name 
 create table seesion_1(student_id int not null, name varchar(20) , dep_head_id int not null)
 create table session_2(student_name varchar(30), head_dep_name varchar(30))
 insert into session_2 values('ramsy')
 select*from session_

 select id, coalesce(firstname, midlename, lastname) as name from tblemployee
 select * from seesion_1
 union
 select * from session_2
    -----store proccedure----
 create procedure spGetkabee_project1
 as 
 begin 
    select  name, education, salary from kabee_project order by name
end
	spGetkabee_project1
 
	----with parameter---
alter proc spgetkabeeprojectbyeducationandhometown
@education varchar(30),
@hometown varchar(30)
with encryption
as  
begin
         select education,hometown from kabee_project where education=@education and hometown=@hometown
end
  -----system defined sp----
sp_helptext spGetkabee_project

create procedure spgetkabee_project3
@salary int output
as 
 begin  
      select salary = count(id) from kabee_project
	  end
    ----output parameter----
 declare @salary int 
 execute spgetkabee_project @salary output
 select   @salary
 ------return parameter----
 create procedure spgetkabee_project4
 as  
 begin
 return(select count(id) from employees)
 end

 create procedure spgetabixp
 @id int ,
 @name varchar(30) output
 as 
 begin 
 select @name=name from kabee_project where id =@id
 end
 
 declare @name varchar(30)
 execute spgetabixp 200,@name out
 print 'name='+ @name

 create procedure spgetabixp2
 @id int 
 as
 begin
 return(select name  from kabee_project where id=@id)
 end
 
 declare @name varchar(30)
 execute spgetabixp2 200
 print 'name='+ @name
 
 -----funtions
 
 select ascii('a')
 select char(97)
 
 declare @start int 
 set @start=97
while(@start<=123)
begin
  print char(@start)
  set @start=@start+1
  end
----string functions 
  select ltrim('    hello   ')
  
  select * from kabee_projectdep
 
 select ltrim(name) as firstname,hometown,
  name+'     '+hometown+'' as address from kabee_project
  
  select upper(ltrim(name)) as firstname, lower(hometown),
  name+''+hometown+'  '+hometown as address from kabee_project
   
   select reverse(upper(ltrim(name))) as firstname, hometown,
  name+''+hometown+'  '+hometown as address from kabee_project
 
 select name, len(ltrim(name)) as totaldevolpers from kabee_project
 ---substring
 select left('abcdef', 3)
 select right('abcdef', 3)
  select charindex('@','sara@aaa.com' )
  select substring('sara@aaa.com',6,7)
   
   select substring(departement_name,charindex('_',departement_name) +1,
   len(departement_name) -charindex('_', departement_name)) as research_base, 
   count(departement_name) as total
   from kabee_project substring(departement_name,charindex('_',departement_name) +1,
   len(departement_name) -charindex('_', departement_name))
   
   ----replicate function 
   select replicate('abel',3)
  
  -----space function
   select space(5)
   
   ------patindex
   select departement_name,patindex('front_end', departement_name)
   as firstline from kabee_projectDep 

   select departement_name,patindex('front_end', departement_name)
   as firstline from kabee_projectDep 
   where
 patindex('front_end', departement_name) > 0
 
----replace 
select  departement_name, replace(departement_name, 'end','port') as covertion from kabee_project

----stuff function 
select name, departement_name, hometown,
     stuff(hometown,2,3,'*****') as home_tenn
	 from kabee_project


-----matematical function----
select abs(-105.5)
select ceiling(15.2)
select ceiling(-15.2)

select floor(15.2)
select floor(-15.2)

select power(2,3)
select square(9)
select sqrt(81)
select rand(1)
select floor(rand() *100)  ---different numbers

declare @counter int 
set @counter=1
while(@counter<=10)
begin
    print floor(rand() *1000)
	set @counter=@counter+1
	end

	select round(850.556,2)
    select round(850.556,2,1)
	select round(850.556,1)
	select round(850.556,1,1)
	select round(850.556,-2)
	select round(850.556,-1)
	
	-----scalar user defined function---
	declare @dob date
	declare @age int
	set @dob ='10/08/1992'

	set @age = datediff(year,@dob,getdate())-
	          case  
			    when(month(@dob)>month(getdate())) or
				(month(@dob)= month(getdate())and day(@dob)>day (getdate()))
				then 1
				else 0
				end

select @age
end

create function calculateAge(@Dob date)
returns int
as 
begin
declare @Dob date
	declare @age int
	set @Dob ='10/08/1992'

	set @age = datediff(year,@Dob,getdate())-
	          case  
			    when(month(@Dob)>month(getdate())) or
				(month(@Dob)= month(getdate())and day(@dob)>day (getdate()))
				then 1
				else 0
				end

select @age
end



select * from project_team 
use project_team

----inline table function---
ALTER function  [dbo].[fn_abixpbydepartement] (@departement varchar(30))
returns table
 as 
 return( select id, name,education from project_team where departement=@departement)
 ------------------------------

CREATE FUNCTION <Inline_Function_Name, sysname, FunctionName> 
(	
	-- Add the parameters for the function here
	<@param1, sysname, @p1> <Data_Type_For_Param1, , int>, 
	<@param2, sysname, @p2> <Data_Type_For_Param2, , char>
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 0
)
GO


CREATE FUNCTION <Table_Function_Name, sysname, FunctionName> 
(
	-- Add the parameters for the function here
	<@param1, sysname, @p1> <data_type_for_param1, , int>, 
	<@param2, sysname, @p2> <data_type_for_param2, , char>
)
RETURNS 
<@Table_Variable_Name, sysname, @Table_Var> TABLE 
(
	-- Add the column definitions for the TABLE variable here
	<Column_1, sysname, c1> <Data_Type_For_Column1, , int>, 
	<Column_2, sysname, c2> <Data_Type_For_Column2, , int>
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	
	RETURN 
END
GO
 -----alter statement for multiline function---
ALTER function [dbo].[fn_miabi_get]()
 returns @table table ( id int, name varchar(30), departement varchar(30))
 as 
 begin 
   insert into @table 
   select id,name,age from project_team
 return

end
 ---function----

sp_helptext dbo.fn_miabi_get
sp_helptext [dbo].[fn_abixpbydepartement]

 ALTER function [dbo].[fn_miabi_get]()
 returns @table table ( id int, name varchar(30), departement varchar(30))
 with encryption
 as 

 begin 
   insert into @table 
   select id,name,age from project_team
 return

end
 
 ALTER function [dbo].[fn_miabi_get]()
 returns @table table ( id int, name varchar(30), departement varchar(30))
 with schemabinding
 as 
 begin 
   insert into @table 
   select id,name,age from project_team
 return

end
----temporary table---

create table #abixp(id int not null, name varchar(30))
select * from tempdb..sysobjects where name like '#abixp'

---local temporary table with store procedure---
create proc splocaltemp1
as 
begin 
create table #abixp2(id int not null,name varchar(30))
insert into #abixp2 values(1,'abixp')
insert into #abixp2 values(2,'miabi')
insert into #abixp2 values(3,'aman')

select *from #abixp
end

select *from #abixp

----global temporary table---
create table ##miabi(id int not null, name varchar(30))
select * from tempdb..sysobjects where name like '##miabi'

------indexes---
use abixp
create index ix_project_team_salary
on kabee_project (salary asc)

select * from kabee_project
 sp_helpindex kabee_project

 ----clustered---
 create clustered index ix_kabee_project
 on kabee_projectDep(departement_head asc, location asc)
 
 drop index kabee_projectDep.ix_kabee_project_salary
 sp_helpindex kabee_projectDep
 select* from kabee_projectDep
  ------non clustered---
  create nonclustered index ix_kabee_pro on kabee_projectDep( departement_name asc)

  sp_helpindex kabee_projectDep
  
  -----unique index---
  create unique nonclustered index uix_kabee_project_email on kabee_project(email)
  
  alter table kabee_project
  add constraint UQ__eritrea_asa
  unique nonclustered(email)
  select * from kabee_project 
  
  -----views----
  create table line(id int primary key,name varchar(30), departement varchar(30))
	insert into line values(2,'aman','dataresearch')

	create table line_1(line_id int references line(id) , departement_name varchar(30))
	insert into line_1 values(3,'back_end')
	
   create view vwkabee_org
   as 
   select * from  line join line_1
   on line_id=line_1.line_id---------must cahange column name 
   
   sp_helptext vwkabee_org
   
   select * from vwkabee_org
   alter table kabee_projectDep alter column departement_name varchar(30) = dep_name varchar(30)
    alter table kabee_projectDep add constraint fk_kabee_order
	foreign key(departement_name) references kabee_projectDep(departement_name)
	
	alter table kabee_projectDep add foreign key(depargtement_id) references kabee_project(departement_id)

    create view vwkabee_org
   as 
   select * from  line join line_1
   on line_id=line_1.line_id
   
   select * from vwkabee_org
   --
   update vwkabee_org set name ='abixp' where id =1
   delete from vwkabee_org where id =1
   insert into vwkabee_org values(3 ,'aman','back_end')

   ----viwes---