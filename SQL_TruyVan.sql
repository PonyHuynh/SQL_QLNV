USE QuanLyNhanVien
GO

--Q1: Cho biết các nhân viên có trình độ học vấn là cao học
SELECT *
FROM NhanVien 
WHERE NhanVien.MaTDHV LIKE 'CH%'

--Q2: Với mỗi phòng ban, cho biết số lượng nhân viên của phòng ban đó
SELECT PB.TenPB,(SELECT COUNT(*)
					FROM NhanVien NV
					WHERE NV.MaPB = PB.MaPB)
FROM PhongBan PB	

--Q3: nv có bậc lương cao nhất
SELECT HoTen,MaCV,  BacLuong
FROM NhanVien NV1
WHERE( SELECT COUNT (*)
		FROM NhanVien NV2
		WHERE NV2.BacLuong < NV1.BacLuong) = 0

--Q4: Cho biết lương cơ bản của các nhân viên có chức vụ là trưởng phòng
SELECT NV.HoTen,NV.MaCV, Luong.LuongCB
FROM NhanVien NV
INNER JOIN Luong ON NV.BacLuong = Luong.BacLuong
WHERE NV.MaCV = 'TP'

--Q5: Liệt kê danh sách nhân viên ở phòng ban HR
SELECT NV.MaNV,  NV.HoTen
FROM NhanVien NV 
WHERE NV.MaPB = 'HR'

--Q6: Cho biết ngày bắt đầu làm việc và kết thúc của các nhân viên phòng IT
SELECT NV.HoTen,NV.MaPB, HDLD.NgayBD, HDLD.NgayKT
FROM NhanVien NV
INNER JOIN HDLD ON NV.MaHD = HDLD.MaHD
WHERE NV.MaPB = 'IT'
