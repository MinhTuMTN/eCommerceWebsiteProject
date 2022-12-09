<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- product detail starts -->
<section class="sproduct">
    <div class="box-container pb-2">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb" >
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Library</a></li>
              <li class="breadcrumb-item active" aria-current="page">Data</li>
            </ol>
        </nav>
    </div>
    <div class="box-container">
        <div class="row">
            <div class="col-lg-5 col-md-12 col-12">
                <img class="img-product" src="https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-bac-thumb-600x600.jpg" alt="">
            </div>

            <div class="col-lg-6 col-md-12 col-12">
                <h3 class="py-4 heading-product-detail">${product.name }</h3>
                <h2 class="price"><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${product.price}" />đ</h2>
                <span style="font-size:20px; padding-right: 25px;">Quantity :</span>
                <input type="number" value="1" min="1" id="quantity">
                
                <h2 class="mt-5 mb-2" style="font: size 30px;">Product Details</h2>
                <span style="font-size: 12px;">${product.description }</span>
                <br>
                <button class="btn-buy" onclick="addToCart()">Add To Cart</button>

            </div>
        </div>
    </div>
    <div class="box-container pt-10">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb" style="height:45px;">
            </ol>
        </nav>
    </div>
</section>
<!-- product detail ends -->

<!-- Other product starts-->
<section class="list" id="" style="padding-top: 0;">

    <h1 class="heading">Some other <span>products</span></h1>

    <div class="box-container">

        <div class="box">
            <img src="https://cdn.tgdd.vn/Products/Images/42/289700/iphone-14-pro-max-vang-thumb-600x600.jpg" alt="">
            <a href=""><h3>iphone 14 pro max</h3></a>
            <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <strong>10.000.000đ</strong>
            <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
            <img src="https://cdn.tgdd.vn/Products/Images/42/267212/Samsung-Galaxy-S21-FE-vang-600x600.jpg" alt="">
            <a href=""><h3>Samsung Galaxy S21 FE</h3></a>
            <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <strong>10.000.000đ</strong>
            <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
            <img src="https://cdn.tgdd.vn/Products/Images/42/282901/oppo-reno8-z-5g-vang-thumb-2-600x600.jpg" alt="">
            <a href=""><h3>oppor reno8 z 5G</h3></a>
            <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <strong>10.000.000đ</strong>
            <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
            <img src="https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-trang-thumb-600x600.jpg" alt="">
            <a href=""><h3>samsung galaxy a33 5G</h3></a>
            <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <strong>10.000.000đ</strong>
            <a href="#" class="btn">Add to cart</a>
        </div>
    </div>

</section>
<!-- Other product ends-->
<c:url value="/addToCart?productId=${product.productId }" var="addToCartURL"></c:url>
<script type="text/javascript">

	function addToCart() {
		<c:set var="myVal" value="${addToCartURL}"/> 
		var quantity = document.getElementById("quantity").value;
		window.location.href = '${myVal}' + '&quantity=' + quantity;
	}
</script>