<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
                        <tr><td>Aircraft Registr.:</td>
                            <td>
                                <select id="criteria_aircraft_registr" name="criteria_aircraft_registr"   class="easyui-combobox" 
                                                          data-options="panelHeight:80"
                                                          style="width:200px;">                                                
                                                <c:forEach var="obj" items="${requestScope.aircraft}">
                                                <option value="${obj}" >${obj}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                </select>                            
                            </td>
                        </tr>   
                        <tr><td>Record Date:</td>
                            <td>
                                 <input class="easyui-datebox" id="criteria_rec_date" name="criteria_rec_date" style="width:100%;">
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
                <c:forEach var="entity" items="${requestScope.data}">
                <tr>
                    <td>${entity.id}</td>
                    <td>${entity.timestamp}</td>
                    <td>${entity.aircraftRegistr}</td>
                    <td>${entity.ata}</td>
                    <td>${entity.recDate}</td>
                    <td>${entity.headline}</td>
                    <td>${entity.description}</td>
                </tr>   
                </c:forEach>
            </table>
        </div>

        <form id="ff" method="POST">   
	        <input id="id"        name="id"        type="hidden">
	        <input id="timestamp" name="timestamp" type="hidden">
	   
	        <div id="southPannel"  style="height:200px;"> 
	            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
	                    <div style="margin-bottom:20px">
	                        <table style="width:400px">
	                            <tr>
	                                <td>Aircraft:</td>
	                                <td><select id="aircraft_registr" name="aircraft_registr"   class="easyui-combobox" 
	                                                          data-options="panelHeight:65,separator:'|'"
	                                                          style="width:200px;">
	                                            <c:forEach var="obj" items="${requestScope.aircraft}">
                                                <option value="${obj}" >${obj}</option>                                                
                                                </c:forEach>
	                                    </select>
	                                    
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>ATA:</td>
	                                <td><input class="easyui-textbox" id="ata" name="ata" style="width:100%" data-options="required:true"></td>
	                            </tr>
	                            <tr>
	                                <td>HeadLine</td>
	                                <td><input class="easyui-textbox" id="headline" name="headline" style="width:100%" data-options="required:true"></td>
	                            </tr> 
	                            <tr>
	                                <td>Description:</td>
	                                <td><input class="easyui-textbox" id="description" name="description" style="width:100%" data-options="required:true"></td>
	                            </tr>                        

	                            <tr>
	                                <td>record datetime:</td>
	                                <td><input class="easyui-datetimebox" id="rec_date" name="rec_date" style="width:100%" ></td>
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

</body>

<script type="text/javascript">
		// <![CDATA[
        var httpDispatcher = '${contextPath}/pms';
	    var appForm = $('#ff');        
		
	    var errorMsg = '${msg}';	
		var gridData;
		
		function togglePanel() {
			$('#northPannel').toggle();
			$('#centerPannel').toggle();
			$('#southPannel').toggle(); 
	    };
       	
		var jsApp = function() {
			// bundle page event
			var bundlePageEvent = function() {
				//Search Button
				$('#searchBtn').on('click', function(event) {			

					
					var selected = $('#criteria_aircraft_registr').combobox('getValue');					
					$('#aircraft_registr').val(selected);
					appForm.attr('action', httpDispatcher + '/addwo/findBy'); // findBy
					appForm.submit();	
					
					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			

				});				
				
				//Create Button
				$('#createBtn').on('click', function(event) {			
	             	
					$('#id').val('');
					
		                $('#timestamp').val('');
		                
		                $('#aircraft_registr').combobox('setValue', '');

		                $('#ata').textbox("setText", '');
		                
		                $('#rec_date').datebox("setText",'');
		                
		                $('#headline').textbox("setText", '');
		                
		                $('#description').textbox("setText", '');
				
					togglePanel();
				});		
				
				//Save Button
				$('#saveBtn').on('click', function(event) {	
					var valid = false;
					valid = appForm.form('validate');
					
					if(valid) {
					
						if($('#id').val() == '') {
							appForm.attr('action', httpDispatcher + '/addwo');	// create 						
							appForm.submit();  
						} else {	
							
							appForm.attr('action', httpDispatcher + '/addwo' +"/"+$('#id').val()); // update
							appForm.submit();
						}

					} else {
						$.messager.alert('Info', 'Validation Error.');
					}					
				});		
				
				//delete Button
				$('#deleteBtn').on('click', function(event) {
					//alert(httpDispatcher + '/addWo/delete' +"/"+$('#id').val());
					appForm.attr('action', httpDispatcher + '/addWo/delete' +"/"+$('#id').val()); // delete
					appForm.submit();					
				});		
				//Cancel Button
				$('#cancelBtn').on('click', function(event) {
					
					togglePanel();
				});		
				
				
                //Double Click Row
                $('#dg').datagrid({
                	 rownumbers:true,
                     singleSelect:true,
                     autoRowHeight:false, 
                     columns:[[
                         {field:'id',title:'id',hidden:true},
                         {field:'timestamp',title:'timestamp',hidden:true},
                         {field:'aircraftRegistr',title:'aircraft registr'},
                         {field:'ata',title:'ata',align:'center'},
                         {field:'recDate',title:'record date',align:'center'},
                         {field: 'headline', title: 'Headline'  },
                         {field: 'description', title: 'description',hidden:true  }
                     ]],
                	onDblClickRow: function(index,row){
                    	if (row){
    		                // $.messager.alert('Info', row.id+":"+row.catalogue+":"+row.code+":"+row.description);
    		                $('#id').val(row.id);
    		                $('#timestamp').val(row.timestamp);
    		                
    		                $('#aircraft_registr').combobox('setValue', row.aircraftRegistr);

    		                $('#ata').textbox("setText", row.ata);
    		                $('#ata').textbox("setValue", row.ata);
    		                
    		                $('#rec_date').datebox("setText", row.recDate);
    		                $('#rec_date').datebox("setValue", row.recDate);
    		                
    		                $('#headline').textbox("setText", row.headline);
    		                $('#headline').textbox("setValue", row.headline);
    		                
    		                $('#description').textbox("setText", row.description);
    		                $('#description').textbox("setValue", row.description);
    		                
    		                togglePanel();
    		            }
                    }
                });			
                //-------------------------------------------------------------
			};
			var showError = function() {
				if (errorMsg != '') {
					$.messager.alert('Error',errorMsg,'error');
				}
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
					
					// if post back with error msg , show it
					showError();					
				}
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
</script>

</html>