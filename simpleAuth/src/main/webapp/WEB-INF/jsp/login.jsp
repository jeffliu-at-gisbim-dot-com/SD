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
	<div id="dlg" class="easyui-dialog" title="Login"  style="width:450px;height:200px;padding:10px">
    <form id="ff" method="POST">
	        <table width="100%">
	        	    
	            <tr><td>帳戶</td>
	            <td><input class="easyui-textbox" name="account" style="width:90%" 
	                       value="${account}"     data-options="required:true">
	            </td></tr>
	            <tr><td>密碼</td>
	            <td><input class="easyui-passwordbox" name="passwd" style="width:90%" 
	                                     data-options="required:true,validType:'password'">
	            </td></tr>
	            	 
	             <tr><td colspan="2">
		<div style="text-align:center;padding:5px 0">
			<a id="submitBtn" href="javascript:void(0)" class="easyui-linkbutton"  style="width:80px">確定</a>
			<a id="resetBtn"   href="javascript:void(0)" class="easyui-linkbutton"  style="width:80px">清除</a>
		</div> 
	             </td></tr>
	        </table>
	</form>        
	</div>
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