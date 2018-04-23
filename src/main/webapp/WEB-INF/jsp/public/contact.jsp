<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<main>
	<div class="header-navigate clearfix mb15">
		<div class="container">
			<div class="row">
				<div class="header-navigate clearfix mb15">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
								<ol class="breadcrumb breadcrumb-arrow" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
									<li><a href="${pageContext.request.contextPath }/trang-chu" itemprop="url" target="_self">Trang chủ</a></li>
									
									<li><i class="fa fa-angle-right"></i></li>
									<li class="active"><span itemprop="title">Liên hệ</span></li>
									
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="layout-page clearfix">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 pd5">
				<h1>
					Liên hệ
				</h1>
				<div class="clearfix page-description">
					
					<p id="map_canvas" class="text-center">
						<iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d250833.41669478157!2d106.54192465230456!3d10.790456947800283!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528ccfe8d5797%3A0xe5cfba6f48e452c4!2zazQzLCAxIFRy4bqnbiBLaOG6r2MgQ2jDom4sIFTDom4gxJDhu4tuaCwgUXXhuq1uIDEsIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2sus!4v1523845831502' width='1140' height='500' frameborder='0' style='border:0' allowfullscreen></iframe>
					</p>
					
				</div>
				<div class="row">
					<div class="col-md-6 col-xs-12">
						<div class="page-left-contact clearfix">	
							<div class="page-left-title">
								<i class="fa fa-envelope"></i><span>Để lại lời nhắn cho chúng tôi</span>
							</div>
							<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he' id='contact' method='post'>
							<input name='FormType' type='hidden' value='contact' />
							<input name='utf8' type='hidden' value='true' />
							
							<div class="contact-form page-form-contact">
								<div class="row">
									<div class="col-sm-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user"></i></span>
												<input type="text" name="name_customer" class="form-control" autocapitalize="off" required placeholder="Họ và tên" />
											</div>
											<p class="error-contact">Không được để trống.</p>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
												<input type="text" name="email" class="form-control" autocapitalize="off" maxlength="50" required="" pattern="^[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&amp;'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$" placeholder="Email" />
											</div>
											<p class="error-contact">Email không hợp lệ.</p>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-phone"></i></span>
												<input type="text" name="phone" class="form-control" autocapitalize="off" required pattern="^\d{8,11}$" maxlength="15" placeholder="Số điện thoại" />
											</div>
											<p class="error-contact">Điện thoại không hợp lệ,</p>
										</div>
									</div>
									<div class="col-sm-6 col-xs-12">
										<div class="input-group">
											<textarea name="message" required placeholder="Viết lời nhắn"></textarea>
										</div>
										<p class="error-contact">Không được để trống.</p>
									</div>
									<div class="col-xs-12 text-center">
										<button class="btn-send-contact">Gửi lời nhắn</button>
									</div>
								</div>
							</div>
							</form>
						</div>
					</div>
					<div class="col-md-6 col-xs-12">
						<div class="page-right-contact clearfix">	
							<div class="page-right-title">
								<span>Thông tin cửa hàng</span>
							</div>	
							<div class="phone flexbox-grid-default">
								
								<i class="fa fa-building" aria-hidden="true"></i> <span>${infoShop.name}</span>
								
							</div>
							<div class="phone flexbox-grid-default">
								<i class="fa fa-phone" aria-hidden="true"></i>
								
								<a href="tel:0938559501">${infoShop.phone}</a>
								
							</div>
							<div class="address flexbox-grid-default">
								
								<i class="fa fa-map-marker" aria-hidden="true"></i> <span>${infoShop.address}</span>
								
							</div>				
							<div class="address flexbox-grid-default">
								<i class="fa fa-envelope" aria-hidden="true"></i>
								
								<a href="mailto:${infoShop.email}">${infoShop.email}</a>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validateEmail(email) {
			var re = /\S+@\S+\.\S+/;
			return re.test(email);
		}
		function validatePhone(phone) {
			var re = /^[0-9-+]+$/;
			return re.test(phone);
		}
		function validateText(object) {
			if ( object.val() == '' ){
				object.css('border-color','red');
			} else {
				object.removeAttr('style');
			}
		}
		$(document).on("click", ".btn-send-contact", function(e){
			e.preventDefault();
			var input_name = $(this).parents('form').find('input[name="name_customer"]');
			var input_email = $(this).parents('form').find('input[name="email"]');
			var input_phone = $(this).parents('form').find('input[name="phone"]');
			var textarea_note = $(this).parents('form').find('textarea[name="message"]');
			if ( input_name.val() == '' ){
				input_name.parents('.input-group').next('.error-contact').show();
			} else {
				input_name.parents('.input-group').next('.error-contact').hide();
			}
			if ( input_email.val() == '' ){
				input_email.parents('.input-group').next('.error-contact').show();
			} else {
				if ( validateEmail(input_email.val()) ){
					input_email.parents('.input-group').next('.error-contact').hide();
				} else {
					input_email.parents('.input-group').next('.error-contact').show();
				}
			}
			if ( input_phone.val() == '' ){
				input_phone.parents('.input-group').next('.error-contact').show();
			} else {
				if ( validatePhone(input_phone.val()) ){
					input_phone.parents('.input-group').next('.error-contact').hide();
				} else {
					input_phone.parents('.input-group').next('.error-contact').show();
				}
			}
			if ( textarea_note.val() == '' ){
				textarea_note.parents('.input-group').next('.error-contact').show();
			} else {
				textarea_note.parents('.input-group').next('.error-contact').hide();
			}
			if ( $('.page-form-contact .error-contact:visible').length == 0 ) {
				$('.form-contact').modal('show');
			}
		});
		$(document).on("click", ".form-contact button[aria-label='Close']", function(e){
			$('form#contact').submit();
		});
	</script>
	<div class="modal fade form-contact" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLongTitle">Thông báo</h4>
				</div>
				<div class="modal-body">
					<p class="text-center">Cảm ơn bạn đã góp ý cho chúng tôi.</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
				</div>
			</div>
		</div>
	</div>
</div>
			</main>
			