<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
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