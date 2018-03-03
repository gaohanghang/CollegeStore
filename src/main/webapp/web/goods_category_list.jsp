<%@ page language="java" 
	contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>测试显示商品分类</title>
</head>
<body>
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>id</th>
			<th>parent_id</th>
			<th>name</th>
			<th>status</th>
			<th>sort_order</th>
			<th>is_parent</th>
			<th>created_time</th>
			<th>created_user</th>
			<th>modified_time</th>
			<th>modified_user</th>
		</tr>
		<c:forEach items="${data}" var="category">
		<tr>
			<td>${category.id }</td>
			<td>${category.parentId }</td>
			<td>${category.name }</td>
			<td>${category.status }</td>
			<td>${category.sortOrder }</td>
			<td>${category.isParent }</td>
			<td>${category.createdTime }</td>
			<td>${category.createdUser }</td>
			<td>${category.modifiedTime }</td>
			<td>${category.modifiedUser }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>