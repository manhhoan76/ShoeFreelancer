<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
              <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Danh sách hình ảnh banner</strong>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/banner-add"><i class="fa fa-plus"></i></a>
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
                                  <th scope="col">ID</th>
                                  <th align="center">Hình ảnh</th>
                                  <th scope="col">Hành động</th>
                                </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${listBanner }" var="banner">
                                <tr>
                                  <th scope="row">${banner.id }</th>
                                  <td align="center"><img style="width: 250px;" alt="${banner.picture }" src="${pageContext.request.contextPath }/files/${banner.picture }"></td>
                                  <td>
                                  	<a href="${pageContext.request.contextPath }/admin/banner-edit/${banner.id}">Sửa&nbsp;<i class="fa fa-edit"></i></a>
                                  	<a onclick="confirm('Bạn có chắc chắn muốn xóa?')" href="${pageContext.request.contextPath }/admin/banner-del/${banner.id}">Xóa&nbsp;<i class="fa fa-remove"></i></a>
                                  </td>
                                </tr>
                                 </c:forEach>
                              
                              </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                </div> 

   
