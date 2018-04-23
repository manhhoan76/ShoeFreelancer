	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/templates/taglib.jsp" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<!--banner-starts-->
<%-- <div class="bnr" id="home">
		<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider4">
				<c:forEach items="${listBanner }" var="banner">
				    <li>
						<div class=""><img style="width: 100%; height: 50%;" alt="${banner.picture}" src="${pageContext.request.contextPath }/files/${banner.picture}"></div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="clearfix"> </div>
	</div>  --%>
	<!--banner-ends--> 
	<!--Slider-Starts-Here-->
				<script src="${pageContext.request.contextPath }/templates/public/js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager: true,
			        nav: false,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
			
	<!--start-shoes--> 
	<div class="shoes"> 
		<div class="container"> 
			<div class="product-one">
				<div class="col-md-3 product-left"> 
					<div class="p-one simpleCart_shelfItem">							
<main>

<section class="slider-main mb15 container">
	<div id="slider-menu" class="slider-menu">
		<div class="owl-carousel">
		<c:forEach items="${listImageBanner }" var="banner">
			<div class="item active">
				<a href="javascript:void(0)" title="Slide">
					<picture>
						<source media="(max-width: 480px)" srcset="${pageContext.request.contextPath }/files/${banner.picture}">
						<source media="(min-width: 481px) and (max-width:767px)" srcset="${pageContext.request.contextPath }/files/${banner.picture}">
						<source media="(min-width: 768px)" srcset="${pageContext.request.contextPath }/files/${banner.picture}">
						<img src="${pageContext.request.contextPath }/files/${banner.picture}" alt="${banner.picture }" />
					</picture>
				</a>
			</div>	
		</c:forEach>	
		</div>
	</div>
</section>	

<div class="container mb30 hidden-xs">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12 pd-r-5 text-center pd5">
			<div class="box-content-service">
				<div class="icon-service">
					<!-- <label>======================================</label> -->
				</div>
				<div class="content-service"><h3>${ fn:toUpperCase('Sự hài lòng và niềm tin của khách hàng là ưu tiên hàng đầu của shop') }</h3></div>
			</div>
		</div>
	</div>
</div>


<div class="container mb15 group-index" id="group-sale-index">
	<div class="row">
		<div class="col-xs-12">
			<div class="title-block">
				<div class="wrap-content">
					<h2 class="title-group">SẢN PHẨM ĐƯỢC TÌM KIẾM NHIỀU</h2>
					<div class="title-group-note">Danh sách sản phẩm được khách hàng tìm kiếm nhiều</div>
				</div>
			</div>
		</div>	
	</div>
	<div class="row box-product-lists clear-item">
	
	<c:forEach items="${listProductMostSearch }" var="product">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6 product-wrapper product-resize mb30 ">
			<div class="product-information">
				<div class="product-detail clearfix">
					<div class="product-image image-resize">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<picture>
								<source media="(max-width: 991px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<source media="(min-width: 992px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<img  src="${pageContext.request.contextPath }/files/${product.picture}" alt="${product.picture}" />
							</picture>
						</a>
						<div class="product-icon-new " style="display: none;">
							<svg class="svg-next-icon svg-next-icon-size-36" style="fill:#d80027">
							</svg>
						</div>
						<div class="box-position-quickview">
					<div class="wrap-btn-quickview">
					<button class="btn-style-buynow addnow btn-success"  data-toggle="modal" data-target="#myModal-${product.id }"> <span class='text-btn' >Mua ngay</span></button>
					</div>
				</div>
				<div class="modal fade" id="myModal-${product.id }" role="dialog">
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
								        			<img  class="img-rounded" alt="${product.name }" src="${pageContext.request.contextPath }/files/${product.picture }"> 
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
										        	<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he-mua-hang' id='contact-${product.id }' method='post'>
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
																<button onclick="submitForm2(${product.id })" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
															</div>
														</div>
													</div>
												</div>
									      </div>
									    </div>
									</div>
					</div>
					<div class="product-info">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<h3 class="product-title text-center">${product.name }</h3>
						</a>
						<p class="product-box-price clearfix flexbox-grid-default">				
							<span class="price-new flexbox-content text-center"><fmt:formatNumber>${product.price }</fmt:formatNumber>₫</span>
						</p>
					</div>
				</div>
			</div>		
		</div>
	</c:forEach>

</div>
	
</div>


<div class="container mb15 group-index">
	<div class="row">
		<div class="col-xs-12">
			<div class="title-block">
				<div class="wrap-content">
					<h2 class="title-group">DANH MỤC HÀNG XEM NHIỀU</h2>
					<div class="title-group-note">Danh mục được nhiều khách hàng xem nhiều</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
	<c:forEach items="${listProductForCatMostView }" var="product">
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 mb30 box-banner-index">
			<div class="">
				<a href="${pageContext.request.contextPath }/${slug.makeSlug(product.nameCat)}/${product.id_category}">
					<img  src="${pageContext.request.contextPath }/files/${product.picture}" alt="${product.picture }" />
				</a>
				<div align="center"><a style="font-style: italic;font-size: 25px;" href="${pageContext.request.contextPath }/">${ fn:toUpperCase(product.nameCat) }</a></div>
			</div>
		</div>	
	</c:forEach>	
	</div>
</div>

<div class="container mb15 group-index">
	<div class="row">
		<div class="col-xs-12">
			<div class="title-block">
				<div class="wrap-content">
					<h2 class="title-group">Sản phẩm mới</h2>
					<div class="title-group-note">Hàng luôn được cập nhật thường xuyên</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row box-product-lists clear-item">
	<c:forEach items="${listProductMostNew }" var="product">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6 product-wrapper product-resize mb30 ">
			<div class="product-information">
				<div class="product-detail clearfix">
					<div class="product-image image-resize">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<picture>
								<source media="(max-width: 991px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<source media="(min-width: 992px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<img src="${pageContext.request.contextPath }/files/${product.picture}" alt="${product.picture}" />
							</picture>
						</a>
						<div class="product-icon-new " style="display: none;">
							<svg class="svg-next-icon svg-next-icon-size-36" style="fill:#d80027">
							</svg>
						</div>
							<div class="box-position-quickview">
					<div class="wrap-btn-quickview">
					<button class="btn-style-buynow addnow btn-success"  data-toggle="modal" data-target="#myModal-${product.id }"> <span class='text-btn' >Mua ngay</span></button>
					</div>
				</div>
				<div class="modal fade" id="myModal-${product.id }" role="dialog">
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
								        			<img  class="img-rounded" alt="${product.name }" src="${pageContext.request.contextPath }/files/${product.picture }"> 
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
										        	<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he-mua-hang' id='contact-${product.id }' method='post'>
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
																<button onclick="submitForm3(${product.id })" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
															</div>
														</div>
													</div>
												</div>
									      </div>
									    </div>
									</div>
					</div>
					<div class="product-info">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<h3 class="product-title text-center">${product.name }</h3>
						</a>
						<p class="product-box-price clearfix flexbox-grid-default">				
							<span class="price-new flexbox-content text-center"><fmt:formatNumber>${product.price }</fmt:formatNumber>₫</span>
						</p>
					</div>
				</div>
			</div>	
			</div>
		</c:forEach>	
	</div>
	
</div>

<div class="container mb15 group-index">
	<div class="row">
		<div class="col-xs-12">
			<div class="title-block">
				<div class="wrap-content">
					<h3 class="title-group">SẢN PHẨM XEM NHIỀU</h3>
					<div class="title-group-note">Danh sách sản phẩm được khách hàng xem nhiều nhất</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row box-product-lists clear-item">
	<c:forEach items="${listProductMostView }" var="product">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6 product-wrapper product-resize mb30 ">
			<div class="product-information">
				<div class="product-detail clearfix">
					<div class="product-image image-resize">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<picture>
								<source media="(max-width: 991px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<source media="(min-width: 992px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<img  src="${pageContext.request.contextPath }/files/${product.picture}" alt="${product.picture}" />
							</picture>
						</a>
						<div class="product-icon-new " style="display: none;">
							<svg class="svg-next-icon svg-next-icon-size-36" style="fill:#d80027">
							</svg>
						</div>
							<div class="box-position-quickview">
					<div class="wrap-btn-quickview">
					<button class="btn-style-buynow addnow btn-success"  data-toggle="modal" data-target="#myModal-${product.id }"> <span class='text-btn' >Mua ngay</span></button>
					</div>
				</div>
				<div class="modal fade" id="myModal-${product.id }" role="dialog">
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
								        			<img  class="img-rounded" alt="${product.name }" src="${pageContext.request.contextPath }/files/${product.picture }"> 
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
										        	<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he-mua-hang' id='contact-${product.id }' method='post'>
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
																<button onclick="submitForm4(${product.id })" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
															</div>
														</div>
													</div>
												</div>
									      </div>
									    </div>
									</div>
					</div>
					<div class="product-info">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<h3 class="product-title text-center">${product.name }</h3>
						</a>
						<p class="product-box-price clearfix flexbox-grid-default">				
							<span class="price-new flexbox-content text-center"><fmt:formatNumber>${product.price }</fmt:formatNumber>₫</span>
						</p>
					</div>
				</div>
			</div>	
		</div>
	</c:forEach>
	</div>
</div>

<div class="container mb15 group-index">
	<div class="row">
		<div class="col-xs-12">
			<div class="title-block">
				<div class="wrap-content">
					
					<h2 class="title-group">Sản phẩm ngẫu nhiên</h2>
					
					<div class="title-group-note">Một số sản phẩm chọn lựa ngẫu nhiên</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row box-product-lists clear-item">
	<c:forEach items="${listItemsRandom }" var="product">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6 product-wrapper product-resize mb30 ">
			<div class="product-information">
				<div class="product-detail clearfix">
					<div class="product-image image-resize">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<picture>
								<source media="(max-width: 991px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<source media="(min-width: 992px)" srcset="${pageContext.request.contextPath }/files/${product.picture}">
								<img src="${pageContext.request.contextPath }/files/${product.picture}" alt="${product.picture}" />
							</picture>
						</a>
						<div class="product-icon-new " style="display: none;">
							<svg class="svg-next-icon svg-next-icon-size-36" style="fill:#d80027">
							</svg>
						</div>
							<div class="box-position-quickview">
					<div class="wrap-btn-quickview">
					<button class="btn-style-buynow addnow btn-success"  data-toggle="modal" data-target="#myModal-${product.id }"> <span class='text-btn' >Mua ngay</span></button>
					</div>
				</div>
				<div class="modal fade" id="myModal-${product.id }" role="dialog">
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
								        			<img  class="img-rounded" alt="${product.name }" src="${pageContext.request.contextPath }/files/${product.picture }"> 
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
										        	<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/lien-he-mua-hang' id='contact-${product.id }' method='post'>
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
																<button onclick="submitForm1(${product.id })" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
															</div>
														</div>
													</div>
												</div>
									      </div>
									    </div>
									</div>
					</div>
					<div class="product-info">
						<a href="${pageContext.request.contextPath }/san-pham/${slug.makeSlug(product.name)}/${product.id}" title="${product.name }">
							<h3 class="product-title text-center">${product.name }</h3>
						</a>
						<p class="product-box-price clearfix flexbox-grid-default">				
							<span class="price-new flexbox-content text-center"><fmt:formatNumber>${product.price }</fmt:formatNumber>₫</span>
						</p>
					</div>
				</div>
			</div>	
		</div>
	</c:forEach>
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
									function submitForm1(id) {
										$('form#contact-'+id).submit();
									}
									function submitForm2(id) {
										$('form#contact-'+id).submit();
									}
									function submitForm3(id) {
										$('form#contact-'+id).submit();
									}
									function submitForm4(id) {
										$('form#contact-'+id).submit();
									}
									/* $(document).on("click", ".form-contact button[aria-label='Close']", function(e){
										$('form#contact').submit();
									}); */
								</script>
								


<div class="clearbox"></div>
<div class="container mb15 group-index">
	<div class="row">
		<div class="col-xs-12">
			<div class="title-block">
				<div class="wrap-content">
					<h2 class="title-group">Thương hiệu</h2>
					<div class="title-group-note">Thương hiệu nổi bật của chúng tôi</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="brand-carousel">
			<div class="owl-carousel">
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_1fc46.png?1521465605103" alt="logo 1" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_2fc46.png?1521465605103" alt="logo 2" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_3fc46.png?1521465605103" alt="logo 3" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_4fc46.png?1521465605103" alt="logo 4" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_5fc46.png?1521465605103" alt="logo 5" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_6fc46.png?1521465605103" alt="logo 6" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_7fc46.png?1521465605103" alt="logo 7" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_8fc46.png?1521465605103" alt="logo 8" />
					</a>
				</div>				
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_9fc46.png?1521465605103" alt="logo 9" />
					</a>
				</div>			
				<div class="item">
					<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/templates/public/assets/567558/assets/partner_10fc46.png?1521465605103" alt="logo 10" />
					</a>
				</div>							
			</div>
		</div>
	</div>
</div>
</main>