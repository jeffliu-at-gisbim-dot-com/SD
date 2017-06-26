<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式範本說明
    1.範本名稱:單檔操作 (Server Side Render) V2017.03.01
    2.說　　明:資料庫選取資料後,以JSTL tag在Server端,將資料以html table型式完成render
                                     傳送到Browser後, 以easyui的datagrid型式展現。render壓力主要由Server端承載。
    3.效能基準:7秒完成畫面載入, 7秒完成操作回應
    4.適用資料量: 700 筆 
    5.環境基準:   Client 端 Browser   環境基準: Pentium 4 EE 3.73, 2G RAM, XP SP3, Chrome 49.0.2623
               Server 端 AP Server 環境基準: IBM eServer 325 (Type8835), 12G RAM, 
                                  SUSE Linux Enterprise Server 9,
                                  WebLogic Server 9.0
               Server 端 DB 環境基準: IBM eServer 325 (Type8835), 12G RAM, 
                                  SUSE Linux Enterprise Server 9
                                  Oracle 10g
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  History:
     2017/02/09 first release
     2017/02/18 refactor client side jsApp
     2017/03/01 bug fix.  when create, delete is not allowed
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
                        <tr><td>Catalogue Name:</td>
                            <td>
                                <select id="criteria_catalogue" name="criteria_catalogue"   class="easyui-combobox" 
                                                          data-options="panelHeight:180"
                                                          style="width:300px;">                                                
                                                <c:forEach var="misc" items="${requestScope.meta}">
                                                <option value="${misc.code}" >${misc.description}</option>                                                
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
            <table id="dg" title="Search Result" style="width:100%;height:335px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false">
                <thead>
                    <tr>
                        <th field="id"           data-options="field:'id',hidden:true">ID</th>
                        <th field="operateAt"    data-options="field:'operateAt',hidden:true">operateAt</th>
                        <th field="catalogue"    data-options="field:'catalogue',hidden:true">Catalogue</th>
                        <th field="catalogueName" width="220" align="right" data-options="field:'catalogueName'">Catalogue Name</th>
                        <th field="code"          width="150" align="right" data-options="field:'code'">Code</th>
                        <th field="description"   width="450" align="right" data-options="field:'description'">Description</th>
                        <th field="modify date"   width="90"  align="right">Modify Date</th>
                    </tr>
                </thead>
                <c:forEach var="entity" items="${requestScope.data}">
                <tr><td>${entity.id}</td><td>${entity.operateAtTime}</td><td>${entity.catalogue}</td>
                    <td>${entity.catalogueName}</td><td>${entity.code}</td><td>${entity.description}</td>
                    <td>${entity.formatedOperateAt}</td>
                </tr>   
                </c:forEach>
            </table>
        </div>

        <form id="ff" method="POST">   
        <input id="id"        name="id"        type="hidden">
        <input id="operateAt" name="operateAt" type="hidden">
        <input id="catalogue" name="catalogue" type="hidden">
   
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table style="width:400px">
                            <tr>
                                <td>Catalogue:</td>
                                <td><select id="catalogueSelect" name="catalogueSelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:200px;">
                                                <c:forEach var="misc" items="${requestScope.meta}">
                                                <option value="${misc.code}" SELECTED>${misc.description}</option>                                                
                                                </c:forEach>
                                    </select>
                                    <input class="easyui-textbox" id="catalogueName" name="catalogueName" style="width:100%" data-options="readonly:true">
                                </td>
                            </tr>
                            <tr>
                                <td>Code:</td>
                                <td><input class="easyui-textbox" id="code" name="code" style="width:100%" data-options="required:true"></td>
                            </tr>
                            <tr>
                                <td>Description:</td>
                                <td><input class="easyui-textbox" id="description" name="description" style="width:100%" data-options="required:true"></td>
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
					var selected = $('#criteria_catalogue').combobox('getValue');					
					$('#catalogue').val(selected);
					appForm.attr('action', httpDispatcher + '/common/misc/findBy'); // findBy
					appForm.submit();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
					$('#criteria_catalogue').combobox('setValue', ''); // select the "ALL" with empty value
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {				                
					$('#id').val('');
	                $('#operateAt').val('');    		                
	                $('#catalogue').val('');
	                
	                $('#catalogueName').textbox("setValue", '');
	                $('#code').textbox("setValue", '');
	                $('#description').textbox("setValue", '');
	                
	                $('#catalogueSelect').combobox('show');
					$('#catalogueName').textbox('hide')					
					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						if($('#id').val() == '') {
							appForm.attr('action', httpDispatcher + '/common/misc');	// create 						
							appForm.submit();  
						} else {
							appForm.attr('action', httpDispatcher + '/common/misc' +"/"+$('#id').val()); // update
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
					appForm.attr('action', httpDispatcher + '/common/misc/delete' +"/"+$('#id').val()); // delete
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
    		                $('#catalogue').val(row.catalogue);
    		                
    		                $('#catalogueName').textbox("setValue", row.catalogueName);
    		                $('#code').textbox("setValue", row.code);
    		                $('#description').textbox("setValue", row.description);
    		                
    		                $('#catalogueSelect').combobox('hide');
    						$('#catalogueName').textbox('show')
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

					$('#dg').datagrid(); // convert html table to dataGrid
					gridData = $('#dg').datagrid("getData"); 
					
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