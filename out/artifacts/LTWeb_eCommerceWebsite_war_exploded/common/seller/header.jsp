<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header section starts  -->

<header class="header">
	<a href="#" class="logo"> <i class="fas fa-shopping-basket"></i>
		HCMUTE
	</a>

	<nav class="navbar">
		<a href='<c:url value="/home" />'>home</a> <a
			href="<c:url value="/categories" />">categories</a> <a
			href="<c:url value="/products" />">products</a> 
		<a href="<c:url value="/contact" />">contact</a>
		<a href="<c:url value="/seller/home" />">seller's page</a>
	</nav>

	<c:url value="/search-product" var="searchURL"></c:url>
	<form action="${searchURL }" class="search-form">
		<input type="search" id="search-box" name="search-text" placeholder="Search here..." value="${searchText }" />
		<input type="submit" id="btn-search-123" hidden="" >
		<label for="btn-search-123" class="fas fa-search"></label>
	</form>

	<div class="icons">
		<div class="fas fa-bars" id="menu-btn"></div>
		<a href="<c:url value="/cart" />">
			<div class="fas fa-shopping-cart" id="cart-btn"></div>
		</a>
		<c:if test="${userName == null }">
			<a href="<c:url value="/dang-nhap" />">
				<div class="fas fa-sign-in-alt"" id="login-btn"></div>
			</a>
		</c:if>
		<c:if test="${userName != null }">
			<a href="<c:url value="/profile" />">
				<div class="fas fa-user" id="login-btn"></div>
			</a>
			<a href="<c:url value="/dang-xuat" />">
				<div class="fas fa-sign-out-alt" ></div>
			</a>
		</c:if>
	</div>
</header>

<!-- header section ends -->