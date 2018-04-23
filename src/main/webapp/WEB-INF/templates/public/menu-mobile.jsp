<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/templates/taglib.jsp" %>
<div id="menu-mobile">
	<div class="clearfix">
		<h3>${infoShop.name}</h3>
		<ul class="menu-mobile">
							<li>
								<a href="${pageContext.request.contextPath}/trang-chu" title="Trang chủ" class="${activeTC}">Trang chủ</a>
							</li>
							<li class="">
								<a href="${pageContext.request.contextPath}/gioi-thieu" title="Giới thiệu" class="${activeGT}">Giới thiệu</a>
							</li>
							<li class="">
								<a href="javascript:void(0)" title="Danh mục" class="${activeDM}">Danh mục<i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu submenu-level1-children" role="menu">
									<c:forEach var="item" items="${listCatHeader}">
										<li>
											<a href="${pageContext.request.contextPath }/${slug.makeSlug(item.name)}/${item.id}" <c:if test="${id == item.id}">class="menu-active"</c:if> title="${item.name}">${item.name}</a>
										</li>
									</c:forEach>
								</ul>
							</li>
							<li class="">
								<a href="${pageContext.request.contextPath}/lien-he" title="Liên hệ" class="${activeLH}">Liên hệ</a>
							</li>	
		</ul>
	</div>	
</div>	
<script>
function hide_float_right() {
	$('.float-ck').css('left','-' + $('.float-ck').width() + 'px');
	$('.float-ck').find('.show_qc').show();
	$('.float-ck').find('.hide_qc').hide();
	Nobita.setCookiePopup('close',7,'banner-left');
}
function show_float_right() {
	$('.float-ck').css('left','0');
	$('.float-ck').find('.show_qc').hide();
	$('.float-ck').find('.hide_qc').show();
	Nobita.setCookiePopup('open',7,'banner-left');
}
var checkCookieBannerLeft = function (name) {
	var username = Nobita.getCookiePopup(name);
	if (username != "" && username == 'close') {
		hide_float_right();
		setTimeout(function(){
			$('.float-ck').css('opacity','1');
		},1000);
	} else {
		show_float_right();
		setTimeout(function(){
			$('.float-ck').css('opacity','1');
		},1000);
	}
}
$(document).ready(function(){
	setTimeout(function(){
		checkCookieBannerLeft('banner-left');
	},1000);
});
</script>
		
<div class="back-to-top">
	<a href="javascript:void(0);">
		<svg class="svg-next-icon svg-next-icon-size-30" style="fill:#58b3f0">
			<use xlink:href="#icon-scrollUp-bottom"></use>
		</svg>
	</a>
</div>
		