<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
    1.Sever Side Paging + master detail   
  @author 291020 
   
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
    <%@ include file="../jspPreload.jsp"%>
</head>
<body>
        <div  id="northPannel"  style="height:auto;" >
             <div style="text-align:left;padding:5px 0"> 
                 <a id="backBtn" href="javascript:void(0)" 
                                 class="easyui-linkbutton" 
                                 data-options="plain:true,iconCls:'icon-back'">Back To</a>                
             </div>
            
            <div class="easyui-panel" title="Job Assign" style="width:100%;max-width:100%;padding:15px 30px;" data-options="collapsible:true">
            <form id="ff" method="POST">
                <input id ="wpnoI"         name ="wpnoI"         type="hidden"  value="${sessionScope.assign.workPackage.wpnoI}">
                <input id ="assignId"      name ="assignId"      type="hidden"  value="${sessionScope.assign.id}">
                <input id ="operateAtTime" name ="operateAtTime" type="hidden"  value="${sessionScope.assign.operateAtTime}">
                <input id ="acRegistr"     name ="acRegistr"     type="hidden"  value="${sessionScope.assign.workPackage.acRegistr}">
            
            
            <%@ include file="jobAssign_clip.jsp"%>           
            
            </form>            
            </div>
           
        </div>
        <div>&nbsp;&nbsp;</div>
        <div  id="centerPannel"  style="height:550px;">
        <div class="easyui-panel"style="width:100%;max-width:100%;padding:1px 1px;">
        
            <div id="tabs" name="tabs" class="easyui-tabs" style="width:100%;height:500px;" data-options="selected:3">
                 <div id="allTab" name="allTab" title="ALL" style="padding:10px"></div>
            
                 <div id="categoryTab" name="categoryTab" title="Category" style="padding:10px">
                                  
                    <table class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
                            data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
                        <thead>
                            <tr>
                                <th data-options="field:'itemid',width:80">Item ID</th>
                                <th data-options="field:'productid',width:100">Product</th>
                                <th data-options="field:'listprice',width:80,align:'right'">List Price</th>
                                <th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
                                <th data-options="field:'attr1',width:250">Attribute</th>
                                <th data-options="field:'status',width:60,align:'center'">Status</th>
                            </tr>
                        </thead>
                    </table>
                 
                 </div>
            
                 <div id="manualInsertTab" name="manualInsertTab" title="Manual Insert" style="padding:10px"></div>
                 
                 <div id="timeBookingTab" name="timeBookingTab" title="Time Booking" style="padding:10px"></div>
            </div>
        </div>    
        </div>
        
	<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}/pms';
	    var appForm = $('#ff');        
	    var errorMsg = '${errorMsg}';
	    var msg      = '${msg}';
	    
	    
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				
				// Click Tab, 點選不同的tab , 進行跳頁動作
                $('#tabs').tabs({                    
                    onSelect:function(title){                        
						if('ALL' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabAll')    
						} if('Category' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabCategory')   
						} if('Manual Insert' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabManualInsert')  
						}
						appForm.submit();
                    }
                });

				
				// Back Button
				$('#backBtn').on('click', function(event) {
					appForm.attr('action', httpDispatcher + '/jobAssign/backToWpHeader');
					appForm.submit();
					
				});
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					
					if(valid) {
						if($('#id').val() == '') {							
							appForm.attr('action', httpDispatcher + '/jobAssign/create');	// create 						
							appForm.submit();  
						} else {
							appForm.attr('action', httpDispatcher + '/jobAssign/update'); 
							appForm.submit();
						}

					} else {
						$.messager.alert('Info', 'Validation Error.');
					}					
				});	
			};
			
			return {
				init : function() {
					
					// 表單事件初始化
					bundlePageEvent(); // 資料載入後再綁事件
					$('#southPannel').toggle();
	               
					if($('#id').val() !='' ){
					    $('#qualification').combobox('setValue',   '${assign.qualification}');
		                $('#assignDateString').textbox("setValue", '${assign.formattedAssignDate}');
		                $('#shift').combobox("setValue",           '${assign.shift}');
				    }
					jsApp.showMsg();
					
				},
		       	togglePanel : function () {
					$('#northPannel').toggle();
					$('#centerPannel').toggle();
					$('#southPannel').toggle(); 
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