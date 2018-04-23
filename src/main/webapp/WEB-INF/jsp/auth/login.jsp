<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>LOGIN</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/admin/scss/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body class="bg-dark">


    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="index.html">
                        <img class="align-content" src="images/logo.png" alt="">
                    </a>
                </div>
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
	                        			<div class="alert alert-danger alert-dismissible fade show" role="alert">
						                  <span class="badge badge-pill badge-success"></span> ${msg1 }
						                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						                        <span aria-hidden="true">&times;</span>
						                    </button>
						                </div>
	                        		</c:if>
					            </div>
                <div class="login-form">
                    <form method="post">
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input type="text" name="username" class="form-control" placeholder="Nhập tên đăng nhập">
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu</label>
                            <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu">
                        </div>
                        <div class="checkbox">
                            <label class="">
                                <a href="#" data-toggle="modal" data-target="#myModal">Bạn đã quên mật khẩu?</a>
                            </label>
                        </div>
                        <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Đăng nhập</button>
                    </form>
                </div>
                	<div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					        	<h2>Nhập tên đăng nhập của bạn</h2>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        <div class="modal-body">
					          <form action="${pageContext.request.contextPath}/login/forget-password" method="post">
					          	<div class="form-group col-sm-12"><input class="form-control" type="text" name="username"/></div>
					          	<div class="form-group col-sm-12"><button style="float: right;" type="submit" class="btn btn-primary" >Xác nhận</button></div>
					          </form>
					        </div>
					      </div>
					    </div>
					</div>
            </div>
        </div>
    </div>


    <script src="${pageContext.request.contextPath }/templates/admin/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/templates/admin/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/templates/admin/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/templates/admin/js/main.js"></script>


</body>
</html>
