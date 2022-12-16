<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
.hfwehhfej-1 {
	flex: 1;
	background-color: blanchedalmond;
}

.my-container-1234 {
	width: 100%;
	display: flex;
	justify-content: center;
}

.item-number-1 {
	flex: 0.25;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.item-number-2 {
	flex: 0.75;
}

.item-number-1-image {
	display: block;
	width: 15rem;
	height: 15rem;
}

input {
	width: 50% !important;
	height: 4rem;
	padding: 1rem;
	border-radius: 10px;
}
</style>

<section class="hfwehhfej-1" style="padding: 3rem 3rem 3rem 3rem; background-color: #faeae8">
	<h1 style="margin-bottom: 2rem;">Thay đổi thông tin</h1>
	<div class="my-container-1234">
		<div class="item-number-1">
			<div class="item-number-1-image">

				<c:if test="${fn:startsWith(store.avatar, 'http')}">
					<img id="output_image" src="${store.avatar }" alt="" width="100%"
						height="100%" style="border-radius: 50%"
						onclick="document.getElementById('avatar').click()" />
				</c:if>
				<c:if test="${!fn:startsWith(store.avatar, 'http')}">
					<c:url value="/image?fileFolder=Stores&fname=${store.avatar }"
						var="urlImage"></c:url>
					<td><img id="output_image" alt="" width="100%" height="100%"
						style="border-radius: 50%"
						onclick="document.getElementById('avatar').click()"
						src="${urlImage }"></td>
				</c:if>

			</div>
		</div>
		<div class="item-number-2">
			<form action="" role="form" enctype="multipart/form-data"
				method="post"
				style="text-transform: none !important; font-size: 1.7rem; width: 100%">
				<input type="file" style="display: none" id="avatar" name="avatar"
					onchange="preview_image(event)" /> <label for="">Tên
					shop:</label><br /> <input type="text" name="name" value="${store.name}"
					required /><br />
				<button class="btn-buy" type="submit" id="submit">Thay đổi
				</button>
			</form>
		</div>
	</div>
</section>
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