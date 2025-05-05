### **I. General conventions**

- [ ] 1. Cài đặt `endline` mode của editor về `CRLF`, căn lề đầu dòng sử dụng tabs.
- [ ] 2. Một dòng không nên vượt quá 120 kí tự.
- [ ] 3. Mỗi file chỉ nên chứa một class.
- [ ] 4. Source code thay đổi không được chứa `warning`.
- [ ] 5. Hạn chế sử dụng TODO.
  > - Nếu cần TODO, comment rõ tình trạng và lý do để dễ đối ứng sau này.  
- [ ] 6. Mỗi member trong class cách nhau chính xác 1 dòng trống.
- [ ] 7. Không sử dụng các `Obsolete` members.
  > - Nếu bắt buộc sử dụng thì phải comment rõ lý do.  

### **II. Naming conventions**

- [ ] 8. Phân biệt chữ viết hoa/thường:
  > - **_camelCase**: Tên field.
  > - **camelCase**: Tên variable, parameter.  
  > - **UPPER_CASE**: Tên const, static readonly.  
  > - **PascalCase**: Các đối tượng còn lại. 
- [ ] 9. Tên ngắn gọn, dễ hiểu, đúng ngữ cảnh:
  > - **Class:** Tên thể hiện đối tượng gì trong hệ thống.  
  > - **Method:** Tên thể hiện phương thức làm gì, phục vụ ai.  
  > - **Variable:** Tên thể hiện rõ ý nghĩa trong logic xử lý, đặc biệt với business code.  
- [ ] 10. Tên rõ ràng và đúng ngữ pháp tiếng Anh:
  > - Đặt tên biến dạng số nhiều nếu biến là kiểu danh sách (`List`, `IEnumerable`, `Array`, ...).  
  > - Không viết tắt quá mức, sử dụng từ vựng chính xác để tránh gây khó hiểu.  
- [ ] 11. Sử dụng từ ngữ chính xác trong ngữ cảnh:
  > - Phân biệt `Validate` (xác thực) và `Check` (kiểm tra).  
  > - Kiểm tra và đổi tên method khi nội dung method thay đổi.  
- [ ] 12. Sử dụng `prefix` hoặc `suffix` phù hợp (ví dụ: `I` cho interface, `Base` cho class cơ sở hoặc các phương thức hoặc hàm bất đồng bộ phải có hậu tố `Async` và ngược lại).

---

### **III. Coding styles**

- [ ] 13. Ưu tiên sử dụng `var` thay cho kiểu dữ liệu tường minh.
- [ ] 14. Sử dụng dấu ngoặc `{}` và xuống dòng cho mọi điều kiện `if` và `method` hoặc `function`.
- [ ] 15. Biểu thức có từ 3 điều kiện trở lên thì xuống dòng cho mỗi điều kiện (bao gồm lambda và các biểu thức điều kiện như `while`, `if`, ... )
- [ ] 16. Nếu phương thức hoặc hàm có 3 tham số trở lên thì xuống dòng cho mỗi tham số.
- [ ] 17. Khi gọi extension methods, nếu gọi liên tục từ 3 methods trở lên hoặc câu lệnh đã quá dài thì xuống dòng cho mỗi lời gọi method.
- [ ] 18. Không sử dụng `expression-bodied` cho method ở bất kì trường hợp nào.
- [ ] 19. Chỉ sử dụng toán tử điều kiện `Ternary` cho giá trị cố định, không sử dụng cho lời gọi hàm.
- [ ] 20. Sử dụng `nameof` thay cho hardcode tên biến hoặc tên member.
- [ ] 21. Kiểm tra điều kiện và `return` sớm nhất có thể.

### **IV. Tuân thủ OOP và SOLID**

- [ ] 22. Khai báo sử dụng hợp lý Access Modifiers:
  > - Luôn để field ở `private`.  
  > - Ngoài ra cần tuân thủ tính kế thừa / truy cập để đặt access modifier.  
- [ ] 23. Khai báo và sử dụng hợp lý constant, readonly, static field/property:
  > - **`const`**: Hằng số chỉ sử dụng cho giá trị không thay đổi và dùng chung.  
  > - **`readonly`**: Biến chỉ khởi tạo một lần tại thời điểm khai báo hoặc trong constructor.  
  > - **`static`**: Chỉ dùng khi biến dùng chung cho nhiều đối tượng khác nhau trong hệ thống.  
- [ ] 24. Khai báo và sử properties hợp lý:
  > - Ưu tiên sử dụng auto-properties khi có thể.  
  > - Sử dụng `private set` hoặc `init` cho các properties chỉ đọc sau khi khởi tạo.  
  > - Phân biệt với `field`. Property sử được sử dụng như 1 API để cho các đối tượng khác ngoài class truy cập vào, còn field thì chỉ sử dụng trong class đó.  

---

### **V. Tuân Thủ Các Quy Tắc SECOND-BRAIN**

- [ ] 25. Xóa code không sử dụng:
  > - Xóa các `using` không cần thiết trong các file `.cs`.  
  > - Xóa file, class, method, property, biến không được sử dụng.  
  > - Xóa biến không sử dụng trong các method có sửa đổi.  
- [ ] 26. Xóa code không cần thiết:
  > - Không cần khởi tạo `null` cho biến kiểu reference type nếu không cần thiết.  
  > - Biến đã được validate đầu vào rồi thì không cần check `null` hoặc rỗng.  
  > - Xóa đoạn code không dùng, không được comment lại bằng `//`.  
- [ ] 27. Giải thích rõ ràng khi copy code từ nơi khác: nguồn gốc, mục đích.
- [ ] 28. Cân nhắc sử dụng `thread-safe collections` trong trường hợp đa luồng.
- [ ] 29. Không thay đổi source code mà không liên quan trực tiếp đến task đang đối ứng, kể cả việc xóa các đoạn code thừa.

---

### **VI. Hiệu Năng**

- [ ] 30. Sử dụng `String Interpolation` hoặc `StringBuilder` thay vì cộng chuỗi.
- [ ] 31. Dùng `OrdinalIgnoreCase` thay vì `InvariantCultureIgnoreCase` khi so sánh chuỗi.
- [ ] 32. Hạn chế số lượng **request** (tới DB) trong một xử lý.
- [ ] 33. Đánh dấu và giải thích **logic phức tạp hoặc magic number** bằng comment rõ ràng.
- [ ] 34. Tránh code bị lặp hoặc quá dài
  > - Tách code thành các method nhỏ, rõ ràng để tái sử dụng và dễ đọc.  
  > - Kiểm tra xem có sử dụng được source code đã có sẵn hay không.  
- [ ] 35. Xử lý dữ liệu:
  > - Trước khi `return` danh sách, sử dụng `ToList()` hoặc `ToArray()` để execute data.  
  > - Xử lý tuần tự theo `index` nên dùng `for`, hạn chế `foreach` nếu có yêu cầu rõ ràng về thứ tự.  
- [ ] 36. Hạn chế `return null`.
- [ ] 37. Sử dụng `throw` thay vì `throw ex` để giữ nguyên stack trace.
- [ ] 38. Sử dụng `using` để giải phóng unmanaged resources khi không còn sử dụng
- [ ] 39. Sử dụng `async/await` thay cho `Task.Wait()` hoặc `Task.Result` hoặc `Task.WaitAll()` để tránh block.

---

### **VII. Comment Code**

- [ ] 40. Comment đầy đủ cho tất cả các đối tượng (riêng đối với field thì tùy chọn):
  > - Đầu các classes, methods, interfaces, properties, ... (các members mà có thể access từ đối tượng khác) - sử dụng XML comments  
  > - Các đoạn logic phức tạp.  
  > - Nội dung comment đúng ngữ cảnh sử dụng, thể hiện rõ ý tưởng.  
