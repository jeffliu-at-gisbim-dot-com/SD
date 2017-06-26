<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PMS Web Application</title>
    <%@ include file="jspPreload.jsp"%>	
</head>
<body>
<form id="ff" method="POST"> </form>

<div id="mainLayout" class="easyui-layout" style="width:100%;height:940px;">
		<div data-options="region:'north'" style="height:40px">
		<table style="width:100%;">
		<tr>
		    <td>PMS Web&nbsp; | &nbsp;<a id="homeBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-man'"　>Home</a>
		    </td>
		    <td width="70%">
		    </td>
		    <td>Sign in as: ${sessionScope.userInfo.userId}&nbsp; | &nbsp;<a id="logoutBtn"   href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">Logout</a>
		    </td>
		</tr>
		</table>

		</div>
		<div data-options="region:'south'" style="height:45px;">		
		    <p align="center">Best viewed with 1920x1080 in IE Edge. Copyright and Disclaimer © EGAT</p>
		</div>
        <div data-options="region:'west',split:true" title="Function By Role" style="width:280px;">
            <div class="easyui-tabs" style="width:100%;">
                <c:forEach var="entry" items="${sessionScope.userInfo.roleFunctions}">
                 <div title="${entry.key.authGroupName}" style="padding:10px">
                 <ul class="easyui-tree">
                     <c:forEach var="topFun" items="${entry.value}">
                     <li><span>${topFun.funName}</span>
                         <ul>
                         <c:forEach var="fun" items="${topFun.funs}">
                             <li><a  onclick="javascript:load('${fun.funPath}');"><span>${fun.funName}</span></a></li>
                         </c:forEach>                     
                         </ul>
                     </li>                                          
                     </c:forEach>
                 </ul>
                 </div>                
                </c:forEach>
            </div>
                
        </div>
		<div data-options="region:'center'">
            <iframe id="content" name="content" width="100%" height="853px" frameborder="0" 
            marginwidth="0" marginheight="0" vspace="0" hspace="0" 
            allowtransparency="true" scrolling="yes" allowfullscreen="true"></iframe>
		</div>		 
	</div>
	
</body>

<script type="text/javascript">
    // <![CDATA[
    function load(uri) {
    	refreshTimer();
    	$('#content').attr('src',uri); 
    };
    
    
    var timeoutHandle = null;
    var theTimeDiff = (new Date()).getTime();
    var currentTimeDiff = null;    
    var showWarning = false;
    var sessionTime = 35 * 60;    // 30 min, session will timeout., 5 min after, client side redirect to login
    
    function startTimerCheck() {    	
    	currentTimeDiff = (new Date()).getTime();
    	
    	var idleTime = (currentTimeDiff - theTimeDiff) / 1000;
    	// document.getElementById('sessionTimer').innerHTML = ''+idleTime;
    	
    	if(idleTime > (sessionTime -180) && !showWarning) {
    		// $.messager.alert('Session timeout','3 min later, your session will be timeout, you may need to relogin', 'warn');
    		showWarning = true;
    	} else if (idleTime  > sessionTime) {
    		window.location.href = 'redirect.jsp';
    	}    	
        timeoutHandle = setTimeout(function () { startTimerCheck();}, 60000); // evey 60 sec, check it.
    };
    function refreshTimer() {        
    	theTimeDiff = (new Date()).getTime(); 
    	showWarning = false;
    	
        startTimerCheck(); // count 10 min down.
    };
    
    
    
    
    
    var appForm = $('#ff');
    var httpDispatcher = '${contextPath}';
    
	var jsApp = function() {
		// bundle page event
		var bundlePageEvent = function() {
			//Home Button
			$('#homeBtn').on('click', function(event) {	
                load('preHome');
			});
			
			//Logout Button
			$('#logoutBtn').on('click', function(event) {	
				appForm.attr('action', httpDispatcher+"/logout");
				appForm.submit();
			});	
			
			
		};
		
		

		return {
			init : function() {
				// 表單事件初始化
				bundlePageEvent();
				// 設定主頁面layout高度
				$('#mainLayout').height($(document).height()-40);
				// load home
				load('preHome');
				
				startTimerCheck(); // count 10 min down.
		        /*
				document.onmousemove = startTimer(3);
		        document.onkeypress  = startTimer(3);
		        document.onmousedown = startTimer(3);
		        document.onmouseclick= startTimer(3);
		        document.onmouseup   = startTimer(3);
		        */
            }
        };
    }();
    
    $(document).ready(jsApp.init);
    // ]]>
</script>

</html>