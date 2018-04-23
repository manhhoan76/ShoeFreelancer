<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="col-lg-12">
	<div class="card">
		<div class="card-header">
			<strong class="card-title">Danh sách tài khoản</strong> <a
				class="btn btn-primary"
				href="${pageContext.request.contextPath }/admin/user-add"><i
				class="fa fa-plus"></i></a>
		</div>
		<div class="table-responsive">
			<div class="card-body">
				<div class="col-sm-12">
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
						<div class="alert  alert-danger alert-dismissible fade show"
							role="alert">
							<span class="badge badge-pill badge-success"></span> ${msg1 }
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:if>
				
				</div>
				<table id="myTable" class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">ID tài khoản</th>
							<th scope="col">Tên tài khoản</th>
							<th scope="col">Mật khẩu</th>
							<th scope="col">Tên đầy đủ</th>
							<th scope="col">Email</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col">Cấp bật</th>
							<th scope="col">Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listUsers }" var="user">
							<tr>
								<th scope="row">${user.id}</th>
								<td>${user.username}</td>
								<td>********</td>
								<td>${user.fullname}</td>
								<td>${user.email}</td>
								<td>${user.phone}</td>
								<td>${user.address}</td>
								<td>${user.nameRole}</td>
								<td>
									<c:if test="${userInfo.id_role == admin.id || userInfo.id == user.id}">
											<a href="${pageContext.request.contextPath }/admin/user-edit/${user.id}">Sửa&nbsp;<i
											class="fa fa-edit"></i></a>
											<c:if test="${userInfo.id_role == admin.id}">
												<a onclick="confirm('Bạn có chắc chắn muốn xóa?')" href="${pageContext.request.contextPath }/admin/user-del/${user.id}" onclick="return confirmAction()">Xóa&nbsp;<i
												class="fa fa-remove"></i></a>
											</c:if>
									</c:if>
								
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function confirmAction() {
	return confirm("Bạn có chắc muốn xóa tài khoản này?")
	}
</script> 



