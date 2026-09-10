use company;

select * from emp;

select ename
from emp
where sal*1.10 > 3000;

select ename, (sal*1.10)*12 as annual_sal 
from emp
where mgr=7566;

select * from emp
where ename like 'k%s';

select * from emp
where hiredate between '1980-01-01' and '1987-12-31'
and ename not like 'a%'
and ename not like 'e%'
and ename not like 'i%'
and ename not like 'o%'
and ename not like 'u%';

select ename from emp
where ename regexp '^[aeiou].*[b-df-hj-np-tv-z]$';

select * from emp
where job='manager';

select empno, ename 
from emp 
where comm is not null;

select ename from emp
where deptno in (10,20);

select ename from emp
where job='clerk' and sal>3000;

select ename from emp
where job in ('clerk','salesman','analyst') and sal > 2500;

select * from emp
where hiredate<'1980-01-01' or hiredate>'1988-12-31';

select ename from emp
where deptno in (10,20,40) or job in ('clerk','salesman','analyst');

select ename from emp
where ename like 's%' and length(ename)=5;

select ename from emp
where comm is not null and deptno in (10,20);

select *, sal*12 as annual_sal
from emp
where job='manager' and deptno in (20,30);

select * from emp
where month(hiredate)=02;

select *, sal*12 as annual_sal
from emp
where ename like '%m%' and ename like 's%';

select ename,hiredate from emp
where hiredate between '1981-01-01' and '1981-12-31';

select * from emp
where job='salesman';

select * from emp
where deptno in (10,20);

select *, sal*6 as half_sal 
from emp
where sal>5000 
and ename like 'a%'
and ename like 'e%'
and ename like 'i%'
and ename like 'o%'
and ename like 'u%';

select * from emp
where job!='manager'
and sal between 1000 and 2000;

select ename from emp
where job='clerk' or job='president';

select ename,sal from emp
where sal between 0 and 1400;

select ename from emp
where deptno=10 and substring(ename,2,1)='m';

select max(sal),deptno from emp
where deptno in (30,20)
group by deptno;

select ename from (select *, sal as smith_sal
from emp
where ename='smith') as smithTab
where sal < smith_sal;

select min(sal),deptno from emp
group by deptno;

select count(*), deptno from emp
group by deptno
having count(*)>=3 and count(*)<=5;

select count(*),deptno from emp
where job!='salesman'
group by deptno;

select count(*),sal from emp
group by sal
having count(*)>=2;

select count(*),ename from emp
group by ename 
having count(*)>=2;

select avg(sal),deptno from emp
where deptno!=10
group by deptno;

select ename,sum(sal) from emp
where sal>2500
group by ename;

select avg(sal),job from emp
group by job
having avg(sal) between 3000 and 6000;

select * from emp
order by deptno asc, sal desc;

select * from emp
order by job asc;
select * from emp
order by ename asc;

select * from emp
where sal>3000
order by sal desc;

select * from emp
where deptno=10
order by hiredate desc;

select ename,job,sal from emp
order by job desc, sal asc;