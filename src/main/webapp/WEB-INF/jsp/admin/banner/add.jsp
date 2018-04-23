<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>	
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Thêm hình ảnh mới cho banner</strong>
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
	                        <form action="${pageContext.request.contextPath }/admin/banner-add" method="post" id="add-banner" enctype="multipart/form-data">
	                          <div class="form-group col-sm-6 img">
	                          		<label  class=" form-control-label">Chọn hình ảnh</label>
	                          		<input type="file"  id="file" name="image" class="form-control">
	                          </div>
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
	            		$('#add-banner').validate({
	            			ignore: [],
	            			rules:{
	            				image: {
	            					required: true,
	            				}, 
	            			},
	            			messages:{
	            				image: {
	            					required: "Bạn chưa chọn hình ảnh",
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

	                          if((this.width != 1140) && (this.height != 428)){
	                        	  alert('Kích thướt ảnh không phù hợp. Chiều rộng 1140pixel. Chiều cao 428pixel');
	                        	  //window.location = window.location.href;
	                        	  document.getElementById("file").value = "";
	                          }
	                      };

	                      image.src = _URL.createObjectURL(file);
	                  }

	              });
	              
	             /*  document.getElementById('file').onchange = function(evt) {
	            	    ImageTools.resize(this.files[0], {
	            	        width: 1140, // maximum width
	            	        height: 428 // maximum height
	            	    }, function(blob, didItResize) {
	            	        // didItResize will be true if it managed to resize it, otherwise false (and will return the original file as 'blob')
	            	        document.getElementById('preview').src = window.URL.createObjectURL(blob);
	            	        // you can also now upload this blob using an XHR.
	            	    });
	            	}; */
	            </script>
	   
	                
