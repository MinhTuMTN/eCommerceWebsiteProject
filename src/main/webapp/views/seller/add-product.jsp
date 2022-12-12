<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
input, select {
	height: 4rem !important;
	width: 100% !important;
	text-transform: none !important
}

textarea {
	font-size: 1.7rem !important;
	text-transform: none !important
}
</style>
<!-- body starts -->
<div class="col">
	<div class="row"
		style="background-color: white; padding: 3rem; font-size: 1.7rem;">
		<div style="width: 100%; height: 100%; padding: 3rem">
			<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
				<div class="row">
					<div class="col-12">
						<h2 class="tm-block-title d-inline-block"
							style="font-size: 2.5rem">${product.productId == null ? "Thêm sản phẩm" : "Chỉnh sửa sản phẩm" }</h2>
					</div>
				</div>
				<div class="row tm-edit-product-row">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<form action="" role="form" enctype="multipart/form-data"
							method="post" class="tm-edit-product-form">
							<c:if test="${product.productId != null }">
								<input name="productId" value="${product.productId }"
									hidden="hidden">
							</c:if>
							<div class="form-group mb-3">
								<label for="name">Tên sản phẩm </label> <input id="name"
									name="name" type="text" class="form-control validate"
									value="${product.name }" required />
							</div>
							<div class="form-group mb-3">
								<label for="description">Mô tả</label>
								<textarea class="form-control validate" rows="3"
									name="description" required>${product.description }</textarea>
							</div>
							<div class="form-group mb-3">
								<label for="category">Danh mục</label> <select
									class="custom-select tm-select-accounts" id="category"
									name="category" required="required">
									<c:if test="${product == null }">
										<c:forEach var="c" items="${categories }">
											<option value="${c.categoryId }">${c.name }</option>
										</c:forEach>
									</c:if>
									<c:if test="${product != null }">
										<c:forEach var="c" items="${categories }">
											<c:if test="${c.categoryId == product.category.categoryId }">
												<option value="${c.categoryId }" selected="selected">${c.name }</option>
											</c:if>
											<c:if test="${c.categoryId != product.category.categoryId }">
												<option value="${c.categoryId }">${c.name }</option>
											</c:if>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="expire_date">Số lượng </label> <input
										id="expire_date" name="quantity" type="number"
										class="form-control validate" data-large-mode="true"
										value="${product.quantity }" />
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="stock">Giá bán </label> <input id="stock"
										name="price" type="number" class="form-control validate"
										value="${product.price }" required onchange="return addCommas(this.value)" />
								</div>
							</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
						<div class="custom-file mt-3 mb-3">
							<div class="mx-auto"
								style="display: block; width: 35rem; height: 35rem;">
								<c:if test="${!fn:startsWith(product.image, 'http')}">
									<img id="output_image" src="../image?fileFolder=Products&fname=${product.image }" alt="" width="100%" height="100%"
										style="border-radius: 50%;">
								</c:if>
								<c:if test="${fn:startsWith(product.image, 'http')}">
									<img id="output_image" src="${product.image }" alt="" width="100%" height="100%"
										style="border-radius: 50% ;">
								</c:if>
							</div>
							<input id="image" type="file" name="image" style="display: none;"
								onchange="preview_image(event)" />
							<div class="mx-auto" style="display: block; width: 35rem;">
								<button type="button"
									style="background-color: rgb(112, 164, 28); display: block; height: 5rem; width: 20rem; text-align: center;"
									class="btn-buy btn-block mx-auto"
									onclick="document.getElementById('image').click();">
									UPLOAD IMAGE</button>
							</div>
						</div>
					</div>
					<div class="col-12">
						<button type="submit" class="btn-buy btn-block text-uppercase">${isEdit ? "Cập nhật" : "Thêm sản phẩm" }</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- body ends -->

<script>
	function addCommas(nStr) {
		nStr += '';
		x = nStr.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2;
	}
	function preview_image(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('output_image');
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>