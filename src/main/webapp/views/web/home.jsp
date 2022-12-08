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
    <section class="home" id="home">
      <div class="content">
        <h5>NEW ARRAIVALS</h5>
        <h3><span>Best Price</span> This Year</h3>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit.<br />
          Aliquam libero nostrum veniam facere tempore nisi.
        </p>
        <a href="#" class="btn">Buy now</a>
      </div>
    </section>

    <!-- home section ends -->

    <section class="categories" id="categories">
      <div class="container">
        <div class="row">
          <div class="col">
            <div
              id="carouselExampleIndicators"
              class="carousel slide"
              data-ride="carousel"
            >
              <ol class="carousel-indicators">
                <li
                  data-target="#carouselExampleIndicators"
                  data-slide-to="0"
                  class="active"
                ></li>
                <li
                  data-target="#carouselExampleIndicators"
                  data-slide-to="1"
                ></li>
                <li
                  data-target="#carouselExampleIndicators"
                  data-slide-to="2"
                ></li>
              </ol>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img
                    class="d-block w-100"
                    src="./views/images/5f3df7c16d4f3a9b4e09f6044dd2c3c8.png"
                    alt="First slide"
                  />
                </div>
                <div class="carousel-item">
                  <img
                    class="d-block w-100"
                    src="./views/images/755ff398b5dc1b7696ae95b04260bd01.jpeg"
                    alt="Second slide"
                  />
                </div>
                <div class="carousel-item">
                  <img
                    class="d-block w-100"
                    src="./views/images/Shopee-25.2-Sale-cuoi-thang-don-luong-ve.jpg"
                    alt="Third slide"
                  />
                </div>
              </div>
              <a
                class="carousel-control-prev"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="prev"
              >
                <span
                  class="carousel-control-prev-icon"
                  aria-hidden="true"
                ></span>
                <span class="sr-only">Previous</span>
              </a>
              <a
                class="carousel-control-next"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="next"
              >
                <span
                  class="carousel-control-next-icon"
                  aria-hidden="true"
                ></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
          <div class="col-12 col-md-3">
            <div class="card">
              <div class="card-header bg-success text-white text-uppercase" style="font-size: 1.7rem ">
                <i class="fa fa-heart"></i> Top product
              </div>
              <img
                class="img-fluid border-0"
                src="https://cdn.tgdd.vn/Products/Images/42/285696/samsung-galaxy-z-flip4-5g-512gb-thumb-xanh-600x600.jpg"
                alt="Card image cap"
              />
              <div class="card-body">
                <h4 class="card-title text-center">
                  <a href="" title="View Product">Samsung Galaxy Z Flip4 5G</a>
                </h4>
                <div class="row">
                  <div class="col text-center">
                    <strong class="price-top">1.000.000 đ</strong>
                  </div>
                  <div class="col">
                    <a href="#" class="btn">Add to cart</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- last product starts  -->
    <section class="categories" id="categories">
      <h1 class="heading"><span>last</span> products</h1>

      <div class="box-container">
        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/289700/iphone-14-pro-max-vang-thumb-600x600.jpg"
            alt=""
          />
          <a href=""><h3>iphone 14 pro max</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/267212/Samsung-Galaxy-S21-FE-vang-600x600.jpg"
            alt=""
          />
          <a href=""><h3>Samsung Galaxy S21 FE</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/282901/oppo-reno8-z-5g-vang-thumb-2-600x600.jpg"
            alt=""
          />
          <a href=""><h3>oppor reno8 z 5G</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-trang-thumb-600x600.jpg"
            alt=""
          />
          <a href=""><h3>samsung galaxy a33 5G</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>
      </div>
    </section>

    <!--  last product ends -->

    <!-- last product starts  -->
    <section class="categories" id="categories">
      <h1 class="heading"><span>best</span> products</h1>

      <div class="box-container">
        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/289700/iphone-14-pro-max-vang-thumb-600x600.jpg"
            alt=""
          />
          <a href=""><h3>iphone 14 pro max</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/267212/Samsung-Galaxy-S21-FE-vang-600x600.jpg"
            alt=""
          />
          <a href=""><h3>Samsung Galaxy S21 FE</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/282901/oppo-reno8-z-5g-vang-thumb-2-600x600.jpg"
            alt=""
          />
          <a href=""><h3>oppor reno8 z 5G</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>

        <div class="box">
          <img
            src="https://cdn.tgdd.vn/Products/Images/42/246199/samsung-galaxy-a33-5g-trang-thumb-600x600.jpg"
            alt=""
          />
          <a href=""><h3>samsung galaxy a33 5G</h3></a>
          <p>
            Some quick example text to build on the card title and make up the
            bulk of the card's content.
          </p>
          <strong>10.000.000đ</strong>
          <a href="#" class="btn">Add to cart</a>
        </div>
      </div>
    </section>

    <!--  last product ends -->
