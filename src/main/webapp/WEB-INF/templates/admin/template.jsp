<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<body>
	<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
    <!-- End Left Panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <tiles:insertAttribute name="header_rightbar"></tiles:insertAttribute>
        <!-- End Header-->
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
         <!-- End content -->
    </div><!-- /#right-panel -->

    <!-- Right Panel -->

 <tiles:insertAttribute name="footer"></tiles:insertAttribute>
<!-- End header -->
</body>
</html>
   