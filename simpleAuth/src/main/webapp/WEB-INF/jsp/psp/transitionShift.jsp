<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式範本說明
    1.範本名稱:單檔操作 (Client Side Paging) V2017.03.07
                                     兼主副檔操作 之副檔

  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
     2017/02/16 first release
     2017/03/07 bug fix.  when ajax_findBy error, datagrid should be cleared.        
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
            <div style="text-align:left;padding:5px 0">
                <a id="backBtn" href="javascript:void(0)" class="easyui-linkbutton" 
                   data-options="plain:true,iconCls:'icon-back'"　>Back To:${requestScope.employee.firstName} ${requestScope.employee.lastName}</a>                
            </div>
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>From:</td>
                            <td><input  id="criteria_fromStartDate"         name="criteria_fromStartDate" 
                                        class="easyui-datebox"  style="width:120px;"
                                        data-options="formatter:egatFormatter,parser:egatParser">
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
            
            
        </div>
        
        
        <form id="ff" method="POST"> 
        <input id="employeeId"    name="employeeId"      type="hidden" value="${requestScope.employee.id}">
        <input id="employeeNo"    name="employeeNo"      type="hidden" value="${requestScope.employee.employeeNo}">
                
        <input id="id"        name="id"          type="hidden">                       
        <input id="operateAt" name="operateAt"   type="hidden">     
           
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table style="width:600px">
                        <tr>
                            <td>Section:</td>
                            <td style="align:left"><select id="shiftSection" name="shiftSection"   class="easyui-combobox" 
                                                          data-options="panelHeight:300"
                                                          style="width:300px;">                                                
                                <c:forEach var="entity" items="${requestScope.sections}">
                                   <option value="${entity.section}">${entity.section}-${entity.description}</option>                                                
                                </c:forEach>                                                 
                             </select>
                              
                            </td> 
                            <td>Team:</td>
                            <td><input class="easyui-textbox" id="team" name="team" style="width:80px">
                            </td>
                        </tr>
                        <tr><td>From Date:</td>
                            <td> <input  id="transStartDate"      name="transStartDate" 
                                             class="easyui-datebox" style="width:120px;"
                                             data-options="formatter:egatFormatter,parser:egatParser">
                            </td>                                
                            <td>To Date:</td>
                            <td> <input  id="transToDate"         name="transToDate"
                                             class="easyui-datebox"  style="width:120px;"
                                             data-options="formatter:egatFormatter,parser:egatParser">
                            </td>
                        </tr> 
        
                    </table>
                                    
                    <div style="text-align:left;padding:5px 0">
                        <a id="saveBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Save</a>
                        <a id="deleteBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Delete</a>
                        <a id="cancelBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Cancel</a>
                    </div>  
            </div>
        </div>    
        </form>
	<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}';
	    var appForm = $('#ff');        
	    var errorMsg = '${errorMsg}';
	    var msg      = '${msg}';
	    
		// override the function, to let datagrid doing client side paging.
		$(function(){        	
            $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', $('#dg').datagrid("getData"));
        });

		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				// Back Button
				$('#backBtn').on('click', function(event) {
					appForm.attr('action', httpDispatcher + '/psp/transition/backToMaster');
					appForm.submit();
				});
				
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
					$('#criteria_fromStartDate').datebox("setValue", '')										
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {	
					$('#id').val('');
					$('#operateAt').val('');	                	                
	                
					$('#shiftSection').combobox("setValue",'');
					$('#team').textbox("setValue",'');
					$('#transStartDate').datebox("setValue",'');
					$('#transToDate').textbox("setValue",'9999/12/31');

					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						var action;
						if($('#id').val() == '') { // create
                        	action = httpDispatcher + '/psp/transition/create';
                        } else {
                        	action = httpDispatcher + '/psp/transition/update';
                        }
                        $.ajax({
                            url: action,
                            data: appForm.serialize(),
                            type:"POST",
                            dataType:'json',
                            success: function(data){
                                if(data.message != null &&data.message != '') {
                                    $.messager.alert('Success',data.message,'info');
                                }
                                $('#dg').datagrid('reload'); // reload current page                                 
                            },                            
                            error:function(XMLHttpRequest, textStatus, errorThrown) {
                                jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            }
                        });						
					} else {
						$.messager.alert('Info', 'Validation Error.');
					}
					
					jsApp.togglePanel();
				});		
				
				//delete Button
				$('#deleteBtn').on('click', function(event) {	
					if($('#id').val() == '') { // when create, delete is not allowed
						$.messager.alert('Warn',"No data to delete.",'warn');
					    return;
                    }
					$.ajax({
                        url: httpDispatcher + '/psp/transition/delete',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){
                            if(data.message != null &&data.message != '') {
                                $.messager.alert('Success',data.message,'info');
                            }
							var gridData = $('#dg').datagrid('getData');
							if(gridData.rows.length == 1) { // current page has only one row
								var opts = $('#dg').datagrid('options');
								var prePage = opts.pageNumber -1;								
								if(prePage >= 1) { // after delete, go to previous page.
									$('#dg').datagrid('gotoPage', prePage);	
								} else {
									$('#dg').datagrid('loadData', {"total":0,"rows":[]}); // all deleted.
								}									
							} else {
								$('#dg').datagrid('reload'); // reload current page.
							}                             
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });						

					jsApp.togglePanel();
				});		
				//Cancel Button
				$('#cancelBtn').on('click', function(event) {			
					jsApp.togglePanel();
				});		
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){                    	
		                $('#id').val(row.id);		                
		                $('#operateAt').val(row.operateAtTime);
		               
						$('#shiftSection').combobox("setValue", row.shiftSection);
						$('#team').textbox("setValue", row.team);
						$('#transStartDate').datebox("setValue", row.transStartDateString);
						$('#transToDate').textbox("setValue", row.transToDateString);

						jsApp.togglePanel();
                    }
                });		
                
                //-------------------------------------------------------------	
			};
			

			return {
				init : function() {					
					// 表單事件初始化
					bundlePageEvent(); // 資料載入後再綁事件
					$('#southPannel').toggle();
	                $('#parentFunIdSelect').combobox('hide');
					$('#parentFunName').textbox('show');
					
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
				fixPersonalShift : function(id, employeeNo) {
					$('#id').val(id);
					$('#employeeNo').val(employeeNo);
					$.ajax({
                        url: httpDispatcher + '/psp/transition/fixPersonalShift',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){
                            if(data.message != null &&data.message != '') {
                                $.messager.alert('Success',data.message,'info');
                            }
                                                    
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });                 
				},
			    ajax_findBy : function() {
					$('#dg').datagrid({
					    url: httpDispatcher + '/psp/transition/detailFindAll',
					    method:'post',
		                rownumbers:true,                    
		                pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                async: false,
		                queryParams: { 'employeeNo':  $('#employeeNo').val(), 
		                               'fromDate':  $('#criteria_fromStartDate').datebox("getValue")            
		                },
					    columns:[[	
					    	{width:120, align:'center', field:'Action',        title:'Action',
                                formatter:function(value,row,index){
                                    return '<a href="javascript:void(0)" '+
                                           'onclick="jsApp.fixPersonalShift(\''+row.id+'\',\''+row.employeeNo+'\')">Fix Personal Shift</a> ';                                  
                                }
                            },
					        {width:80, align:'left', field:'shiftSection',   title:'Section'},
		                    {width:80, align:'left', field:'team',           title:'Team'},
		                    {width:480,align:'left', field:'sectionName',    title:'Section Name'},
		                    {width:100,align:'left', field:'transStartDateString', title:'From Date'},
		                    {width:100,align:'right',field:'transToDateString',    title:'To Date'},		                    
		                    {width:120,align:'right',field:'lastUpdate',           title:'Update At'}		                    					
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