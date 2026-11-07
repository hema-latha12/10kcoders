create database pokemon;
use pokemon;

select * from pokemon_data;

select distinct count(id) from pokemon_data;

-- first copy the table
create table pk as (select * from pokemon_data);

select * from pk;

-- all rows and unique records are same so no need to check for duplicates

-- set id col to primary key

alter table pk add primary key (id);

-- check for null or missing records
select id from pk
where id='' or id is null;
select name from pk
where name='' or name is null;
select base_experience from pk
where base_experience='' or base_experience is null;
select height from pk
where height='' or height is null;
select weight from pk
where weight='' or weight is null;

select * from pk
where weight=0;

select types from pk
where types='' or types is null;
select abilities from pk
where abilities='' or abilities is null;
select moves from pk
where moves='' or moves is null;

select count(moves) from pk
where moves='';

select stats from pk
where stats='' or stats is null;

-- work on moves col empty rows and weight col is 0
-- real pokeman weight can't be zero so we can modify it as unknown
set sql_safe_updates=0;
update pk
set weight=null 
where weight=0;

update pk
set moves=null 
where moves='';

-- checked for duplicate names
select distinct count(name) from pk;

select * from pk;

-- no need to trim the names
select count(*) from pokemon_data where name <> trim(name);

-- split records
select types,
substring_index(types, ', ', 1) as type1,
if(types like '%,%', substring_index(types, ',', -1),null) as type2 from pk;

alter table pk add column type1 varchar(30), add column type2 varchar(30);

update pk
set type1=substring_index(types, ', ', 1),
type2=if(types like '%,%', substring_index(types,',',-1), null);

alter table pk 
drop column types;

-- for stats
alter table pk
  add column hp int,
  add column attack int,
  add column defense int,
  add column special_attack int,
  add column special_defense int,
  add column speed int;
  
update pk
set
  hp = cast(regexp_replace(regexp_substr(stats, 'hp=[0-9]+'), '[^0-9]', '') as unsigned),
  attack = cast(regexp_replace(regexp_substr(stats, '(^|, )attack=[0-9]+'), '[^0-9]', '') as unsigned),
  defense = cast(regexp_replace(regexp_substr(stats, '(^|, )defense=[0-9]+'), '[^0-9]', '') as unsigned),
  special_attack = cast(regexp_replace(regexp_substr(stats, 'special-attack=[0-9]+'), '[^0-9]', '') as unsigned),
  special_defense = cast(regexp_replace(regexp_substr(stats, 'special-defense=[0-9]+'), '[^0-9]', '') as unsigned),
  speed = cast(regexp_replace(regexp_substr(stats, 'speed=[0-9]+'), '[^0-9]', '') as unsigned)
where id > 0;

select * from pk;

alter table pk
drop column stats;

-- we can split abilities moves as well...
