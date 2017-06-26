<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
           依指定Department(departmentCode)月份(yearMonth), 匯出排班資料   
    
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)    
  History:
     2017/??/?? first release
               
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
    <%@ include file="../jspPreload.jsp"%>
</head>
<body>
        <form id="ff" method="POST">
        <div  id="northPannel"  style="height:190px;">
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>Department:</td>
                            <td><select id="criteria_departmentCode" name="criteria_departmentCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:350px;">
                                                <c:forEach var="entity" items="${requestScope.departments}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                 </select>                           
                            </td>                            
                            <td> &nbsp; &nbsp;</td>
                            <td>Year Month:</td>
                            <td><input class="easyui-textbox" id="criteria_yearMonth" name="criteria_yearMonth" style="width:120px" >
                            </td>                            
                        </tr>   
                    
                    </table>       
            </div>
            <div style="text-align:left;padding:5px 0">
                <a id="exportBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Export</a>                
            </div>
        </div>
      
        
        </form>    
	<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}';
	    var appForm = $('#ff');        		
	    var errorMsg = '${errorMsg}';
	    var msg      = '${msg}';
	    
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				
				//Export Button
				$('#exportBtn').on('click', function(event) {			
                    appForm.attr('action', httpDispatcher + '/psp/dailyExport'); 
                    appForm.submit();
				});			
					
                //-------------------------------------------------------------
			};

			return {
				init : function() {
					// 表單事件初始化					
					bundlePageEvent();
					
					// if post back with msg , show it
					jsApp.showMsg();					
				},		       	
				showMsg : function() {
					if (errorMsg != '') {
						$.messager.alert('Error',errorMsg,'error');
					}
					if (msg != '') {
						$.messager.alert('Info',msg,'info');
					}
				},
				ajaxMsg : function (XMLHttpRequest, textStatus, errorThrown){
			    	var result = XMLHttpRequest.responseJSON;
			    	
			    	// NOT EXTENDED 所提供的參數條件不充份 (使用者的使用問題 LogicException)
			    	if(errorThrown == 'Not Extended') {
			    		$.messager.alert('Try again.',result.message,'warn');
			    		
			    	// INTERNAL_SERVER_ERROR 未出現過的錯誤 (測試時沒測到的Exception)	
			    	} else if (errorThrown == 'Internal Server Error') {
			    		$.messager.alert('Please Contact the Developer.',result.message,'error');
			    	
			    	// 傳出不允許的HttpStatus, 開發者開發紀律問題	
			    	} else {
			    		$.messager.alert('Please Contact the Administrator.',result.message,'error');
			    	}
				}
				
				
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>