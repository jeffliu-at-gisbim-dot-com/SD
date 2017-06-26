<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式範本說明
    1.範本名稱:單檔操作 (Server Side Paging) V2017.03.07
    2.說　　明:資料庫選取資料後,以JSON格式傳送到Browser端,由Browser 完成render
                                     資料搜尋壓力由DB主機承載。render壓力主要由Browser端承載。
    3.效能基準:7秒完成畫面載入, 7秒完成操作回應
    4.適用資料量: 2,0000,000 筆 
    5.環境基準:待測
     
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  
  History:
      2017/02/16 first release
      2017/02/18 refactor for jsApp & timestamp
      2017/02/22 improve IE compatability.
                 Root Cause: 
                    A. Due to easyui form will send data by iframe.
                       IE will take it as a "DOWNLOAD" request.
                    B. IE cached the "GET" http request
                       , that cause datagrid refresh fail.
                 Solution: 
				    A. rewrite the 'save', 'update', 'delete' using native jquery ajax.
                    B. change datagrid request from "get" to "post". (LINE:371)
      2017/02/22 fix Bug. for no data found.   
      2017/03/01 bug fix.  when create, delete is not allowed   
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
        <input id="id"        name="id"          type="hidden">        
        <input id="operateAt" name="operateAt"   type="hidden">     
           
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table style="width:100%">
                        <tr>
                            <td style="width:15%, align:right">功能分類:</td>
                            <td style="align:left"><select id="parentFunIdSelect" name="parentFunIdSelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:80"
                                                          style="width:200px;">                                                
                                <c:forEach var="fun" items="${requestScope.topFuns}">
                                    <option value="${fun.FUN_ID}" >${fun.FUN_NAME}</option>                                                
                                </c:forEach>
                                    <option value="">頂層分類</option>              
                             </select>
                             <input class="easyui-textbox" id="parentFunName" name="parentFunName" style="width:200px" data-options="readonly:true"> 
                            </td>
                            <td style="width:5%"></td>                             
                            <td style="width:15%, align:right">支援操作</td>
                            <td style="align:left"><input class="easyui-textbox" id="funOperation" name="funOperation" style="width:160px" data-options="required:false"></td>
                        </tr>
                        <tr><td style="width:15%, align:right">功能代碼:</td>
                            <td><input class="easyui-textbox" id="funCode" name="funCode" style="width:160px" data-options="required:true"></td>
                            <td style="width:5%"></td>
                            <td style="width:15%, align:right">功能名稱:</td>
                            <td><input class="easyui-textbox" id="funName" name="funName" style="width:300px" data-options="required:true"></td>
                        </tr>
                        <tr><td style="width:15%, align:right">功能型別:</td>
                            <td><select id="funType" name="funType"   class="easyui-combobox" 
                                                          data-options="panelHeight:80,required:true"
                                                          style="width:200px;">                                                
                                <c:forEach var="misc" items="${requestScope.funTypes}">
                                    <option value="${misc.code}" >${misc.description}</option>                                                
                                </c:forEach>
                                                
                                </select> 
                            </td>
                            <td style="width:5%"></td>
                            <td style="width:15%, align:right">功能路徑:</td>
                            <td><input class="easyui-textbox" id="funPath" name="funPath" style="width:300px" data-options="required:false"></td>
                        </tr>
                        <tr><td style="width:15%, align:right">功能分層:</td>
                            <td><input class="easyui-textbox" id="layer" name="layer" style="width:80px" data-options="required:true"></td>
                            <td style="width:5%"></td>
                            <td style="width:15%, align:right">功能顯示順序:</td>
                            <td><input class="easyui-textbox" id="layerSort" name="layerSort" style="width:80px" data-options="required:true"></td>
                        </tr>
                        <tr>
                            <td style="width:15%, align:right">啟用:</td>
                            <td><select id="activeFlag" name="activeFlag"   class="easyui-combobox" 
                                                          data-options="panelHeight:60,required:true"
                                                          style="width:45px;">                       
                                    <option value="Y" >是</option>
                                    <option value="N" >否</option>                                                
                                </select>
                            </td>
                            <td style="width:5%"></td>
                            <td style="width:15%, align:right">啟動功能:</td>
                            <td><select id="bootFlag" name="bootFlag"   class="easyui-combobox" 
                                                          data-options="panelHeight:60,required:true"
                                                          style="width:45px;">                       
                                    <option value="Y" >是</option>
                                    <option value="N" >否</option>                                                
                             </select>
                             </td>
                        </tr>
                        <tr><td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
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
					$('#criteria_function_code').textbox("setValue",'');					
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {	
	                $('#parentFunIdSelect').combobox('show');
					$('#parentFunName').textbox('hide')

					$('#id').val('');
					$('#operateAt').val('');
					
	                $('#parentFunName').textbox("setText", ''); // default for new
	                $('#funOperation').textbox("setValue",  '');
	                $('#funCode').textbox("setValue",    '');
	                $('#funName').textbox("setValue",    '');
	                $('#funType').combobox('setValue',   'W');
	                $('#funPath').textbox("setValue",    '');
	                $('#layer').textbox("setValue",      '');
	                $('#layerSort').textbox("setValue",  '');		                
	                $('#activeFlag').combobox('setValue','Y');
	                $('#bootFlag').combobox('setValue',  'Y');
					
					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						// improve IE compatibility.
						var action;
                        if($('#id').val() == '') { // create
                        	action = httpDispatcher + '/auth/function/create';
                        } else { // update
                        	action = httpDispatcher + '/auth/function/update'                             
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

                        /*
                        *  deprecated.
                        *   
                        *   if($('#id').val() == '') { // create
                        *       appForm.attr('action', httpDispatcher + '/auth/function/create');
                        *   } else { // update
                        *       appForm.attr('action', httpDispatcher + '/auth/function/update');
                        *   }
                        *   appForm.form({
                        *       success:function(result) {
                        *           // change the JSON string to javascript object
                        *           var data = eval('(' + result + ')');  
                        *           if(jsApp.ajaxPostSuccess(data)){
                        *               $('#dg').datagrid('reload'); // reload current page
                        *           };
                        *           
                        *       }
                        *   }); 
                        *   appForm.form('submit');
                        */
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
					// improve IE compatibility.
                    $.ajax({
                        url: httpDispatcher + '/auth/function/delete',
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
								var prePage = opts.pageNumber -1
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
					
					/*
                    *   deprecated.
                    *
                    *   appForm.attr('action', httpDispatcher + '/auth/function/delete');
                    *   appForm.form({
                    *       success:function(result) {
                    *           var data = eval('(' + result + ')');                                    
                    *           if(jsApp.ajaxPostSuccess(data)){
                    *               var gridData = $('#dg').datagrid('getData');
                    *               if(gridData.rows.length == 1) { // current page has only one row
                    *                   var opts = $('#dg').datagrid('options');
                    *                   var prePage = opts.pageNumber -1
                    *                   if(prePage >= 1) { // after delete, go to previous page.
                    *                       $('#dg').datagrid('gotoPage', prePage); 
                    *                   }                                   
                    *               } else {
                    *                   $('#dg').datagrid('reload'); // reload current page.
                    *               }                               
                    *           };
                    *       }
                    *   });
                    *   appForm.form('submit');
                    */
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
		                $('#operateAt').val(row.operateAt);
		                
		                $('#parentFunName').textbox("setText", row.parentFunName);
		                $('#funOperation').textbox("setValue", row.funOperation);
		                $('#funCode').textbox("setValue",    row.funCode);
		                $('#funName').textbox("setValue",    row.funName);
		                $('#funType').combobox('setValue',   row.funType);
		                $('#funPath').textbox("setValue",    row.funPath);
		                $('#layer').textbox("setValue",      row.layer);
		                $('#layerSort').textbox("setValue",  row.layerSort);		                
		                $('#activeFlag').combobox('setValue',row.activeFlag);
		                $('#bootFlag').combobox('setValue',  row.bootFlag);
		                    		                
		                $('#parentFunIdSelect').combobox('hide');
						$('#parentFunName').textbox('show')
						jsApp.togglePanel();
                    }
                });		
                
                //-------------------------------------------------------------	
			};
			

			return {
				init : function() {
					jsApp.ajax_findBy();
					// 表單事件初始化
					bundlePageEvent(); // 資料載入後再綁事件
					$('#southPannel').toggle();
	                $('#parentFunIdSelect').combobox('hide');
					$('#parentFunName').textbox('show');
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
					    url: httpDispatcher+ '/auth/function/findBy',
					    method:'post',
		                rownumbers:true,                    
		                pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                queryParams: { 'funCode': $('#criteria_function_code').textbox("getValue") },
					    columns:[[
					        {width:80, align:'right',field:'funCode',     title:'Code'},
		                    {width:320,align:'left', field:'funName',     title:'Name'},
		                    {width:100,align:'right',field:'funTypeName', title:'Type'},
		                    {width:240,align:'left', field:'funPath',     title:'Path'},
		                    {width:40, align:'right',field:'layer',       title:'Layer'},
		                    {width:40, align:'right',field:'layerSort',   title:'Sort'},
		                    {width:100,align:'right',field:'funOperation',title:'Operation'},
		                    {width:40, align:'right',field:'active',      title:'Active'},
		                    {width:40, align:'right',field:'boot',        title:'Boot'},
		                    {width:40, align:'right',field:'id',            title:'Id',           hidden:true},		                    
		                    {width:40, align:'right',field:'operateAt',     title:'OperateAt',    hidden:true},
		                    {width:40, align:'right',field:'parentFunName', title:'parentFunName',hidden:true}					
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