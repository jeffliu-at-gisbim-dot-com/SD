<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
    1.範本名稱: 異形/無
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

        <div  id="northPannel"  style="height:190px;">
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>User:</td>
                            <td><input class="easyui-textbox" id="criteria_userId" name="criteria_userId">      
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>Start Date:</td>
                            <td><input  id="criteria_date"    name="criteria_date" 
                                      class="easyui-datebox"        style="width:90px;"
                                      data-options="formatter:egatFormatter,parser:egatParser">
                                <input  id="criteria_time"    name="criteria_time"
                                      class="easyui-timespinner"   style="width:60px;">
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
            <div style="text-align:left;padding:5px 0">
                <a id="createBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Create</a>
            </div>  
            <table id="dg" title="Search Result" style="width:100%;height:335px">                
            </table>
            <div>
            1. 此畫面為手動刷工紀錄查詢畫面, 實際工時以AMOS為準。<BR/>
            2. 僅能查詢有執行過手動刷工的紀錄。
            </div>
        </div>
        
        
        <form id="ff" method="POST"> 
        <input id="workGroupId" name="workGroupId" type="hidden">        
        <input id="operateAt"   name="operateAt"   type="hidden">  
        
        
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table style="width:900px">
                        <tr>
                            <td style="align:right">Booking Seq:</td>
                            <td colspan='3'> <input class="easyui-textbox" id="workGroupName" name="workGroupName"> 
                            </td> 
                        </tr>
                        <tr><td style="align:right">Worker:</td>
                            <td colspan='2'><input class="easyui-textbox"  id="workers" name="workers" multiline="true"  style="width:700px;height:60px;" data-options="readonly:true">
                            </td>
                            <td><a id="userResetBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:70px">Reset</a>      
                            </td>
                        </tr>
                        <tr><td style="align:right">Job:</td>
                            <td colspan='2'>
                             <table id="jobs" name="jobs" class="easyui-datagrid" lines="true" style="width:850px;height:120px">
                                <thead>
                                    <tr>
                                        <th data-options="field:'info',width:350">Info</th>                                        
                                        <th data-options="field:'eventDisplay',width:470">eventDisplay</th>
                                        
                                    </tr>
                                </thead>                             
                             </table>                         
                            </td>
                            <td><a id="jobResetBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:70px">Reset</a>      
                            </td>
                        </tr>
                        <tr><td style="align:right">Total MH:</td>
                            <td colspan="3"><span id="totalMH"></span></td>
                        </tr>
                        
                        <tr><td colspan="4">&nbsp;&nbsp;&nbsp;</td></tr>
                        
                        <tr><td style="align:right">User:</td>
                            <td colspan="2"><input class="easyui-textbox" id="employeeNos" name="employeeNos" style="width:410px">      
                                <a id="userAddBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Add</a>
                                                            
                            </td>
                            <td></td>
                            
                        </tr>
                        
                        <tr><td colspan="4">&nbsp;&nbsp;&nbsp;</td></tr>
                                                
                        <tr><td style="align:right">Barcode:</td>
                            <td><input class="easyui-textbox" id="barCode" name="barCode" style="width:300px">                                                                 
                            </td>
                            <td></td>
                            <td></td>
                        </tr> 
                        <tr>
                            <td>Start Date:</td>
                            <td colspan="3"><input  id="startDate"    name="startDate" 
                                      class="easyui-datebox"        style="width:90px;"
                                      data-options="formatter:egatFormatter,parser:egatParser">
                                <input  id="startTime"    name="startTime"
                                      class="easyui-timespinner"   style="width:60px;">
                              &nbsp;&nbsp;&nbsp;
                            End Date:<input  id="endDate"    name="endDate" 
                                      class="easyui-datebox"        style="width:90px;"
                                      data-options="formatter:egatFormatter,parser:egatParser">
                                <input  id="endTime"    name="endTime"
                                      class="easyui-timespinner"   style="width:60px;">
                               &nbsp;&nbsp;&nbsp;
                                <a id="jobAddBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Add</a>
                                             
                            </td>                            
                        </tr>
                       <tr><td colspan="4">&nbsp;&nbsp;&nbsp;</td></tr>
                    </table>
                                    
                    <div style="text-align:left;padding:5px 0">
                        <a id="timeBookingBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:180px">Time Booking</a>
                         &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                        <a id="cancelBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Cancel</a>
                    </div> 
                    
               
                     <table style="width:100%">
                         <tr><td colspan="4">&nbsp;&nbsp;&nbsp;</td></tr>
                     </table>
                     <table id="logDg" title="Time Booking log" style="width:100%;height:335px"/>   
            
                     
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
				
				//Search Button
				$('#searchBtn').on('click', function(event) {					
                    if($('#dg').datagrid() != null) {
                        var opts = $('#dg').datagrid('options');
                        opts.pageNumber = 1; // page set to the first page.     
                    }			
					jsApp.ajax_findBy();
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {	
					$('#criteria_userId').textbox("setValue",  '');
					$('#criteria_date').datebox("setValue",  '');
					$('#criteria_time').timespinner("setValue",  '');
				});				

				//Create Button
				$('#createBtn').on('click', function(event) {	
					$('#workGroupId').val('');
					$('#operateAt').val('');
					
                    var theDate = new Date();
                    var aMonth = (theDate.getMonth()+1);
                    var aDay   = theDate.getDate();
                    var aHour  = theDate.getHours();
                    var aMin   = theDate.getMinutes();
                    
                    var theMonth = aMonth<10?('0'+aMonth):aMonth;
                    var theDay   = aDay<10?('0'+aDay):aDay;
                    var theHour  = aHour<10?('0'+aHour):aHour;
                    var theMin   = aMin<10?('0'+aMin):aMin;
                    var dateString = theDate.getFullYear()+ "_" + theMonth+"_" + theDay+ "-" +
                                     theHour + "_" + theMin;                    
                    $('#workGroupName').textbox("setValue",    dateString);
                    $('#workers').textbox("setValue",  '');
                    //$('#jobs').textbox("setValue",     '');
                    $('#jobs').datagrid('loadData', {"total":0,"rows":[]});
                    $('#employeeNos').textbox("setValue", '');
                    $('#barCode').textbox("setValue",     '');
                    $('#logDg').datagrid('loadData', {"total":0,"rows":[]});
                    
					jsApp.togglePanel();
				});		
				
				//User Add Button
                $('#userAddBtn').on('click', function(event) {                   
                    $.ajax({
                        url: httpDispatcher + '/pms/manualBooking/userAdd',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){  
                            if(data.message != null &&data.message != '') {
                                $.messager.alert('Success',data.message,'info');
                            }
                        	 $('#workGroupId').val(data.workGroup.id);
                             $('#operateAt').val(data.workGroup.operateAtTime);
                            
                            jsApp.ajax_refresh();
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);                            
                        }
                    });
                });
				
                //User Reset Button
                $('#userResetBtn').on('click', function(event) {   
                    $.ajax({
                        url: httpDispatcher + '/pms/manualBooking/userReset',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){  
                            if(data.message != null &&data.message != '') {
                                $.messager.alert('Success',data.message,'info');
                            }                         
                            jsApp.ajax_refresh();
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);                            
                        }
                    });

                });	
                
                //Job Add Button
                $('#jobAddBtn').on('click', function(event) {                   
                    $.ajax({
                        url: httpDispatcher + '/pms/manualBooking/jobAdd',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){  
                            if(data.message != null &&data.message != '') {
                                $.messager.alert('Success',data.message,'info');
                            }
                        	$('#workGroupId').val(data.workGroup.id);
                            $('#operateAt').val(data.workGroup.operateAtTime);
                            
                        	jsApp.ajax_refresh();
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);                            
                        }
                    });
                });     

                //Job Reset Button
                $('#jobResetBtn').on('click', function(event) {    
                    $.ajax({
                        url: httpDispatcher + '/pms/manualBooking/jobReset',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){  
                            if(data.message != null &&data.message != '') {
                                $.messager.alert('Success',data.message,'info');
                            }                          
                            jsApp.ajax_refresh();
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);                            
                        }
                    });              	
                });     
                
				//Time Booking Button
				$('#timeBookingBtn').on('click', function(event) {	
                    $.ajax({
                        url: httpDispatcher + '/pms/manualBooking/timeBooking',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){  
                            if(data.message != null &&data.message != '') {
                                if(data.message != null &&data.message != '') {
                                    $.messager.alert('Success',data.message,'info');
                                }
                            }
                        	jsApp.ajax_findLog();
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);                            
                        }
                    });
				});		
					
				//Cancel Button
				$('#cancelBtn').on('click', function(event) {			
					jsApp.togglePanel();
					jsApp.ajax_findBy();
				});		
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){
                    	if(row.id != null && row.id != '') {
                            $('#workGroupId').val(row.id);
                            $('#operateAt').val(row.operateAtTime);
                            
                            jsApp.ajax_refresh();
                            
                            $('#workGroupName').textbox("setValue",  row.workgroupName);                            
                            $('#employeeNos').textbox("setValue",  '');
                            $('#barCode').textbox("setValue",  '');
                            $('#totalMH').text(row.uiTotalMH);
                            
                            jsApp.ajax_findLog();
                            
                            jsApp.togglePanel();    
                    	} // 雙擊item不動作
                    }
                });		
                
                //-------------------------------------------------------------	
			};
			

			return {
				init : function() {
					
					// 表單事件初始化
					bundlePageEvent(); // 資料載入後再綁事件
					$('#southPannel').toggle();
					jsApp.showMsg();
					
					jsApp.ajax_findBy();
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
				},
				ajax_refresh : function() {
                    $.ajax({
                        url: httpDispatcher + '/pms/manualBooking/refreshWG',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){  
                        	 $('#workers').textbox("setValue",  data.workGroup.workerOrJobs);
                             $('#jobs').datagrid("loadData",  data.workGroup.workOrders);
                             $('#totalMH').text(data.workGroup.uiTotalMH);
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);                            
                        }
                    });	
                    
				},
			    ajax_findBy : function() {
					$('#dg').datagrid({
					    url: httpDispatcher + '/pms/manualBooking/findBy',
					    method:'post',
		                rownumbers:true,                    
		                pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                queryParams: {    'userId': $('#criteria_userId').textbox("getValue"),
		                	          'dateString': $('#criteria_date').datebox("getValue") ,
		                	          'timeString': $('#criteria_time').timespinner("getValue")		                	              	
		                },
					    columns:[[                            
                            {width:140,  align:'left', field:'uiWorkGroupName',   title:'Booking Sequence'},
                            {width:1400, align:'left', field:'workerOrJobs',      title:'Worker / Item'}   
					    ]],
					    onLoadSuccess: function(result) {				    	
					    }, 
					    onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
					    	jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
					    	$('#dg').datagrid('loadData', {"total":0,"rows":[]});
					    }
					    
					});	
			    },
			    ajax_findLog : function() {
			    	if($('#workGroupId').val() == '' ) {
			    		return;
			    	}
                    $('#logDg').datagrid({
                        url: httpDispatcher + '/pms/manualBooking/findLog',
                        method:'post',
                        rownumbers:true,                    
                        pagination:true,
                        singleSelect:true,
                        autoRowHeight:false,
                        collapsible:true,
                        pageSize:10,
                        queryParams: {    'workGroupId': $('#workGroupId').val() },
                        columns:[[                            
                            {width:140,  align:'left',   field:'aimReference',   title:'Log ID'},
                            {width:80,   align:'center', field:'execNumber',     title:'Imported'},
                            {width:50,   align:'center', field:'failNumber',     title:'Failed'},                            
                            {width:1400, align:'left',   field:'aimWarning',     title:'Warning Message'}   
                        ]],
                        onLoadSuccess: function(result) {                       
                        }, 
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            $('#dg').datagrid('loadData', {"total":0,"rows":[]});
                        }
                        
                    }); 
			    }
			    
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>