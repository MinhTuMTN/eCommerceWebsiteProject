<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.mw-100 {
	height: 5rem;
	background-size: cover;
	width: 100%;
}
#contactForm > div > div > div > input, textarea{
	font-size: 1.3rem !important;
}
</style>

<section class="ftco-section" style="font-size: 1.7rem">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">Contact Form #07</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="wrapper">
					<div class="row no-gutters">
						<div class="col-md-6 d-flex align-items-stretch">
							<div class="contact-wrap w-100 p-md-5 p-4 py-5">
								<h3 class="mb-4">Write us</h3>
								<div id="form-message-warning" class="mb-4"></div>
								<div id="form-message-success" class="mb-4">Your message
									was sent, thank you!</div>
								<form method="POST" id="contactForm" name="contactForm"
									class="contactForm">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" name="name"
													id="name" placeholder="Name" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="email" class="form-control" name="email"
													id="email" placeholder="Email" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" name="subject"
													id="subject" placeholder="Subject" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<textarea name="message" class="form-control" id="message"
													cols="30" rows="6" placeholder="Message"></textarea>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="submit" value="Send Message"
													class="btn-buy" />
												<div class="submitting"></div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch">
							<div class="info-wrap w-100 p-md-5 p-4 py-5 img">
								<h3>Contact information</h3>
								<p class="mb-4">We're open for any suggestion or just to
									have a chat</p>
								<div class="dbox mw-100 d-flex align-items-start">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-map-marker"></span>
									</div>
									<div class="text pl-3">
										<p>
											<span>Address:</span> Số 1 Võ Văn Ngân, phường Linh Chiểu,
											Thủ Đức, Thành phố Hồ Chí Minh
										</p>
									</div>
								</div>
								<div class="dbox mw-100 d-flex align-items-center">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-phone"></span>
									</div>
									<div class="text pl-3">
										<p>
											<span>Phone:</span> <a href="tel:111-222-3333">+111-222-3333</a>
										</p>
									</div>
								</div>
								<div class="dbox mw-100 d-flex align-items-center">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-paper-plane"></span>
									</div>
									<div class="text pl-3">
										<p>
											<span>Email:</span> <a href="mailto:dhspkt@gmail.com"><span
												class="__cf_email__"
												data-cfemail="e38a8d858ca39a8c9691908a9786cd808c8e" style="text-transform: none">dhspkt@gmail.com</span></a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>