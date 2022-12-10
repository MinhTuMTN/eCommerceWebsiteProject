<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<%@include file="/common/taglib.jsp"%>
<c:url value="/views/images/shopping-basket-solid.svg" var="URL"></c:url>

<!DOCTYPE html>
<html>
<head>
<!-- Site meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>HCMUTE Shop</title>
<link rel="icon" href="${URL }" sizes="any" type="image/svg+xml">
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<!-- custom css file link  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/style.css" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<%@ include file="/common/seller/header.jsp"%>
<section class="sproduct" style="padding: 10rem 3rem 3rem 3rem;">
	<div class="box-container w-10">
		<div class="row">
			<%@ include file="/common/seller/left.jsp"%>
			<!-- body -->
			<dec:body />
			<!-- body -->
		</div>
	</div>
</section>
	<!--=== Footer v4 ===-->
	<jsp:include page="/common/seller/footer.jsp"></jsp:include>

	
</body>