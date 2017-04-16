with where clause
----------------
sqoop import --connect jdbc:mysql://localhost/college --username root --P ''--table student_master --where 'student_id=1' --target-dir /niit/query1 -m 1;

WITH QUERY
----------

sqoop import --connect jdbc:mysql://localhost/college --username root --P ''--query 'select * from student_master where $CONDITIONS and student_id=2' --target-dir /niit/query2 -m 1;

with joins in form of query
-----------------------------
sqoop import --connect jdbc:mysql://localhost/college --username root --P ''--query 'select a.student_id, a.name, a.address,b.result from student_master a, fy b where $CONDITIONS and a.student_id=b.student_id' --target-dir /niit/query3 -m 1;

Import all tables
----------------
sqoop import-all-tables --connect jdbc:mysql://localhost/college --username root --P -m 1;
(if target dir not specified the files will get copied in a folder by the name hduser)

with right outer join in query
----------------------------
sqoop import --connect jdbc:mysql://localhost/college --username root --P ''--query 'select a.student_id, a.name, a.address,b.result from student_master a right outer join fy b on a.student_id=b.student_id where $CONDITIONS' --target-dir /niit/query4 -m 1;

left outer join
-----------------
sqoop import --connect jdbc:mysql://localhost/college --username root --P ''--query 'select a.student_id, a.name, a.address,b.result from student_master a left outer join fy b on a.student_id=b.student_id where $CONDITIONS' --target-dir /niit/query7 -m 1;

full outer join
-------------
sqoop import --connect jdbc:mysql://localhost/college --username root --P ''--query 'select a.student_id, a.name, a.address,b.result from student_master a full outer join fy b on a.student_id=b.student_id where $CONDITIONS' --target-dir /niit/query8 -m 1;

inner join
----------
sqoop import --connect jdbc:mysql://localhost/college --username root --P ''--query 'select a.student_id, a.name, a.address,b.result from student_master a inner join fy b on a.student_id=b.student_id where $CONDITIONS' --target-dir /niit/query4 -m 1;

import into hive tables
----------------------

sqoop import --connect jdbc:mysql://localhost/college --username root -P --table student_master --hive-import --hive-table niit.student_profile -m 1; (correct)

sqoop import --connect jdbc:mysql://localhost/college --username root -P --table fy --hive-import --hive-table college.fyresults -m 1;

 create table employee_master(
     employee_id INT NOT NULL AUTO_INCREMENT,
      name VARCHAR(40) NOT NULL,
      address VARCHAR(40) NOT NULL,
      PRIMARY KEY(employee_id));

using export
------------
sqoop export --connect jdbc:mysql://localhost/niit --username root -P --table employee_master --update-mode allowinsert --update-key employee_id --export-dir /niit/emp1.txt --input-fields-terminated-by ','; 


