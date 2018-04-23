<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

		<header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                       <!--  <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div> -->

                   <!--      <div class="dropdown for-notification">
                          <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-bell"></i>
                            <span class="count bg-danger">5</span>
                          </button>
                          <div class="dropdown-menu" aria-labelledby="notification">
                            <p class="red">You have 3 Notification</p>
                            <a class="dropdown-item media bg-flat-color-1" href="#">
                                <i class="fa fa-check"></i>
                                <p>Server #1 overloaded.</p>
                            </a>
                            <a class="dropdown-item media bg-flat-color-4" href="#">
                                <i class="fa fa-info"></i>
                                <p>Server #2 overloaded.</p>
                            </a>
                            <a class="dropdown-item media bg-flat-color-5" href="#">
                                <i class="fa fa-warning"></i>
                                <p>Server #3 overloaded.</p>
                            </a>
                          </div>
                        </div> -->

                        <div class="dropdown for-message">
                          <button class="btn btn-secondary dropdown-toggle" type="button"
                                id="message"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ti-email"></i>
                            <span class="count bg-primary" id="numberContact">${numberContact }</span>
                          </button>
                          <div class="dropdown-menu" aria-labelledby="message">
                          <c:choose>
                          	<c:when test="${numberContact != 0 }">
                          		 <p class="red">Bạn có ${numberContact } liên hệ chưa đọc</p>
                          	</c:when>
                          	<c:otherwise>
                          		 <p class="red">Bạn không liên hệ nào cả</p>
                          	</c:otherwise>
                          </c:choose>
                            <c:forEach items="${listContactShow }" var="objContact">
                            	<a  class="dropdown-item media bg-flat-color-3" href="${pageContext.request.contextPath }/admin/contact-detail/${objContact.id}">
                                <span class="message media-body">
                                    <span class="name float-left">${objContact.name_customer }</span>
                                        <p>${objContact.message }</p>
                                </span>
                            </a>
                            </c:forEach>
                          </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath }/templates/admin/images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="${pageContext.request.contextPath }/admin/user-edit/${userInfo.id}"><i class="fa fa- user"></i>Trang cá nhân</a>
                                <a class="nav-link" href="${pageContext.request.contextPath }/logout"><i class="fa fa-power -off"></i>Đăng xuất</a>
                        </div>
                    </div>

                </div>
            </div>

        </header>
       