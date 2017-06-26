<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
    1.範本名稱:單檔操作 (Server Side Paging) V2017.03.07
    2.說　　明:  For event, recording the tooling usage.
    
    
    
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  
  History:
      2017/03/09 first release
          
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
                        <tr><td>AirCraft:</td>
                            <td><select id="criteria_airCraft" name="criteria_airCraft"   class="easyui-combobox" 
                                                          data-options="panelHeight:380"
                                                          style="width:120px;">                                                
                                                <option value="">Please choose </option>
                                                <c:forEach var="acRegistr" items="${requestScope.acRegistrs}">
                                                <option value="${acRegistr}" >${acRegistr}</option>                                                
                                                </c:forEach>
                                </select>       
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>Work Package No.:</td>
                            <td><select id="criteria_wpno" name="criteria_wpno"   class="easyui-combobox" 
                                                          data-options="valueField:'key',textField:'value'"
                                                          style="width:180px;">                                                                                                
                                </select> 
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;</td>
                            <td>Event:</td>
                            <td><select id="criteria_event" name="criteria_event"   class="easyui-combobox" 
                                                          data-options="valueField:'key',textField:'value'"
                                                          style="width:250px;">                                                                                                
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
            <table id="dg" title="Search Result" style="width:100%;height:335px">                
            </table>
        </div>
        
        
        <form id="ff" method="POST"> 
        <input id="id"        name="id"          type="hidden">        
        <input id="operateAt" name="operateAt"   type="hidden">  
        
        <input id="acRegistr"     name="acRegistr"        type="hidden">
        <input id="wpno_i"        name="wpno_i"           type="hidden">
        <input id="eventPerfnoI"  name="eventPerfnoI"     type="hidden">      
           
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table style="width:500px">
                        <tr>
                            <td style="align:right">AirCraft:</td>
                            <td colspan='3'><select id="airCraftSelect" name="airCraftSelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:380"
                                                          style="width:120px;">      
                                                          <option value="">Please choose </option>                                          
                                                      <c:forEach var="acRegistr" items="${requestScope.acRegistrs}">
                                                          <option value="${acRegistr}" >${acRegistr}</option>                                                
                                                      </c:forEach>
                                                  </select>
                             <input class="easyui-textbox" id="airCraftName" name="airCraftName" data-options="readonly:true"> 
                            </td> 
                        </tr>
                        <tr>                          
                            <td>Work Package No.:</td>
                            <td colspan='3'><select id="wpnoSelect" name="wpnoSelect"   class="easyui-combobox" 
                                        data-options="valueField:'key',textField:'value'"
                                                          style="width:200px;">                                                                                                
                                </select> 
                                <input class="easyui-textbox" id="wpnoName" name="wpnoName" data-options="readonly:true">
                            </td>
                        </tr>
                        <tr>                                 
                            <td>Event:</td>
                            <td colspan='3'><select id="eventSelect" name="eventSelect"   class="easyui-combobox" 
                                        data-options="valueField:'key',textField:'value'"
                                                          style="width:300px;">                                                                                                
                                </select>
                                <input class="easyui-textbox" id="eventName" name="eventName" data-options="readonly:true">
                            </td>
                        </tr>
                        <tr><td style="align:right">PSN:</td>
                            <td><input class="easyui-textbox" id="psn" name="psn" style="width:160px" data-options="required:true"></td>
                            <td style="align:right">Date:</td>
                            <td><input  id="execDate"    name="execDate" 
                                      class="easyui-datebox"        style="width:120px;"
                                      data-options="formatter:egatFormatter,parser:egatParser">
                            </td>
                        </tr>
                        <tr><td style="align:right">Remark:</td>
                            <td colspan='3'><input class="easyui-textbox"  id="remark" name="remark" multiline="true"  style="width:80%;height:120px">      
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
	    
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {

				// AirCraft Select
				$('#criteria_airCraft').combobox({
				    onChange:function(newValue,oldValue){
				    	if(newValue != '') {
					    	$('#acRegistr').val(newValue);
					    	action = httpDispatcher + '/pms/toolingRecord/queryWpno';
					    	jsApp.ajax_combobox(action, $('#criteria_wpno'));
					    	
					    	$('#criteria_event').combobox({data:[]});		
				    	}
				    }
				});
				
				$('#airCraftSelect').combobox({
				    onChange:function(newValue,oldValue){
				    	if(newValue != '') {
					    	$('#acRegistr').val(newValue);
					    	action = httpDispatcher + '/pms/toolingRecord/queryWpno';
					    	jsApp.ajax_combobox(action, $('#wpnoSelect'));
					    	
					    	$('#eventSelect').combobox({data:[]});	
				    	}
				    }
				});
				// WPNO select 
				$('#criteria_wpno').combobox({
				    onChange:function(newValue,oldValue){
				    	if(newValue != '') {
					    	$('#wpno_i').val(newValue);
					    	action = httpDispatcher + '/pms/toolingRecord/queryEvent';
					    	jsApp.ajax_combobox(action, $('#criteria_event'));
				    	}
				    }
				});				
				$('#wpnoSelect').combobox({
				    onChange:function(newValue,oldValue){
				    	if(newValue != '') {
					    	$('#wpno_i').val(newValue);
					    	action = httpDispatcher + '/pms/toolingRecord/queryEvent';
					    	jsApp.ajax_combobox(action, $('#eventSelect'));	
				    	}
				    }
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
					$('#criteria_wpno').combobox({data:[]});
					$('#criteria_event').combobox({data:[]});						
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {	
	                $('#airCraftSelect').combobox('show');
	                $('#wpnoSelect').combobox('show');
	                $('#eventSelect').combobox('show');
					$('#airCraftName').textbox('hide');
					$('#wpnoName').textbox('hide');
					$('#eventName').textbox('hide');

					$('#id').val('');
					$('#operateAt').val('');
					$('#acRegistr').val('');
					$('#wpno_i').val('');
					$('#eventPerfnoI').val('');
					
					$('#airCraftSelect').combobox("setValue",  '');
					$('#wpnoSelect').combobox({data:[]});
					$('#eventSelect').combobox({data:[]});
					
	                $('#psn').textbox("setValue", ''); // default for new
	                $('#execDate').datebox("setValue",  '');
	                $('#remark').textbox("setValue",    '');
	               
					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate'); // client side validateion					
					var action;

					if(valid) {
						action = httpDispatcher + '/pms/toolingRecord/validatePsn'
						$.ajax({
	                         url: action,
	                         data: appForm.serialize(),
	                         type:"POST",
	                         dataType:'json',
	                         success: function(data){  
	     						 // server side validate passed.
	                             //--------------------------------------------
	     						 if($('#id').val() == '') { // create
	                             	action = httpDispatcher + '/pms/toolingRecord/create';
	                             } else { // update
	                             	action = httpDispatcher + '/pms/toolingRecord/update'     
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
	                                     jsApp.togglePanel();
	                                 },                            
	                                 error:function(XMLHttpRequest, textStatus, errorThrown) {
	                                     jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
	                                 }
	                             });   
	                             //--------------------------------------------
	                         },                            
	                         error:function(XMLHttpRequest, textStatus, errorThrown) {
	                             jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
	                             if(valid) {  valid = false; }
	                         }
	                     });	                      
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
					// improve IE compatibility.
                    $.ajax({
                        url: httpDispatcher + '/pms/toolingRecord/delete',
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
    	                $('#airCraftSelect').combobox('hide');
    	                $('#wpnoSelect').combobox('hide');
    	                $('#eventSelect').combobox('hide');
    					$('#airCraftName').textbox('show');
    					$('#wpnoName').textbox('show');
    					$('#eventName').textbox('show');

    					$('#id').val(row.id);
    					$('#operateAt').val(row.operateAtTime);
    					$('#acRegistr').val(row.airCraft);
    					$('#wpno_i').val(row.wpnoI);
    					$('#eventPerfnoI').val(row.eventPerfnoI);
    					
    					$('#airCraftName').textbox("setValue",  row.airCraft);
    					$('#wpnoName').textbox("setValue",  row.workPackageNo);
    					$('#eventName').textbox("setValue",  row.event);
    					
    	                $('#psn').textbox("setValue", row.psn); // default for new
    	                $('#execDate').datebox("setValue",  row.formatedExecDate);
    	                $('#remark').textbox("setValue",    row.remark);
    	               
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
				ajax_combobox : function(action, comboboxUI) {					
					var comboboxData = [];
                    $.ajax({
                        url: action,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){                        	                            	
                        	comboboxData.push({key:'', value:'Please choose'});
                        	result.mapResult.forEach(function(map){                            		
                            	var keys = Object.keys(map);
                            	for( var i=0; i< keys.length; i++) {
                            		comboboxData.push({key:keys[i], value:map[keys[i]]});                                		
                            	}
                        	});                             	
                        	comboboxUI.combobox({data:comboboxData});
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            comboboxUI.combobox({data:comboboxData});
                        }
                    });	                    
				},
			    ajax_findBy : function() {
					$('#dg').datagrid({
					    url: httpDispatcher + '/pms/toolingRecord/findBy',
					    method:'post',
		                rownumbers:true,                    
		                pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                queryParams: { 'wpno_i':$('#criteria_airCraft').combobox("getValue"),
		                	           'acRegistr': $('#criteria_airCraft').combobox("getValue"),
		                	           'eventPerfnoI':$('#criteria_event').combobox("getValue")	
		                },
					    columns:[[
					        {width:80, align:'right',field:'airCraft',       title:'AirCraft'},
		                    {width:180,align:'left', field:'workPackageNo',  title:'Work Package'},
		                    {width:250,align:'right',field:'event',          title:'Event'},
		                    {width:120,align:'left', field:'psn',            title:'PSN'},
		                    {width:90, align:'right',field:'formatedExecDate',     title:'Exec Date'},
		                    {width:220,align:'right',field:'remark',         title:'Remark'}
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