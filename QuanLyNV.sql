
CREATE DATABASE	QuanLyNhanVien
USE QuanLyNhanVien

CREATE TABLE NhanVien
(
	MaNV nchar(8),
	HoTen nvarchar(50),
	GioiTinh nchar(5),
	NgaySinh date,
	QueQuan nvarchar(50),
	SDT varchar(10),

	MaCV nchar(8),
	MaPB nchar(8),
	MaTDHV nchar(8),
	BacLuong int,
	MaHD nchar(8)


	CONSTRAINT PK_NhanVien primary key(MaNV)
)

CREATE TABLE PhongBan
(
	MaPB nchar(8),
	TenPB nvarchar(50),
	sdtPB nchar(11)

	CONSTRAINT PK_PhongBan primary key(MaPB)
)

CREATE TABLE ChucVu
(
	MaCV nchar(8),
	TenCV nvarchar(50)

	CONSTRAINT PK_ChucVu primary key(MaCV)

)

CREATE TABLE TrinhDoHocVan
(
	MaTDHV nchar(8),
	TenTDHV nvarchar(50)

	CONSTRAINT PK_TrinhDoHocVan primary key(MaTDHV)
	
)

CREATE TABLE Luong
(
	BacLuong int,
	LuongCB float,
	Thuong float

	CONSTRAINT PK_Luong primary key(BacLuong)
)

CREATE TABLE HDLD
(
	MaHD nchar(8),
	LoaiHD nvarchar(20),
	NgayBD date,
	NgayKT date,

	CONSTRAINT PK_HDLD primary key(MaHD)

)
--KHOA NGOAI 
ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_ChucVu FOREIGN KEY (MaCV) REFERENCES ChucVu(MaCV)

ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_PhongBan FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)

ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_TrinhDoHocVan FOREIGN KEY (MaTDHV) REFERENCES TrinhDoHocVan(MaTDHV)

ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_Luong FOREIGN KEY (BacLuong) REFERENCES Luong(BacLuong)

ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_HDLD FOREIGN KEY (MaHD) REFERENCES HDLD(MaHD)

--NHAP LIEU
--Chức Vụ
INSERT INTO ChucVu(MaCV, TenCV)
VALUES('CEO',N'giám đốc điều hành')
INSERT INTO ChucVu(MaCV, TenCV)
VALUES('TP',N'Trưởng Phòng')
INSERT INTO ChucVu(MaCV, TenCV)
VALUES('NV',N'Nhân Viên')
INSERT INTO ChucVu(MaCV, TenCV)
VALUES('TTS',N'Thực Tập Sinh')

---Phòng Ban

INSERT INTO PhongBan(MaPB, TenPB,sdtPB)
VALUES('HR',N'Nhân Sự','0838123456')
INSERT INTO PhongBan(MaPB, TenPB,sdtPB)
VALUES('IT',N'Công Nghệ Thông Tin','0832923466')
INSERT INTO PhongBan(MaPB, TenPB,sdtPB)
VALUES('MKT',N'Makerting','0838459456')
INSERT INTO PhongBan(MaPB, TenPB,sdtPB)
VALUES('KT',N'Kế Toán','0839023478')
INSERT INTO PhongBan(MaPB, TenPB,sdtPB)
VALUES('KD',N'Kinh Doanh','0838813006')

---Trình Độ Học Vấn

INSERT INTO TrinhDoHocVan(MaTDHV, TenTDHV)
VALUES('CH',N'Cao học')
INSERT INTO TrinhDoHocVan(MaTDHV, TenTDHV)
VALUES('DH',N'Đại học')
INSERT INTO TrinhDoHocVan(MaTDHV, TenTDHV)
VALUES('CD',N'Cao đẳng')
INSERT INTO TrinhDoHocVan(MaTDHV, TenTDHV)
VALUES('PT',N'Phổ Thông')

---Bậc Lương

INSERT INTO Luong(BacLuong, LuongCB,Thuong)
VALUES(1,30000.000,3000.0)
INSERT INTO Luong(BacLuong, LuongCB,Thuong)
VALUES(2,20000.000,2000.0)
INSERT INTO Luong(BacLuong, LuongCB,Thuong)
VALUES(3,12000.000,1500.0)
INSERT INTO Luong(BacLuong, LuongCB,Thuong)
VALUES(4,7000.000,1000.0)
 
 ---Nhân Viên
insert into NhanVien Values('001',N'Nguyễn Hoài An',N'Nam','1999-02-15',N' TP.HCM',N'0912480190',NULL,NULL, NULL,NULL,NULL)
insert into NhanVien Values('002',N'Trần Trà Hương',N'Nữ','1998-06-20',N'Phú Yên',N'0912480674',NULL,NULL, NULL,NULL,NULL)
Insert into NhanVien Values('003',N'Nguyễn Ngọc Ánh',N'Nữ','1995-05-11',N'Bình Định',N'0915180184',NULL,NULL, NULL,NULL,NULL)
Insert into NhanVien Values('004',N'Trương Nam Sơn',N'Nam','2000-06-20',N'Lâm Đồng',N'0910980178',NULL,NULL, NULL,NULL,NULL)
Insert into NhanVien Values('005',N'Lý Hoàng Hà',N'Nam','2002-10-23',N'Khánh Hòa',N'0971080590',NULL,NULL, NULL,NULL,NULL)
Insert into NhanVien Values('006',N'Trần Bạch Tuyết',N'Nữ','2001-05-20',N'Đà Nẵng',N'0915285100',NULL,NULL, NULL,NULL,NULL)
Insert into NhanVien Values('007',N'Nguyễn Thiên Thư',N'Nam','1996-06-20',N'Bình Dương',N'0910280316',NULL,NULL, NULL,NULL,NULL)
Insert into NhanVien Values('008',N'Huỳnh Duy Hưng',N'Nam','1989-10-23',N'TP.HCM',N'0902780120',NULL,NULL, NULL,NULL,NULL)
Insert into NhanVien Values('009',N'Lê Phương Anh',N'Nữ','1991-05-20',N'Đồng Nai',N'0912492056',NULL,NULL, NULL,NULL,NULL)

--xóa bảng
DROP TABLE NhanVien
--xóa key chính
ALTER TABLE NhanVien
DROP  CONSTRAINT PK_MaNV

--xóa key ngoại
ALTER TABLE NhanVien
DROP  CONSTRAINT FK_NhanVien_ChucVu
ALTER TABLE NhanVien
DROP  CONSTRAINT FK_NhanVien_PhongBan
ALTER TABLE NhanVien
DROP  CONSTRAINT FK_NhanVien_TrinhDoHocVan
ALTER TABLE NhanVien
DROP  CONSTRAINT FK_NhanVien_Luong

---Hợp đồng lao động

INSERT INTO HDLD(MaHD, LoaiHD, NgayBD, NgayKT)
VALUES('NH',N'Ngắn hạn','2023-02-21', '2026-02-21')
INSERT INTO HDLD(MaHD, LoaiHD, NgayBD, NgayKT)
VALUES('DH',N'Dài hạn','2023-09-22', '2030-09-22')
INSERT INTO HDLD(MaHD, LoaiHD, NgayBD, NgayKT)
VALUES('HV',N'HĐ Cho TTS','2023-02-21', '2023-05-21')

--UPDATE

UPDATE NhanVien SET MaCV = 'NV', MaPB = 'HR', MaTDHV = 'DH', BacLuong = 3, MaHD = 'NH'  WHERE MaNV = '001'
UPDATE NhanVien SET MaCV = 'NV', MaPB = 'IT', MaTDHV = 'DH', BacLuong = 3, MaHD = 'NH'  WHERE MaNV = '002'
UPDATE NhanVien SET MaCV = 'TP', MaPB = 'HR', MaTDHV = 'CH', BacLuong = 2, MaHD = 'DH' WHERE MaNV = '003'
UPDATE NhanVien SET MaCV = 'NV', MaPB = 'MKT', MaTDHV = 'DH', BacLuong = 3, MaHD = 'DH'  WHERE MaNV = '004'
UPDATE NhanVien SET MaCV = 'TTS', MaPB = 'HR', MaTDHV = 'PT', BacLuong = 4, MaHD = 'HV'  WHERE MaNV = '005'
UPDATE NhanVien SET MaCV = 'NV', MaPB = 'KD', MaTDHV = 'CD', BacLuong = 3, MaHD = 'NH'  WHERE MaNV = '006'
UPDATE NhanVien SET MaCV = 'TP', MaPB = 'KD', MaTDHV = 'CH', BacLuong = 2, MaHD = 'DH' WHERE MaNV = '007'
UPDATE NhanVien SET MaCV = 'CEO', MaPB = NULL, MaTDHV = 'CH', BacLuong = 1, MaHD = 'DH'  WHERE MaNV = '008'
UPDATE NhanVien SET MaCV = 'TP', MaPB = 'IT', MaTDHV = 'CH', BacLuong = 2, MaHD = 'DH'  WHERE MaNV = '009'

----THÊM THÔNG TIN NHÂN VIÊN MỚI 

Insert into NhanVien Values('010',N'Nguyễn Huỳnh Anh',N'Nam','1995-12-23',N'Khánh Hòa',N'0974378990','TP','KT', 'CH',2,'DH')
Insert into NhanVien Values('011',N'Huỳnh Anh Thư',N'Nữ','2000-05-29',N'Gia Lai',N'0989288426','NV','KT', 'DH',3,'NH')

----Xóa nhân viên khi hết hợp đồng
DELETE
FROM NhanVien
WHERE MaNV = '005'
