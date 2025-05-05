# Hướng dẫn cài môi trường để làm việc với file markdown và planuml

Hệ thống SECOND-BRAIN documentation được xây dựng dựa trên opensource [mkdocs-material](https://squidfunk.github.io/mkdocs-material/)
Đây là một hệ thống web rất mạnh được sử dụng để xây dựng documentation portal được viết bằng `python` với định dạng tài liệu sử dụng là `markdown` và có hỗ trợ hàng loạt các tính năng hữu ích như:

- Convert sang html (dạng file tĩnh và không cần host)
- Hỗ trợ gắn thẻ cho tài liệu
- Hỗ trợ docker
- Hỗ trợ theme
- Hỗ trợ tìm kiếm theo nội dung tài liệu
- Hỗ trợ blog
- Hỗ trợ đa ngôn ngữ
- Hỗ trợ cá nhân hóa toàn phần
- Rất nhiều 3rd plugins
- Hỗ trợ nhúng và hiển thị [plantuml](https://plantuml.com/)
- [Và hàng loạt các tính năng khác](https://squidfunk.github.io/mkdocs-material/plugins/)

Có rất nhiều phần mềm để tạo `markdown` và `plantuml`. Tuy nhiên trong tài liệu này hướng dấn sử dụng `Visual Studio Code`.

### 1. Cài đặt `Visual Studio Code`

[Link cài đặt VS Code](https://code.visualstudio.com/)

### 2. Cài đặt plugin cho VS Code cho phép `Preview` tài liệu markdown

Mở VS code, bấm tổ hợp phím `Ctrl` + `Shift` + `X` để mở `Extensions`.

Tìm kiếm và cài đặt các extensions sau:

- DavidAnson.vscode-markdownlint

Khi cài đặt xong có thể sẽ không gõ được tiếng Việt trong tài liệu `markdown`, hãy làm như sau:

- Gõ tổ hợp phím `Ctrl` + `Shift` + `P` để mở Shortcut settings
- Tìm từ khóa `onBackspaceKey`. Chuột phải vào và chọn `Remove Keybiding`.

![Remove Keybiding](/assets/images/guides/remove-keybinding.png)

### 3. Cài đặt plugin cho VS Code cho phép `preview` `planuml`

Mở VS code, bấm tổ hợp phím `Ctrl` + `Shift` + `X` để mở `Extensions`.

Tìm kiếm và cài đặt các extensions sau:

- clysto.plantuml
- jebbs.plantuml
- qhoekman.language-plantuml
- well-ar.plantuml
