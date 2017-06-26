<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式範本說明
    1.範本名稱:單檔操作 (Client Side Paging)
    2.說　　明:
     
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  History:
     2017/03/?? first release
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
                        <tr>
                                <td>Department Sum:</td>
                                <td><input class="easyui-textbox" id="criteria_topOrg" name="criteria_topOrg" style="width:80px;" >                                    
                                </td>
                                <td style="text-align:right">&nbsp;&nbsp;Department:</td>
                                <td><select id="criteria_departmentCode" name="criteria_departmentCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:300px;">
                                                <c:forEach var="entity" items="${requestScope.departments}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                                </select>                               
                                </td>  
                                <td style="text-align:right">&nbsp;&nbsp;Section:</td>
                                <td><select id="criteria_sectionCode" name="criteria_sectionCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:300px;">
                                                <c:forEach var="entity" items="${requestScope.sections}">
                                                <option value="${entity.section}">${entity.section}-${entity.description}</option>                                                   
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
        </div>

        <form id="ff" method="POST">   
        <input id="id"            name="id"            type="hidden">
        <input id="operateAtTime" name="operateAtTime" type="hidden">

   
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table style="width:80%">
                            <tr>
                                <td>Department Sum:</td>
                                <td><input class="easyui-textbox" id="topOrg"       name="topOrg"        style="width:60px;"  
                                           data-options="required:true"  validType="length[4,4]" invalidMessage="長度需等於4"></td>                                 
                            </tr>
                            <tr>               
                                <td>Department:</td>
                                <td>
                                    <select id="departmentCode" name="departmentCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:400px;">
                                                <c:forEach var="entity" items="${requestScope.data}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                
                                                </c:forEach>                                                
                                    </select>
                                </td>
                             </tr>
                             </tr>    
                                <td>Section:</td>
                                <td><select id="sectionCode" name="sectionCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:500px;">
                                                <c:forEach var="entity" items="${requestScope.data}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                  
                                                </c:forEach>                                                
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
						
				//Search Button
				$('#searchBtn').on('click', function(event) {			
                    jsApp.ajax_findBy();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {						
					$('#criteria_topOrg').textbox('setValue', '');
					$('#criteria_departmentCode').combobox('setValue', '');
					$('#criteria_sectionCode').combobox('setValue', ''); // select the "ALL" with empty value
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {			
					$('#id').val('');
	                $('#operateAtTime').val('');
                    
	                $('#topOrg').textbox("setValue", '');                    
	                $('#departmentCode').combobox("setValue", '');
					$('#sectionCode').combobox("setValue", '');                    
					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						var action;
                        if($('#id').val() == '') { // create
                        	action = httpDispatcher + '/lbr/departmentOrg/create';
                        } else { // update
                        	action = httpDispatcher + '/lbr/departmentOrg/update'                             
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
                        jsApp.togglePanel();
					} else {
						$.messager.alert('Info', 'Validation Error.');
					}	
					
					
				});		
				
				//delete Button
				$('#deleteBtn').on('click', function(event) {
					if($('#id').val() == '') { // when create, delete is not allowed
						$.messager.alert('Warn',"No data to delete.",'warn');
					    return;
                    }
					
                    $.ajax({
                        url: httpDispatcher + '/lbr/departmentOrg/delete',
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
					jsApp.togglePanel();
				});		
				
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){
                    	if (row){
    		                // $.messager.alert('Info', row.id+":"+row.catalogue+":"+row.code+":"+row.description);
    		                $('#id').val(row.id);
    		                $('#operateAtTime').val(row.operateAtTime);
    		                
    	                    $('#topOrg').textbox("setValue",       row.topOrg);    	                        	                    
    	                    $('#sectionCode').combobox("setValue", row.sectionCode);
    	                    $('#departmentCode').combobox("setValue",  row.departmentCode);
    	                    
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

					// if post back with msg , show it
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
				ajax_findBy : function() {
					$('#dg').datagrid({
					    url: httpDispatcher +'/lbr/departmentOrg/findBy',
					    method:'post',
					    rownumbers:true,
					    pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                async: false,
		                queryParams: { 'topOrg': $('#criteria_topOrg').textbox("getValue"),
		                	           'departmentCode': $('#criteria_departmentCode').combobox("getValue"),		                
		                               'sectionCode'   : $('#criteria_sectionCode').combobox("getValue") 
		                },
					    columns:[[					        
		                    {width:80, align:'right',field:'topOrg',         title:'Sum Code'},		                    
		                    {width:80, align:'right',field:'departmentCode', title:'Dept. Code'},		                    
		                    {width:280,align:'left', field:'departmentName', title:'Department'},
		                    {width:80, align:'right',field:'sectionCode',    title:'Sec. Code'},
		                    {width:280,align:'left', field:'sectionName',    title:'Section'}		                    
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