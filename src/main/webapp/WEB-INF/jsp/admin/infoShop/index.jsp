<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp"%>
<div class="col-lg-12">
	<div class="card">
		<div class="card-header">
			<strong class="card-title">Thông tin cửa hàng</strong>
		</div>
		<div class="card col-sm-12">
			<c:if test="${msg != null }">
						<div class="alert  alert-success alert-dismissible fade show"
							role="alert">
							<span class="badge badge-pill badge-success"
								style="align-content: center;"></span> ${msg }
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:if>
					<c:if test="${msg1 != null }">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<span class="badge badge-pill badge-success"></span> ${msg1 }
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:if>
			<div class="card-body">
				<form action="${pageContext.request.contextPath }/admin/info-shop-edit"
					method="post" id="info-shop">
					<div class="form-group col-md-6 col-sm-12">
						<label class=" form-control-label">Tên cửa hàng</label> <input
							name="name" type="text" id="name" class="form-control" value="${info.name}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Số điên thoại</label>
						<input type="text" id="phone" name="phone" class="form-control" value="${info.phone}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Email</label>
						<input type="text" id="email" name="email" class="form-control" value="${info.email}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Địa chỉ</label>
						<input type="text" id="address" name="address" class="form-control" value="${info.address}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Link facebook </label>
						<input type="text" id="link_fb" name="link_fb" class="form-control" value="${info.link_fb}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Zalo </label>
						<input type="text" id="zalo" name="zalo" class="form-control" value="${info.zalo}">
					</div>
					<div class="form-group col-sm-12">
						<button type="submit" class="btn btn-primary btn-sm">
							<i class="fa fa-dot-circle-o"></i> Cập nhật
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
		$('#info-shop').validate({
			ignore : [],
			rules : {
				email : {
					email : true
				},
			},
			messages : {
				email : {
					email : "<b style='color:red '>Email không đúng định dạng",
				},
			},
		});
	});
</script>



