create database booklib;

\c booklib;

create table if not exists account
(
    id_user   serial not null primary key,
    login     varchar(150) not null,
    password  varchar(150) not null
);

create table if not exists book (
                      isbn            varchar(13)     not null primary key,
                      title           varchar(200)    not null,
                      author          varchar(150)    not null,
                      overview        varchar(1500)   null,
                      picture         varchar(250)    null,
                      read_count      integer         default(1) null,
                      is_delete       boolean         default(false) not null,
                      date_delete     timestamp,
                      date_create     timestamp       default(now()) not null,
                      id_user_create  integer         not null,
                      id_user_delete  integer         null,
                      constraint  "FK_BOOK_USER_CREATE"   foreign key (id_user_create) references account(id_user),
                      constraint  "FK_BOOK_USER_DELETE"   foreign key (id_user_delete) references account(id_user)
);

create table if not exists reader (
                        id_reader   serial      not null primary key,
                        date_reader timestamp   default(now()),
                        isbn        varchar(13) not null,
                        id_user     int,
                        constraint  "FK_READER_BOOK" foreign key (isbn)     references book(isbn),
                        constraint  "FK_READER_USER" foreign key (id_user)  references account(id_user)
);

create table if not exists favorite (
                          id_user         int         not null,
                          isbn            varchar(13) not null,
                          date_favorite   timestamp   default(now()) not null,
                          constraint  "PK_FAVORITE"       primary key (id_user, isbn),
                          constraint  "FK_FAVORITE_BOOK"  foreign key (isbn)     references book(isbn),
                          constraint  "FK_FAVORITE_USER"  foreign key (id_user)  references account(id_user)
);

create table if not exists session (
                         token   varchar(50) not null primary key,
                         id_user int         not null,
                         constraint  "FK_SESSION_USER"   foreign key (id_user)   references account(id_user)
);

create or replace function sign_in(identifier varchar, pwd varchar) returns varchar as $$
declare
id integer;
    token varchar;
begin
select id_user into id
from account usr
where usr.login = identifier
  and usr.password = pwd;

if id is not null then
select md5(random()::text) into token;
insert into session(token, id_user) values (token, id);
return token;
else
        return null;
end if;
end;
$$
language plpgsql;

create or replace function get_authorization(tokenApi varchar) returns int as $$
declare
id integer;
begin
select id_user into id
from session ses
where ses.token = tokenApi;

if id is null then
        return -1;
else
        return id;
end if;
end;
$$
language plpgsql;
