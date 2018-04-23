<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/templates/taglib.jsp" %>	
<main>
<div class="header-navigate clearfix mb15">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5">
				<ol class="breadcrumb breadcrumb-arrow" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
					<li><a href="${pageContext.request.contextPath }/trang-chu" itemprop="url" target="_self">Trang chủ</a></li>
					
					<li><i class="fa fa-angle-right"></i></li>
					<li><span itemprop="title">Danh mục</span></li>
					<li><i class="fa fa-angle-right"></i></li>
					<li class="active"><span itemprop="title">${objCat.name }</span></li>
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
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
	<div class="wrap-filter clearfix mb15">
		
		<div class="group-collection" aria-expanded="true">
			<div class="title-block dropdown-filter">
				
				<h3 class="title-group">Danh mục</h3>
				
				<i class="fa fa-minus flexbox-grid-default flexbox-justifyContent-center flexbox-alignItems-center" aria-hidden="true"></i>
			</div>
			<div class="filter-box">
				<ul id="menusidebarleft" class="menu-collection clearfix mb15">
					<c:forEach items="${listCat }" var="objCat">
						<li><a href="${pageContext.request.contextPath }/${slug.makeSlug(objCat.name)}/${objCat.id}">${objCat.name }</a> </li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
	</div>
</div>
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
				<div class="row">
					<div class="col-xs-12 pd5">
						<div class="group-collection">
							<div class="title-block">
								
								<h1 class="title-group">${objCat.name }</h1>
								
								
								<div class="browse-tags pull-right hidden-xs">
									<span class="mr5">Sắp xếp theo:</span>
									<span class="custom-dropdown custom-dropdown--white">
										<select onchange="changeListProduct(${objCat.id },${page } )" id="optionValue" class="sort-by custom-dropdown__select custom-dropdown__select--white">
											<option value="1">Mới nhất</option>
											<option value="2">Giá: Tăng dần</option>
											<option value="3">Giá: Giảm dần</option>
											<option value="4">Tên: A-Z</option>
											<option value="5">Tên: Z-A</option>
											<option value="6">Cũ nhất</option>
										</select>
									</span>
								</div>
								
							</div>
						</div>	
					</div>
				</div>
				<script>
				function  changeListProduct(idCat, page) {
					var valueOption = document.getElementById("optionValue").value;
					$.ajax({
						url: '${pageContext.request.contextPath }/sap-xep-danh-muc',
						type: 'POST',
						cache: false,
						data: {
							id: idCat,
							npage : page,
							choise : valueOption,
								//Dữ liệu gửi đi
								},
						success: function(data){
							// Xử lý thành công
							$('#event-grid').html(data);
						},
						error: function (){
						// Xử lý nếu có lỗi
						alert('Loi');
						}
					});
				}
				
				</script>
				<div  class="row  product-lists product-item box-product-lists clear-item-collection" id="event-grid">
<c:forEach items="${listProductByIDCatPagination }" var="objProduct">
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 product-wrapper product-resize mb30">
	<div class="product-information">
		<div class="product-detail clearfix">
			<div class="product-image image-resize">
				<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(objProduct.name)}/${objProduct.id}" title="${objProduct.name }">
					<picture>
						<source media="(max-width: 991px)" srcset="${pageContext.request.contextPath }/files/${objProduct.picture }">
						<source media="(min-width: 992px)" srcset="${pageContext.request.contextPath }/files/${objProduct.picture }">
						<img style="width: 100%; height: 40%;" src="${pageContext.request.contextPath }/files/${objProduct.picture }" alt="${objProduct.name }" />
					</picture>
				</a>
				<!-- <div class="product-pricesale-percent">-10%</div> -->
				<div class="product-icon-new countdown_7680117" style="display: none;">
					<svg class="svg-next-icon svg-next-icon-size-36" style="fill:#d80027">
						<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-new-product"></use>
					</svg>
				</div>
				<div class="box-position-quickview">
					<div class="wrap-btn-quickview">
					<button class="btn-style-buynow addnow btn-success"  data-toggle="modal" data-target="#myModal-${objProduct.id }"> <span class='text-btn' >Mua ngay</span></button>
					</div>
				</div>
				<div class="modal fade" id="myModal-${objProduct.id }" role="dialog">
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
								        			<img  class="img-rounded" alt="${objProduct.name }" src="${pageContext.request.contextPath }/files/${objProduct.picture }"> 
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
										        	<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he-mua-hang' id='contact-${objProduct.id  }' method='post'>
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
																<button onclick="submitForm(${objProduct.id })" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
															</div>
														</div>
													</div>
												</div>	 				
									        	</div>
									      </div>
									    </div>
									</div>
			</div>
			<div class="product-info">
				<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(objProduct.name)}/${objProduct.id}" title="${objProduct.name }">
					<h3 class="product-title">${objProduct.name }</h3>
				</a>
				<p class="product-box-price clearfix flexbox-grid-default">
					<span class="price-new flexbox-content text-left"><fmt:formatNumber value="${objProduct.price }"></fmt:formatNumber>₫</span>
					<!-- <span class="price-old flexbox-content text-right">3.000.000₫</span> -->
				</p>
			</div>
		</div>
	</div>
</div>
</c:forEach>
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
										$('form#contactDM').submit();
									}); */
								</script>
								
	   <div class="container">
		<div class="col-md-9 p-left">
			<ul class="pagination" >         
					 <c:set value="${pageContext.request.contextPath }/${slug.makeSlug(objCat.name)}/${objCat.id}/${page-1 }"  var="urlPre"></c:set>
		                <c:set value="${pageContext.request.contextPath }/${slug.makeSlug(objCat.name)}/${objCat.id}/${page+1 }" var="urlNext"></c:set>
		                   <c:if test="${(page-1) > 0 }">
		                     <li ><a class="page-link" href="${urlPre }"><<</a></li>
		                    </c:if>
		                    <c:choose>
		                    	<c:when test="${sumPage < 4 }">
		                    		<c:forEach begin="1"  end="${sumPage }" var="i">
		                      	 		 <li   <c:if test="${i == page }">class='active'</c:if>><a class="page-link"  href="${pageContext.request.contextPath }/${slug.makeSlug(objCat.name)}/${objCat.id}/${i }">${i } <span class="sr-only"></span></a></li>
		                      		</c:forEach>
		                    	</c:when>
		                    	<c:when test="${page<(sumPage-3) && sumPage>3 }">
		                    		<c:forEach begin="${page }"  end="${page+3 }" var="i">
		                      			 <li  <c:if test="${i == page }">class='active'</c:if>> <a class="page-link"  href="${pageContext.request.contextPath }/${slug.makeSlug(objCat.name)}/${objCat.id}/${i }">${i } <span class="sr-only"></span></a></li>
		                     		 </c:forEach>
		                    	</c:when>
		                    	<c:when test="${page>=(sumPage-3) && sumPage>3 }">
		                    		<c:forEach begin="${sumPage-3 }"  end="${sumPage }" var="i">
		                      			 <li  <c:if test="${i == page }">class='active'</c:if>> <a  class="page-link"  href="${pageContext.request.contextPath }/${slug.makeSlug(objCat.name)}/${objCat.id}/${i }">${i } <span class="sr-only"></span></a></li>
		                     		 </c:forEach>
		                    	</c:when>
		                    </c:choose>
		                      <c:if test="${page+1 <= sumPage }">
		                      <li >  <a class="page-link" href="${urlNext }"> >> </a></li>
		                    </c:if>
				 </ul> 
			</div>	 
		 </div>
	  </div>
	 </div>
	</div>
	</section>
</main>
		