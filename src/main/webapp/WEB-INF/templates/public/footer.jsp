<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   </div>
   </div>
   </div>
   </div>
   </div>
<footer>
	<div class="footer-center">
		<div class="container">
			<div class="row">			
				<div class="col-lg-5 col-md-3 col-sm-6 col-xs-12 pd5">
					<div class="box-footer-colum">
						<h4 class="">Liên hệ</h4>
						<ul class="footer-list-menu">							
							<li class="footer-address">${infoShop.address}</li>														
							<li class="fooer-phone">
								<label class="mr5">Điện thoại: </label><span><a href="tel:${infoShop.phone}">${infoShop.phone}</a></span>
							</li>											
							<li class="footer-email">
								<label class="mr5">Email: </label><span><a href="mailto:${infoShop.email}">${infoShop.email}</a></span>
							</li>							
						</ul>
					</div>
				</div>		
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pd5">
					<div class="box-footer-colum">
						<h4 class="">Fanpage</h4>
						<div style="width:100%; ">
							<div class="fb-page" data-href="${infoShop.link_fb}" data-width="260" data-small-header="false"  >
								<blockquote cite="${infoShop.link_fb}" class="fb-xfbml-parse-ignore">
									<a href="${infoShop.link_fb}">SHOE SHOP ONLINE</a>
								</blockquote>
							</div>
						</div>
					</div>
				</div>
					
				<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 pd5">
					<div class="box-footer-colum">
						<!-- <h4 class="">Chính sách hỗ trợ</h4> -->
						<div align="center">
							<img style="width: 150px; height: 100px;" alt="adidas.jpg" src="${pageContext.request.contextPath }/templates/public/add.jpg">
							<img style="width: 150px; height: 100px;" alt="nike.jpg" src="${pageContext.request.contextPath }/templates/public/nike.jpeg">
						</div>						
						<!-- <ul class="footer-list-menu">													
							<li>
								<a href="https://rossy-store.bizwebvietnam.net/huong-dan-thanh-toan" title="Hướng dẫn thanh toán">Hướng dẫn thanh toán</a>
							</li>
							<li>
								<a href="https://rossy-store.bizwebvietnam.net/giao-hang-tan-nha" title="Giao hàng tận nhà">Giao hàng tận nhà</a>
							</li>
							<li>
								<a href="https://rossy-store.bizwebvietnam.net/chinh-sach-doi-tra" title="Chính sách đổi trả">Chính sách đổi trả</a>
							</li>
							<li>
								<a href="https://rossy-store.bizwebvietnam.net/chinh-sach-bao-mat" title="Chính sách bảo mật">Chính sách bảo mật</a>
							</li>														
						</ul> -->
					</div>
				</div>								
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="pd5 text-center">
			<div class="footer-copyright">
				<div class="inline-block">&copy; Shoe shop online <a href="" target="_blank"></a>. </div>
				<div class="inline-block"><a href="${infoShop.link_fb}" rel="nofollow" target="_blank">Nguyễn Tuấn Huy</a>.</div>                
			</div>
		</div>
	</div>
</footer>
		<div class="hotline-mobile hidden-lg">
			<a href="tel:${infoShop.phone}">
				<svg class="svg-next-icon svg-next-icon-size-40" style="fill:#58b3f0">
					<use xmlns:xlink="" xlink:href="#icon-phone-header"></use>
				</svg>
			</a>
		</div>	