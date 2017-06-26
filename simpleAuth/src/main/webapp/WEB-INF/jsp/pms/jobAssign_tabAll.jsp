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
     <script type="text/javascript" src="${contextPath}/resources/js/jqueryEasyui/datagrid-detailview.js"></script> 
     <fmt:formatNumber type="number" value="${requestScope.totalPlanMh}" maxFractionDigits="2" var="totalPlanMhNum" />
     <fmt:formatNumber type="number" value="${requestScope.totalDiffMh}" maxFractionDigits="2" var="totalDiffMhNum" />
     
     
     <Style>
        .hide {
            display:none;
        }
     </Style>  
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
                <input id ="workGroupId"   name ="workGroupId"   type="hidden">
                
                <table width="850px">
                    <tr><td>A/C Registr:</td>   <td>${sessionScope.assign.workPackage.acRegistr}</td>
                        <td style="text-align:right">
                            W/P name:</td>      <td>${sessionScope.assign.workPackage.wpno} </td>
                        <td style="text-align:right">
                            Start Date:</td>    <td>${sessionScope.assign.workPackage.formattedStartDate}</td>
                        <td style="text-align:right">
                            End Date:</td>      <td>${sessionScope.assign.workPackage.formattedEndDate}</td>
                    </tr>
                    <tr><td>
                            Shift:</td>          <td><select id="shift" name="shift" class="easyui-combobox"
                                                            data-options="panelHeight:65,required: true"
                                                            style="width: 80px;">
                                                        <c:forEach var="shift" items="${requestScope.shift}">
                                                            <option value="${shift.code}" >${shift.description}</option>
                                                        </c:forEach>
                                                            <option value="" SELECTED></option>
                                                    </select>
                                                </td>
                        <td style="text-align:right">
                            Qualification:</td> <td colspan="3"><select id="qualification" name="qualification" class="easyui-combobox"
                                                            data-options="panelHeight:65,required: true"
                                                            style="width: 290px;">
                                                        <c:forEach var="scope" items="${requestScope.scope}">
                                                            <option value="${scope.CODE}" >${scope.CODE}-${scope.DESCRIPTION}</option>
                                                        </c:forEach>
                                                            <option value="" SELECTED></option>
                                                    </select>
                                                </td>                          
                        
                        
                        
                        <td style="text-align:right">
                            Creator:</td>        <td><input id="create_by" name="create_by"
                                                                       data-options="readonly:true"
                                                                       class="easyui-textbox"
                                                                       style="width: 100px;"
                                                                       value="${sessionScope.assign.createBy}">
                                                </td>

                    </tr>
                    <tr><td>Date Assign:</td>    <td><input id="assignDateString" name="assignDateString" class="easyui-datebox"
                                                           style="width: 120px;"
                                                           data-options="formatter:egatFormatter,parser:egatParser, required:true">
                                                </td>
                        <td style="text-align:right">
                            Status:</td>        <td colspan="5"><select id="status" name="status" class="easyui-combobox"
                                                            data-options="panelHeight:65,required: true"
                                                            style="width: 300px;">                                                            
                                                            <option value="L" SELECTED>ON JOB ASSIGN</option>
                                                            <option value="N">DRAFT</option>
                                                    </select>
                                                </td>                                
                    </tr>
                </table>
                <div style="text-align:left;padding:5px 0">
                    <a id="saveBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Save</a>
                    <a id="printBtn"    href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Print</a>
                </div>            
            </form>            
            </div>
           
        </div>
        <div>&nbsp;&nbsp;</div>
        <div  id="centerPannel"  style="height:550px;">
        <div class="easyui-panel"style="width:100%;max-width:100%;padding:1px 1px;">
        
            <div id="tabs" name="tabs" class="easyui-tabs" style="width:100%;height:500px;" data-options="selected:0">
                 <div id="allTab"          name="allTab"          title="ALL"           style="padding:10px">
                     <table style="width:100%">
                         <tr>
                             <td>Staff:</td>   <td><c:out value = "${requestScope.totalStaffMh}"/></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td>Act M/H:</td> <td><c:out value = "${requestScope.totalActualMh}"/></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td>Plan M/H:</td><td><c:out value = "${totalPlanMhNum}"/></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                             <td>Diff M/H:</td>
                             
                             <!-- if diff <0 , font color to red -->
                             <c:if test = "${requestScope.totalDiffMh < 0}">
                                 <td><p style="color:red"><c:out value = "${totalDiffMhNum}"/></p></td>
                             </c:if>
                             <c:if test = "${requestScope.totalDiffMh >= 0}">                                 
                                 <td><p><c:out value = "${totalDiffMhNum}"/></p></td>
                             </c:if>
                             
                             
                             <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         
                         </tr>
                         <tr><td colspan="12">
                                 <table id="dg" style="width:100%;height:335px"></table>
                         </td></tr>
                     </table>
                 </div>           
                 <div id="categoryTab"     name="categoryTab"     title="Category"      style="padding:10px"></div>            
                 <div id="manualInsertTab" name="manualInsertTab" title="Manual Insert" style="padding:10px"></div>                 
                 <div id="timeBookingTab"  name="timeBookingTab"  title="Time Booking"  style="padding:10px"></div>
            </div>
            <div id="dlg" class="easyui-dialog" title="Confirm Dialog" style="width:400px;height:200px;padding:10px">
                   <BR/>
                                                      
                <table width="99%">
                <tr><td colspan='2'>If you change the setting. All Job Assign will be lost. Are you sure ?</td></tr>
                <tr><td colspan='2'>&nbsp;</td></tr>
                <tr><td colspan='2'>如果改變設定,所有已指定的派工都會刪除,您確定嗎?</td></tr>
                <tr><td colspan='2'>&nbsp;</td></tr>                
                <tr><td align="center"><a id="confirmBtn"  href="javascript:void(0)" 
                                          class="easyui-linkbutton" onclick="" style="width:120px">Yes, I Sure.</a> 
                    </td>
                    <td>               <a id="cancelBtn"  href="javascript:void(0)" 
                                          class="easyui-linkbutton" onclick="" style="width:80px">Cancel</a>   
                    </td>
                </tr>
                </table>
            </div>
        </div>    
        </div>
        
	<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}/pms';
	    var appForm = $('#ff');        
	    var errorMsg = '${errorMsg}';
	    var msg      = '${msg}';
	    var downloadSuccess = false;

	    function textFormatter(val,row){
            if(val == null || val =='') {
                return '';
            }
            
            if(val.substring(0,2).match('綠底')) {
                return '<span style="color:white; background-color:green">'+val.substring(2, val.length)+'</span>';
            } else if(val.substring(0,2).match('紅底')) {
                return '<span style="color:white; background-color:red">'+val.substring(2, val.length)+'</span>';
            } else {
                return val;
            }                                                
        };
        
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				// Confirm Button
				$('#confirmBtn').on('click', function(event) {
					$('#dlg').dialog('close');
					appForm.attr('action', httpDispatcher + '/jobAssign/update'); 
					appForm.submit();
				});
				// Cancel Button
				$('#cancelBtn').on('click', function(event) {
					$('#dlg').dialog('close');
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
						if($('#assignId').val() == '') {							
							appForm.attr('action', httpDispatcher + '/jobAssign/create');	// create 						
							appForm.submit();  
						} else {
							$('#dlg').dialog('open');
						}

					} else {
						$.messager.alert('Info', 'Validation Error.');
					}					
				});	
				// Print Button
                $('#printBtn').on('click', function(event) {                    	
                    $.ajax({
                        url: httpDispatcher + '/jobAssign/tabAll/printAllWG',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){
                            var jsonObj = { filelist : [] };                                
                            $.fileDownload(httpDispatcher + '/jobAssign/tabAll/downloadAllWG', {
                                httpMethod: "POST",
                                data: {act: "downloadZipFiles", jsonstr: JSON.stringify(jsonObj)}
                            }); 
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });             
                });
                
                // Click Tab, 點選不同的tab , 進行跳頁動作
                $('#tabs').tabs({                    
                    onSelect:function(title){                        
                        if('Category' == title) {
                            appForm.attr('action', httpDispatcher + '/jobAssign/tabCategory')    
                        } if('Manual Insert' == title) {
                            appForm.attr('action', httpDispatcher + '/jobAssign/tabManualInsert')  
                        } if('Time Booking' == title) {
                            appForm.attr('action', httpDispatcher + '/jobAssign/tabTimeBooking')   
                        } 
                        appForm.submit();
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
					$('#dlg').dialog('close');
					//alert($('#assignId').val());
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
                ajax_findBy : function() {
                	if($('#assignId').val() == '') {   // if no assign
                		   return;
                	}
                    $('#dg').datagrid({
                        url : httpDispatcher + '/jobAssign/tabAll/statisticManHour',
                        method:'post',
                        rownumbers:false,                    
                        pagination:false,
                        singleSelect:true,
                        autoRowHeight:true,
                        collapsible:true,                        
                        queryParams: {
                        	'assignId' : $('#assignId').val()                         
                        },
                        columns:[[
                            {width : 180, align : 'left',    field : 'workgroupName',     title : 'WorkGroup Name'},
                            {width :  80, align : 'left',    field : 'staffManHours',     title : 'Staff'},
                            {width :  80, align : 'left',    field : 'actualManHours',    title : 'Actual M/H',
                                formatter:function(val,row,index){
                                	if(val == null || val == '') {
                                		return '';
                                	} else {
                                		return val.toFixed(2);	
                                	}                                                                   
                                }                            
                            },  
                            {width :  80, align : 'right',   field : 'planManHours',      title : 'Plan M/H' ,  
                                formatter:function(val,row,index){
                                	if(val == null || val == '') {
                                        return '';
                                    } else {
                                        return val.toFixed(2);   
                                    }                             
                                }                            
                            },                            
                            {width :  80, align : 'right',   field : 'diffOfPlanActual',  title : 'Diff M/H',
                                formatter:function(val,row,index){
                                	if(val == null || val == '') {
                                        return '';
                                    } else {
                                        if(val < 0) {
                                            return '<span style="color:red;">'+val.toFixed(2)+'</span>'; 
                                        } else {
                                            return val.toFixed(2);   
                                        }
                                    }                               
                                }                            
                            },  
                            {width :1000, align : 'right',   field : 'empty',  title : ''}
                        ]],
                        onLoadSuccess: function(result) {  
                        	//alert('success');
                        }, 
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        },
                        view: detailview,
                        detailFormatter:function(index,row){
                            return '<div style="padding:2px"><table id="ddv" style="width=100%" class="ddv"></table></div>';
                        },
                        onExpandRow: function(index,row){
                            $('#workGroupId').val(row.id); // row 為 workGroup vo.
                            var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');                            
                            ddv.datagrid({
                                url:httpDispatcher+'/jobAssign/tabAll/detailOfWorkGroup',
                                fitColumns:true,
                                singleSelect:true,
                                rownumbers:false,
                                loadMsg:'',
                                height:'auto',
                                queryParams: {
                                    'assignId'    : $('#assignId').val(),
                                    'workGroupId' : $('#workGroupId').val()
                                },
                                columns:[[
                                    {width:100,                 field:'column0', title: 'Task / Staff'},
                                    {width:100, align:'right',  field:'column1', formatter:textFormatter},                                    
                                    {width:100, align:'right',  field:'column2', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column3', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column4', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column5', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column6', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column7', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column8', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column9', formatter:textFormatter},
                                    {width:100, align:'right',  field:'column10', formatter:textFormatter}
                                
                                ]],
                                onResize:function(){
                                    $('#dg').datagrid('fixDetailRowHeight',index);
                                },
                                onLoadSuccess:function(){
                                    setTimeout(function(){
                                        $('#dg').datagrid('fixDetailRowHeight',index);
                                    },0);
                                }
                            });
                            $('#ddv > datagrid-header-row').addClass("hide");
                            
                            
                            $('#dg').datagrid('fixDetailRowHeight',index);
                        }
                        
                        
                        
                    }); 
                },            
                printWorkGroups : function(workGroups, currentIdx) { 
                	var workGroup = workGroups[currentIdx];                                	                	
                	if(workGroup != null) {
                		downloadSuccess = false;
                		jsApp.printWorkGroup(workGroup);                		                		 
                		jsApp.printWorkGroups(workGroups, currentIdx+1);
                		//jsApp.timerCheck(workGroups, currentIdx+1);                		
                	} 
                    
                },
                printWorkGroup : function(workGroup) {                                                    
                    if(workGroup != null) {                        
                        $('#workGroupId').val(workGroup.id);                        
                        appForm.attr('action', httpDispatcher + '/jobAssign/tabAll/printWorkGroup');                   
                        appForm.form({iframe:true });                             
                        appForm.submit();     
                    } 
                    
                }, 
                timerCheck : function(workGroups, idx) {
                	if(downloadSuccess){
                		jsApp.printWorkGroups(workGroups, idx);	
                	}                	
                	setTimeout(function () {downloadSuccess = true; jsApp.timerCheck(workGroups, idx);}, 20000);
                }
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>

</body>
</html>