<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Footer -->
<!-- footer section starts  -->

    <section class="footer">
      <div class="box-container">
        <div class="box">
          <h3>HCMUTE <i class="fas fa-shopping-basket"></i></h3>
          <p>
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam,
            saepe.
          </p>
          <div class="share">
            <a href="#" class="fab fa-facebook-f"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-instagram"></a>
            <a href="#" class="fab fa-linkedin"></a>
          </div>
        </div>

        <div class="box">
          <h3>contact info</h3>
          <a href="#" class="links">
            <i class="fas fa-phone"></i> +111-222-3333
          </a>
          <a href="#" class="links" style="text-transform: none">
            <i class="fas fa-envelope" ></i> dhspkt@gmail.com
          </a>
          <a href="#" class="links">
            <i class="fas fa-map-marker-alt"></i>Số 1 Võ Văn Ngân, phường Linh
            Chiểu, Thủ Đức, Thành phố Hồ Chí Minh
          </a>
        </div>

        <div class="box">
          <h3>quick links</h3>
          <a href="<c:url value="/admin/home" />" class="links">
            <i class="fas fa-arrow-right"></i> home
          </a>
          <a href="<c:url value="#" />" class="links">
            <i class="fas fa-arrow-right"></i> none
          </a>
          
          <a href="#" class="links">
            <i class="fas fa-arrow-right"></i> review
          </a>
          <a href="#" class="links">
            <i class="fas fa-arrow-right"></i> contact
          </a>
        </div>
      </div>
    </section>

    <!-- footer section ends -->

    <!-- JS -->
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <script>
      let loginForm = document.querySelector(".login-form");

      document.querySelector("#login-btn").onclick = () => {
        loginForm.classList.toggle("active");
        searchForm.classList.remove("active");
        shoppingCart.classList.remove("active");
        navbar.classList.remove("active");
      };
    </script>
    <script
      src="//code.jquery.com/jquery-3.2.1.slim.min.js"
      type="text/javascript"
    ></script>
    <script
      src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      type="text/javascript"
    ></script>
    <script
      src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      type="text/javascript"
    ></script>
  </body>
</html>
