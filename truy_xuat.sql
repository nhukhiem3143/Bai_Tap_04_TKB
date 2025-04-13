DECLARE @datetime1 DATETIME = '2025-03-18 07:00:00';
DECLARE @datetime2 DATETIME = '2025-03-22 08:00:00';

SELECT 
    GV.HoTen [Họ Tên Giáo Viên],
    MH.TenMon [Môn Dạy],
    TKB.GioVao [Giờ Vào],
    TKB.GioRa [Giờ Ra]
FROM 
    ThoiKhoaBieu TKB
JOIN 
    LopHocPhan LHP ON TKB.MaLHP = LHP.MaLHP
JOIN 
    GiangVien GV ON LHP.MaGV = GV.MaGV
JOIN 
    MonHoc MH ON LHP.MaMon = MH.MaMon
WHERE 
    TKB.NgayHoc = CAST(@datetime1 AS DATE)
    AND TKB.GioVao < CAST(@datetime2 AS TIME)
    AND TKB.GioRa > CAST(@datetime1 AS TIME);
