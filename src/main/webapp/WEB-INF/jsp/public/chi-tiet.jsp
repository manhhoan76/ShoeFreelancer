<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/templates/taglib.jsp" %>	
			<main>
				<div itemscope itemtype="http://schema.org/Product"></div>
<meta itemprop="url" content="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(objProduct.name)}/${objProduct.id}">
<meta itemprop="image" content="${pageContext.request.contextPath }/files/${objProduct.picture }">
<meta itemprop="shop-currency" content="VND">

<div class="header-navigate clearfix mb15">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
				<ol class="breadcrumb breadcrumb-arrow" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
					<li><a href="${pageContext.request.contextPath }/trang-chu" itemprop="url" target="_self">Trang chủ</a></li>
					<li><i class="fa fa-angle-right"></i></li>
					<li class="active"><span itemprop="title">${objProduct.name }</span></li>
				</ol>
			</div>
		</div>
	</div>
</div>
<%-- <c:if test="${msg == 1 }">
	<div style="text-align: center;" class="sufee-alert alert with-close alert-success alert-dismissible">
           Cảm ơn bạn đã liên hệ với chúng tôi
         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
           <span aria-hidden="true">&times;</span>
       </button>
   </div>
</c:if> --%>
<section id="product" class="clearfix">
	<div class="container">
		<div class="row">
			<div id="surround" class="col-lg-6 col-md-6">
								
				
				<div class="row flexbox-product-slide">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 pd5 pd-r-none-992 product-box-slide">
						<div class="product-thumb-vertical" id="sliderproduct" >
							<ul>
								<c:forEach items="${listImageByIdProduct }" begin="0" end="8" var="objImage">
									<li  class="product-thumb">
									<a href="javascript:void(0);" data-image="${pageContext.request.contextPath }/files/${objImage.name}">
										<img src="${pageContext.request.contextPath }/files/${objImage.name}" alt="${objProduct.name }" />
									</a>
								</li>
								</c:forEach>
							</ul>							
						</div>
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 pd5 box-image-featured">
						<img style="width: 460px; height:305px; " class="product-image-feature"  src="${pageContext.request.contextPath }/files/${objProduct.picture }" alt="">
					</div>
				</div>
				
				
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12 pd5 information-product">
				<div class="product-title">
					<h1>${objProduct.name }</h1>
				</div>
				<div class="clearfix product-sku-date">
					<span class="pull-left product-sku" id="pro_sku">Mã sản phẩm: ${objProduct.id }</span>
				</div>
				<div class="product-price" id="price-preview">
					
					<span><fmt:formatNumber value="${objProduct.price }"></fmt:formatNumber>₫</span>
					
					
				</div>
				
							
				<div id="add-item-form"  class="variants clearfix variant-style ">	
					<div class="select clearfix">
						
						
						<!-- <div class="selector-wrapper opt1">
							<label>Màu sắc</label>
							<ul class="data-opt1 clearfix style-variant-template">

							</ul>
						</div>
						
						
						<div class="selector-wrapper opt2">
							<label>Kích thước</label>
							<ul class="data-opt2 clearfix style-variant-template">
								
							</ul>
						</div>
 -->						
					</div>
					<div class="clearfix price-contact">
						<button class="btn-style-buynow addnow" data-toggle="modal" data-target="#myModal">
							<span class="icon_cart_btn"></span>
							<span class='text-btn' >Mua ngay</span>
						</button>
					</div>
				</div>			
					<div class="modal fade" id="myModal" role="dialog">
									    <div class="modal-dialog">
									      <!-- Modal content-->
									      <div class="modal-content">
									        <div class="modal-header">
									        	<button type="button" class="close" data-dismiss="modal">&times;</button>
									        	<h2 style="text-align: center; color: #0c4da1;">Thông tin liên hệ mua hàng</h2>
									        </div>
									        <div class="modal-body">
									        <div>
									        	<div  class="col-sm-9 col-xs-12">
								        			<img   class="img-rounded" alt="${objProduct.name }" src="${pageContext.request.contextPath }/files/${objProduct.picture }"> 
								        		</div>
									        	<div  class=" col-sm-3 col-xs-12" style="text-align: center;" >
									        		<h5 style="color: #f46f22;" ><i style="font-size: 30px;"  class="fa fa-facebook-square"></i></h5> <a href="${infoShop.link_fb }">The SaiGon</a>
										        	<h5 style="color: #f46f22;" ><i style="font-size: 30px;"  class="fa fa-phone"></i></h5> ${infoShop.phone } 
									        		<h5 style="color: #f46f22;" ><i style="font-size: 30px;"  class="fa  fa-info-circle"></i></h5> ${infoShop.address }
									        		<h5></h5>
									        	</div>
									        </div>
									        <div class="clearboth"></div>
										        <div style="margin-top: 20px;" >
										        	<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he-mua-hang' id='contact' method='post'>
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
																	<button class="btn-send-contact">Gửi thông tin</button>
																</div>
															</div>
														</div>
														</form>
										        </div>
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
									      </div>
									    </div>
									</div>
				<div class="info-socials-article clearfix">
					<div class="box-like-socials-article">
						<div class="fb-like" data-href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(objProduct.name)}/${objProduct.id}" data-layout="button" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
					</div> 
				</div>
			</div>
			<div class="col-lg-3 col-xs-12 pd-none-box-service mb15">
				<div id="product-related" class="mb10">
	<div class="wrapper-product-related">
		<div class="title-group-related">
			
			<h2 class="title-group">
				Sản phẩm liên quan
			</h2>
		</div>
		<ul class="list-product-related">
			<c:forEach items="${listProductSameCat }" var="objProductSameCat">
				<li>
					<div class="flexbox-grid-default">
						<div class="flexbox-auto-100px">
							<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(objProductSameCat.name)}/${objProductSameCat.id}"">
								<img src="${pageContext.request.contextPath }/files/${objProductSameCat.picture }" alt="${objProductSameCat.name }" />
							</a>
						</div>
						<div class="flexbox-content pd-l-10">
							<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(objProductSameCat.name)}/${objProductSameCat.id}"">
								<h3 class="product-title">${objProductSameCat.name }</h3>
								<p class="product-box-price-related clearfix flexbox-grid-default">
									<span class="price-new-related flexbox-auto mr10 text-left"><fmt:formatNumber value="${objProductSameCat.price }"></fmt:formatNumber> ₫</span>
								</p>
							</a>
						</div>
					</div>
				</li>	
			</c:forEach>
		</ul>
	</div>
</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-xs-12 pd5">
				<div class="product-comment">
					<!-- Nav tabs -->
					<ul class="product-tablist nav nav-tabs" id="tab-product-template">
						<li class="active">
							<a data-toggle="tab" data-spy="scroll" href="#description">
								<span>Mô tả sản phẩm</span>
							</a>
						</li>
						<li>
							<a data-toggle="tab" data-spy="scroll" href="#comment">
								<span>Bình luận</span>
							</a>
						</li>
					</ul>
					<!-- Tab panes -->
					<div id="description">										
						<div class="container-fluid product-description-wrapper">
						<span>${objProduct.description }</span>
						</div>
					</div>
					<div id="comment">
						<div class="group-index mb15">
							<div class="title-block">
								<h3 class="title-group">Bình luận</h3>
							</div>
						</div>
						<div class="container-fluid">
							<div class="row">
								<div id="fb-root"></div>
								<div  class="fb-comments" data-href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(objProduct.name)}/${objProduct.id}" data-numposts="8"></div>	
								<script>(function(d, s, id) {
									  var js, fjs = d.getElementsByTagName(s)[0];
									  if (d.getElementById(id)) return;
									  js = d.createElement(s); js.id = id;
									  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12';
									  fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));
								</script>
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
														</div>
						</div>
					</div>	
						
				</div>
			</div>
			<div class="col-lg-4 col-xs-12 pd5">
			</div>
		</div>
		</div>
		</section>
			</main>
