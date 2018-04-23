<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>	
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Thêm danh mục mới</strong>
                        </div>
                        <c:choose>
                         <c:when test="${msg ==1 }">
                         	<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                                    Tên danh mục đã tồn tại.
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                        
                        </c:choose>
                        <div class="card col-sm-12">
	                      <div class="card-body">
	                        <form action="${pageContext.request.contextPath }/admin/category-add" method="post" id="add-category">
	                          <div class="form-group col-sm-6"><label  class=" form-control-label">Tên mặt hàng</label><input type="text" id="name" name="name" placeholder="Nhập tên danh mục" class="form-control"></div>
	                          <div class="form-group col-sm-12"><button type="submit" class="btn btn-primary btn-sm">
		                          <i class="fa fa-dot-circle-o"></i> Thêm
		                        </button>
		                        <button type="reset" class="btn btn-danger btn-sm">
		                          <i class="fa fa-ban"></i> Đặt Lại
		                        </button>
		                        
		                        </div>
	                        </form>
	                      </div>
	                    </div>
                    </div>
                </div>
	<script type="text/javascript">
	              $(document).ready(function() {
	            		$('#add-category').validate({
	            			ignore: [],
	            			rules:{
	            				name: {
	            					required: true,
	            				}, 
	            			},
	            			messages:{
	            				name: {
	            					required: "Bạn chưa nhập tên danh mục",
	            				}, 
	            			},
	            		});
	            	});
	            </script>
	   
	                
