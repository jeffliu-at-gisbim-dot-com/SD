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
                   data-options="plain:true,iconCls:'icon-back'"　>Back To:${requestScope.role.roleName}</a>                
            </div>
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>Function Code:</td>
                                 <td><input id="criteria_function_code" name="criteria_function_code"  class="easyui-textbox" 
                                                          style="width:100%"></td>
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
        <input id="roleId"    name="roleId"      type="hidden" value="${requestScope.role.id}">
                
        <input id="id"        name="id"          type="hidden">               
        <input id="funId"     name="funId"       type="hidden">
        <input id="operateAt" name="operateAt"   type="hidden">     
           
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table style="width:100%">
                        <tr>
                            <td style="width:15%, align:right">功能:</td>
                            <td style="align:left"><select id="funIdSelect" name="funIdSelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:300"
                                                          style="width:200px;">                                                
                                <c:forEach var="fun" items="${requestScope.funs}">
                                    <option value="${fun.id}" >${fun.funName}</option>                                                
                                </c:forEach>                                                 
                             </select>
                             <input class="easyui-textbox" id="funName" name="funName" style="width:400px" data-options="readonly:true"> 
                            </td>                           
                        </tr>
        
                    </table>
                                    
                    <div style="text-align:left;padding:5px 0">
                        <a id="saveBtn"     href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Add</a>
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
					appForm.attr('action', httpDispatcher + '/auth/role/backToMaster');
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
					$('#criteria_function_code').textbox("setValue",'');
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {	
					$('#id').val('');
					$('#operateAt').val('');	                
	                $('#funId').val('');
	                
	                $('#funIdSelect').combobox('show');
					$('#funName').textbox('hide')
					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						var action;
						if($('#id').val() == '') { // create
                        	action = httpDispatcher + '/auth/roleFun/create';
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
                        url: httpDispatcher + '/auth/roleFun/delete',
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
		                $('#funId').val(row.funId);
		                $('#operateAt').val(row.operateAtTime);
		                $('#funName').textbox("setValue", row.funName);		                
		                
		                $('#funIdSelect').combobox('hide');
						$('#funName').textbox('show')

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
				ajaxGetMsg : function (XMLHttpRequest, textStatus, errorThrown){
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
					    url: httpDispatcher + '/auth/roleAuth/detailFindAll',
					    method:'post',
		                rownumbers:true,                    
		                pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                async: false,
		                queryParams: { 'funCode': $('#criteria_function_code').textbox("getValue"), 'roleId': $('#roleId').val()},
					    columns:[[					    	
					        {width:80, align:'right',field:'funCode',     title:'Code'},
		                    {width:320,align:'left', field:'funName',     title:'Name'},
		                    {width:100,align:'right',field:'funTypeName', title:'Type'},
		                    {width:140,align:'left', field:'funPath',     title:'Path'},
		                    {width:40, align:'right',field:'layer',       title:'Layer'},
		                    {width:40, align:'right',field:'layerSort',   title:'Sort'},
		                    {width:40, align:'right',field:'active',      title:'Active'},
		                    {width:40, align:'right',field:'boot',        title:'Boot'},
		                    {width:100,align:'right',field:'funOperation',title:'Operation'},
		                    {width:100,align:'right',field:'operateBy',   title:'By'},
		                    {width:100,align:'right',field:'lastUpdate',  title:'Time'},
		                    
		                    {width:340, align:'right',field:'id',          title:'Id',       hidden:true},
		                    {width:40, align:'right',field:'roleId',       title:'RoleId',   hidden:true},
		                    {width:40, align:'right',field:'runId',        title:'FunId',    hidden:true},		                    
		                    {width:40, align:'right',field:'operateAtTime',title:'OperateAt',hidden:true},		                    					
					    ]],
					    onLoadSuccess: function(result) {				    	
					    }, 
					    onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
					    	jsApp.ajaxGetMsg(XMLHttpRequest, textStatus, errorThrown);
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