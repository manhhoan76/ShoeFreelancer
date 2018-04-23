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
    <title>ERROR PAGE</title>
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
  <div class="container">
    <div class="mx-auto mt-5">
      <div class="card-header">Page Not Found</div>
      <div class="card-body" style="background-image: url('${pageContext.request.contextPath }/templates/admin/images/pnf.png');height: 400px;">
         <h2 style="text-align: center; color: red;">
          	This page is not exist!
          </h2> 
          <div style="text-align: center;">
	          <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin"><i class="fa fa-reply"></i>&nbsp;ADMIN</a>
	          <a class="btn btn-primary" href="${pageContext.request.contextPath }/"><i class="fa fa-home"></i>&nbsp;HOME PAGE</a>
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
