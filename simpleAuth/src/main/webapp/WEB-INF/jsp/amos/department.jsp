<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式範本說明
    1.範本名稱:單檔操作 (Server Side Render) V2017.03.01
    2.說       明: AMOS Department 資料檔查詢
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  History:
     2017/02/09 first release
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
    <%@ include file="../jspPreload.jsp"%>
</head>
<body>
        <div  id="northPannel"  style="height:190px;">
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>Department Code:</td>
                            <td><input class="easyui-textbox" id="criteria_departmentCode" name="criteria_departmentCode" style="width:300px;" >                                                         
                            </td>
                        </tr>   
                    
                    </table>       
            </div>
            <div style="text-align:left;padding:5px 0">
                <a id="searchBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Search</a>
                <a id="resetBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Reset</a>
            </div>
        </div>
      
        
        <div  id="centerPannel"  style="height:200px;">
            <table id="dg" title="Search Result" style="width:100%;height:335px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false">
                <thead>
                    <tr>
                        <th field="department"  width="80"  align="right" data-options="field:'department'">CODE</th>
                        <th field="description" width="350" align="left"  data-options="field:'description'">DESCRIPTION</th>
                        <th field="homebase"    width="100" align="right" data-options="field:'homebase'">HOMEBASE</th>
                        <th field="costcenter"  width="100" align="right" data-options="field:'costcenter'">COST CENTER</th>
                        <th field="lastModify"  width="180" align="right" data-options="field:'lastModify'">MODIFY DATE</th>
                        
                    </tr>
                </thead>
                <c:forEach var="entity" items="${requestScope.data}">
                <tr><td>${entity.department}</td><td>${entity.description}</td><td>${entity.homebase}</td>
                    <td>${entity.costcenter}</td><td>${entity.lastModify}</td>
                </tr>   
                </c:forEach>
            </table>
        </div>

        <form id="ff" method="POST">   
        <input id="departmentCode"        name="departmentCode"        type="hidden">
    
        </form>    
	<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}';
	    var appForm = $('#ff');        
		
	    var errorMsg = '${errorMsg}';	
	    var msg      = '${msg}';
		var gridData;
		

       	
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				//Search Button
				$('#searchBtn').on('click', function(event) {			
					var selected = $('#criteria_departmentCode').textbox('getValue');					
					$('#departmentCode').val(selected);
					appForm.attr('action', httpDispatcher + '/amos/preDepartment/findBy'); // findBy
					appForm.submit();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
					$('#criteria_departmentCode').combobox('setValue', ''); // select the "ALL" with empty value
				});					
                //-------------------------------------------------------------
			};

			
			return {
				init : function() {
					// 表單事件初始化					
					bundlePageEvent();

					$('#dg').datagrid(); // convert html table to dataGrid
					gridData = $('#dg').datagrid("getData"); 
					
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
				}
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>