<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- home section starts  -->

<section class="home" id="home">
    <div class="content">
        <h5>NEW ARRAIVALS</h5>
        <h3><span>Man's clother</span> Category</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<br>
            Aliquam libero nostrum veniam facere tempore nisi. Lorem ipsum dolor sit, amet consectetur adipisicing elit.</p>
    </div>

</section>

<!-- home section ends -->

<!-- category detail starts -->
<section class="sproduct" style="padding-top: 5rem;">
    <div class="box-container pb-2">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb" >
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Categories</a></li>
              <li class="breadcrumb-item active" aria-current="page">Data</li>
            </ol>
        </nav>
    </div>
    <div class="box-container w-10">
        <div class="row">
            <div class="col-12 col-sm-3">
                <!--Danh mục category starts-->
                <div class="card bg-light mb-1" >
                    <div class="card-header text-white text-uppercase" style="background-color: black; font-size: 18px;"><i class="fa fa-list"></i> Categories</div>
                    <ul class="list-group category_block">
                        <li class="list-group-item" style="font-size: 1.7rem; height: 4.25rem;"><a href="" class="a-cate-detai">Men clother</a></li>
                        <li class="list-group-item" style="font-size: 1.7rem;"><a href="" class="a-cate-detai">Woman clother</a></li>
                    </c:forEach>
                    </ul>
                </div>
                <!--Danh mục category ends-->

                <div class="card bg-light mb-3 mt-5">
                    <div class="card-header text-white text-uppercase" style="background-color: black; font-size: 18px;">Last product</div>
                    <div class="card-body" style="background-color: white;">
                        <img class="img-last-product" src="https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-starlight-1-600x600.jpg"alt="Card image cap">
                        <h5 class="heading1" style="font-size: 2rem;">iphone 13 starlight</h5>
                        <p class="card-text" style="font-size: 1.2rem;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque architecto nostrum facilis, quasi debitis iusto.</p>
                        <p class="bloc_left_price price" style="text-align: center;">13.999.000đ</p>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row">
                    <!--Product in category starts-->
                        <section class="list-cate" id="" style="padding-top: 0; padding-left: 2rem; padding-right: 2rem;">
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
                    <!--Product in category starts-->

                    <!--Phân trang starts-->
                    <div class="col-12">
                        <nav aria-label="...">
                            <ul class="pagination mt-5">
                                <li class="page-item disabled">
                                    <span class="page-link">Previous</span>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item" aria-current="page">
                                    <a class="page-link">2</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!--Phân trang starts-->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- category detail ends -->