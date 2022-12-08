<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url value="/templates/" var="URL"></c:url>
<!DOCTYPE html>
<html>
<head>
<!-- Site meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Free Bootstrap 4 Ecommerce Template</title>
<!-- CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600"
	rel="stylesheet" type="text/css">
<link href="${URL}css/style.css" rel="stylesheet" type="text/css">
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/common/admin/header.jsp"%>
	<!-- body -->
	<dec:body />
	<!-- body -->
	<!--=== Footer v4 ===-->
	<jsp:include page="/common/admin/footer.jsp"></jsp:include>
	<!--=== End Footer v4 ===-->

	<!-- JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		type="text/javascript"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>