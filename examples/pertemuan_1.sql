--DDL
-- membuat tabel mata_kuliah dengan kolom kode, nama dan sks
create table mata_kuliah (
	kode varchar(10) primary key,
	nama varchar(200) not null,
	sks int not null
)

--DML
-- menambah data
insert into mata_kuliah values('MK0001', 'Sistem Basis Data', 3);
insert into mata_kuliah values('MK0002', 'Application Development', 3);
-- menampilkan data
select * from mata_kuliah;
-- menampilkan data yang ada huruf s dan a
select * from mata_kuliah where nama like '%s%a%';
