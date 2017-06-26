<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
    1.Sever Side Paging + master detail   
  @author 291020 Vivian
          jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
          
  History:
      2017/03/?? first release
       
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
    <%@ include file="../jspPreload.jsp"%>
    <script type="text/javascript" src="${contextPath}/resources/js/jqueryEasyui/datagrid-detailview.js"></script>
</head>
<body>

        <div  id="northPannel"  style="width: 1558px; height: 190px;">
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:15px 30px;">
                    <table>
						<tr>
							<td>A/C Registr.</td>
							<td>
							    <select id="criteria_ac_registr"
								        name="criteria_ac_registr" class="easyui-combobox" data-options="panelHeight:65" style="width: 200px;">
					            <c:forEach var="obj" items="${requestScope.aircraft}">
                                                <option value="${obj}" >${obj}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
							    </select></td>
							<td>Start Date</td>
							<td><input id="criteria_start_date" class="easyui-datebox" style="width: 50%;"
							      data-options="formatter:egatFormatter,parser:egatParser"></td>
							<td>End Date</td>
							<td><input id="criteria_end_date" class="easyui-datebox" style="width: 50%;"
							      data-options="formatter:egatFormatter,parser:egatParser"></td>
						</tr>
		
						<tr>
							<td>W/P name:</td>
							<td>							
							<select id="criteria_wpno"
                                    name="criteria_wpno" class="easyui-combobox" data-options="panelHeight:300" style="width: 250px;">
                                <c:forEach var="workPackage" items="${requestScope.workPackages}">
                                    <option value="${workPackage.wpno}" >${workPackage.wpno}</option>                                                
                                </c:forEach>
                                    <option value="" SELECTED>ALL</option>
                            </select>
							
							
							
							
							</td>
							<td>W/P status:</td>
							<td><input id="criteria_wp_status" class="easyui-textbox" style="width: 100%;"></td>
							<td></td>
							<td></td>
						</tr>
		
						<tr>
							<td>Qualification:</td>
							<td><select id="criteria_qualification" class="easyui-combobox" data-options="panelHeight:65" style="width: 200px;">
							         <c:forEach var="scope" items="${requestScope.scope}">
                                                <option value="${scope.CODE}" >${scope.CODE}-${scope.DESCRIPTION}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
							    </select></td>
							<td>Assign Date</td>
							<td><input id="criteria_assign_date" class="easyui-datebox" style="width: 50%;"></td>
							<td>Shift</td>
							<td>
							    <select id="criteria_shift" class="easyui-combobox" data-options="panelHeight:65" style="width: 200px;">
							    <c:forEach var="shift" items="${requestScope.shift}">
                                                <option value="${shift.code}" >${shift.description}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
							    </select>
							</td>
						</tr>
					</table>    
            </div>
            <div style="text-align: left; padding: 5px 0">
			    <a id="searchBtn" href="javascript:void(0)" class="easyui-linkbutton" style="width: 80px">Search</a> 
		        <a id="resetBtn" href="javascript:void(0)"  class="easyui-linkbutton" style="width: 80px">Reset</a>
		    </div>
        </div>
        
        <div  id="centerPannel"  style="height:200px;">
            <table id="dg" title="Search Result" style="width:100%;height:335px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false">                
            </table>
        </div>
        
        <div id="dlg" class="easyui-dialog" title="Daily Work Assign List Report Query" data-options="iconCls:'icon-save'" style="width:360px;height:195px;padding:10px">
                <div style="text-align:center;padding:5px 0">
                <table style="width:320px">
                    <tr><td>WorkPackage:</td><td colspan="3"><span id="workpackageName"></span></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr> 
                    <tr> 
                        <td>Assign Date:</td>
                        <td><input id="target_assign_date" class="easyui-datebox" style="width: 90px;"
                                  data-options="formatter:egatFormatter,parser:egatParser">
                        </td>                                               
                    </tr> 
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>                    
                    <tr> 
                        <td colspan="6" style="text-align:center">
                        <div style="text-align:center;padding:5px 0">
                            <a id="printBtn"        href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Print</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a id="cancelBtn"       href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Cancel</a>                             
                        </div> 
                        </td>
                    </tr>
                     
                </table>
                </div>
           
        </div>
        <form id="ff" method="POST">     
            <!-- 頁面拋轉時, 傳送參數 -->
            <input id="assignId"      name="assignId"      type="hidden"> <!-- assign_id -->
            <input id="operateAtTime" name="operateAtTime" type="hidden">
            <input id="wpnoI"         name="wpnoI"         type="hidden">
            <input id="assign_date"   name="assign_date"   type="hidden">
            
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
					$('#criteria_ac_registr').textbox("setValue",'');					
					$('#criteria_start_date').textbox("setValue",'');
					$('#criteria_end_date').textbox("setValue",'');
					$('#criteria_wpno').textbox("setValue",'');
					$('#criteria_wp_status').textbox("setValue",'');
					$('#criteria_qualification').combobox("setValue",'');
					$('#criteria_assign_date').datebox("setValue",'');
					$('#criteria_shift').combobox("setValue",'');					
				});				
				//Cancel Button
                $('#cancelBtn').on('click', function(event) {
                	$('#dlg').dialog('close'); 
                });         
                //Print Button
                $('#printBtn').on('click', function(event) {
                	$('#assign_date').val($('#target_assign_date').datebox("getValue"));
                	
                    $.ajax({
                        url: httpDispatcher + '/jobAssign/wpList/genReport',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){
                            var jsonObj = { filelist : [] };                                
                            $.fileDownload(httpDispatcher + '/jobAssign/wpList/downloadReport', {
                                httpMethod: "POST",
                                data: {act: "downloadZipFiles", jsonstr: JSON.stringify(jsonObj)}
                            }); 
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });   
                });         
				
			};
			

			return {
				init : function() {
					//jsApp.ajax_findBy();
					// 表單事件初始化
					bundlePageEvent(); // 資料載入後再綁事件
					$('#dlg').dialog('close'); 
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
					$('#dg').datagrid({
						url : httpDispatcher + '/wpHeader/findBy',
					    method:'post',
		                rownumbers:true,                    
		                pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                queryParams: {
		                	      'wpno' : $('#criteria_wpno').textbox("getValue"),
		                	  'end_date' : $('#criteria_end_date').textbox("getValue"),
		                	 'wp_status' : $('#criteria_wp_status').textbox("getValue"),
		                	'start_date' : $('#criteria_start_date').textbox("getValue"),
		                	'ac_registr' : $('#criteria_ac_registr').combobox("getValue")							
		                },
					    columns:[[
					    	{width :  60, align : 'center',  field : 'Report',                 title : 'Report',
                                formatter:function(value,row,index){
                                    return '<a href="javascript:void(0)" '+
                                           'onclick="jsApp.dailyWorkAssign(\''+row.wpnoI+'\',\''+row.wpno+'\')">Query</a> ';                                   
                                }
                            },
                            {width : 120, align : 'center',  field : 'Action',                 title : 'Action',
								formatter:function(value,row,index){
		                    		return '<a href="javascript:void(0)" '+
		                    		       'onclick="jsApp.addJobAssign(\''+row.wpnoI+'\')">New Assignment</a> ';		                            
		                        }
							},
							{width :  80, align : 'left',    field : 'acRegistr',              title : 'AirCraft'},
							{width : 250, align : 'left',    field : 'wpno',                   title : 'W/P Name'},							                            
                            {width : 100, align : 'right',   field : 'formattedStartDate',     title : 'Start Date'},
                            {width : 100, align : 'right',   field : 'formattedEndDate',       title : 'End Date'},
                            {width : 100, align : 'right',   field : 'formattedActStartDate',  title : 'Act Start Date'},
                            {width : 100, align : 'right',   field : 'formattedActEndDate',    title : 'Act End Date'},
                            {width : 240, align : 'left',    field : 'description',            title : 'Description'},
                            {width :  80, align : 'right',   field : 'wpStatus',               title : 'W/P status'},
                            {width : 120, align : 'right',   field : 'hidden',                 title : 'Classification'}

					    ]],
					    onLoadSuccess: function(result) {				    	
					    }, 
					    onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
					    	jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
					    },
					    view: detailview,
		                detailFormatter:function(index,row){
		                    return '<div style="padding:2px"><table class="ddv"></table></div>';
		                },
		                onExpandRow: function(index,row){
		                    var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
		                    ddv.datagrid({
		                        url:httpDispatcher+'/jobAssign/detail/'+row.wpnoI,
		                        fitColumns:true,
		                        singleSelect:true,
		                        rownumbers:true,
		                        loadMsg:'',
		                        height:'auto',
		                        columns:[[
                                    {width:45,  align:'center', field:'Action',       title:'Action',
                                        formatter:function(value,row,index){
                                            return '<a href="javascript:void(0)" '+
                                                   'onclick="jsApp.editJobAssign(\''+row.id+'\','+row.operateAtTime+')">Edit</a> ';
                                         }
                                    },
                                    {width:100,                 field:'formattedAssignDate',  title:'Assign date'  },
                                    {width:100, align:'right',  field:'qualification',        title:'Qualification'},
                                    {width:100, align:'right',  field:'shift',                title:'Shift'        },
                                    {width:100, align:'center', field:'status',               title:'Status'       }
                                
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
		                    $('#dg').datagrid('fixDetailRowHeight',index);
		                }
					});	
			    },
			    addJobAssign : function (wpno_i) {
		       		//丟 資料到html tag
					appForm.attr('action', httpDispatcher + '/jobAssign/addPage/'+wpno_i);
					appForm.submit();	
		       	},
		       	dailyWorkAssign : function (wpno_i, wpno) {
		       		$('#wpnoI').val(wpno_i);
		       		$('#workpackageName').text(wpno);
		       		$('#dlg').dialog('open'); 
                },
		       	editJobAssign : function (id, operateAtTime) {
		       	    $('#assignId').val(id);
	                $('#operateAtTime').val(operateAtTime);
		       		
					appForm.attr('action', httpDispatcher + '/jobAssign/editPage/'+id);
					appForm.submit();	
		       	}
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>