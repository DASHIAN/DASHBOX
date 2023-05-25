drop database board;

create database board default character set utf8;

drop table member;

create table member (
     id        varchar(50) primary key
   , name     varchar(50) not null
   , password   varchar(20) not null
   , regnumber varchar(20) not null
   , mileage   int(10)     default 0
   , gender    char(1)     default 'M'
   , regdate   datetime    not null default curdate() on update current_timestamp()
);

delete from member;
DELIMITER //
begin not atomic
   declare i int default 1;
   while(i<=1001) do
      insert into member (id, password, name, regnumber, mileage, gender, regdate )
          values (concat('hong_', i, '@gmail.com') 
                     , '12345'
                     , concat('홍길동_', i) 
                    , concat(date_format(NOW(), '%y%m%d'), '-', floor((rand() * 4 + 1)), floor((rand() * 999999 + 1)))
                     , 1000
                     , 'M'
                     , now());
      set i = i + 1;
   end while;
end;

select * from member;