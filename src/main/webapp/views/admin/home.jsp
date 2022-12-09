<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!-- home section starts  -->
<!-- Hiển thông báo -->
<c:if test="${message != null}">
	<div class="alert alert-primary" role="alert">
		<i>${message}</i>
	</div>
</c:if>
<!-- Hêt thông báo -->

<a href="<c:url value="/admin/user"/>">Quản lý người dùng</a>


