<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/templates/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Danh sách danh mục</strong>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/category-add"><i class="fa fa-plus"></i></a>
                        </div>
                        <c:choose>
                         <c:when test="${msg == 0 }">
                         	<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                                    Thêm danh mục thất bại
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                        <c:when test="${msg == 1 }">
                         	<div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                    Bạn đã thêm danh mục thành công
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                          <c:when test="${msg == 3 }">
                         	<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                                    Sửa danh mục thất bại
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                        <c:when test="${msg == 2 }">
                         	<div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                    Bạn đã sửa danh mục thành công
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                          <c:when test="${msg == 5 }">
                         	<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                                    Xóa danh mục thất bại
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                        <c:when test="${msg == 4 }">
                         	<div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                    Bạn đã xóa danh mục thành công
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                        </c:choose>
                        <div class="table-responsive">
                          <div class="card-body">
                            <table id="myTable" class="table table-bordered">
                              <thead>
                                <tr>
                                  <th scope="col">ID</th>
                                  <th scope="col">Tên danh mục</th>
                                  <th scope="col">Hành động</th>
                                </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${listCat }" var="objCat">
                                <tr>
                                  <th scope="row">${objCat.id }</th>
                                  <td>${objCat.name }</td>
                                  <td>
                                  	<a href="${pageContext.request.contextPath }/admin/category-edit/${objCat.id}">Sửa<i class="fa fa-edit"></i></a>
                                  	<a onclick="return confirm('Bạn có muốn xóa không (chú ý: Sẽ xóa tất cả các sản phẩm trong danh mục này)')" href="${pageContext.request.contextPath }/admin/category-delete/${objCat.id}">Xóa<i class="fa fa-remove"></i></a>
                                  </td>
                                </tr>
                                 </c:forEach>
                              
                              </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>

   
                
