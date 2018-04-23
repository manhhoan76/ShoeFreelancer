<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp"%>
<div class="col-lg-12">
	<div class="card">
		<div class="card-header">
			<strong class="card-title">Sửa thông tin người dùng</strong>
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
				<form action="${pageContext.request.contextPath }/admin/user-edit/${objUser.id}"
					method="post" id="add-user">
					<div class="form-group col-md-6 col-sm-12">
						<label class=" form-control-label">Tên tài khoản (*)</label> <input
							name="username" type="text" id="username" disabled="disabled"
							placeholder="Nhập tên tài khoản" class="form-control" value="${objUser.username}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Tên
							đầy đủ (*) </label><input type="text" id="fullname" name="fullname"
							placeholder="Nhập tên đầy đủ" class="form-control" value="${objUser.fullname}">
					</div>
					<c:if test="${session.id_role == listRoles[0].id}">
						<div class="form-group col-md-6 col-sm-12">
							<label>Cấp bậc (*)</label>
							 <select name="id_role" 
								class="form-control">
								<c:forEach items="${listRoles}" var="role">
									<option <c:if test="${role.id == objUser.id_role}">selected='selected'</c:if> value="${role.id}">${role.name}</option>
								</c:forEach>
							</select>
						</div>
					</c:if>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Email
							(*) </label><input type="text" id="email" name="email"
							placeholder="Nhập email" class="form-control" value="${objUser.email}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Số
							điện thoại </label><input type="text" id="phone" name="phone"
							placeholder="Nhập số điện thoại" class="form-control" value="${objUser.phone}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Địa
							chỉ </label><input type="text" id="address" name="address"
							placeholder="Nhập địa chỉ" class="form-control" value="${objUser.address}">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Mật
							khẩu </label><input type="password" id="password" name="password"
							placeholder="Nhập mật khẩu" class="form-control">
					</div>
					<div class="form-group col-md-6 col-sm-12">
						<label for="postal-code" class=" form-control-label">Nhập
							lại mật khẩu </label><input type="password" id="rePassword"
							name="rePassword" placeholder="Nhập lại mật khẩu"
							class="form-control">
					</div>
					<div class="form-group col-sm-12">
						<button type="submit" class="btn btn-primary btn-sm">
							<i class="fa fa-dot-circle-o"></i> Sửa
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
		$('#add-user').validate({
			ignore : [],
			rules : {
				username : {
					minlength:6,
					maxlength:32,
					required : true,
				},
				password : {
					minlength:6,
				},
				rePassword : {
					equalTo : "#password",
				},
				fullname : {
					required : true,
				},
				id_role : {
					required : true,
				},
				email : {
					required : true,
				},
			},
			messages : {
				username : {
					minlength:"<b style='color:red '>Tên truy cập phải có ít nhất 6 ký tự !</b>",
					maxlength:"<b style='color:red '>Tên truy cập có nhiều nhất 32 kí tự !</b>",
					required : "<b style='color:red '>Bạn chưa nhập tên tài khoản",
				},
				password : {
					minlength:"<b style='color:red '>Mật khẩu phải có ít nhất 6 ký tự !</b>",
				},
				rePassword : {
					equalTo : "<b style='color:red '>Xác nhận mật khẩu phải trùng với Mật khẩu ở trên</b>",
				},
				fullname : {
					required : "<b style='color:red '>Bạn chưa nhập tên đầy đủ",
				},
				id_role : {
					required : "<b style='color:red '>Bạn chưa chọn cấp bật",
				},
				email : {
					required : "<b style='color:red '>Bạn chưa nhập email",
				},
			},
		});
	});
</script>



