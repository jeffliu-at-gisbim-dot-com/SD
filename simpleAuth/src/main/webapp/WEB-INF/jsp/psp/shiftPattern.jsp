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
                        <tr>
                                <td>Department:</td>
                                <td colspan="3">
                                    <select id="criteria_departmentCode" name="criteria_departmentCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:350px;">
                                                <c:forEach var="entity" items="${requestScope.departments}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                    </select>
                                </td>
                                <td style="text-align:right">&nbsp;&nbsp;Section:</td>
                                <td colspan="3"><select id="criteria_sectionCode" name="criteria_sectionCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180, separator:'|', valueField:'key', textField:'value'"                                                          
                                                          style="width:450px;">
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
                        <table style="width:90%">
                            <tr>
                                <td>Department:</td>
                                <td colspan="3">
                                    <select id="departmentCode" name="departmentCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:300px;">
                                                <c:forEach var="entity" items="${requestScope.departments}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                
                                                </c:forEach>                                                
                                    </select>
                                </td>
                                <td style="text-align:right">Section Code:</td>
                                <td colspan="3"><select id="sectionCode" name="sectionCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180, separator:'|', valueField:'key', textField:'value'"
                                                          style="width:300px;">                                               
                                                </select>                               
                                </td>                                
                            </tr>
                            <tr>                                    
                                <td>Team Code:</td>
                                <td colspan="1"><input class="easyui-textbox" id="teamCode"       name="teamCode"        style="width:60px;"  
                                           data-options="required:true"  validType="length[2,2]" invalidMessage="長度需等於2"></td>
                                <td style="text-align:right">&nbsp;&nbsp;Description:</td>
                                <td colspan="5"><input class="easyui-textbox" id="teamDescription"name="teamDescription" style="width:400px;" data-options="required:true"></td>                                
                            </tr>
                            <tr>
                                <td rowspan="3">ShiftPattern:</td>
                                <td colspan="7"><div>
                                <input class="easyui-textbox" id="cy1"  name="cy1"  style="width:30px">
                                <input class="easyui-textbox" id="cy2"  name="cy2"  style="width:30px">
                                <input class="easyui-textbox" id="cy3"  name="cy3"  style="width:30px">
                                <input class="easyui-textbox" id="cy4"  name="cy4"  style="width:30px">
                                <input class="easyui-textbox" id="cy5"  name="cy5"  style="width:30px">&nbsp;
                                <input class="easyui-textbox" id="cy6"  name="cy6"  style="width:30px">
                                <input class="easyui-textbox" id="cy7"  name="cy7"  style="width:30px">
                                <input class="easyui-textbox" id="cy8"  name="cy8"  style="width:30px">
                                <input class="easyui-textbox" id="cy9"  name="cy9"  style="width:30px">
                                <input class="easyui-textbox" id="cy10" name="cy10" style="width:30px">
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7"><div>
                                <input class="easyui-textbox" id="cy11"  name="cy11" style="width:30px">
                                <input class="easyui-textbox" id="cy12"  name="cy12" style="width:30px">
                                <input class="easyui-textbox" id="cy13"  name="cy13" style="width:30px">
                                <input class="easyui-textbox" id="cy14"  name="cy14" style="width:30px">
                                <input class="easyui-textbox" id="cy15"  name="cy15" style="width:30px">&nbsp;
                                <input class="easyui-textbox" id="cy16"  name="cy16" style="width:30px">
                                <input class="easyui-textbox" id="cy17"  name="cy17" style="width:30px">
                                <input class="easyui-textbox" id="cy18"  name="cy18" style="width:30px">
                                <input class="easyui-textbox" id="cy19"  name="cy19" style="width:30px">
                                <input class="easyui-textbox" id="cy20"  name="cy20" style="width:30px">
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7"><div>
                                <input class="easyui-textbox" id="cy21"  name="cy21" style="width:30px">
                                <input class="easyui-textbox" id="cy22"  name="cy22" style="width:30px">
                                <input class="easyui-textbox" id="cy23"  name="cy23" style="width:30px">
                                <input class="easyui-textbox" id="cy24"  name="cy24" style="width:30px">
                                <input class="easyui-textbox" id="cy25"  name="cy25" style="width:30px">&nbsp;
                                <input class="easyui-textbox" id="cy26"  name="cy26" style="width:30px">
                                <input class="easyui-textbox" id="cy27"  name="cy27" style="width:30px">
                                <input class="easyui-textbox" id="cy28"  name="cy28" style="width:30px">
                                <input class="easyui-textbox" id="cy29"  name="cy29" style="width:30px">
                                <input class="easyui-textbox" id="cy30"  name="cy30" style="width:30px">&nbsp;
                                <input class="easyui-textbox" id="cy31"  name="cy31" style="width:30px">
                                </div>
                                </td>
                            </tr> 
                            <tr>
                                <td>Start Date:</td>
                                <td><input  id="startDate"         name="startDate" 
                                             class="easyui-datebox"  style="width:90px;"
                                             data-options="formatter:egatFormatter,parser:egatParser,required:true"></td>
                                <td style="text-align:right">&nbsp;&nbsp;Start Position:</td>
                                <td><input class="easyui-textbox" id="startPos" name="startPos" style="width:40px;" data-options="required:true"></td> 
                                <td style="text-align:right">&nbsp;&nbsp;Next Start Date:</td>
                                <td><input  id="nextStartDate"         name="nextStartDate" 
                                             class="easyui-datebox"  style="width:90px;"
                                             data-options="formatter:egatFormatter,parser:egatParser,required:true"></td>
                                <td style="text-align:right">&nbsp;&nbsp;Next Start Position:</td>
                                <td><input class="easyui-textbox" id="nextStartPos" name="nextStartPos" style="width:40px;" data-options="required:true"></td> 
                            </tr>
                            <tr>
                                <td>Use Cycle:</td>
                                <td><select id="useCycle" name="useCycle"   class="easyui-combobox" 
                                                          data-options="panelHeight:60,required:true"
                                                          style="width:45px;">                       
                                    <option value="Y" SELECTED>是</option>
                                    <option value="N" >否</option>                                                
                                    </select></td>
                                <td colspan="6"></td>
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
				
				
				// Department Criteria Select
				
				
				$('#criteria_departmentCode').combobox({
				    onChange:function(newValue,oldValue){
				    	if(newValue != '') {
					    	$('#departmentCode').combobox('setValue', newValue);
					    	action = httpDispatcher + '/psp/shiftPattern/querySection';
					    	jsApp.ajax_combobox(action, $('#criteria_sectionCode'));					    		
				    	}
				    }
				});
				
				// Department Select
				$('#departmentCode').combobox({
				    onChange:function(newValue,oldValue){
				    	if(newValue != '') {
					    	$('#departmentCode').combobox('setValue', newValue);
					    	action = httpDispatcher + '/psp/shiftPattern/querySection';
					    	jsApp.ajax_combobox(action, $('#sectionCode'));					    		
				    	}
				    }
				});
				//Search Button
				$('#searchBtn').on('click', function(event) {			
                    jsApp.ajax_findAll();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
					$('#criteria_departmentCode').combobox('setValue', '');
					$('#criteria_sectionCode').combobox('setValue', ''); // select the "ALL" with empty value
				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {			
					$('#id').val('');
	                $('#operateAtTime').val('');
                    
					$('#departmentCode').combobox("setValue", '');
					$('#sectionCode').combobox("setValue", '');
                    $('#teamCode').textbox("setValue", '');                    
					$('#teamDescription').textbox("setValue", '');
					
                    $('#nextStartDate').datebox("setValue", '');
                    $('#nextStartPos').textbox("setValue", '');
                    $('#startDate').datebox("setValue", '');
                    $('#startPos').textbox("setValue", '');
                    $('#useCycle').combobox("setValue", '');   
                    
                    $('#cy1').textbox("setValue",  '');
                    $('#cy2').textbox("setValue",  '');
                    $('#cy3').textbox("setValue",  '');
                    $('#cy4').textbox("setValue",  '');
                    $('#cy5').textbox("setValue",  '');
                    $('#cy6').textbox("setValue",  '');
                    $('#cy7').textbox("setValue",  '');
                    $('#cy8').textbox("setValue",  '');
                    $('#cy9').textbox("setValue",  '');
                    $('#cy10').textbox("setValue", '');

                    $('#cy11').textbox("setValue", '');
                    $('#cy12').textbox("setValue", '');
                    $('#cy13').textbox("setValue", '');
                    $('#cy14').textbox("setValue", '');
                    $('#cy15').textbox("setValue", '');
                    $('#cy16').textbox("setValue", '');
                    $('#cy17').textbox("setValue", '');
                    $('#cy18').textbox("setValue", '');
                    $('#cy19').textbox("setValue", '');
                    $('#cy20').textbox("setValue", '');

                    $('#cy21').textbox("setValue", '');
                    $('#cy22').textbox("setValue", '');
                    $('#cy23').textbox("setValue", '');
                    $('#cy24').textbox("setValue", '');
                    $('#cy25').textbox("setValue", '');
                    $('#cy26').textbox("setValue", '');
                    $('#cy27').textbox("setValue", '');
                    $('#cy28').textbox("setValue", '');
                    $('#cy29').textbox("setValue", '');
                    $('#cy30').textbox("setValue", '');

                    $('#cy31').textbox("setValue", '');

					jsApp.togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						var action;
                        if($('#id').val() == '') { // create
                        	action = httpDispatcher + '/psp/shiftPattern/create';
                        } else { // update
                        	action = httpDispatcher + '/psp/shiftPattern/update'                             
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
                        url: httpDispatcher + '/psp/shiftPattern/delete',
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
    		                    		                
    						$('#departmentCode').combobox("setValue",  row.departmentCode);
    						$('#sectionCode').combobox("setValue",     row.sectionCode);
    	                    $('#teamCode').textbox("setValue",        row.teamCode);    	                    
    	                    $('#teamDescription').textbox("setValue", row.teamDescription);

    	                    $('#startDate').datebox("setValue",     row.formatedStartDate);
    	                    $('#nextStartDate').datebox("setValue", row.formatedNextStartDate);
    	                    $('#nextStartPos').textbox("setValue",  row.nextStartPos);    	                    
    	                    $('#startPos').textbox("setValue",      row.startPos);
    	                    $('#useCycle').combobox("setValue",      row.useCycle);
    	                    
    	                    var cyArray = row.pattern.split(',');
    	                    $('#cy1').textbox("setValue", cyArray[0]);
    	                    $('#cy2').textbox("setValue", cyArray[1]);
    	                    $('#cy3').textbox("setValue", cyArray[2]);
    	                    $('#cy4').textbox("setValue", cyArray[3]);
    	                    $('#cy5').textbox("setValue", cyArray[4]);
    	                    $('#cy6').textbox("setValue", cyArray[5]);
    	                    $('#cy7').textbox("setValue", cyArray[6]);
    	                    $('#cy8').textbox("setValue", cyArray[7]);
    	                    $('#cy9').textbox("setValue", cyArray[8]);
    	                    $('#cy10').textbox("setValue", cyArray[9]);    	                    

    	                    $('#cy11').textbox("setValue", cyArray[10]);
    	                    $('#cy12').textbox("setValue", cyArray[11]);
    	                    $('#cy13').textbox("setValue", cyArray[12]);
    	                    $('#cy14').textbox("setValue", cyArray[13]);
    	                    $('#cy15').textbox("setValue", cyArray[14]);
    	                    $('#cy16').textbox("setValue", cyArray[15]);
    	                    $('#cy17').textbox("setValue", cyArray[16]);
    	                    $('#cy18').textbox("setValue", cyArray[17]);
    	                    $('#cy19').textbox("setValue", cyArray[18]);
    	                    $('#cy20').textbox("setValue", cyArray[19]);
    	                    
    	                    $('#cy21').textbox("setValue", cyArray[20]);
    	                    $('#cy22').textbox("setValue", cyArray[21]);
    	                    $('#cy23').textbox("setValue", cyArray[22]);
    	                    $('#cy24').textbox("setValue", cyArray[23]);
    	                    $('#cy25').textbox("setValue", cyArray[24]);
    	                    $('#cy26').textbox("setValue", cyArray[25]);
    	                    $('#cy27').textbox("setValue", cyArray[26]);
    	                    $('#cy28').textbox("setValue", cyArray[27]);
    	                    $('#cy29').textbox("setValue", cyArray[28]);
    	                    $('#cy30').textbox("setValue", cyArray[29]);
    	                    
    	                    $('#cy31').textbox("setValue", cyArray[30]);
    	                    
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
				ajax_combobox : function(action, comboboxUI) {					
					var comboboxData = [];
                    $.ajax({
                        url: action,
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(result){    
                        	comboboxData.push({key:'', value:'Please choose'});
                        	                        	
                        	for (var i=0; i< result.listResult.length; i++) {
                        		var item = result.listResult[i];                        		
                        		comboboxData.push({key:item['sectionCode'], value:item['sectionCode']+' - '+item['sectionName']});
                        	}
                        	comboboxUI.combobox({data:comboboxData});
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                        	alert('error found.');
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            comboboxUI.combobox({data:comboboxData});
                        }
                    });	                    
				},
				ajax_findAll : function() {
					$('#dg').datagrid({
					    url: httpDispatcher +'/psp/shiftPattern/findBy',
					    method:'post',
					    rownumbers:true,
					    pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                async: false,
		                queryParams: { 'departmentCode': $('#criteria_departmentCode').combobox("getValue"),
		                               'sectionCode'   : $('#criteria_sectionCode').combobox("getValue") 
		                },
					    columns:[[
					        {width:5,   align:'right', field:'id',               title:'ID',            hidden:true},
		                    {width:5,   align:'right', field:'operateAtTime',    title:'OperateAtTime', hidden:true},		                    
		                    
		                    {width:80,  align:'right', field:'departmentCode',   title:'Department'},
		                    {width:60,  align:'right', field:'sectionCode',      title:'Section'},
		                    {width:50,  align:'right', field:'teamCode',         title:'Team'},		                    
		                    {width:180, align:'right', field:'teamDescription',  title:'Team Description'},
		                    {width:90,  align:'right', field:'formatedStartDate',title:'Start Date'},
		                    {width:90,  align:'center',field:'startPos',         title:'Start Position'},		                    
		                    {width:80,  align:'right', field:'formatedNextStartDate',  title:'Next Start'},
		                    {width:90,  align:'center',field:'nextStartPos',   title:'Next Position'},
		                    {width:40,  align:'center',field:'useCycle',       title:'Cycle'},
		                    {width:600, align:'left',  field:'pattern',        title:'Pattern'}
		                    					
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