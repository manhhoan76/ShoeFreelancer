<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>	
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Thêm sản phẩm mới</strong>
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
				                  <span class="badge badge-pill badge-danger"></span> ${msg1 }
				                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
                       		</c:if>
			            </div>
	                        <form action="${pageContext.request.contextPath }/admin/product-add" method="post" id="add-product" enctype="multipart/form-data" >
	                          <div class="form-group col-sm-6 col-xs-12"><label  class=" form-control-label">Tên mặt hàng</label><input type="text" id="name" name="name" placeholder="Nhập tên mặt hàng" class="form-control"></div>
	                          <div class="form-group col-sm-4  col-xs-12">
	                          	<label  class=" form-control-label">Danh mục</label>
	                          	<select class="form-control" name="id_category">
	                          		<c:forEach items="${listCat }" var="cat">
	                          			<option <c:if test="${cat.id == product.id_category }">selected='selected'</c:if> value="${cat.id }" >${cat.name }</option>
	                          		</c:forEach>
	                          	</select>
	                          </div>
	                          <div class="form-group col-sm-2 col-xs-12"><label  class=" form-control-label">Giá bán</label><input type="number" id="price" name="price" placeholder="Nhập giá bán" class="form-control"></div>
	                          <div class="form-group col-sm-12  col-xs-12"><label  class=" form-control-label">Hình ảnh</label><input type="file" id="file" multiple="multiple" name="image" class="form-control" ></div>
	                           <div class="form-group col-sm-12  col-xs-12"><label  class=" form-control-label">Mô tả</label>
	                          	<textarea rows="4" cols="" name="description" id="editor" class="form-control"></textarea>
	                          </div>
	                          <div class="form-group "><button type="submit" class="btn btn-primary btn-sm">
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
	   // var editor = CKEDITOR.replace('editor');
		//CKFinder.setupCKEditor(editor,'${pageContext.request.contextPath}/templates/admin/ckfinder');
			
		/* function CKupdate(){
	       	for ( instance in CKEDITOR.instances )
	          	CKEDITOR.instances[instance].updateElement();	
	           }; */
	    $(document).ready(function() {
         		$('#add-product').validate({
         			/* ignore: [], */
         			rules:{
         				name: {
         					required: true,
         				}, 
         				price: {
         					required: true,
         					number: true,
         				},
         				image: {
         					required: true,
         				},
         				description: {
         					required: true,
         				}, 
         			},
         			messages:{
         				name: {
         					required: "Bạn chưa nhập tên mặt hàng",
         				}, 
         				price: {
         					required: "Bạn chưa nhập giá",
         					number: "Giá phải dạng số",
         				}, 
         				image: {
         					required: "Bạn chưa chọn ảnh",
         				},
         				description: {
         					required: "Bạn chưa nhập mô tả",
         				}, 
         			},
         		});
           	});
	           
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
	   
	                
