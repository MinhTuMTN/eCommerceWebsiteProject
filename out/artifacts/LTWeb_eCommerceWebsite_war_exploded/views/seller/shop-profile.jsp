<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<style>
	.qpNcUn img{
		border-radius: 50%;
	}
</style>
<!-- body starts -->
<div class="col">
	<div class="row">
		<!--Product in category starts-->
		<section class="list-cate" id=""
			style="padding-top: 0; padding-left: 0; padding-right: 0;">
			<div class="box-container">
				<div class="xMDeox">
					<div style="padding: 1.875rem 0.625rem;">
						<div class="Q5feZb">
							<h1 class="OomjNA">Hồ sơ shop</h1>
							<div class="HJ5nmd">Xem tình trạng Shop và cập nhật hồ sơ
								Shop của bạn</div>
						</div>
						<div class="+eqaLN">
							<div class="InGfFt">
								<form action="">
									<div class="dghdd9">
										<div class="h4eiAQ ">
											<div class="tBgRZR">
												<label for="">Tên shop: </label>
											</div>
											<div class="gV\+dPk">
												<div class="_2NnHla">
													<div class="Z1Wx1m">${store.name }</div>
												</div>
											</div>
										</div>

									</div>
									<div class="dghdd9">
										<div class="h4eiAQ ">
											<div class="tBgRZR">
												<label for="">Ngày tạo shop: </label>
											</div>
											<div class="gV\+dPk">
												<div class="_2NnHla">
													<div class="Z1Wx1m"><fmt:formatDate value="${store.createdAt }" pattern="dd/MM/yyyy hh:mm:ss"/></div>
												</div>
											</div>
										</div>

									</div>
									<div class="dghdd9">
										<div class="h4eiAQ ">
											<div class="tBgRZR">
												<label for="">Số dư ví: </label>
											</div>
											<div class="gV\+dPk">
												<div class="_2NnHla">
													<div class="Z1Wx1m"><fmt:formatNumber value="${store.e_wallet }" maxFractionDigits="2" type="number"/>&nbsp;đ</div>
												</div>
											</div>
										</div>

									</div>
									<div class="dghdd9">
										<div class="h4eiAQ ">
											<div class="tBgRZR">
												<label for="">Người quản lý: </label>
											</div>
											<div class="gV\+dPk">
												<div class="_2NnHla">
													<div class="Z1Wx1m">${store.user.firstName } ${store.user.lastName }</div>
												</div>
											</div>
										</div>

									</div>
								</form>
							</div>
							<div class="_6-dPdd">
								<div class="DyzGC5">

									<div class="qpNcUn">
										<c:if test="${fn:startsWith(store.avatar, 'http')}">
											<img alt="" width="100%" height="100%" src="${store.avatar }">
										</c:if>
										<c:if test="${!fn:startsWith(store.avatar, 'http')}">
											<c:url value="/image?fileFolder=Stores&fname=${store.avatar }" var="urlImage"></c:url>
											<img alt="" width="100%" height="100%" src="${urlImage }">
										</c:if>
									</div>
									<a href="<c:url value="/seller/change-information" />">
										<button type="button" class="btn-buy"
										style="background-color: coral;">Cập nhật</button>
									</a>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!--Product in category starts-->
	</div>

</div>
<!-- body ends -->