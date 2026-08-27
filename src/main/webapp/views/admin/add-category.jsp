<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Thêm danh mục</title>

</head>

<body>

<h1>Thêm danh mục</h1>

<c:if test="${not empty error}">
    <p style="color: red;"><c:out value="${error}"/></p>
</c:if>

<form
        action="${pageContext.request.contextPath}/admin/category/add"
        method="post"
        enctype="multipart/form-data">

    <div>

        <label>
            Tên danh mục:
        </label>

        <input
                type="text"
                name="name"
                value="<c:out value='${enteredName}'/>"
                required>

    </div>

    <br>

    <div>

        <label>
            Ảnh đại diện:
        </label>

        <input
                type="file"
                name="icon"
                accept="image/png,image/jpeg,image/gif,image/webp">

    </div>

    <br>

    <button type="submit">
        Thêm
    </button>

    <button type="reset">
        Hủy
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/admin/category/list">
    Quay lại
</a>

</body>

</html>
