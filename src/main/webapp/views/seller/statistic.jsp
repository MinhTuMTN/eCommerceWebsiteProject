<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
body>section.sproduct>div>div>div.row>div>div:nth-child(3)>div>div:nth-child(1)>div
	{
	font-size: 1.7rem;
	text-transform: none;
}
</style>
<!-- body starts -->
<div class="row" style="flex: 0.9;">
	<div class="col" style="display: flex; flex-direction: column;">
		<h1>Thống kê</h1>
		<div>
			<form action="" method="get">
				<div
					style="display: flex; flex-direction: row; justify-content: space-between; font-size: 1.7rem; margin: 3rem 0rem;">
					<div>
						<label for="">Ngày bắt đầu:</label> <input type="date"
							name="dateStart" id="" style="width: 90%;" value='${dateStart }'>
					</div>
					<div>
						<label for="">Ngày kết thúc:</label> <input type="date"
							name="dateEnd" id="" style="width: 90%;" value='${dateEnd }'>
					</div>
					<div>
						<button type="submit" class="btn-buy">Thống kê</button>
					</div>
				</div>
			</form>
		</div>
		<div style="width: 100%;">
			<h2>Sản phẩm bán chạy nhất</h2>
			<hr style="width: 100%;">
			<div
				style="display: flex; font-size: 1.5rem; justify-content: space-between; width: 100%;">
				<div style="flex: 0.7; line-height: 6rem"> 
					<div><strong>Mã sản phẩm:</strong> ${bestProduct.product.productId }</div>
					<div><strong>Tên sản phẩm:</strong> ${bestProduct.product.name }</div>
					<div><strong>Số sản phẩm đã bán:</strong> ${bestProduct.count }</div>
					<div>
						<strong>Tổng doanh thu từ sản phẩm:</strong>
						<fmt:formatNumber type="number" maxFractionDigits="2"
							value="${bestProduct.count*bestProduct.product.price*0.8 }" /> đ
					</div>
				</div>
				<c:if test="${fn:startsWith(bestProduct.product.image, 'http')}">
					<div style="flex: 0.3;">
						<img src="${bestProduct.product.image }" alt="" width="100%">
					</div>
				</c:if>
				<c:if test="${!fn:startsWith(bestProduct.product.image, 'http')}">
					<div style="flex: 0.3;">
						<img src="../image?fileFolder=Products&fname=${bestProduct.product.image }" alt="" width="100%">
					</div>
				</c:if>

			</div>
		</div>
		<div style="margin-top: 4rem;">
			<h2>Biểu đồ doanh thu theo ngày</h2>
			<hr style="width: 100%">
			<canvas id="myChart" height="" width="100%"></canvas>
		</div>
	</div>

</div>
<!-- body ends -->


<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
          const ctx = document.getElementById('myChart');

          new Chart(ctx, {
            type: 'bar',
            data: {
              labels: [<c:forEach var="s" items="${sellerIncomes }">
              '<fmt:formatDate value="${s.date }" pattern="dd/MM"/>', 
                </c:forEach>],
              datasets: [{
                label: 'Doanh thu (vnđ)',
                data: [<c:forEach var="s" items="${sellerIncomes }">
            	${s.amount }, 
                </c:forEach>],
                borderWidth: 1
              }]
            },
            options: {
              scales: {
                y: {
                  beginAtZero: true
                }
              }
            }
          });
        </script>