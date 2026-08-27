<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Sửa danh mục</title>

</head>

<body>

<h1>Chỉnh sửa danh mục</h1>

<c:if test="${not empty error}">
    <p style="color: red;"><c:out value="${error}"/></p>
</c:if>

<form
        action="${pageContext.request.contextPath}/admin/category/edit"
        method="post"
        enctype="multipart/form-data">

    <input
            type="hidden"
            name="id"
            value="${category.id}">

    <div>

        <label>
            Tên danh mục:
        </label>

        <input
                type="text"
                name="name"
                value="${category.name}"
                required>

    </div>

    <br>

    <c:if test="${not empty category.icon}">

        <c:url
                value="/image"
                var="imgUrl">

            <c:param
                    name="fname"
                    value="${category.icon}"/>

        </c:url>

        <img
                src="${imgUrl}"
                width="150"
                alt="category">

    </c:if>

    <br><br>

    <div>

        <label>
            Chọn ảnh mới:
        </label>

        <input
                type="file"
                name="icon"
                accept="image/png,image/jpeg,image/gif,image/webp">

    </div>

    <br>

    <button type="submit">
        Sửa
    </button>

    <button type="reset">
        Reset
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/admin/category/list">
    Quay lại
</a>

</body>

</html>
