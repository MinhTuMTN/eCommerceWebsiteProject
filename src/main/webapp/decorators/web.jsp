<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<%@include file="/common/taglib.jsp"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link
	href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" type="text/css">
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
<body>
	<%@ include file="/common/web/header.jsp"%>
	
	<!-- body -->
	<dec:body />
	<!-- body -->
	<!--=== Footer v4 ===-->
	<jsp:include page="/common/web/footer.jsp"></jsp:include>

	<!--=== End Footer v4 ===-->
	<script src="https://code.jquery.com/jquery-3.5.1.js"
	type="text/javascript"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$('.dropdown-toggle').dropdown()
	</script>
</body>