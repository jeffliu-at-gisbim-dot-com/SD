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
     <script type="text/javascript" src="${contextPath}/resources/js/jqueryEasyui/datagrid-filter.js"></script> 
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
                <input id ="workGroupId"        name ="workGroupId"        type="hidden" >
                <input id ="workerIdsString"    name ="workerIdsString"    type="hidden" >
                <input id ="eventPerfnoIString" name ="eventPerfnoIString" type="hidden" >
                
                
            <%@ include file="jobAssign_clip.jsp"%>
                   
            </form>            
            </div>
           
        </div>
        <div>&nbsp;&nbsp;</div>
        <div  id="centerPannel"  style="height:833px;">
        
            <!------------ Top Tabs ------------------------------------------>
            <div id="tabs" name="tabs" class="easyui-tabs" style="height:833px;" data-options="selected:1,">
                 <div id="allTab" name="allTab" title="ALL" style="padding:10px"></div>            
                 <div id="categoryTab" name="categoryTab" title="Category" style="padding:10px">
                                  
                    <table id="workGroupIdx" class="easyui-datagrid" title="WorkGroup Team" style="height:270px"
                            data-options="singleSelect:true,collapsible:true">
                    </table>
                    <div>&nbsp;&nbsp;</div>
                    <!----- Bank Tabs ---------------------------------------->
                    <div id="bankTabs" name="bankTabs" class="easyui-tabs" style="height:455px;" data-options="selected:0">
                        <div id="manBankTab" name="manBankTab" title="Man Bank" style="padding:10px;" >
                            <div class="easyui-layout" style="width:1060px;height:400px;">
                                <div data-options="region:'west'" style="width:450px;">
                                    <div id="manForSelect" class="easyui-datalist" title="Man for Select" style="width:448px;height:349px" 
                                    data-options="valueField:'employeeNo', textField:'label',checkbox:false, singleSelect:false, lines:true"></div>
                                </div>
                                <div data-options="region:'center'">
                                    <table width='100%'>
                                    <tr><td align="center"><a id="manAddBtn"        href="javascript:void(0)"
                                                 class="easyui-linkbutton"  style="width:80px">Add</a>
                                        </td>
                                    </tr>
                                    </tr><tr><td>&nbsp;</td>
                                    </tr><tr><td>&nbsp;</td>
                                    <tr><td align="center"><a id="manRemoveBtn"     href="javascript:void(0)"
                                                 class="easyui-linkbutton"  style="width:80px">Remove</a>
                                        </td>
                                    </tr>
                                                                 
                                    </table>
                                </div>
                                <div data-options="region:'east'" style="width:450px;">
                                    <div id="selectedMan" class="easyui-datalist" title="Selected Man" 
                                    style="width:448px;height:349px" 
                                    data-options="valueField:'employeeNo', textField:'label',checkbox:false, singleSelect:false, lines:true"></div>
                                    
                                        
					    
					    
                                </div>
                                
                                <div data-options="region:'south'" style="height:50px;  ">
                                <table width='100%' style="padding:10px 20px">
                                <tr><td align="center">
                                    WorkGroupName:<input class="easyui-textbox" id="workGroupNameM" name="workGroupNameM" style="width:280px" 
                                                         data-options="required:true"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a id="makeTeamByManBtn"     href="javascript:void(0)" class="easyui-linkbutton"  
                                       style="width:180px">Make Them as WG.</a>     
                                </td>
                                </tr>
                                </table>
                                  
                                </div>

                            </div>
                        </div>    
                                       
                        <div id="jobBankTab" name="jobBankTab" title="Job Bank" style="padding:10px">
                            <div class="easyui-layout" style="width:1100px;height:400px;">
                                <div data-options="region:'west'" style="width:500px;">                                      
                                    <table  id="jobForSelect" class="easyui-treegrid" style="width:498px;height:349px" 
                                           data-options="lines: true, rownumbers: true, idField:'eventPerfnoI', treeField:'eventDisplay', singleSelect:false ">
                                        <thead>
                                            <tr>
                                                <th data-options="field:'eventDisplay'" width="600">Job for Select</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div data-options="region:'center'">
                                    <table width='100%'>
                                    <tr><td align="center"><a id="jobAddBtn"        href="javascript:void(0)"
                                                 class="easyui-linkbutton"  style="width:80px">Add</a>
                                        </td>
                                    </tr>
                                    </tr><tr><td>&nbsp;</td>
                                    </tr><tr><td>&nbsp;</td>
                                    <tr><td align="center"><a id="jobRemoveBtn"     href="javascript:void(0)"
                                                 class="easyui-linkbutton"  style="width:80px">Remove</a>
                                        </td>
                                    </tr>
                                                                 
                                    </table>
                                </div>
                                <div data-options="region:'east'" style="width:500px;">
                                    <div id="selectedJob" class="easyui-datalist" title="Selected Job" style="width:498px;height:349px" 
                                     data-options="valueField:'eventPerfnoI', textField:'eventDisplay',checkbox:false, singleSelect:false, lines:true"></div>
                                </div>
                                
                                <div data-options="region:'south'" style="height:50px;  ">
                                <table width='100%' style="padding:10px 20px">
                                <tr><td align="center">
                                    WorkGroupName:<input class="easyui-textbox" id="workGroupNameJ" name="workGroupNameJ" style="width:280px" 
                                                         data-options="required:true"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a id="makeTeamByJobBtn"     href="javascript:void(0)" class="easyui-linkbutton"  
                                       style="width:180px">Make Them as WG.</a>     
                                </td>
                                </tr>
                                </table>
                                  
                                </div>

                            </div>
                        </div>
                    
                    
                    </div>
                 </div>
            
                 <div id="manualInsertTab" name="manualInsertTab" title="Manual Insert" style="padding:10px"></div>                 
                 <div id="timeBookingTab" name="timeBookingTab" title="Time Booking" style="padding:10px"></div>
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
				
                //Double Click Row
                $('#workGroupIdx').datagrid({
                    onDblClickRow: function(index,row){
                        if(row.uiWorkGroupName == null) { return; }  
                        // check man
                        var gridData = $('#selectedMan').datagrid('getData');
                        if(gridData != null) {
                            var rows = gridData.rows;
                            if( $('#workGroupId').val() == '' &&  rows.length > 0 ) {
                                $.messager.alert('Warn','Man selected. Please remove it first.','warn'); 
                                return;
                            } 	
                        }

                        // check job
                        var listData = $('#selectedJob').datalist('getData');
                        if(listData != null) {
                            var listRows = listData.rows;                        
                            if( $('#workGroupId').val() == '' &&  listRows.length > 0 ) {
                                $.messager.alert('Warn','Job selected. Please remove it first.','warn'); 
                                return;
                            }
                        }

                        // setting operating workGroup
                        $('#workGroupId').val(row.id);
                        $('#workGroupNameM').textbox("setValue",    row.workgroupName);
                        $('#workGroupNameJ').textbox("setValue",    row.workgroupName);
                        
                        // ajax call to change uiModel
                        $.ajax({
                            url:  httpDispatcher + '/jobAssign/workGroupSelect' ,
                            data: appForm.serialize(),
                            type:"POST",
                            dataType:'json',
                            success: function(result){
                                jsApp.syncManForSelect();
                                jsApp.syncSelectedMan();
                                
                                jsApp.syncJobForSelect();
                                jsApp.syncSelectedJob();
                                
                            },                            
                            error:function(XMLHttpRequest, textStatus, errorThrown) {
                                jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            }
                        });

                        
                    }
                }); 
                
				// Make Team as WG Button , By Man
				$('#makeTeamByManBtn').on('click', function(event) {		
                    var idsString = '';
                    var gridData = $('#selectedMan').datagrid('getData');
                    var rows = gridData.rows;
                    for(var i=0; i< rows.length; i++) {                     
                        idsString = idsString + rows[i].employeeNo +',';
                    }
                    if(idsString == '') {
                    	$.messager.alert('Error','No worker selected.','error');
                    	return;
                    }
                    
                    if($('#workGroupNameM').textbox("getValue") == '') {
                    	$.messager.alert('Error','WorkGroup Name can not be empty','error');
                    	return;
                    }
                    jsApp.makeTeamByMan(idsString); 
				});
				
                // Make Team as WG Button , By Job
                $('#makeTeamByJobBtn').on('click', function(event) {        
                    var idsString = '';
                    var gridData = $('#selectedJob').datagrid('getData');
                    var rows = gridData.rows;
                    for(var i=0; i< rows.length; i++) {                     
                        idsString = idsString + rows[i].eventPerfnoI +',';
                    }
                    if(idsString == '') {
                        $.messager.alert('Error','No Job selected.','error');
                        return;
                    }
                    
                    if($('#workGroupNameJ').textbox("getValue") == '') {
                        $.messager.alert('Error','WorkGroup Name can not be empty','error');
                        return;
                    }
                    jsApp.makeTeamByJob(idsString); 
                });
				
                // Job Add Button
                $('#jobAddBtn').on('click', function(event) {
                    var idsString = '';
                    var rows = $('#jobForSelect').treegrid('getSelections');
                    for(var i=0; i< rows.length; i++) {                     
                        idsString = idsString + rows[i].eventPerfnoI +',';
                    }
                    if(idsString == '' ){
                        $.messager.alert('Error','No job selected to add','error');
                        return;
                    }
                    $('#eventPerfnoIString').val(idsString);
                    
                    jsApp.selectedJobAdd();         
                });
                
                // Job Remove Button
                $('#jobRemoveBtn').on('click', function(event) {
                    var idsString = '';
                    var rows = $('#selectedJob').datagrid('getSelections');
                    for(var i=0; i< rows.length; i++) {                     
                        idsString = idsString + rows[i].eventPerfnoI +',';
                    }
                    if(idsString == '' ){
                    	$.messager.alert('Error','No Job selected to remove','error');
                    	return;
                    }
                    $('#eventPerfnoIString').val(idsString);
                    
                    jsApp.selectedJobRemove();                  
                });
                
				// Man Add Button
				$('#manAddBtn').on('click', function(event) {
					var idsString = '';
					var rows = $('#manForSelect').datagrid('getSelections');
					for(var i=0; i< rows.length; i++) {						
						idsString = idsString + rows[i].employeeNo +',';
					}
                    if(idsString == '' ){
                        $.messager.alert('Error','No man selected to add','error');
                        return;
                    }
					$('#workerIdsString').val(idsString);
					
					jsApp.selectedManAdd();			
				});
				
				// Man Remove Button
				$('#manRemoveBtn').on('click', function(event) {
					var idsString = '';
					var rows = $('#selectedMan').datagrid('getSelections');
					for(var i=0; i< rows.length; i++) {						
						idsString = idsString + rows[i].employeeNo +',';
					}
                    if(idsString == '' ){
                        $.messager.alert('Error','No man selected to remove','error');
                        return;
                    }
					$('#workerIdsString').val(idsString);
					
					jsApp.selectedManRemove();					
				});
				
				
				
				// Click Tab, 點選不同的tab , 進行跳頁動作
                $('#tabs').tabs({                    
                    onSelect:function(title){                        
						if('ALL' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabAll')    
						} if('Manual Insert' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabManualInsert')  
						} if('Time Booking' == title) {
						    appForm.attr('action', httpDispatcher + '/jobAssign/tabTimeBooking')  
						} 
						appForm.submit();
                    }
                });
                // Click Tab Man or Job
                $('#bankTabs').tabs({                    
                    onSelect:function(title){                        
                        if('Man Bank' == title) {
                            jsApp.syncManForSelect();
                            jsApp.syncSelectedMan();
                        } if('Job Bank' == title) {
                            jsApp.syncJobForSelect();
                            jsApp.syncSelectedJob();  
                        } 
                    }
                });

				// Back Button
				$('#backBtn').on('click', function(event) {
					appForm.attr('action', httpDispatcher + '/jobAssign/backToWpHeader');
					appForm.submit();
					
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
					jsApp.refresh();
					
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
				refresh : function() {	
                    $.ajax({
                        url:  httpDispatcher + '/jobAssign/refresh' ,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){
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
                            
                            $('#workGroupId').val('');
                            $('#workGroupNameM').textbox("setValue",    dateString);
                            $('#workGroupNameJ').textbox("setValue",    dateString);
                            
                            jsApp.syncUiList();
                            jsApp.syncManForSelect();
                            jsApp.syncSelectedMan();

                            jsApp.syncJobForSelect();
                            jsApp.syncSelectedJob();
                            
                            
                            
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });

				},
				selectedJobAdd : function() {
                    $.ajax({
                        url:  httpDispatcher + '/jobAssign/selectedJobAdd' ,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){

                            jsApp.syncUiList();
                            jsApp.syncJobForSelect();
                            jsApp.syncSelectedJob(); 
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });	
				},
				selectedJobRemove : function() {
                    $.ajax({
                        url:  httpDispatcher + '/jobAssign/selectedJobRemove' ,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){

                            jsApp.syncUiList();
                            jsApp.syncJobForSelect();
                            jsApp.syncSelectedJob();   
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });
                },
				selectedManAdd : function() {
                    $.ajax({
                        url:  httpDispatcher + '/jobAssign/selectedManAdd' ,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){

                            jsApp.syncUiList();
                            jsApp.syncManForSelect();
                            jsApp.syncSelectedMan(); 
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });
				}, 
				selectedManRemove : function() {
                    $.ajax({
                        url:  httpDispatcher + '/jobAssign/selectedManRemove' ,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){

                            jsApp.syncUiList();
                            jsApp.syncManForSelect();
                            jsApp.syncSelectedMan();   
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });
				},
				makeTeamByMan : function(workerIdsString) {
					if( $('#workGroupId').val() != '') {
						// show message.
					}
					
					$('#workGroupIdx').datagrid({
                        url: httpDispatcher+ '/jobAssign/makeTeamByMan',
                        method:'post',
                        rownumbers:false,                    
                        pagination:false,
                        singleSelect:true,
                        autoRowHeight:false,
                        collapsible:true,                        
                        queryParams: {
                                      'wpnoI' : $('#wpnoI').val(),
                                   'assignId' : $('#assignId').val(),
                                'workGroupId' : $('#workGroupId').val(),
                              'workGroupName' : $('#workGroupNameM').textbox("getValue"),  
                            'workerIdsString' : workerIdsString
                        },
                        onLoadSuccess: function(result) {                           	
                        	if(result['newWorkGroupId'] != null) {
                        		$('#workGroupId').val(result['newWorkGroupId']);                        		 
                                 $('#workGroupNameJ').textbox("setValue",   $('#workGroupNameM').textbox("getValue"));
                               
                        	}
                        	 
                        }, 
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            $('#dg').datagrid('loadData', {"total":0,"rows":[]});
                        }
                        
                    }); 

				},
                makeTeamByJob : function(idString) {
                    if( $('#workGroupId').val() != '') {
                        // show message.
                    }
                    
                    $('#workGroupIdx').datagrid({
                        url: httpDispatcher+ '/jobAssign/makeTeamByJob',
                        method:'post',
                        rownumbers:false,                    
                        pagination:false,
                        singleSelect:true,
                        autoRowHeight:false,
                        collapsible:true,                        
                        queryParams: {
                                         'wpnoI' : $('#wpnoI').val(),
                                      'assignId' : $('#assignId').val(),
                                   'workGroupId' : $('#workGroupId').val(),
                                 'workGroupName' : $('#workGroupNameJ').textbox("getValue"),  
                            'eventPerfnoIString' : idString                            
                        },
                        onLoadSuccess: function(result) {                               
                            if(result['newWorkGroupId'] != null) {
                                $('#workGroupId').val(result['newWorkGroupId']);                                 
                                 $('#workGroupNameM').textbox("setValue",   $('#workGroupNameJ').textbox("getValue"));                               
                            }
                             
                        }, 
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            $('#dg').datagrid('loadData', {"total":0,"rows":[]});
                        }
                        
                    }); 

                },
                syncJobForSelect : function () {

                    $('#jobForSelect').treegrid({
                        url:  httpDispatcher + '/jobAssign/syncJobForSelect' ,
                        method:'post',
                        onLoadSuccess: function(result) {     
                        },  
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }                       
                    });
                    
                }, 
				syncManForSelect : function () {
                    $('#manForSelect').datalist({
                        url:  httpDispatcher + '/jobAssign/syncManForSelect' ,
                        method:'post',
                        onLoadSuccess: function(result) {     
                        },  
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }                       
                    });
				}, 
				syncSelectedJob : function() {
                    $('#selectedJob').datalist({
                        url:  httpDispatcher + '/jobAssign/syncSelectedJob' ,
                        method:'post',
                        queryParams: {
                            'workGroupId' : $('#workGroupId').val()
                        },
                        onLoadSuccess: function(result) {     
                        },  
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }                       
                    });   
				},
                syncSelectedMan : function () {
                    $('#selectedMan').datalist({
                        url:  httpDispatcher + '/jobAssign/syncSelectedMan' ,
                        method:'post',
                        queryParams: {
                            'workGroupId' : $('#workGroupId').val()
                        },
                        onLoadSuccess: function(result) {     
                        },  
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }                       
                    });   
                }, 
                syncUiList : function() {
                    $('#workGroupIdx').datagrid({
                        url: httpDispatcher+ '/jobAssign/syncUiList',
                        method:'post',
                        rownumbers:false,                    
                        pagination:false,
                        singleSelect:true,
                        autoRowHeight:false,
                        collapsible:true,                        
                        columns:[[
                            {width:45, align:'center', field:'Action',        title:'Action',
                                formatter:function(value,row,index){
                                	if(row.id == null) {
                                		return '';
                                	} else {
                                        return '<a href="javascript:void(0)" '+
                                        'onclick="jsApp.delWorkGroup(\''+row.id+'\',\''+row.assignId+'\')">Del</a> ';  		
                                	}                                
                                }
                            },
                            {width:140,  align:'left', field:'uiWorkGroupName',   title:'WorkGroup Name'},
                            {width:1400, align:'left', field:'workerOrJobs',      title:'Worker / Item'}                            
                        ]],
                        onLoadSuccess: function(result) {                               
                        }, 
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                        
                    });
                    
                },
                delWorkGroup : function(workGroupId, assignId){
                	$('#workGroupId').val(workGroupId);
                    $.ajax({
                        url:  httpDispatcher + '/jobAssign/delWorkGroup' ,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){
                            jsApp.refresh();
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
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