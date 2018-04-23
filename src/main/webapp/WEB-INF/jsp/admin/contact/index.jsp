<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/templates/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Liên Hệ</strong>
                            <a onclick="updateNumberContact()" onmouseup="changeStatus()"   href="javascript:void(0)"><button style="float: right;" type="button" class="btn btn-primary btn-sm">Đánh dấu đọc tất cả</button></a>
                        </div>
                        <c:choose>
                         <c:when test="${msg == 0 }">
                         	<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
                                    Xóa liên hệ thất bại
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                        <c:when test="${msg == 1 }">
                         	<div class="sufee-alert alert with-close alert-primary alert-dismissible fade show">
                                    Bạn đã xóa liên hệ thành công
                                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                         </c:when>
                         </c:choose>
                        <div class="table-responsive ">
                          <div class="card-body">
                            <table id="myTable" class="table table-bordered">
                              <thead>
                                <tr>
                                  <th scope="col">ID</th>
                                  <th scope="col">Tên khách hàng</th>
                                  <th scope="col">Email</th>
                                  <th scope="col">Điện thoại</th>
                                  <th scope="col">Nội dung</th>
                                  <th scope="col">Trạng thái</th>
                                  <th scope="col">Hành động</th>
                                </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${listContact }" var="objContact">
                              <tr>  
                                  <th>${objContact.id }</th>
                                  <td>${objContact.name_customer }</td>
                                  <td>${objContact.email }</td>
                                  <td>0${objContact.phone }</td>
                                  <td>${cutString.cutTittle(objContact.message) }</td>
                                  	<td class="statusContact"><c:choose>
                                  		<c:when test="${objContact.readed == 0 }">
                                  			 <p style="text-align: center; border: 2px solid red;border-radius: 10px;color: red;">Chưa đọc</p>
                                  		</c:when>
										<c:otherwise>
											<p  style="text-align: center;" >Đã đọc</p> 
										</c:otherwise>                                  		
                                  	</c:choose>
                                  	</td>
                                  <td>
                                  	<a href="${pageContext.request.contextPath }/admin/contact-detail/${objContact.id}">Chi tiết<i class="fa fa-edit"></i></a>
                                 	<a onclick="return confirm('Bạn có muốn xóa không')" href="${pageContext.request.contextPath }/admin/contact-delete/${objContact.id}">Xóa<i class="fa fa-remove"></i></a>
                                  </td>
                                </tr>
                               </c:forEach>
                              </tbody>
                            </table>
                        </div>
                      </div>  
                    </div>
                    <script>
						function  updateNumberContact() {
							$.ajax({
								url: '${pageContext.request.contextPath }/admin/contact-updateNumberContact',
								type: 'POST',
								cache: false,
								data: {
										//Dữ liệu gửi đi
										},
								success: function(data){
									// Xử lý thành công
									$('#numberContact').html(data);
								},
								error: function (){
								// Xử lý nếu có lỗi
								alert('Loi');
								}
							});
						}
						function  changeStatus() {
							$.ajax({
								url: '${pageContext.request.contextPath }/admin/contact-changeStatus',
								type: 'POST',
								cache: false,
								data: {
										//Dữ liệu gửi đi
										},
								success: function(data){
									// Xử lý thành công
									$('.statusContact').html(data);
								},
								error: function (){
								// Xử lý nếu có lỗi
								alert('Loi');
								}
							});
						}
					</script>
                </div>

   
                
