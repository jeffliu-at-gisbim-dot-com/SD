<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式範本說明
    1.範本名稱:單檔操作 (Client Side Paging) V2017.03.07
         
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)  
  History:
     2017/02/09 first release
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
                        <tr><td>Employee NO:</td>
                            <td><input class="easyui-textbox" id="criteria_employeeNo" name="criteria_employeeNo" style="width:120px" >                           
                            </td>
                            <td> &nbsp; &nbsp;</td>
                            <td>Shift Section:</td>
                            <td><input class="easyui-textbox" id="criteria_shiftSection" name="criteria_shiftSection" style="width:120px" >
                            </td>
                        </tr>   
                    
                    </table>       
            </div>
            <div style="text-align:left;padding:5px 0">
                <a id="searchBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Search</a>
                <a id="resetBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Reset</a>
            </div>
        </div>
      
        
        <div  id="centerPannel"  style="height:400px;">
            <div style="text-align:left;padding:5px 0"> 
            <table id="dg" title="Search Result" style="width:100%;height:355px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false">
                        
            </table>
            </div>                        
        </div>

        <form id="ff" method="POST">   
        <input id="id"            name="id"            type="hidden">
        <input id="operateAt"     name="operateAt"     type="hidden">
        
        
   
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table style="width:650px">
                            <tr>
                                <td>Employee No:</td>
                                <td><input class="easyui-textbox" id="employeeNo" name="employeeNo" style="width:90px" data-options="readonly:true"></td>
                                <td style="text-align:right">First Name:</td>
                                <td><input class="easyui-textbox" id="firstName" name="firstName" style="width:120px" data-options="readonly:true"></td>                            
                                <td style="text-align:right">Last Name:</td>
                                <td><input class="easyui-textbox" id="lastName" name="lastName" style="width:150px" data-options="readonly:true"></td>
                            </tr>
                            <tr>
                                <td>Level:</td>
                                <td><select id="levelCodeSelect" name="levelCodeSelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:65,separator:'|'"
                                                          style="width:80px;">
                                                <c:forEach var="level" items="${requestScope.levels}">
                                                <option value="${level.code}" SELECTED>${level.description}</option>                                                
                                                </c:forEach>
                                    </select>
                                </td>
                                <td style="text-align:right">Mobile Phone:</td>
                                <td><input class="easyui-textbox" id="mobilePhone" name="mobilePhone" 
                                           style="width:120px" validType="length[0,9]" invalidMessage="長度需 小於等於9"></td>
                                <td style="text-align:right">Diagram:</td>
                                <td><select id="diagramAbilitySelect" name="diagramAbilitySelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:60,required:true"
                                                          style="width:45px;">                       
                                    <option value="Y" >是</option>
                                    <option value="N" >否</option>
                                    </select>
                                    English:
                                    <select id="englishAbilitySelect" name="englishAbilitySelect"   class="easyui-combobox" 
                                                          data-options="panelHeight:60,required:true"
                                                          style="width:45px;">                       
                                    <option value="Y" >是</option>
                                    <option value="N" >否</option>                                                
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Original Section:</td>
                                <td><input class="easyui-textbox" id="originalSection" name="originalSection" 
                                           style="width:60px" validType="length[4,4]" invalidMessage="長度需 等於4"></td>
                                <td style="text-align:right">Shift Section:</td>
                                <td><input class="easyui-textbox" id="shiftSection" name="shiftSection" 
                                           style="width:60px" validType="length[4,4]" invalidMessage="長度需 等於4"></td>
                                <td style="text-align:right">Team:</td>
                                <td><input class="easyui-textbox" id="team" name="team" 
                                           style="width:60px" validType="length[2,2]" invalidMessage="長度需 等於2"></td>
                            </tr>
                            <tr>
                                <td>Next Shift Section:</td>
                                <td><input class="easyui-textbox" id="nextShiftSection" name="nextShiftSection" 
                                           style="width:60px" validType="length[4,4]" invalidMessage="長度需 等於4"></td>
                                <td style="text-align:right">Next Shift Team:</td>
                                <td><input class="easyui-textbox" id="nextShiftTeam" name="nextShiftTeam" 
                                           style="width:60px" validType="length[2,2]" invalidMessage="長度需 等於2"></td>
                                <td style="text-align:right">Next Shift Date:</td>
                                <td><input  id="nextShiftDate"      name="nextShiftDate" 
                                             class="easyui-datebox" style="width:120px;"
                                             data-options="formatter:egatFormatter,parser:egatParser"></td>
                            
                            
                            </tr>                                                    
                        </table>
                    </div>                
                    <div style="text-align:left;padding:5px 0">
                        <a id="saveBtn"    href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Save</a>
                        <a id="deleteBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Clear</a>
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
                    jsApp.ajax_findAll();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
					$('#criteria_employeeNo').textbox('setValue', ''); 					
					$('#criteria_shiftSection').textbox('setValue', '');
				});					
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					if(valid) {
						var action;
                        if($('#id').val() == '') { // create
                        	action = httpDispatcher + '/common/employee/create';
                        } else { // update
                        	action = httpDispatcher + '/common/employee/update'                             
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
                        url: httpDispatcher + '/common/employee/delete',
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
                    		if(row.id == '') {
        		                $('#id').val('');
        		                $('#operateAt').val('');

        		                $('#employeeNo').textbox("setValue", row.employeeNo);
        		                $('#firstName').textbox("setValue",  row.firstName);
        		                $('#lastName').textbox("setValue",   row.lastName);
        		                
        		                $('#levelCodeSelect').combobox("setValue", '');    						
        		                $('#mobilePhone').textbox("setValue",      '');
        		                $('#diagramAbilitySelect').combobox('setValue', 'Y');
        		                $('#englishAbilitySelect').combobox('setValue', 'Y');

        		                $('#originalSection').textbox("setValue", '');
        		                $('#shiftSection').textbox("setValue",    '');
        		                $('#team').textbox("setValue",            '');
        		                
        		                $('#nextShiftSection').textbox("setValue", '');
        		                $('#nextShiftTeam').textbox("setValue",    '');
        		                $('#nextShiftDate').datebox('setValue',    '');
        		                
                    		} else {
        		                $('#id').val(row.id);
        		                $('#operateAt').val(row.operateAtTime);
        		                
        		                $('#employeeNo').textbox("setValue", row.employeeNo);
        		                $('#firstName').textbox("setValue",  row.firstName);
        		                $('#lastName').textbox("setValue",   row.lastName);
        		                
        		                $('#levelCodeSelect').combobox("setValue", row.levelCode);    						
        		                $('#mobilePhone').textbox("setValue",      row.mobilePhone);
        		                $('#diagramAbilitySelect').combobox('setValue', row.diagramAbility);
        		                $('#englishAbilitySelect').combobox('setValue', row.englishAbility);

        		                $('#originalSection').textbox("setValue", row.originalSection);
        		                $('#shiftSection').textbox("setValue",    row.shiftSection);
        		                $('#team').textbox("setValue",            row.team);
        		                
        		                $('#nextShiftSection').textbox("setValue", row.nextShiftSection);
        		                $('#nextShiftTeam').textbox("setValue",    row.nextShiftTeam);
        		                $('#nextShiftDate').datebox('setValue', row.formatedNextShiftDate); 
                    		}
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
				detailEdit : function (id, employeeNo, firstName, lastName) {
		       		$('#id').val(id);
		       		$('#employeeNo').textbox("setValue",  employeeNo);
		       		$('#firstName').textbox("setValue",  firstName);
	                $('#lastName').textbox("setValue",   lastName);

					appForm.attr('action', httpDispatcher + '/psp/transition/detailEdit');
					appForm.submit();	
		       	}, 
				ajax_findAll : function() {
					$('#dg').datagrid({
					    url: httpDispatcher +'/common/employee/findBy',
					    method:'post',
					    rownumbers:true,
					    pagination:true,
		                singleSelect:true,
		                autoRowHeight:false,
		                collapsible:true,
		                pageSize:10,
		                async: false,
		                queryParams: { 'employeeNo': $('#criteria_employeeNo').textbox("getValue"), 		                	           
		                	           'shiftSection': $('#criteria_shiftSection').textbox("getValue")
		                	           },		                
					    columns:[[
		                    {width:80, align:'center', field:'Action',        title:'Shift',
		                    	formatter:function(value,row,index){
		                    		return '<a href="javascript:void(0)" '+
		                    		       'onclick="jsApp.detailEdit(\''+row.id+'\',\''+row.employeeNo+'\',\''+row.firstName+'\',\''+row.lastName+'\')">Transition</a> ';		                            
		                        }
		                    },		                    
		                    {width:90, align:'right',field:'employeeNo',     title:'Employee NO'},
		                    {width:200,align:'right',field:'firstName',      title:'First Name'},
		                    {width:120,align:'right',field:'lastName',       title:'Last Name'},		                    
		                    {width:50, align:'right',field:'levelName',      title:'Level'},
		                    {width:90, align:'right',field:'mobilePhone',    title:'Mobile Phone'}		
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