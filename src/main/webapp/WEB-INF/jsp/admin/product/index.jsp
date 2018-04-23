<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Danh sách mặt hàng</strong>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/product-add"><i class="fa fa-plus-circle"></i></a>
                        </div>
                        <div class="table-responsive">
                        	<div class="card-body">
	                        	<div class="col-sm-12">
	                        		<c:if test="${msg != null }">
	                        			<div class="alert  alert-success alert-dismissible fade show" role="alert">
						                  <span class="badge badge-pill badge-success" style="align-content: center;"></span> ${msg }
						                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						                        <span aria-hidden="true">&times;</span>
						                    </button>
						                </div>
	                        		</c:if>
	                        		<c:if test="${msg1 != null }">
	                        			<div class="alert  alert-danger alert-dismissible fade show" role="alert">
						                  <span class="badge badge-pill badge-danger"></span> ${msg1 }
						                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						                        <span aria-hidden="true">&times;</span>
						                    </button>
						                </div>
	                        		</c:if>
					            </div>
					         
                            <table id="myTable" class="table table-bordered">
                              <thead>
                                <tr>
                                  <th scope="col">ID mặt hàng</th>
                                  <th scope="col">Tên mặt hàng</th>
                                  <th scope="col">Thuộc Danh mục</th>
                                  <th scope="col">Người đăng</th>
                                  <th scope="col">Ngày đăng</th>
                                  <th scope="col">Hình ảnh</th>
                                  <th scope="col">Giá bán</th>
                                  <th scope="col">Lượt xem</th>
                                  <th scope="col">Hành động</th>
                                </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${listProduct }" var="product">
                                <tr>
                               	 <td scope="row">${product.id }</td>
                                  <td>${product.name }</td>
                                  <td>${product.nameCat }</td>
                                  <td>${product.nameUser }</td>
                                  <td>${product.date_create }</td>
                                  <td><img alt="${product.picture}" width="200px;" src="${pageContext.request.contextPath }/files/${product.picture}"></td>
                                  <td><fmt:formatNumber value="${product.price }" ></fmt:formatNumber> VND</td>
                                  <td>${product.product_view }</td>
                                  <td>
                                  	<a href="${pageContext.request.contextPath }/admin/product-edit/${product.id}">Sửa&nbsp;<i class="fa fa-edit"></i></a>
                                  	<a onclick="confirm('Bạn có chắc chắn muốn xóa?')" href="${pageContext.request.contextPath }/admin/product-del/${product.id}">Xóa&nbsp;<i class="fa fa-remove"></i></a>
                                  </td>
                                </tr>
                              </c:forEach>
                              </tbody>
                            </table>
                             </div>
                        </div>
                    </div>
                </div>

   
                
