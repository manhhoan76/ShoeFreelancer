<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>	
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Sửa sản phẩm</strong>
                        </div>
                        <div class="card col-sm-12">
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
				                  <span class="badge badge-pill badge-success"></span> ${msg1 }
				                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
                       		</c:if>
			            </div>
	                        <form action="${pageContext.request.contextPath }/admin/product-edit" method="post" id="edit-product" enctype="multipart/form-data" >
	                          <div class="form-group col-sm-12 col-xs-12"><input type="hidden" id="id" name="id" value="${product.id }" class="form-control"></div>
	                          <div class="form-group col-sm-5 col-xs-12"><label  class=" form-control-label">Tên mặt hàng</label><input type="text" id="name" name="name" value="${product.name }" placeholder="Nhập tên mặt hàng" class="form-control"></div>
	                          <div class="form-group col-sm-4 col-xs-12">
	                          	<label  class=" form-control-label">Danh mục</label>
	                          	<select class="form-control" name="id_category">
	                          		<c:forEach items="${listCat }" var="cat">
	                          			<option <c:if test="${cat.id == product.id_category }">selected='selected'</c:if> value="${cat.id }" >${cat.name }</option>
	                          		</c:forEach>
	                          	</select>
	                          </div>
	                          <div class="form-group col-sm-3 col-xs-12"><label  class=" form-control-label">Giá bán</label><input type="number" id="price" name="price" value="${product.price }" placeholder="Nhập giá bán" class="form-control"></div>
	                           <div class="form-group col-sm-12 col-xs-12"><label  class=" form-control-label">Mô tả</label>
	                          	<textarea rows="4" cols="" name="description" id="editor" class="form-control">${product.description }</textarea>
	                          </div>
	                          <div class="form-group col-sm-12 col-xs-12"><input type="hidden" id="id" name="id" value="${product.id }"  class="form-control"></div>
	                           <div class="form-group col-sm-12 col-xs-12"><label  class=" form-control-label">Chọn hình hiển trị trang chủ</label>
	                           		<input type="file" id="file" name="image" class="form-control" >
	                           </div>
				               
	                          <div align="center" style="padding-top: 50px;" class="form-group col-sm-12">
	                          	<button type="submit" class="btn btn-primary btn-sm">
		                          <i class="fa fa-edit-circle"></i>&nbsp;Cập nhật
		                        </button>
		                          <a href="${pageContext.request.contextPath }/admin/product" class="btn btn-danger btn-sm"><i class="fa fa-ban"></i>&nbsp;Hủy</a>
		                        
		                        </div>
	                        </form>
	                        <script type="text/javascript">
		                        var _URL = window.URL || window.webkitURL;
	
		                        $("#file").change(function (e) {
		                          var image, file;
		                          if ((file = this.files[0])) {
	
		                                image = new Image();
	
		                                image.onload = function () {
	
		                                    if((this.width != 480) && (this.height != 480)){
		                                  	  alert('Kích thướt ảnh không phù hợp. Chiều rộng 480pixel. Chiều cao 480pixel');
		                                  	  //window.location = window.location.href;
		                                  	  document.getElementById("file").value = "";
		                                    }
		                                };
	
		                                image.src = _URL.createObjectURL(file);
		                            }
	
		                        });
	                        </script>
	                        <div style="padding-top: 50px;" class="col-md-12">
				                 <div align="center" style="padding-bottom: 25px;" class="col-md-12">
				                 	<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus-circle"></i>&nbsp;Thêm hình ảnh chi tiết</button>
				                 </div>
		                           	<div class="modal fade" id="myModal" role="dialog">
									    <div class="modal-dialog">
									      <!-- Modal content-->
									      <div class="modal-content">
									        <div class="modal-header">
									        	<h2>Thêm hình ảnh để mô tả</h2>
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									        </div>
									        <div class="modal-body">
									          <form action="${pageContext.request.contextPath}/admin/product/${product.id}/add-img" method="post" enctype="multipart/form-data">
									          	<div class="form-group col-sm-12"><input class="form-control" type="file" name="image" multiple="multiple" /></div>
									          	<div class="form-group col-sm-12"><button style="float: right;" type="submit" class="btn btn-primary" >Thêm ảnh</button></div>
									          </form>
									        </div>
									      </div>
									    </div>
									</div>
				            </div>
	                        <div class="ajaxImage">
		                        <c:set var="count" value="1"></c:set>
		                        <c:forEach items="${listPicture }" var="picture">
		                       	<c:if test="${count % 3 == 1 }">
		                      	  <div class="col-md-12 listImage">
		                       	</c:if>
									<div class="col-md-4">
					                        <div class="card">                            
					                            <div class="card-body">
													<a onclick="return delImage(${picture.id},${picture.id_product})" href="javascript:void(0)">
														<small><span class="badge badge-danger float-right mt-1"><i class = "fa fa-remove"></i></span></small>
													</a>
					                                <img style="width: 250px; height: 175px;" class="rounded mx-auto d-block" src="${pageContext.request.contextPath }/files/${picture.name }" alt="${picture.name }">
					                            </div>
					                        </div>
					                    </div>
					              <c:if test="${count % 3 == 0 || listPicture.size() == count }">
					           		 </div>
					           	  </c:if>
					           	  <c:set var="count" value="${count + 1 }"></c:set>
					             </c:forEach>
				            </div>
				            
	                      </div>
	                    </div>
                    </div>
                </div>
	<script type="text/javascript">
	  //  var editor = CKEDITOR.replace('editor');
	//	CKFinder.setupCKEditor(editor,'${pageContext.request.contextPath}/templates/admin/ckfinder');
			
        
	    $(document).ready(function() {
         		$('#edit-product').validate({
         			 ignore: [],
         			rules:{
         				name: {
         					required: true,
         				}, 
         				price: {
         					required: true,
         					number: true,
         				},
         				description: {
         					required: true,
         			},
         			messages:{
         				name: {
         					required: "Bạn chưa nhập tên mặt hàng",
         				}, 
         				price: {
         					required: "Bạn chưa nhập giá",
         					number: "Giá phải dạng số",
         				}, 
         				description: {
         					required: "Bạn chưa nhập mô tả",
         				}, 
         			},
         		});
           	});
	    
           </script>
           
           <script type="text/javascript">
				function delImage(id,id_product) {
					$.ajax({
						url : '${pageContext.request.contextPath }/admin/product/'+id_product+'/del-img/'+id,
						type : 'POST',
						cache : false,
						data : {
						},
						success : function(data) {
							if(data == 'ERROR'){
								alert('Có lổi khi xóa ảnh!');
							}else{
								$(".ajaxImage").html(data);
							}
						},
						error : function() {
							alert('Có lổi khi xóa ảnh');
						}
					});
				}
			</script>
	   
	                
