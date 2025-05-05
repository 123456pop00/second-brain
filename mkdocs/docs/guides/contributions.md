# Hướng dẫn tạo tài liệu

- Clone repo về máy local 
- Cấu trúc làm việc hiện tại như sau:

```
├─  mkdocs.yml
│  
└─docs
    │  about.md
    │  contributions.md
    │  index.md
    │  
    ├─assets
    │  └─images
    │      │  logo.png
    │      │  
    │      └─common-errors
    │              version-of-an-assembly.png
    │              
    ├─blog
    │  │  index.md
    │  │  
    │  └─posts
    ├─common-errors
    │  │  others.md
    │  │  
    │  └─oracle
    │          index.md
    │          
    ├─database
    │      index.md
    │      
    ├─environments
    │      async-jobs.md
    │      oracle-database.md
    │      rocket-chat.md
    │      visual-studio.md
    │      vpn.md
    │      
    ├─examples
    │  ├─markdown
    │  │      cheat-sheet.md
    │  │      
    │  └─plantuml
    │          activity-diagram.md
    │          sequence-diagram.md
    │          use-case-diagram.md
    │          
    ├─functions
    │      index.md
    │      
    └─scenarios
            environments.md
            how-to-create.md
            how-to-run.md
            index.md
```

### Các bước tạo tài liệu

#### 1. Tạo một nhánh `git` mới tương ứng với chức năng muốn tạo tài liệu

#### 2. Tạo file `.md` hoặc chỉnh sửa nội dung của tài liệu. 

Ví dụ muốn chỉnh sửa file tài liệu của `async-jobs` trong mục `environments` thì tìm file `async-jobs.md` sau đó chỉnh sửa.

Hoặc muốn tạo tài liệu cho chức năng `RedLink` thì tạo mới file `red-link.md` trong folder `functions`

#### 3. Viết nội dung. 

- Về markdown và các biểu đồ

Tham khảo cheetsheet của [markdown](/examples/markdown/cheat-sheet) hoặc [plantuml](/examples/plantuml/sequence-diagram)

- Về hình ảnh. Để thêm hình ảnh vào tài liệu:

Copy ảnh vào folder `docs/assets/images` tương ứng với chức năng. Ví dụ đang làm chức năng `RedLink` thì hãy tạo 1 folder (nếu chưa có) `red-link` và dán ảnh vào thư mục đó.

Chỉ định link ảnh trong tài liệu. 

```
![How to attach an image to a document](/assets/images/red-link/lorem.png)
```

#### 4. Tạo `navigation` cho tài liệu vừa tạo

Di chuyển tới section `nav` trong file `mkdocs.yml`.
Tạo một nav tương ứng với tài liệu vừa tạo, hãy tham khảo các nav khác nếu cần thiết.

#### 5. Tạo MR để merge vào nhánh master

Hiện tại thì đang sử dụng cấu hình tự động cập nhật tài liệu bằng cách sử dụng `GitLab runner` trên nhánh `master`. Do đó hãy merge vào nhánh master.

**Have a nice day !!!**