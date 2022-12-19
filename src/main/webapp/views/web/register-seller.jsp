<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<section class="sproduct">
	<div class="container">
		<h1>Trở thành người bán hàng</h1>
		<c:if test="${isSeller }">
			<p style="text-transform: none;">Hiện tại bạn đã là người bán hàng nên bạn không thể đăng ký</p>
		</c:if>
		<c:if test="${!isSeller }">
			<p style="text-transform: none;">Để có thể trở thành người bán
				hàng, bạn cần phải cung cấp một số thông tin cơ bản</p>
		</c:if>
		<c:if test="${!isSeller }">
			<hr style="width: 100%;">
			<form action="" method="post" role="form"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="">Tên cửa hàng:</label> <input type="text"
						name="storeName" required>
				</div>
				<div class="form-group">
					<label for="avatar">Ảnh đại diện:</label> <img
						style="border-radius: 50%; border: 2px solid coral;"
						src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/-Insert_image_here-.svg/800px--Insert_image_here-.svg.png"
						alt="" width="100rem" height="100rem" id="avatar-out"
						onclick='document.getElementById("avatar").click()'> <input
						type="file" name="avatar" id="avatar" required
						onchange="preview_image(event, 'avatar-out')"
						accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" />
				</div>
				<div class="form-group">
					<label for="cover">Ảnh bìa:</label> <img
						src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/-Insert_image_here-.svg/800px--Insert_image_here-.svg.png"
						alt="" width="350rem" height="300rem" id="cover-out"
						onclick='document.getElementById("cover").click()'> <input
						type="file" name="cover" id="cover" required
						onchange="preview_image(event, 'cover-out')"
						accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" />
				</div>
				<p style="text-transform: none;">Bằng cách nhấn vào nút yêu cầu,
					bạn đã đồng ý với các điều khoản của chúng tôi</p>
				<div class="form-group">
					<button type="submit" class="btn-buy">Yêu cầu</button>
				</div>
			</form>
		</c:if>
	</div>
</section>
<script>
	function preview_image(event, outputId) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById(outputId);
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>