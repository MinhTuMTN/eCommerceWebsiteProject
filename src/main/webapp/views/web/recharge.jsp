<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="srecharge">
	<h1>Nạp tiền vào ví</h1>
	<hr>
	<form action="" method="post" onsubmit="return checkInp()">
		<div class="amount">
			<h2>Nhập số tiền:</h2>
			<input type="number" name="amount" id="amount">
		</div>


		<div class="recharge-details">
			<div class="payment-methods">
				<h2>Phương thức thanh toán</h2>
				<div class="container">
					<div class="credit">
						<input type="radio" name="method" checked="checked"> <img
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png"
							alt=""> <img
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/640px-Mastercard-logo.svg.png"
							alt=""> <img
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/American_Express_logo_%282018%29.svg/800px-American_Express_logo_%282018%29.svg.png"
							alt="">
					</div>
					<div class="paypal">
						<input type="radio" name="method"> <img
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/PayPal_logo.svg/2560px-PayPal_logo.svg.png"
							alt="">
					</div>
					<div class="momo">
						<input type="radio" name="method"> <img
							src="https://images.viblo.asia/e3155ca5-5d16-455a-9449-fdc95d4a9664.png"
							alt="">
					</div>
				</div>
			</div>
		</div>

		<div>
			<input type="submit" class="btn-buy" value="Nạp tiền"
				style="margin-top: 1.5rem; width: 25rem;">
		</div>
	</form>
</section>

<script type="text/javascript">
	function checkInp() {
		var x = document.getElementById("amount").value;

		if (isNaN(x)) {
			alert("Must input numbers");
			return false;
		}
	}
</script>