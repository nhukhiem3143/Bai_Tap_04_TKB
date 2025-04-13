# Bài tập 4 : Hệ Thống Quản Lý Thời Khoá Biểu 
# Yêu cầu bài toán :
 - Tạo csdl cho hệ thống TKB (đã nghe giảng, đã xem cách làm)
 - Nguồn dữ liệu: TMS.tnut.edu.vn
 - Tạo các bảng tuỳ ý (3nf)
 - Tạo được query truy vấn ra thông tin gồm 4 cột: họ tên gv, môn dạy, giờ vào lớp, giờ ra.
### Trả lời câu hỏi : Trong khoảng thời gian từ datetime1 tới datetime2 thì có những gv nào đang bận giảng dạy.

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
* Ta có thể tạo các bảng sau :
* GiangVien(#MaGV, HoTen)
* MonHoc(#MaMon, TenMon)
* LopHocPhan(#MaLHP, @MaMon, @MaGV)
* ThoiKhoaBieu(#STT, @MaLHP, Thu, TietBatDau, SoTiet, GioVao, GioRa, NgayHoc)
#### *Ta có thể truy vấn thành bảng gồm : Họ Tên GV, Môn Dạy, Giờ Vào, Giờ Ra*
### 1. Bảng GiangVien
#### - MaGV (Pk)
![Screenshot 2025-04-13 201642](https://github.com/user-attachments/assets/4eef8999-1ede-49ab-98be-2a4835a31b55)

### 2. Bảng MonHoc
#### - MaMon (PK)
![Screenshot 2025-04-13 201305](https://github.com/user-attachments/assets/fcbf90b9-e623-4fd5-9c83-44740399f9d0)

### 3. Bảng LopHocPhan
#### - MaLHP (PK) ,MaGV (FK), MaMon (FK)
![Screenshot 2025-04-13 201619](https://github.com/user-attachments/assets/d51f23c6-4d55-47f2-a2e6-0cd9ef7b7706)

### 4. Bảng ThoiKhoaBieu
#### - STT (PK), MaLHP (PK)
![Screenshot 2025-04-13 201554](https://github.com/user-attachments/assets/f168c5fd-817c-479a-b26b-057dbec6f562)

#### - NgayHoc (CK) ( *từ 2000-01-01 - hiện tại* )

![Screenshot 2025-04-13 203314](https://github.com/user-attachments/assets/dbe85aaa-1879-4ddd-8575-815ae07b9672)

#### - SoTiet (CK) ( *1 <= sotiet <= 4* )

![Screenshot 2025-04-13 203322](https://github.com/user-attachments/assets/b5177127-eb2d-4b39-a07f-285123992fe3)

#### - TietBD (CK) ( *1 - 10* )
![Screenshot 2025-04-13 203327](https://github.com/user-attachments/assets/aa86d353-d366-46d7-be2b-682220c1f635)

#### - Thu (CK) ( *2 - 8(CN)* )
![Screenshot 2025-04-13 203333](https://github.com/user-attachments/assets/8ede5ccc-0fea-44e3-9c4c-eca500ecedbc)

#### - GioVao, GioRa (CK) ( *6:30 - 20:00* )
![Screenshot 2025-04-13 210711](https://github.com/user-attachments/assets/4cd21241-2d69-43b7-853f-ea948a3d1c60)
![Screenshot 2025-04-13 210717](https://github.com/user-attachments/assets/ac772a84-4bda-4133-ab78-57c500bd1469)

## 📥 Nhập dữ liệu từ Excel
*Dùng SSMS để copy dữ liệu từ Excel trực tiếp vào bảng*
![Screenshot 2025-04-13 230214](https://github.com/user-attachments/assets/8af7659d-726b-4a7d-8160-dc7335cb9c31)

## 🔍 Truy vấn giảng viên bận
```sql 
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

```
*Kết quả truy vấn danh sách giảng viên đang giảng dạy trong khoảng thời gian 2025-03-18 07:00:00 - 2025-03-18 08:00:00*
![Screenshot 2025-04-13 230100](https://github.com/user-attachments/assets/1ca1728d-4ae9-4c70-bb34-9b41c55704f5)

# The End
