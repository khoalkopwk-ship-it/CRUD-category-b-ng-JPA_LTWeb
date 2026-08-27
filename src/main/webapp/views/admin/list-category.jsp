<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f5f5;
            color: #444;
        }

        /* ================= HEADER ================= */

        .header {
            height: 70px;
            background: #1597e5;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 35px;
        }

        .header .logo {
            font-size: 27px;
            font-weight: bold;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logout-btn {
            background: #f45145;
            color: white;
            padding: 10px 14px;
            text-decoration: none;
            border-radius: 2px;
        }

        .logout-btn:hover {
            background: #d93c32;
        }

        /* ================= LAYOUT ================= */

        .wrapper {
            display: flex;
            min-height: calc(100vh - 70px);
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 220px;
            background: #1597e5;
            color: white;
            flex-shrink: 0;
        }

        .profile {
            text-align: center;
            padding: 30px 10px 25px;
        }

        .avatar {
    width: 145px;
    height: 145px;

    margin: 0 auto 20px;

    border-radius: 50%;
    overflow: hidden;

    background: white;
    border: 4px solid white;
}

        .avatar img {
            width: 100%;
            height: 100%;

            object-fit: cover;

            object-position: center 20%;

            transform: scale(1.00);
        }

        .profile p {
            margin: 0;
            font-size: 14px;
        }

        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu li a {
            color: white;
            display: block;
            padding: 18px 18px;
            text-decoration: none;
            border-bottom: 1px solid rgba(255, 255, 255, 0.15);
            font-size: 14px;
        }

        .menu li a:hover {
            background: #087cc0;
        }

        .menu .dashboard {
            background: #ff1515;
        }

        .menu .category {
            background: #151515;
        }

        .submenu {
            background: #1597e5;
            padding-left: 15px;
        }

        .submenu a {
            padding: 12px 16px !important;
            font-size: 13px !important;
            border-left: 1px solid white;
        }

        .icon {
            margin-right: 10px;
            font-size: 22px;
            vertical-align: middle;
        }

        /* ================= CONTENT ================= */

        .content-wrapper {
            flex: 1;
            padding: 30px 28px;
        }

        .content {
            background: white;
            min-height: 650px;
            padding: 15px;
        }

        .page-title {
            color: red;
            font-weight: normal;
            font-size: 27px;
            margin: 10px 0 5px;
        }

        .description {
            font-size: 13px;
            margin-top: 0;
            margin-bottom: 30px;
        }

        hr {
            border: none;
            border-top: 1px solid #eee;
            margin-bottom: 20px;
        }

        /* ================= PANEL ================= */

        .panel {
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .panel-heading {
            padding: 14px;
            background: #f5f5f5;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        .panel-body {
            padding: 15px;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .toolbar-left,
        .toolbar-right {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .toolbar select {
            padding: 7px 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .toolbar input {
            height: 34px;
            width: 180px;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 5px 8px;
        }

        /* ================= TABLE ================= */

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            vertical-align: top;
        }

        th {
            text-align: left;
            background: #fafafa;
            font-weight: normal;
        }

        .stt-column {
            width: 70px;
        }

        .image-column {
            width: 370px;
        }

        .action-column {
            width: 170px;
        }

        .category-img {
            width: 120px;
            height: 120px;
            object-fit: contain;
            display: block;
            margin: 5px auto;
        }

        .no-image {
            width: 120px;
            height: 100px;
            background: #f5f5f5;
            margin: 5px auto;

            display: flex;
            align-items: center;
            justify-content: center;

            color: #aaa;
            font-size: 12px;
        }

        .action-link {
            color: #1597e5;
            text-decoration: none;
        }

        .action-link:hover {
            text-decoration: underline;
        }

        .add-btn {
            display: inline-block;
            margin-top: 20px;
            background: #1597e5;
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 3px;
        }

        .add-btn:hover {
            background: #087cc0;
        }

        /* responsive */

        @media (max-width: 900px) {
            .sidebar {
                width: 180px;
            }

            .image-column {
                width: 200px;
            }
        }
    </style>
</head>

<body>

<!-- ================= HEADER ================= -->

<div class="header">

    <div class="logo">
        Dashboard
    </div>

    <div class="header-right">

        <span>
            Xin chào <b>Admin</b>
        </span>

        <a href="#" class="logout-btn">
            Đăng xuất
        </a>

    </div>

</div>


<div class="wrapper">

    <!-- ================= SIDEBAR ================= -->

    <div class="sidebar">

        <div class="profile">

            <div class="avatar">
                <img
                    src="${pageContext.request.contextPath}/images/admin.png"
                    alt="Admin">
            </div>

            <p>Admin</p>

        </div>


        <ul class="menu">

            <li>
                <a href="#" class="dashboard">
                    <span class="icon">◉</span>
                    Dashboard
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/admin/category/list"
                   class="category">

                    <span class="icon">📁</span>
                    Quản lý Danh mục
                </a>
            </li>


            <li class="submenu">

                <a href="${pageContext.request.contextPath}/admin/category/add">
                    Thêm danh mục mới
                </a>

                <a href="${pageContext.request.contextPath}/admin/category/list">
                    Danh sách danh mục
                </a>

            </li>


            <li>
                <a href="#">
                    <span class="icon">🖥</span>
                    Quản lý sản phẩm
                </a>
            </li>


            <li>
                <a href="#">
                    <span class="icon">▦</span>
                    Quản lý tài khoản
                </a>
            </li>

        </ul>

    </div>


    <!-- ================= CONTENT ================= -->

    <div class="content-wrapper">

        <div class="content">

            <h1 class="page-title">
                Quản lý danh mục
            </h1>

            <p class="description">
                Nơi bạn có thể quản lý danh mục của mình
            </p>

            <hr>


            <div class="panel">

                <div class="panel-heading">
                    Danh sách danh mục
                </div>


                <div class="panel-body">

                    <!-- TOOLBAR -->

                    <div class="toolbar">

                        <div class="toolbar-left">

                            <select id="pageSize">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                            </select>

                            <span>records per page</span>

                        </div>


                        <form class="toolbar-right"
                              method="get"
                              action="${pageContext.request.contextPath}/admin/category/list">

                            <label for="searchInput">
                                Search:
                            </label>

                            <input
                                    type="text"
                                    id="searchInput"
                                    name="keyword"
                                    value="<c:out value='${keyword}'/>"
                                    placeholder="Nhập tên rồi Enter">

                        </form>

                    </div>


                    <!-- TABLE -->

                    <table id="categoryTable">

                        <thead>

                        <tr>

                            <th class="stt-column">
                                STT
                            </th>

                            <th class="image-column">
                                Hình ảnh
                            </th>

                            <th>
                                Tên danh mục
                            </th>

                            <th class="action-column">
                                Hành động
                            </th>

                        </tr>

                        </thead>


                        <tbody>

                        <c:forEach
                                items="${cateList}"
                                var="cate"
                                varStatus="STT">

                            <tr>

                                <!-- STT -->

                                <td>
                                    ${STT.index + 1}
                                </td>


                                <!-- HÌNH ẢNH -->

                                <td>

                                    <c:choose>

                                        <c:when test="${not empty cate.icon}">

                                            <c:url
                                                    value="/image"
                                                    var="imgUrl">

                                                <c:param
                                                        name="fname"
                                                        value="${cate.icon}"/>

                                            </c:url>


                                            <img
                                                    src="${imgUrl}"
                                                    class="category-img"
                                                    alt="${cate.name}">

                                        </c:when>


                                        <c:otherwise>

                                            <div class="no-image">
                                                Chưa có hình ảnh
                                            </div>

                                        </c:otherwise>

                                    </c:choose>

                                </td>


                                <!-- TÊN -->

                                <td class="category-name">
                                    ${cate.name}
                                </td>


                                <!-- ACTION -->

                                <td>

                                    <a
                                            class="action-link"
                                            href="<c:url value='/admin/category/edit?id=${cate.id}'/>">

                                        Sửa

                                    </a>

                                    |

                                    <a
                                            class="action-link"
                                            href="<c:url value='/admin/category/delete?id=${cate.id}'/>"
                                            onclick="return confirm('Bạn có chắc muốn xóa danh mục này?')">

                                        Xóa

                                    </a>

                                </td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>


                    <a
                            class="add-btn"
                            href="${pageContext.request.contextPath}/admin/category/add">

                        + Thêm danh mục mới

                    </a>

                </div>

            </div>

        </div>

    </div>

</div>


</body>
</html>
