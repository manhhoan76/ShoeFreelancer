<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<html lang="vi">
<!-- Start header -->
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<!-- end header -->
<body class="hideresponsive menu-repsonsive">
<tiles:insertAttribute name="trigger-mobile"></tiles:insertAttribute>
<div id="box-wrapper">
<tiles:insertAttribute name="menu-header"></tiles:insertAttribute>

<!-- start content -->
<tiles:insertAttribute name="content"></tiles:insertAttribute>
<!-- end content -->

<!-- Start footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
<!-- End footer -->
</div>
<!-- Start menu-mobile -->
<tiles:insertAttribute name="menu-mobile"></tiles:insertAttribute>
<!-- End menu-mobile -->
</body>
</html>
