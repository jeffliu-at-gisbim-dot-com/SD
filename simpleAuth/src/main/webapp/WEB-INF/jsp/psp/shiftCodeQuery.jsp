<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
    1.基準範本:單檔操作 (Server Side Render)  V2017.03.01
    2.說　　明: 指定 輪班代碼及其屬性
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
                        <tr><td>Shift Code:</td>
                            <td><input id="criteria_shift_code" name="criteria_shift_code"  class="easyui-textbox" 
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
               
            </div>  
            <table id="dg" title="Search Result" style="width:100%;height:335px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:false">
                <thead>
                    <tr>
                        <th field="id"            data-options="field:'id',hidden:true">ID</th>
                        <th field="operateAt"     data-options="field:'operateAt',hidden:true">OperateAt</th>
                        
                        <th field="siteShiftCode"        width="100"  align="right" data-options="field:'siteShiftCode'"       >Site Shift Code</th>
                        <th field="shiftCode"            width="70"   align="right" data-options="field:'shiftCode'"           >Shift Code</th>
                        <th field="personalShiftCode"    width="140"  align="right" data-options="field:'personalShiftCode'"   >Personal Shift Code</th>
                        <th field="shiftCodeDescription" width="160"  align="right" data-options="field:'shiftCodeDescription'">Description</th>                        
                        <th field="startFrom"            width="60"   align="right" data-options="field:'startFrom'"           >Start</th>
                        <th field="untilTo"              width="60"   align="right" data-options="field:'untilTo'"             >To</th>
                        <th field="actualWorkHours"      width="120"  align="right" data-options="field:'actualWorkHours'"     >Actual Work Hours</th>
                        <th field="breakfast"            width="90"   align="right" data-options="field:'breakfast'"           >Breakfast</th>
                        <th field="morningCommute"       width="120"  align="right" data-options="field:'morningCommute'"      >Morning Commute</th>
                        <th field="dinner"               width="60"   align="right" data-options="field:'dinner'"              >Dinner</th>
                        <th field="nightCommute"         width="110"  align="right" data-options="field:'nightCommute'"        >Night Commute</th>
                        
                        <th field="lastUpdate"           width="90"   align="right" data-options="field:'lastUpdate'"          >LastUpdate</th>
                    </tr>
                </thead>
                <c:forEach var="entity" items="${requestScope.data}">
                <tr><td>${entity.id}</td><td>${entity.operateAtTime}</td><td>${entity.siteShiftCode}</td>
                    <td>${entity.shiftCode}</td><td>${entity.personalShiftCode}</td><td>${entity.shiftCodeDescription}</td>
                    <td>${entity.startFrom}</td><td>${entity.untilTo}</td><td>${entity.actualWorkHours}</td>
                    <td>${entity.breakfast}</td><td>${entity.morningCommute}</td>
                    <td>${entity.dinner}</td><td>${entity.nightCommute}</td>
                    <td>${entity.lastUpdate}</td>
                </tr>   
                </c:forEach>
            </table>
        </div>

        <form id="ff" method="POST">   
        <input id="id"        name="id"        type="hidden">
        <input id="operateAt" name="operateAt" type="hidden">
   
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table style="width:700px">
                            <tr>
                                <td style="text-align:right">Site Shift Code:</td>
                                <td><input class="easyui-textbox" id="siteShiftCode" name="siteShiftCode" style="width:90px" 
                                      data-options="required:true" validType="length[1,2]" invalidMessage="長度需小於 等於2"></td>
                                <td style="text-align:right">Shift Code:</td>
                                <td><input class="easyui-textbox" id="shiftCode" name="shiftCode" style="width:90px" 
                                      data-options="required:true" validType="length[1,2]" invalidMessage="長度需小於 等於2"></td>
                                <td style="text-align:right">Personal Shift Code</td>
                                <td><input class="easyui-textbox" id="personalShiftCode" name="personalShiftCode" style="width:90px" 
                                      data-options="required:true" validType="length[1,2]" invalidMessage="長度需小於 等於2"></td>
                            </tr>                           
                            <tr>    
                                <td style="text-align:right">Start From:</td>
                                <td><input class="easyui-textbox" id="startFrom" name="startFrom" style="width:90px" 
                                      data-options="required:true" validType="length[4,4]" invalidMessage="長度需 等於4"></td>
                                <td style="text-align:right">Until To:</td>
                                <td><input class="easyui-textbox" id="untilTo" name="untilTo" style="width:90px" 
                                      data-options="required:true"  validType="length[4,4]" invalidMessage="長度需等於4"></td>
                                <td style="text-align:right">Actual Work Hours:</td>
                                <td><input class="easyui-textbox" id="actualWorkHours" name="actualWorkHours" style="width:90px" 
                                      data-options="required:true" validType="length[1,5]" invalidMessage="長度需小於 等於5"></td>
                            </tr>
                            <tr>    
                                <td style="text-align:right">Breakfast Miss:</td>
                                <td><select id="breakfast" name="breakfast"   class="easyui-combobox" 
                                                          data-options="panelHeight:45,required:true"
                                                          style="width:45px;">                       
                                    <option value="">否</option>
                                    <option value="B">是</option>                                                                                   
                                    </select>
                                </td>
                                <td style="text-align:right">Morning Commute:</td>
                                <td colspan="3"><select id="morningCommute" name="morningCommute"   class="easyui-combobox" 
                                                          data-options="panelHeight:45,required:true"
                                                          style="width:45px;">   
                                    <option value="">否</option>                                          
                                    <option value="M">是</option>                                                                                   
                                    </select>
                                </td>                                
                            </tr>
                            <tr>    
                                <td style="text-align:right">Dinner Miss:</td>
                                <td><select id="dinner" name="dinner"   class="easyui-combobox" 
                                                          data-options="panelHeight:45,required:true"
                                                          style="width:45px;">                       
                                    <option value="">否</option>
                                    <option value="D">是</option>                                                                                   
                                    </select>
                                </td>
                                <td style="text-align:right">Night Commute:</td>
                                <td colspan="3"><select id="nightCommute" name="nightCommute"   class="easyui-combobox" 
                                                          data-options="panelHeight:45,required:true"
                                                          style="width:45px;">                       
                                    <option value="">否</option>
                                    <option value="N">是</option>                                                                                   
                                    </select>
                                </td>                                
                            </tr>
                            <tr>
                                <td style="text-align:right">Description:</td>
                                <td colspan="3"><input class="easyui-textbox" id="shiftCodeDescription" name="shiftCodeDescription" style="width:307px" 
                                     data-options="required:false"  validType="length[0,50]" invalidMessage="長度需小於 等於50"></td>
                            </tr>                    
                        </table>
                    </div>                
                    <div style="text-align:left;padding:5px 0">
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
					var selected = $('#criteria_shift_code').textbox('getValue');
					 $('#shiftCode').textbox("setValue", selected);
					appForm.attr('action', httpDispatcher + '/psp/shiftCode/findBy'); // findBy
					appForm.submit();					
				});			
				//Reset Button
				$('#resetBtn').on('click', function(event) {			
					$('#criteria_shift_code').textbox('setValue', ''); // select the "ALL" with empty value
				});				
				
				
				//Cancel Button
				$('#cancelBtn').on('click', function(event) {	
	                
					
					togglePanel();
				});		
				
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){
                    	if (row){
    		                // $.messager.alert('Info', row.id+":"+row.catalogue+":"+row.code+":"+row.description);
    		                $('#id').val(row.id);
    		                $('#operateAt').val(row.operateAt);
    		                
    		                $('#siteShiftCode').textbox("setValue", row.siteShiftCode);
    		                $('#shiftCode').textbox("setValue", row.shiftCode);
    		                $('#personalShiftCode').textbox("setValue", row.personalShiftCode);
    		                $('#shiftCodeDescription').textbox("setValue", row.shiftCodeDescription);
    		                $('#startFrom').textbox("setValue", row.startFrom);
    		                $('#untilTo').textbox("setValue", row.untilTo);
    		                $('#actualWorkHours').textbox("setValue", row.actualWorkHours);
    		                
    		                $('#breakfast').combobox("setValue", row.breakfast);
    		                $('#morningCommute').combobox("setValue", row.morningCommute);
    		                $('#dinner').combobox("setValue", row.dinner);
    		                $('#nightCommute').combobox("setValue", row.nightCommute);

    		                togglePanel();
    		            }
                    }
                });			
                //-------------------------------------------------------------
			};
			var showMsg = function() {
				if (errorMsg != '') {
					$.messager.alert('Error',errorMsg,'error');
				}
				if (msg != '') {
					$.messager.alert('Info',msg,'info');
				}
			};
			
			return {
				init : function() {
					// 表單事件初始化					
					bundlePageEvent();
					$('#southPannel').toggle(); // hide southPanel


					$('#dg').datagrid(); // convert html table to dataGrid
					gridData = $('#dg').datagrid("getData"); 
					
					// if post back with msg , show it
					showMsg();					
				}
			};
		}();

		$(document).ready(jsApp.init);

		// ]]>
	</script>
</body>
</html>