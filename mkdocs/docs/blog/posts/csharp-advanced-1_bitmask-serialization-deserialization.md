---
date: 2025-04-11
authors: [ductv]
title: Bitmask, Serialization/Deserialization trong C\#
description: >
  Giới thiệu cơ bản về kĩ thuật Bitmask, Serialization/Deserialization trong C\#,
  So sánh một vài format dữ liệu phổ biến: Xml, Json, Protocol Buffers, MessagePack
slug: bitmask-serialization-deserialization
categories:
  - Technical
  - C# advanced series
tags:
  - blog
---

# Bitmask, Serialization/Deserialization trong C\#

Dưới lớp vỏ đơn giản của C# là những kỹ thuật tinh gọn nhưng mạnh mẽ.
Bitmask giúp quản lý trạng thái chỉ với vài bit, còn serialization là cây cầu giữa bộ nhớ và thế giới bên ngoài.
Bài viết này là một cái nhìn ngắn gọn, súc tích — nhưng đủ sâu — để bạn hiểu và dùng chúng hiệu quả.
