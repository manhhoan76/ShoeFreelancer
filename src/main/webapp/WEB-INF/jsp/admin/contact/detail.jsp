<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/templates/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Liên Hệ > Chi Tiết</strong>
                        </div>
                         <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                 <i class="fa fa-user"></i> ${objContact.name_customer } 
                            </li>
                            <li class="list-group-item">
                                 <i class="fa fa-envelope-o"></i> ${objContact.email } 
                            </li>
                            <li class="list-group-item">
                                 <i class="fa fa-phone-square"></i> 0${objContact.phone } 
                            </li>
                            <li class="list-group-item">
                                 <i class="fa fa-comments-o"></i> ${objContact.message }
                            </li>
                        </ul>
                    </div>
                </div>

   
                
