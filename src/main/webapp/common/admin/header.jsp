<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header section starts  -->

<header class="header">
	<a href="#" class="logo"> <i class="fas fa-shopping-basket"></i>
		HCMUTE
	</a>

	<nav class="navbar">
		<a href='<c:url value="/admin/home" />'>home</a> <a
			href="<c:url value="#" />">none</a> <a href="#review">review</a> <a
			href="#contact">contact</a>
	</nav>

	<form action="" class="search-form">
		<input type="search" id="search-box" placeholder="Search here..." />
		<label for="search-box" class="fas fa-search"></label>
	</form>

	<div class="icons">
		<div class="fas fa-bars" id="menu-btn"></div>
		<div class="fas fa-shopping-cart" id="cart-btn"></div>
		<c:if test="${userName == null }">
			<a href="<c:url value="/dang-nhap" />">
				<div class="fas fa-sign-in-alt" " id="login-btn"></div>
			</a>
		</c:if>
		<c:if test="${userName != null }">
			<a href="<c:url value="/profile" />">
				<div class="fas fa-user" id="login-btn"></div>
			</a>
			<a href="<c:url value="/dang-xuat" />">
				<div class="fas fa-sign-out-alt"></div>
			</a>
		</c:if>
	</div>
</header>

<!-- header section ends -->