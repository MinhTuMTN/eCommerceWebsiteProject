<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
.form-group {
	margin: 1rem 0rem;
}
</style>

<div class="row" style="display: flex; flex: 0.9; margin-left: 2rem">
	<form action='<c:url value="/admin/update-category"/>' method="post"
		enctype="multipart/form-data" style="width: 100%">
		<div class="card" style="padding: 1rem; font-size: 1.7rem">
			<div class="card-header">
				<h2>Update category</h2>
			</div>
			<div style="display: flex;">
				<div style="flex: 0.6">
					<div class="form-group">
						<label>Category ID:</label> <input readonly="readonly" type="text"
							class="form-control" placeholder="Category ID" name="categoryId"
							value="${category.categoryId}" style="width: 70%" />
					</div>
					<div class="form-group">
						<label>Category name:</label> <input type="text"
							class="form-control" placeholder="Category name" name="name"
							value="${category.name}" style="width: 70%" />
					</div>
					<div style="display: flex; justify-content: flex-start;">
						<button type="reset" class="btn-buy"
							style="background-color: #d65249; margin-right: 1rem">Reset</button>
						<button type="submit" class="btn-buy"
							onclick="javascript:return YNConfirmation()">Update</button>
					</div>
				</div>
				<div style="flex: 0.4">
					<div class="form-group">
						<c:url
							value="/image?fname=${category.image }&fileFolder=Categories"
							var="imageUrl"></c:url>
						<label>Image:</label> <br> <img class="img-responsive" id="output_image"
							width="40%" style="margin: 0.6rem 0rem" src="${imageUrl}"
							alt="" onclick="document.getElementById('image').click()">
						<input id="image" type="file" name="image" value="${imageUrl}"
							hidden="" onchange="preview_image(event)" />
					</div>
				</div>
			</div>

		</div>




	</form>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
<script>
	function preview_image(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('output_image');
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>