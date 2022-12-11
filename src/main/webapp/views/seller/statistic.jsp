<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<style>
	body > section.sproduct > div > div > div.row > div > div:nth-child(3) > div > div:nth-child(1) > div {
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
                    <label for="">Ngày bắt đầu:</label>
                   
                    <input type="date" name="dateStart" id="" style="width: 90%;" value='${dateStart }'>
                  </div>
                  <div>
                    <label for="">Ngày kết thúc:</label>
                    
                    <input type="date" name="dateEnd" id="" style="width: 90%;" value='${dateEnd }'>
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
              <div style="display: flex; font-size: 1.5rem;justify-content: space-between; width: 100%;">
                <div style="flex: 0.7;">
                  <div>Mã sản phẩm: 1234</div>
                  <div>Tên sản phẩm: Samsung</div>
                  <div>Số sản phẩm đã bán: Samsung</div>
                  <div>Tổng doanh thu từ sản phẩm: </div>
                </div>
                <div style="flex: 0.3;">
                  <img src="/views/images/2.jpg" alt="" width="100%">
                </div>
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
        

        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
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