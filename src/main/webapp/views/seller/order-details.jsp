<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
        <style>
          #example_wrapper {
            width: 100% !important;
            font-size: 1.3rem;
          }

          #example>thead>tr>th {
            vertical-align: middle;
            text-align: center;
          }

          #example>tbody>tr>td,
          th {
            vertical-align: middle;
            text-align: center;
            font-size: 1.5rem !important;
          }

          .page-item.active .page-link {
            z-index: 1;
            color: #fff;
            background-color: coral !important;
            border-color: coral !important;
          }

          #example>tbody>tr>td>a {
            text-decoration: none !important;
            color: gray;
          }

          #example>tbody>tr>td>a:hover {
            color: coral;
          }

          .order-infor {
            display: block;
            width: 100%;
            margin: 1rem 0rem 0rem 0rem;
            font-size: 1.4rem;
            line-height: 2.3rem;
          }
          .order-infor span {
            text-transform: none;          
          }
        </style>
        <!-- body starts -->
        <div class="col">
          <div class="row">
            <!--Product in category starts-->
            <section class="list-cate" id="" style="padding-top: 0; padding-left: 0; padding-right: 0">
              <div class="box-container">
                <div class="xMDeox">
                  <div style="padding: 1.875rem 0.625rem">
                    <div class="Q5feZb">
                      <h1 class="OomjNA">Chi tiết đơn hàng</h1>
                      <div class="order-infor">
                        <span><strong>Ngày tạo đơn hàng:</strong> <fmt:formatDate value="${order.createdAt }" pattern="dd-MM-yyyy hh:mm:ss"/> </span>
                        <br>
                        <span><strong>Được đặt bởi:</strong> ${order.user.firstName } ${order.user.lastName}(${order.user.email })</span>
                        <br>
                        <span><strong>Giá trị đơn hàng:</strong> <fmt:formatNumber type="number" maxFractionDigits="2" value="${order.amountFromUser }"/> đ</span>
                      </div>
                    </div>
                    <div class="+eqaLN">
                      <table id="example" class="table table-striped" style="width: 100%">
                        <thead>
                          <tr>
                            <th>Mã sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá tiền</th>
                            <th>Số lượng</th>
                            <th>Số lượng tồn</th>
                            <th>Tổng tiền</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="oi" items="${order.orderItems }">
                            <tr>
                              <td>${oi.product.productId }</td>
                              <td>
                                <c:if test="${fn:startsWith(oi.product.image, 'http')}">
                                  <img alt="" src="${oi.product.image }" width="100rem">
                                </c:if>
                                <c:if test="${!fn:startsWith(oi.product.image, 'http')}">
                                  <img alt="" src="../image?fileFolder=Products&fname=${oi.product.image }" width="100rem">
                                </c:if>
                              </td>
                              <td>
                                <a href="../product-details?productId=${oi.product.productId }">
                                  ${oi.product.name }
                                </a>
                              </td>
                              <td>
                                <fmt:formatNumber value="${oi.product.price }" maxFractionDigits="2" type="number">
                                </fmt:formatNumber>đ
                              </td>
                              <td>${oi.count}</td>
                              <td>${oi.product.quantity}</td>
                              <td><fmt:formatNumber value="${oi.count * oi.product.price}" maxFractionDigits="2" type="number">
                                </fmt:formatNumber>đ</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      <c:if test="${order.status == 1 }">
                      	<div style="display: flex; justify-content: flex-end; width: 100%;">
                        	<a  href="/seller/order-complete?orderId=${order.orderId }" class="btn-buy" style="color: white; text-decoration: none">Giao hàng</a>
                      	</div>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>
            </section>
            <!--Product in category starts-->
          </div>
        </div>
        <!-- body ends -->

        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
          $(document).ready(function () {
            $("#example").DataTable({
              lengthMenu: [5, 10, 20, 30, 50, 100]
            });
          });
        </script>