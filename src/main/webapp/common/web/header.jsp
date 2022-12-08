<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header section starts  -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

<!-- custom css file link  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/style.css" />
<header class="header">
	<a href="#" class="logo"> <i class="fas fa-shopping-basket"></i>
		HCMUTE
	</a>

	<nav class="navbar">
		<a href='<c:url value="/home" />'>home</a> <a
			href="<c:url value="/categories" />">categories</a> <a
			href="<c:url value="/products" />">products</a> <a href="#review">review</a>
		<a href="#contact">contact</a>
	</nav>

	<form action="" class="search-form">
		<input type="search" id="search-box" placeholder="Search here..." />
		<label for="search-box" class="fas fa-search"></label>
	</form>

	<div class="icons">
		<div class="fas fa-bars" id="menu-btn"></div>
		<div class="fas fa-shopping-cart" id="cart-btn"></div>
		<a href="<c:url value="/dang-nhap" />">
			<div class="fas fa-user" id="login-btn"></div>
		</a>

	</div>
</header>

<!-- header section ends -->