<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<main>
	<div class="header-navigate clearfix mb15">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
					<ol class="breadcrumb breadcrumb-arrow" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
						<li><a href="${pageContext.request.contextPath}/trang-chu" itemprop="url" target="_self">Trang chủ</a></li>
						<li><i class="fa fa-angle-right"></i></li>
						<li class="active"><span itemprop="title">Tìm kiếm</span></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${msg == 1 }">
	<div style="text-align: center;" class="sufee-alert alert with-close alert-success alert-dismissible">
           Cảm ơn bạn đã liên hệ với chúng tôi
         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
           <span aria-hidden="true">&times;</span>
       </button>
   </div>
</c:if>
	<section id="collection" class="clearfix">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 pd5">
					<div class="group-collection">
						<div class="title-block">
							<h1 class="title-group">Tìm kiếm: ${key} </h1>
						</div>
					</div>
				</div>	
			</div>
			<div class="row product-lists product-item box-product-lists clear-item" id="event-grid">
				<c:forEach items="${items}" var="item">
						<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6 product-wrapper product-resize">
								<div class="product-information">
									<div class="product-detail clearfix">
										<div class="product-image image-resize">
											<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(item.name)}/${item.id}/s" title="${item.name}">
												<picture>
													<source media="(max-width: 991px)" srcset="${pageContext.request.contextPath }/files/${item.picture}"></source>
													<source media="(min-width: 992px)" srcset="${pageContext.request.contextPath }/files/${item.picture}"></source>
													<img style="width: 263px; height: 175px;" src="${pageContext.request.contextPath }/files/${item.picture}" alt="${item.picture}" /> 
												</picture>
											</a>
											<div class="box-position-quickview">
												<div class="wrap-btn-quickview">
													<button class="btn-style-buynow addnow btn-success"  data-toggle="modal" data-target="#myModal-${item.id }"> <span class='text-btn' >Mua ngay</span></button>
												</div>
											</div>
										</div>
										<div class="modal fade" id="myModal-${item.id }" role="dialog">
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
								        			<img  class="img-rounded" alt="${item.name }" src="${pageContext.request.contextPath }/files/${item.picture }"> 
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
										        	<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he-mua-hang' id='contact-${item.id }' method='post'>
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
																<button class="btn btn-default" onclick="submitForm(${item.id })" data-dismiss="modal" aria-label="Close">Đóng</button>
															</div>
														</div>
													</div>
												</div>
									        	</div>
									      </div>
									    </div>
									</div>
										<div class="product-info">
											<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(item.name)}/${item.id}/s" title="${item.name}">
												<h3 class="product-title text-center">${item.name}</h3>
											</a>
											<p class="product-box-price clearfix flexbox-grid-default">
												<span class="price-new flexbox-content text-center"><fmt:formatNumber>${item.price }</fmt:formatNumber>₫</span>
											</p>
										</div>
									</div>
								</div>
							</div>		
						</c:forEach>	
				</div>
				
				        	
			
				<div class="container ">
					<div class="pagination-default  clearfix clear-ajax col-xs-12">
						<ul class="pagination " >           
								 <c:set value="${pageContext.request.contextPath }/tim-kiem/${key }+${page-1 }.html"  var="urlPre"></c:set>
					                <c:set value="${pageContext.request.contextPath }/tim-kiem/${key }+${page+1 }.html" var="urlNext"></c:set>
					                   <c:if test="${(page-1) > 0 }">
					                     <li ><a class="page-link" href="${urlPre }"><<</a></li>
					                    </c:if>
					                    <c:choose>
					                    	<c:when test="${sumPage < 4 }">
					                    		<c:forEach begin="1"  end="${sumPage }" var="i">
					                      	 		 <li <c:if test="${i == page }">class=active</c:if> ><a class="page-link"  href="${pageContext.request.contextPath }/tim-kiem/${key }+${i }.html">${i } <span class="sr-only"></span></a></li>
					                      		</c:forEach>
					                    	</c:when>
					                    	<c:when test="${page<(sumPage-3) && sumPage>3 }">
					                    		<c:forEach begin="${page }"  end="${page+3 }" var="i">
					                      			 <li <c:if test="${i == page }">class=active</c:if> > <a class="page-link"  href="${pageContext.request.contextPath }/tim-kiem/${key }+${i }.html">${i } <span class="sr-only"></span></a></li>
					                     		 </c:forEach>
					                    	</c:when>
					                    	<c:when test="${page>=(sumPage-3) && sumPage>3 }">
					                    		<c:forEach begin="${sumPage-3 }"  end="${sumPage }" var="i">
					                      			 <li  <c:if test="${i == page }">class=active</c:if>> <a  class="page-link"  href="${pageContext.request.contextPath }/tim-kiem/${key }+${i }.html">${i } <span class="sr-only"></span></a></li>
					                     		 </c:forEach>
					                    	</c:when>
					                    </c:choose>
					                      <c:if test="${page+1 <= sumPage }">
					                      <li >  <a class="page-link" href="${urlNext }"> >> </a></li>
					                    </c:if>
							 </ul> 
						</div>	 
					 </div>
			<!-- <div class="pagination-default clearfix clear-ajax col-xs-12">
				<div class="pagination-box clearfix">	
					<a class="page-node current">1</a>
					<a class="page-node" href="#">2</a>
					<a class="next fa fa-angle-right" href="#"></a>
				</div>
			</div> -->
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
									function submitForm(id) {
										$('form#contact-'+id).submit();
									}
									/* $(document).on("click", ".form-contact button[aria-label='Close']", function(e){
										$('form#contact').submit();
									}); */
								</script>
	</section>
</main>