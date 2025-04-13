# Bài tập 4 : Hệ Thống Quản Lý Thời Khoá Biểu 
# Yêu cầu bài toán :
 - Tạo csdl cho hệ thống TKB (đã nghe giảng, đã xem cách làm)
 - Nguồn dữ liệu: TMS.tnut.edu.vn
 - Tạo các bảng tuỳ ý (3nf)
 - Tạo được query truy vấn ra thông tin gồm 4 cột: họ tên gv, môn dạy, giờ vào lớp, giờ ra.
### Trả lời câu hỏi : trong khoảng thời gian từ datetime1 tới datetime2 thì có những gv nào đang bận giảng dạy.

# Các bước thực hiện :
1. Tạo github repo mới : đặt tên tuỳ ý (có liên quan đến bài tập này)
2. Tạo file readme.md, edit online nó:
   - paste những ảnh chụp màn hình
   - gõ text mô tả cho ảnh đó

## *Gợi ý :*
- *Sử dung tms => dữ liệu thô => tiền xử lý => dữ liệu như ý (3nf)*
- *Tạo các bảng với struct phù hợp*
- *Insert nhiều rows từ excel vào cửa sổ edit dữ liệu 1 table (quan sát thì sẽ làm đc)*
  
## 🎯 Mục Tiêu
Thiết kế CSDL đạt chuẩn 3NF để quản lý thời khoá biểu giảng viên và truy vấn các giảng viên đang bận giảng dạy trong một khoảng thời gian cụ thể.

## 🛠 Thiết Kế Cơ Sở Dữ Liệu
*Cấu trúc bảng được tạo theo chuẩn 3NF*
### 1. Bảng GiangVien

### 2. Bảng MonHoc

### 3. Bảng LopHocPhan

## 📥 Nhập dữ liệu từ Excel
*Dùng SSMS để copy dữ liệu từ Excel trực tiếp vào bảng*

## 🔍 Truy vấn giảng viên bận
```sql 
DECLARE @datetime1 DATETIME = '2025-04-13 08:00:00';
DECLARE @datetime2 DATETIME = '2025-04-13 10:00:00';

SELECT 
    GV.HoTen,
    MH.TenMon,
    TKB.GioVao,
    TKB.GioRa
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
```
*Kết quả truy vấn danh sách giảng viên đang giảng dạy trong khoảng thời gian*
