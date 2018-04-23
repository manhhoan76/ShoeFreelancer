<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
 <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <%-- <a class="navbar-brand" href="./"><img src="${pageContext.request.contextPath}/templates/admin/images/logo11.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="${pageContext.request.contextPath}/templates/admin/images/logo11.png" alt="Logo"></a> --%>
                <p class="navbar-brand" style="width: 220px;"><a href="${ pageContext.request.contextPath }/admin">ADMIN SHOP</a></p>
                <p class="navbar-brand hidden"><a href="${ pageContext.request.contextPath }/admin">AD</a></p>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                   	<c:if test="${userInfo.id_role == 1}">
                   		<li class="${activeTK}">
                        	<a href="${pageContext.request.contextPath }/admin/user"> <i class="menu-icon fa fa-user"></i>Quản lí tài Khoản</a>
                    	</li>
                   	</c:if>
                    <li class="${activeLH}">
                        <a href="${pageContext.request.contextPath }/admin/contact"> <i class="menu-icon ti-email"></i>Quản lí liên Hệ</a>
                    </li>
                    <li class="${activeDM}">
                        <a href="${pageContext.request.contextPath }/admin/category"> <i class="menu-icon fa fa-folder-o"></i>Quản lí danh mục</a>
                    </li>
                    <li class="${activeSP}">
                        <a href="${pageContext.request.contextPath }/admin/product"> <i class="menu-icon fa fa-shopping-cart"></i>Quản lí mặt hàng</a>
                    </li>
                    <li class="${activeBN}">
                        <a href="${pageContext.request.contextPath }/admin/banner"> <i class="menu-icon fa fa-picture-o"></i>Quản lí ảnh Banner</a>
                     <li class="${activeIS}">
                        <a href="${pageContext.request.contextPath }/admin/info-shop"> <i class="menu-icon fa fa-info"></i>Thông tin cửa hàng</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->