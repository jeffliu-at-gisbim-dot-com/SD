<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
    <%@ include file="jspPreload.jsp"%>
</head>
<body>
This is home

</body>

<script type="text/javascript">
    // <![CDATA[
    var appForm = $('#ff');
    var httpDispatcher = '${contextPath}/postLogin';
    var errorMsg = '${msg}';
        
	var jsApp = function() {
		// bundle page event
		var bundlePageEvent = function() {
			//Submit Button
			$('#submitBtn').on('click', function(event) {	
				var valid = false;
				valid = appForm.form('validate');
				if(valid) {
					appForm.attr('action', httpDispatcher);
					//appForm.form('submit'); // 注意, 這是由easyUi進行的ajax submit
					appForm.submit();  // 這才是傳統的form post submit
				} 
			});		

			//Reset Button
			$('#resetBtn').on('click', function(event) {			
			    appForm.form('clear');
			});	
		};
		
		var showLoginError = function() {
			if (errorMsg != '') {
				$.messager.alert('Login Error',errorMsg,'error');
			}
		};

		return {
			init : function() {
				// 表單事件初始化				
				bundlePageEvent();
				// if post back with error msg , show it
				showLoginError();
            }
        };
    }();
    
    $(document).ready(jsApp.init);
    // ]]>
</script>
	
</html>