<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
    1.基準範本:單檔操作 (Server Side Render)  V2017.03.01
    2.說　　明: 使用者指定  user 具備的角色 (Role)及其有效期間
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  History:
     2017/03/03 first release
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
                        <tr><td>User ID:</td>
                            <td><input class="easyui-textbox" id="criteria_userId" name="criteria_userId" style="width:100%" value="${requestScope.userId}"></td>
                            <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                            <td style="text-align:right">Role:</td>                            
                            <td>
                                <select id="criteria_roleId" name="criteria_roleId"   class="easyui-combobox" 
                                                          data-options="panelHeight:180"
                                                          style="width:200px;">                                                
                                                <c:forEach var="role" items="${requestScope.roles}">
                                                <option value="${role.id}"> ${role.roleName}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                                
                                                
                                </select>                            
                            </td>  
                        </tr>
                        <tr><td>Valid Time:</td>
                            <td> <input  id="criteria_validTime"    name="criteria_validTime" 
                                      class="easyui-datebox"        style="width:120px;"
                                      data-options="formatter:egatFormatter,parser:egatParser"></td>
                            <td colspan="3"></td>                                      
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
            <table id="dg" title="Search Result" style="width:100%;height:335px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false,
                        remoteSort:false,
                        multiSort:true
                        ">
                <thead>
                    <tr>
                        <th field="userId"       width="80"  align="right" data-options="field:'userId',sortable:true">User Id</th>
                        <th field="roleName"     width="150" align="right" data-options="field:'roleName',sortable:true">Role Name</th>
                        <th field="startFromTs"  width="150" align="right" data-options="field:'startFromTs',sortable:true">Valid From</th>
                        <th field="endAtTs"      width="150" align="right" data-options="field:'endAtTs',sortable:true">End At</th>
                        
                        <th field="id"         data-options="field:'id',hidden:true">ID</th>
                        <th field="operateAt"  data-options="field:'operateAt',hidden:true">operateAt</th>
                        <th field="roleId"     data-options="field:'roleId',hidden:true">Role Id</th>
                        <th field="startFrom"  data-options="field:'startFrom',hidden:true">Role Id</th>
                        <th field="endAt"      data-options="field:'endAt',hidden:true">Role Id</th>
                    </tr>
                </thead>
                <c:forEach var="entity" items="${requestScope.data}">
                <tr><td>${entity.userId}</td><td>${entity.roleName}</td><td>${entity.startFromTs}</td>
                    <td>${entity.endAtTs}</td><td>${entity.id}</td><td>${entity.operateAtTime}</td>
                    <td>${entity.roleId}</td><td>${entity.startFrom}</td><td>${entity.endAt}</td>
                </tr>   
                </c:forEach>
            </table>
        </div>

        <form id="ff" method="POST">   
        <input id="id"        name="id"        type="hidden">
        <input id="operateAt" name="operateAt" type="hidden">
        <input id="roleId"    name="roleId"    type="hidden">
   
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table>
                            <tr><td>User ID:</td>
                                <td><input id="userId"           name="userId" 
                                        class="easyui-textbox"  style="width:100%"></td>
                                <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>        
                                <td>Role:</td>
                                <td>
                                    <select id="roleIdSelect" name="roleIdSelect"   class="easyui-combobox" 
                                                              data-options="panelHeight:180"
                                                              style="width:200px;">                                                
                                                    <c:forEach var="role" items="${requestScope.roles}">
                                                    <option value="${role.id}" >${role.roleName}</option>                                                
                                                    </c:forEach>                                                    
                                    </select>
                                    <input class="easyui-textbox" id="roleName" name="roleName" style="width:200px;" data-options="readonly:true">                            
                                </td>
                            </tr>
                            <tr><td>Valid From</td>
                                <td> <input  id="validateFrom"      name="validateFrom" 
                                             class="easyui-datebox" style="width:120px;"
                                             data-options="formatter:egatFormatter,parser:egatParser"></td>
                                <td></td>             
                                <td>Valid To</td>
                                <td> <input  id="validateTo"         name="validateTo" 
                                             class="easyui-datebox"  style="width:120px;"
                                             data-options="formatter:egatFormatter,parser:egatParser"></td>
                            </tr>                 
                        </table>
                    </div>                
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
		var gridData;
		

       	
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				//Search Button
				$('#searchBtn').on('click', function(event) {		
					$('#userId').textbox('setValue', $('#criteria_userId').textbox('getValue'));
					$('#roleId').val($('#criteria_roleId').combobox('getValue'));
					$('#validateFrom').datebox('setValue', $('#criteria_validTime').datebox('getValue'));
					
					appForm.attr('action', httpDispatcher + '/auth/userAuth/findBy'); // findBy
					appForm.submit();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
	                $('#criteria_userId').textbox('setValue', '');
	                $('#criteria_roleId').combobox('setValue', ''); 
	                $('#criteria_validTime').datebox('setValue', '');	               
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {				                
					$('#id').val('');
	                $('#operateAt').val('');    		                
	                $('#roleId').val('');
	                
	                $('#userId').textbox('setValue', '');
	                $('#validateFrom').datebox('setValue', '');
	                $('#validateTo').datebox('setValue', '');
	                
	                $('#roleIdSelect').combobox('show');
					$('#roleName').textbox('hide')					
					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						if($('#id').val() == '') {
							appForm.attr('action', httpDispatcher + '/auth/userAuth/create');	// create 						
							appForm.submit();  
						} else {
							appForm.attr('action', httpDispatcher + '/auth/userAuth/update'); // update
							appForm.submit();
						}

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
					appForm.attr('action', httpDispatcher + '/auth/userAuth/delete'); // delete
					appForm.submit();					
				});		
				//Cancel Button
				$('#cancelBtn').on('click', function(event) {	
	                $('#catalogueSelect').combobox('hide');
					$('#catalogueName').textbox('show')
					jsApp.togglePanel();
				});		
				
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){
                    	if (row){
    		                // $.messager.alert('Info', row.id+":"+row.catalogue+":"+row.code+":"+row.description);
    		                $('#id').val(row.id);
    		                $('#operateAt').val(row.operateAt);    		                
    		                $('#roleId').val(row.roleId);
    		                $('#roleId').val(row.roleId);
    		                
    		                $('#userId').textbox('setValue', row.userId);
    		                $('#roleIdSelect').combobox('setValue', row.roleId);
    		                $('#roleName').textbox('setValue', row.roleName);    		                
    		                $('#validateFrom').datebox('setValue', row.startFrom);
    		                $('#validateTo').datebox('setValue', row.endAt);    		                
    		                
	                        $('#roleIdSelect').combobox('hide');
					        $('#roleName').textbox('show')
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
					$('#catalogueSelect').combobox('hide'); // hide catalogue combobox for new misc
					$('#catalogueName').textbox('show')

					// if post back with msg , show it
					jsApp.showMsg();					
				},
				togglePanel : function() {
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
				}
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>