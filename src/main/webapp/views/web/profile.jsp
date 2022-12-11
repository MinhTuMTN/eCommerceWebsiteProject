<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<section class="sproduct" style="padding-top: 10rem;">
	<div class="box-container w-10">
		<div class="row">
			<div class="col-12 col-sm-3">
				<!--Danh mục profile starts-->
				<div class="card bg-light mb-1">
					<div class="card-header text-white"
						style="background-color: black; font-size: 23px;">
						<i class="fa fa-user"></i> Tài khoản của tôi
					</div>
					<ul class="list-group category_block">
						<li class="list-group-item"
							style="font-size: 15px; height: 4.25rem; padding-left: 3.5rem;"><a
							href='<c:url value="/change-information" ></c:url>' class="a-cate-detai">Hồ Sơ</a></li>
						<li class="list-group-item"
							style="font-size: 15px; padding-left: 3.5rem;"><a href="<c:url value="/change-password" ></c:url>"
							class="a-cate-detai">Đổi Mật Khẩu</a></li>
					</ul>
				</div>
				<!--Danh mục profile ends-->
			</div>

			<div class="col">
				<div class="row">
					<!--Product in category starts-->
					<section class="list-cate" id=""
						style="padding-top: 0; padding-left: 0; padding-right: 0;">
						<div class="box-container">
							<div class="xMDeox">
								<div style="padding: 1.875rem 0.625rem;">
									<div class="Q5feZb">
										<h1 class="OomjNA">Hồ sơ của tôi</h1>
										<div class="HJ5nmd">Quản lý thông tin hồ sơ để bảo mật
											tài khoản</div>
									</div>
									<div class="+eqaLN">
										<div class="InGfFt">
											<form action="">
												
												<div class="dghdd9">
													<div class="h4eiAQ ">
														<div class="tBgRZR">
															<label for="">Họ và tên: </label>
														</div>
														<div class="gV\+dPk" style="width: 75%">
															<div class="_2NnHla">
																<div class="Z1Wx1m">${user.firstName }&nbsp;${user.lastName }</div>
															</div>
														</div>
													</div>

												</div>
												<div class="dghdd9">
													<div class="h4eiAQ ">
														<div class="tBgRZR">
															<label for="">Email: </label>
														</div>
														<div class="gV\+dPk" style="width: 75%">
															<div class="_2NnHla">
																<div class="Z1Wx1m">${user.email }</div>
															</div>
														</div>
													</div>

												</div>
												<div class="dghdd9">
													<div class="h4eiAQ ">
														<div class="tBgRZR">
															<label for="">Số điện thoại: </label>
														</div>
														<div class="gV\+dPk" style="width: 75%">
															<div class="_2NnHla">
																<div class="Z1Wx1m">${user.phone }</div>
															</div>
														</div>
													</div>

												</div>
												<div class="dghdd9">
													<div class="h4eiAQ ">
														<div class="tBgRZR">
															<label for="">Địa chỉ: </label>
														</div>
														<div class="gV\+dPk" style="width: 75%">
															<div class="_2NnHla">
																<div class="Z1Wx1m">${user.address }</div>
															</div>
														</div>
													</div>

												</div>
												<div class="dghdd9">
													<div class="h4eiAQ ">
														<div class="tBgRZR">
															<label for="">Loại tài khoản: </label>
														</div>
														<div class="gV\+dPk" style="width: 75%">
															<div class="_2NnHla">
																<div class="Z1Wx1m">${user.role == 2 ? "User" : (user.role == 1 ? "Seller" : "Admin") }</div>
															</div>
														</div>
													</div>

												</div>
												<div class="dghdd9">
													<div class="h4eiAQ ">
														<div class="tBgRZR">
															<label for="">Số dư ví: </label>
														</div>
														<div class="gV\+dPk" style="width: 75%">
															<div class="_2NnHla">
																<div class="Z1Wx1m">
																	<strong>
																		<fmt:formatNumber value="${user.e_wallet }" maxFractionDigits="2" type="number"></fmt:formatNumber>
																	 đ
																	</strong>
																</div>
															</div>
														</div>
													</div>

												</div>
												<div class="dghdd9">
													<div class="h4eiAQ ">
														<div class="tBgRZR">
															<label for="">Ngày tạo: </label>
														</div>
														<div class="gV\+dPk" style="width: 75%">
															<div class="_2NnHla">
																<div class="Z1Wx1m"><fmt:formatDate pattern = "dd-MM-yyy" 
         value = "${user.createdAt}" /></div>
															</div>
														</div>
													</div>

												</div>
											</form>
										</div>
										<div class="_6-dPdd">
											<div class="DyzGC5">

												<div class="qpNcUn"
													style="background-image: url(https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-cute-meo-con-than-chet-700x695.jpg);"></div>
												<button type="button" class="btn-buy"
													style="background-color: coral;">Chọn Ảnh</button>

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
		</div>
	</div>
</section>