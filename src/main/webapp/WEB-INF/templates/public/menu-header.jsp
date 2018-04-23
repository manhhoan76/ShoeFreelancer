<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<header class="hidden-xs">
	<div class="container">
		<div class="row">
			<div class="flexbox-grid-default col-xs-12">
				<div class="flexbox-content flexbox-align-self-center">
					
				</div>
				<div class="flexbox-content flexbox-align-self-center">
					<div class="logo">
						<h1 class="hidden">${infoShop.name}</h1>
						<a href="index.html" title="Rossy Store">
							<img src="assets/567558/assets/logofc46.png?1521465605103" alt="Rossy Store" />
						</a>
					</div>
				</div>
				<div class="flexbox-content flexbox-align-self-center">
					<ul class="icon-control-header text-right">
						<li class="search-header">
							<div class="dropdown btn-group">
								<a href="#" data-toggle="dropdown">
									<svg class="svg-next-icon svg-next-icon-size-24">
										<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-search-filter"></use>
									</svg>
								</a>
								<div class="dropdown-menu">
									<form action="${pageContext.request.contextPath}/tim-kiem.html">
										<input type="text" class="form-control" name="s" placeholder="Tìm kiếm..." />
									</form>
								</div>
							</div>
						</li>
						<li>
							<div class="support-phone-header">
								<a href="tel:${infoShop.phone}">
									<svg class="svg-next-icon svg-next-icon-size-30" style="fill:#58b3f0">
										<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-phone-header"></use>
									</svg>
									<span class="ml5">${infoShop.phone}</span>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
<nav class="navbar-main navbar navbar-default cl-pri">		
	<!-- MENU MAIN -->
	<div class="container nav-wrapper">
		<div class="row">
			<div class="navbar-header">				
				<div class="flexbox-grid-default hidden-lg hidden-md hidden-sm">
					<div class="flexbox-content text-center box-logo-mobile">
						<div class="logo-mobile">
							<a href="index.html" title="Rossy Store">
								<img src="assets/567558/assets/logofc46.png?1521465605103" alt="Rossy Store" />
							</a>
						</div>
					</div>
					<div class="flexbox-auto">
						<div class="mobile-menu-icon-wrapper">					
							<ul class="mobile-menu-icon clearfix">
								<li class="search">
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle icon-search" data-toggle="dropdown" aria-expanded="false">
											<svg class="svg-next-icon svg-next-icon-size-20">
												<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-search-filter"></use>
											</svg>
										</button>
										<div class="dropdown-menu" role="menu">
											<div class="search-bar">
												<div class="">
													<form class="col-md-12" action="${pageContext.request.contextPath}/tim-kiem.html">
														<input type="text" class="form-control" name="s" placeholder="Tìm kiếm..." />
													</form>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<div class="row clearfix">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<ul class="nav navbar-nav clearfix flexbox-grid flexbox-justifyContent-center">
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
			</div>
		</div>
	</div>
</nav>
