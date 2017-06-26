<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式範本說明
    1.範本名稱:單檔操作 (Client Side Paging) V2017.03.07
                                     兼主副檔操作 之主檔
    2.說　　明:資料庫選取資料後,「全部」以JSON格式傳送到Browser端,由Browser 完成render
                                     資料搜尋壓力由DB主機承載。render壓力主要由Browser端承載。
    3.效能基準:7秒完成畫面載入, 7秒完成操作回應
    4.適用資料量: 3,000 筆 
    5.環境基準:待測
     
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
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>Role Type:</td>
                            <td>
                                <select id="criteria_role_type" name="criteria_role_type"   class="easyui-combobox" 
                                                          data-options="panelHeight:80"
                                                          style="width:200px;">                                                
                                                <c:forEach var="type" items="${requestScope.roleTypes}">
                                                <option value="${type.code}" >${type.description}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                </select>                            
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
            <div style="text-align:left;padding:5px 0"> 
            <table id="dg" title="Search Result" style="width:100%;height:335px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false">
                        
            </table>
            </div>
            <div id="dlg" class="easyui-dialog" title="Role Choose Dialog" data-options="iconCls:'icon-save'" style="width:400px;height:200px;padding:10px">
                <div style="text-align:center;padding:5px 0">
                <table style="width:100%">
                    <tr><td style="text-align:right">Copy From:</td>
                        <td><select id="srcRoleIdSelect" name="srcRoleIdSelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:300"
                                                          style="width:200px;">                                                
                                <c:forEach var="role" items="${requestScope.roles}">
                                    <option value="<c:out value="${role.id}"/>" ><c:out value="${role.roleName}"/></option>                                                
                                </c:forEach>                                                 
                             </select>
                        </td>
                    </tr>  
                    <tr> <td colspan="2" style="text-align:center">
                         <div style="text-align:center;padding:5px 0">
                             <a id="copyBtn"        href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Copy</a>
                             <a id="copyCancelBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('close')" style="width:80px">Cancel</a>
                         </div> 
                    </td>
                    </tr>  
                </table>
                </div>
           
            </div>
            
        </div>

        <form id="ff" method="POST">   
        <input id="id"            name="id"            type="hidden">
        <input id="operateAtTime" name="operateAtTime" type="hidden">
        <input id="roleType"      name="roleType"      type="hidden">
        
        <input id="targetRoleId"  name="targetRoleId"  type="hidden">
        <input id="srcRoleId"     name="srcRoleId"     type="hidden">
   
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table style="width:400px">
                            <tr>
                                <td>Role Type:</td>
                                <td><select id="roleTypeSelect" name="roleTypeSelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:65,separator:'|'"
                                                          style="width:200px;">
                                                <c:forEach var="type" items="${requestScope.roleTypes}">
                                                <option value="${type.code}" SELECTED>${type.description}</option>                                                
                                                </c:forEach>
                                    </select>
                                    <input class="easyui-textbox" id="roleTypeName" name="roleTypeName" style="width:100%" data-options="readonly:true">
                                </td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td><input class="easyui-textbox" id="roleName" name="roleName" style="width:100%" data-options="required:true"></td>
                            </tr>
                            <tr>
                                <td>Description:</td>
                                <td><input class="easyui-textbox" id="description" name="description" style="width:100%" data-options="required:true"></td>
                            </tr>
                            <tr>
                                <td>Editable:</td>
                                <td><select id="editable" name="editable"   class="easyui-combobox" 
                                                          data-options="panelHeight:60,required:true"
                                                          style="width:45px;">                       
                                    <option value="Y" >是</option>
                                    <option value="N" >否</option>                                                
                                    </select>
                                </td>
                            </tr>                         
                        </table>
                    </div>                
                    <div style="text-align:left;padding:5px 0">
                        <a id="saveBtn"    href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Save</a>
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
				//Copy Button
				$('#copyBtn').on('click', function(event) {											
	                $('#srcRoleId').val($('#srcRoleIdSelect').combobox('getValue'));
                    $.ajax({
                        url: httpDispatcher + '/auth/role/copyFrom',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){
                            if(data.message != null &&data.message != '') {
                                $.messager.alert('Success',data.message,'info');
                            }
                            $('#dlg').dialog('close');                              
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });
				});			
				//Search Button
				$('#searchBtn').on('click', function(event) {			
                    jsApp.ajax_findAll();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
					$('#criteria_role_type').combobox('setValue', ''); // select the "ALL" with empty value
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {			
					$('#id').val('');
	                $('#operateAtTime').val('');
	                $('#roleType').val('');
					
					$('#roleName').textbox("setText", '');
					$('#description').textbox("setText", '');
					
	                $('#roleTypeSelect').combobox('show');
					$('#roleTypeName').textbox('hide')					
					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						var action;
                        if($('#id').val() == '') { // create
                        	action = httpDispatcher + '/auth/role/create';
                        } else { // update
                        	action = httpDispatcher + '/auth/role/update'                             
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
                        url: httpDispatcher + '/auth/role/delete',
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
                    
					jsApp.togglePanel();
				});		
				//Cancel Button
				$('#cancelBtn').on('click', function(event) {	
	                $('#roleTypeSelect').combobox('hide');
					$('#roleTypeName').textbox('show')
					jsApp.togglePanel();
				});		
				
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){
                    	if (row){
    		                // $.messager.alert('Info', row.id+":"+row.catalogue+":"+row.code+":"+row.description);
    		                $('#id').val(row.id);
    		                $('#operateAtTime').val(row.operateAtTime);
    		                $('#roleType').val(row.roleType);
    		                    		                
    		                $('#roleTypeName').textbox("setValue", row.roleTypeName);    		                
    		                $('#roleName').textbox("setValue",     row.roleName);    						
    		                $('#description').textbox("setValue",  row.description);
    		                $('#editable').combobox('setValue',    row.editable);

    		                $('#roleTypeSelect').combobox('hide');
    						$('#roleTypeName').textbox('show')
    		                jsApp.togglePanel();
    		            }
                    }
                });			
                //-------------------------------------------------------------
			};

			return {
				init : function() {
					// 表單事件初始化					
					bundlePageEvent();
					$('#southPannel').toggle(); // hide southPanel
	                $('#roleTypeSelect').combobox('hide');
					$('#roleTypeName').textbox('show');
					$('#dlg').dialog('close');
					
					// if post back with msg , show it
					jsApp.showMsg();
					jsApp.ajax_findAll();
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
				ajax_findAll : function() {
					$('#dg').datagrid({
					    url: httpDispatcher +'/auth/role/findAll',
					    method:'post',
					    rownumbers:true,
					    pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                async: false,
		                queryParams: { 'roleType': $('#criteria_role_type').textbox("getValue") },
					    columns:[[
					        {width:5,  align:'right', field:'id',            title:'ID',            hidden:true},
		                    {width:5,  align:'right', field:'operateAtTime', title:'OperateAtTime', hidden:true},
		                    {width:5,  align:'right', field:'roleType',      title:'Role Type',     hidden:true},
		                    {width:5,  align:'right', field:'editable',      title:'Editable',      hidden:true},		                    
		                    {width:45, align:'right', field:'Action',        title:'Action',
		                    	formatter:function(value,row,index){
		                    		return '<a href="javascript:void(0)" '+
		                    		       'onclick="jsApp.detailEdit(\''+row.id+'\',\''+row.roleName+'\')">Edit</a> ';		                            
		                        }
		                    },
		                    {width:50, align:'right', field:'Copy',        title:'',
		                    	formatter:function(value,row,index){
		                    		return '<a href="javascript:void(0)" '+
		                    		       'onclick="jsApp.chooseRole(\''+row.id+'\')">Copy</a> ';		                            
		                        }
		                    },
		                    
		                    {width:80, align:'right',field:'roleTypeName',     title:'Role Type'},
		                    {width:180,align:'right',field:'roleName',         title:'Role Name'},
		                    {width:450,align:'right',field:'description',      title:'Description'},
		                    {width:60, align:'right',field:'editableName',     title:'Editable'}					
					    ]],
					    onLoadSuccess: function(result) {					    	
					    }, 
					    onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
					    	jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
					    	$('#dg').datagrid('loadData', {"total":0,"rows":[]});
					    }
					    
					});	
				},
				detailEdit : function (id, roleName) {
		       		$('#id').val(id);
		       		$('#roleName').textbox("setValue", roleName);
					appForm.attr('action', httpDispatcher + '/auth/role/detailEdit');
					appForm.submit();	
		       	}, 
		       	chooseRole : function(targetRoleId) {
		       		$('#targetRoleId').val(targetRoleId);
		       		$('#dlg').dialog('open');
		       	}
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>