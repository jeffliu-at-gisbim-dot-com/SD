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
<body><form id="ff" method="POST">
        <div  id="northPannel"  style="height:auto;" >
             <div style="text-align:left;padding:5px 0"> 
                 <a id="backBtn" href="javascript:void(0)" 
                                 class="easyui-linkbutton" 
                                 data-options="plain:true,iconCls:'icon-back'">Back To</a>                
             </div>
            
            <div class="easyui-panel" title="Job Assign" style="width:100%;max-width:100%;padding:15px 30px;" data-options="collapsible:true">
            
                <input id ="wpnoI"         name ="wpnoI"         type="hidden"  value="${sessionScope.assign.workPackage.wpnoI}">
                <input id ="assignId"      name ="assignId"      type="hidden"  value="${sessionScope.assign.id}">
                <input id ="operateAtTime" name ="operateAtTime" type="hidden"  value="${sessionScope.assign.operateAtTime}">
                <input id ="acRegistr"     name ="acRegistr"     type="hidden"  value="${sessionScope.assign.workPackage.acRegistr}">
            
            <%@ include file="jobAssign_clip.jsp"%>
                         
            
            </div>
           
        </div>
        <div>&nbsp;&nbsp;</div>
        <div  id="centerPannel"  style="height:550px;">
        <div class="easyui-panel"style="width:100%;max-width:100%;padding:1px 1px;">
        
            <div id="tabs" name="tabs" class="easyui-tabs" style="width:100%;height:500px;" data-options="selected:2">
                 <div id="allTab" name="allTab" title="ALL" style="padding:10px"></div>
            
                 <div id="categoryTab" name="categoryTab" title="Category" style="padding:10px"></div>
            
                 <div id="manualInsertTab" name="manualInsertTab" title="Manual Insert" style="padding:10px">
                     <table style='width:50%'>
                         <tr><td>WorkGroup:</td>
                             <td><select id="workGroupId" name="workGroupId" class="easyui-combobox"
                                                            data-options="panelHeight:65,required: true"
                                                            style="width: 300px;"> 
                                <c:forEach var="obj" items="${requestScope.workGroups}">
                                    <option value="${obj.id}" >${obj.workgroupName}</option>                                                
                                </c:forEach>                                   
                                 </select>
                             </td> 
                         </tr>
                         
                         
                         <tr>
                             <td>Worker</td>
                             <td><input id="worker" name="worker"  class="easyui-textbox"></td>
                         </tr>  
                         <tr><td>WorkOrder</td>
                             <td><select id="job" name="job"   class="easyui-combobox" 
                                            data-options="valueField:'key',textField:'value'"
                                            style="width:600px;">                                                                                                
                                </select> 
                             
                             
                             </td>
                         </tr>
                                            
                     </table>
                 <div style="width:20%;text-align:right;padding:5px 0">
                     <a id="saveBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Save</a>
                 </div>   
                 </div>
                 
                 <div id="timeBookingTab" name="timeBookingTab" title="Time Booking" style="padding:10px"></div>
            </div>
        </div>    
        </div>
      </form>              
	<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}/pms';
	    var appForm = $('#ff');        
	    var errorMsg = '${errorMsg}';
	    var msg      = '${msg}';
	    
	    
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				
                // WorkGroup Select
                $('#workGroupId').combobox({
                    onChange:function(newValue,oldValue){
                        if(newValue != '') {                         	
                            jsApp.ajax_select();      
                        }
                    }
                });
				
				
				
				// Click Tab, 點選不同的tab , 進行跳頁動作
                $('#tabs').tabs({                    
                    onSelect:function(title){                        
						if('ALL' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabAll')    
						} if('Category' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabCategory')    
						} if('Time Booking' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabTimeBooking')  
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
						$.ajax({
	                        url:  httpDispatcher + '/jobAssign/tabManualInsert/create' ,
	                        data: appForm.serialize(),
	                        type:"POST",
	                        dataType:'json',
	                        success: function(result){
                                if(result.message != null &&result.message != '') {
                                    $.messager.alert('Success',result.message,'info');
                                }
                                // remove added items
                                jsApp.ajax_select();
	                        },                            
	                        error:function(XMLHttpRequest, textStatus, errorThrown) {
	                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
	                        }
	                    });  						
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
	               
					if($('#assignId').val() !='' ){
					    $('#qualification').combobox('setValue',   '${assign.qualification}');
		                $('#assignDateString').textbox("setValue", '${assign.formattedAssignDate}');
		                $('#shift').combobox("setValue",           '${assign.shift}');
				    }
					jsApp.showMsg();
					jsApp.ajax_select();
					
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
				},
				ajax_select : function () {
					action = httpDispatcher + '/jobAssign/refresh';
                    $.ajax({
                        url: action,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){                                                          
                             action = httpDispatcher + '/jobAssign/manualInsertSyncJobForSelect';
                             jsApp.ajax_combobox(action, $('#job'));                                           
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            comboboxUI.combobox({data:comboboxData});
                        }
                    });   
				},
				ajax_combobox : function(action, comboboxUI) {                  
                    var comboboxData = [];
                    $.ajax({
                        url: action,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){   
                        	comboboxData.push({key:'', value:'Please choose'});
                            result.rows.forEach(function(bean){
                            	comboboxData.push({key:bean.eventPerfnoI, value:bean.eventDisplay});
                            });                            
                            comboboxUI.combobox({data:comboboxData});                            
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            comboboxUI.combobox({data:comboboxData});
                        }
                    });                     
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