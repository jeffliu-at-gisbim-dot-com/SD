<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 
    程式說明
           依指定Department(departmentCode)月份(yearMonth), 匯出排班資料   
    
  @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)    
  History:
     2017/??/?? first release
               
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login here</title>
    <%@ include file="../jspPreload.jsp"%>
</head>
<body>
        <form id="ff" method="POST">
        <div  id="northPannel"  style="height:190px;">
            <div class="easyui-panel" title="Search Filter" style="width:100%;max-width:100%;padding:30px 60px;">
                    <table>
                        <tr><td>Department:</td>
                            <td><select id="criteria_departmentCode" name="criteria_departmentCode"   class="easyui-combobox" 
                                                          data-options="panelHeight:180,separator:'|'"
                                                          style="width:350px;">
                                                <c:forEach var="entity" items="${requestScope.departments}">
                                                <option value="${entity.department}">${entity.department}-${entity.description}</option>                                                
                                                </c:forEach>
                                                <option value="" SELECTED>ALL</option>
                                 </select>                           
                            </td>                            
                            <td> &nbsp; &nbsp;</td>
                            <td>EmployeeNo:</td>
                            <td><input class="easyui-textbox" id="criteria_employeeNo" name="criteria_employeeNo" style="width:120px" >
                            <td> &nbsp; &nbsp;</td>
                            <td>Year Month:</td>
                            <td><input class="easyui-textbox" id="criteria_yearMonth" name="criteria_yearMonth" style="width:120px" >
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
        
          
        <input id="employeeNo"    name="employeeNo"     type="hidden">
        <input id="yearMonth"     name="yearMonth"      type="hidden">
        <input id="employeeName"  name="employeeName"     type="hidden">

        <input id="01_id"     name="01_id"      type="hidden">
        <input id="02_id"     name="02_id"      type="hidden">
        <input id="03_id"     name="03_id"      type="hidden">
        <input id="04_id"     name="04_id"      type="hidden">
        <input id="05_id"     name="05_id"      type="hidden">
        <input id="06_id"     name="06_id"      type="hidden">
        <input id="07_id"     name="07_id"      type="hidden">
        <input id="08_id"     name="08_id"      type="hidden">
        <input id="09_id"     name="09_id"      type="hidden">
        <input id="10_id"     name="10_id"      type="hidden">
        <input id="11_id"     name="11_id"      type="hidden">
        <input id="12_id"     name="12_id"      type="hidden">
        <input id="13_id"     name="13_id"      type="hidden">
        <input id="14_id"     name="14_id"      type="hidden">
        <input id="15_id"     name="15_id"      type="hidden">
        <input id="16_id"     name="16_id"      type="hidden">
        <input id="17_id"     name="17_id"      type="hidden">
        <input id="18_id"     name="18_id"      type="hidden">
        <input id="19_id"     name="19_id"      type="hidden">
        <input id="20_id"     name="20_id"      type="hidden">
        <input id="21_id"     name="21_id"      type="hidden">
        <input id="22_id"     name="22_id"      type="hidden">
        <input id="23_id"     name="23_id"      type="hidden">
        <input id="24_id"     name="24_id"      type="hidden">
        <input id="25_id"     name="25_id"      type="hidden">
        <input id="26_id"     name="26_id"      type="hidden">
        <input id="27_id"     name="27_id"      type="hidden">
        <input id="28_id"     name="28_id"      type="hidden">
        <input id="29_id"     name="29_id"      type="hidden">
        <input id="30_id"     name="30_id"      type="hidden">
        <input id="31_id"     name="31_id"      type="hidden">
        
        <input id="01_operateAtTime"     name="01_operateAtTime"      type="hidden">
        <input id="02_operateAtTime"     name="02_operateAtTime"      type="hidden">
        <input id="03_operateAtTime"     name="03_operateAtTime"      type="hidden">
        <input id="04_operateAtTime"     name="04_operateAtTime"      type="hidden">
        <input id="05_operateAtTime"     name="05_operateAtTime"      type="hidden">
        <input id="06_operateAtTime"     name="06_operateAtTime"      type="hidden">
        <input id="07_operateAtTime"     name="07_operateAtTime"      type="hidden">
        <input id="08_operateAtTime"     name="08_operateAtTime"      type="hidden">
        <input id="09_operateAtTime"     name="09_operateAtTime"      type="hidden">
        <input id="10_operateAtTime"     name="10_operateAtTime"      type="hidden">
        <input id="11_operateAtTime"     name="11_operateAtTime"      type="hidden">
        <input id="12_operateAtTime"     name="12_operateAtTime"      type="hidden">
        <input id="13_operateAtTime"     name="13_operateAtTime"      type="hidden">
        <input id="14_operateAtTime"     name="14_operateAtTime"      type="hidden">
        <input id="15_operateAtTime"     name="15_operateAtTime"      type="hidden">
        <input id="16_operateAtTime"     name="16_operateAtTime"      type="hidden">
        <input id="17_operateAtTime"     name="17_operateAtTime"      type="hidden">
        <input id="18_operateAtTime"     name="18_operateAtTime"      type="hidden">
        <input id="19_operateAtTime"     name="19_operateAtTime"      type="hidden">
        <input id="20_operateAtTime"     name="20_operateAtTime"      type="hidden">
        <input id="21_operateAtTime"     name="21_operateAtTime"      type="hidden">
        <input id="22_operateAtTime"     name="22_operateAtTime"      type="hidden">
        <input id="23_operateAtTime"     name="23_operateAtTime"      type="hidden">
        <input id="24_operateAtTime"     name="24_operateAtTime"      type="hidden">
        <input id="25_operateAtTime"     name="25_operateAtTime"      type="hidden">
        <input id="26_operateAtTime"     name="26_operateAtTime"      type="hidden">
        <input id="27_operateAtTime"     name="27_operateAtTime"      type="hidden">
        <input id="28_operateAtTime"     name="28_operateAtTime"      type="hidden">
        <input id="29_operateAtTime"     name="29_operateAtTime"      type="hidden">
        <input id="30_operateAtTime"     name="30_operateAtTime"      type="hidden">
        <input id="31_operateAtTime"     name="31_operateAtTime"      type="hidden">  
        
        <div id="southPannel"  style="height:200px;"> 
            <div class="easyui-panel" title="Data Input" style="width:100%;max-width:100%;padding:30px 60px;">
                    <div style="margin-bottom:20px">
                        <table style="width:480px">
                            <tr><td style="font-weight:bold;">EmployeeNo:</td>
                                <td><span id="employeeNo"></span></td>
                                <td style="font-weight:bold;">Name:</td>
                                <td><span id="name"></span></td>
                                <td style="font-weight:bold;">YearMonth:</td>
                                <td><span id="yearMonth"></span></td>
                            </tr>
                        </table>
                    </div>    

                    <div style="margin-bottom:20px">
                    
                        <table style="width:620px">
                        <tr>
                            <td style="font-weight:bold;">Date</td><td>Rev.</td><td>Rest.</td><td>B.</td><td>D.</td><td>M.</td><td>N.</td><td>差假</td><td>加班</td><td>&nbsp;&nbsp;&nbsp;</td>
                            <td style="font-weight:bold;">Date</td><td>Rev.</td><td>Rest.</td><td>B.</td><td>D.</td><td>M.</td><td>N.</td><td>差假</td><td>加班</td>                            
                        </tr> 
             
             
                        <tr>
                            <td>01</td>
                            
                            <td><input class="easyui-textbox" id="01_reviseShiftCode" name="01_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="01_restShiftCode"   name="01_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="01_breakfast"       name="01_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="01_dinner"          name="01_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="01_morningCommute"  name="01_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="01_nightCommute"    name="01_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="01_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="01_overtime">Detail</a></td>
                            <td></td>
                            <td>16</td>
                            <td><input class="easyui-textbox" id="16_reviseShiftCode" name="16_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="16_restShiftCode"   name="16_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="16_breakfast"       name="16_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="16_dinner"          name="16_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="16_morningCommute"  name="16_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="16_nightCommute"    name="16_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="16_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="16_overtime">Detail</a></td>

                        </tr>
                        <tr>
                            <td>02</td>
                            <td><input class="easyui-textbox" id="02_reviseShiftCode" name="02_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="02_restShiftCode"   name="02_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="02_breakfast"       name="02_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="02_dinner"          name="02_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="02_morningCommute"  name="02_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="02_nightCommute"    name="02_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="02_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="02_overtime">Detail</a></td>
                             
                            <td></td>
                            <td>17</td>
                            <td><input class="easyui-textbox" id="17_reviseShiftCode" name="17_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="17_restShiftCode"   name="17_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="17_breakfast"       name="17_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="17_dinner"          name="17_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="17_morningCommute"  name="17_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="17_nightCommute"    name="17_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="17_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="17_overtime">Detail</a></td> 
                        </tr>
                        <tr>
                            <td>03</td>
                            <td><input class="easyui-textbox" id="03_reviseShiftCode" name="03_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="03_restShiftCode"   name="03_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="03_breakfast"       name="03_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="03_dinner"          name="03_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="03_morningCommute"  name="03_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="03_nightCommute"    name="03_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="03_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="03_overtime">Detail</a></td>
                            <td></td>
                            <td>18</td>
                            <td><input class="easyui-textbox" id="18_reviseShiftCode" name="18_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="18_restShiftCode"       name="18_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="18_breakfast"       name="18_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="18_dinner"          name="18_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="18_morningCommute"  name="18_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="18_nightCommute"    name="18_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="18_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="18_overtime">Detail</a></td>   
                        </tr>
                        <tr>
                            <td>04</td>
                            <td><input class="easyui-textbox" id="04_reviseShiftCode" name="04_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="04_restShiftCode"   name="04_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="04_breakfast"       name="04_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="04_dinner"          name="04_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="04_morningCommute"  name="04_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="04_nightCommute"    name="04_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="04_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="04_overtime">Detail</a></td>
                            <td></td>
                            <td>19</td>
                            <td><input class="easyui-textbox" id="19_reviseShiftCode" name="19_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="19_restShiftCode"   name="19_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="19_breakfast"       name="19_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="19_dinner"          name="19_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="19_morningCommute"  name="19_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="19_nightCommute"    name="19_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="19_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="19_overtime">Detail</a></td>       
                        </tr>
                        <tr>
                            <td>05</td>
                            <td><input class="easyui-textbox" id="05_reviseShiftCode" name="05_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="05_restShiftCode"   name="05_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="05_breakfast"       name="05_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="05_dinner"          name="05_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="05_morningCommute"  name="05_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="05_nightCommute"    name="05_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="05_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="05_overtime">Detail</a></td>
                            <td></td>
                            <td>20</td>
                            <td><input class="easyui-textbox" id="20_reviseShiftCode" name="20_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="20_restShiftCode"   name="20_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="20_breakfast"       name="20_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="20_dinner"          name="20_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="20_morningCommute"  name="20_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="20_nightCommute"    name="20_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="20_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="20_overtime">Detail</a></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        <tr>
                            <td>06</td>
                            <td><input class="easyui-textbox" id="06_reviseShiftCode" name="06_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="06_restShiftCode"   name="06_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="06_breakfast"       name="06_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="06_dinner"          name="06_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="06_morningCommute"  name="06_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="06_nightCommute"    name="06_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="06_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="06_overtime">Detail</a></td>  
                            <td></td>
                            <td>21</td>
                            <td><input class="easyui-textbox" id="21_reviseShiftCode" name="21_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="21_restShiftCode"   name="21_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="21_breakfast"       name="21_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="21_dinner"          name="21_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="21_morningCommute"  name="21_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="21_nightCommute"    name="21_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="21_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="21_overtime">Detail</a></td>
                        </tr>
                        <tr>
                            <td>07</td>
                            <td><input class="easyui-textbox" id="07_reviseShiftCode" name="07_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="07_restShiftCode"   name="07_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="07_breakfast"       name="07_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="07_dinner"          name="07_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="07_morningCommute"  name="07_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="07_nightCommute"    name="07_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="07_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="07_overtime">Detail</a></td>
                            <td></td>
                            <td>22</td>
                            <td><input class="easyui-textbox" id="22_reviseShiftCode" name="22_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="22_restShiftCode"   name="22_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="22_breakfast"       name="22_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="22_dinner"          name="22_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="22_morningCommute"  name="22_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="22_nightCommute"    name="22_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="22_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="22_overtime">Detail</a></td>
                        </tr>
                        <tr>
                            <td>08</td>
                            <td><input class="easyui-textbox" id="08_reviseShiftCode" name="08_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="08_restShiftCode"   name="08_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="08_breakfast"       name="08_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="08_dinner"          name="08_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="08_morningCommute"  name="08_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="08_nightCommute"    name="08_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="08_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="08_overtime">Detail</a></td>
                            <td></td>
                            <td>23</td>
                            <td><input class="easyui-textbox" id="23_reviseShiftCode" name="23_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="23_restShiftCode"   name="23_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="23_breakfast"       name="23_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="23_dinner"          name="23_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="23_morningCommute"  name="23_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="23_nightCommute"    name="23_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="23_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="23_overtime">Detail</a></td>
                        </tr>
                        <tr>
                            <td>09</td>
                            <td><input class="easyui-textbox" id="09_reviseShiftCode" name="09_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="09_restShiftCode"   name="09_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="09_breakfast"       name="09_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="09_dinner"          name="09_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="09_morningCommute"  name="09_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="09_nightCommute"    name="09_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="09_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="09_overtime">Detail</a></td>
                            <td></td>
                            <td>24</td>
                            <td><input class="easyui-textbox" id="24_reviseShiftCode" name="24_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="24_restShiftCode"   name="24_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="24_breakfast"       name="24_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="24_dinner"          name="24_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="24_morningCommute"  name="24_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="24_nightCommute"    name="24_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="24_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="24_overtime">Detail</a></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td><input class="easyui-textbox" id="10_reviseShiftCode" name="10_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="10_restShiftCode"   name="10_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="10_breakfast"       name="10_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="10_dinner"          name="10_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="10_morningCommute"  name="10_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="10_nightCommute"    name="10_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="10_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="10_overtime">Detail</a></td>
                            <td></td>
                            <td>25</td>
                            <td><input class="easyui-textbox" id="25_reviseShiftCode" name="25_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="25_restShiftCode"   name="25_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="25_breakfast"       name="25_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="25_dinner"          name="25_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="25_morningCommute"  name="25_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="25_nightCommute"    name="25_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="25_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="25_overtime">Detail</a></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        <tr>
                            <td>11</td>
                            <td><input class="easyui-textbox" id="11_reviseShiftCode" name="11_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="11_restShiftCode"   name="11_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="11_breakfast"       name="11_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="11_dinner"          name="11_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="11_morningCommute"  name="11_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="11_nightCommute"    name="11_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="11_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="11_overtime">Detail</a></td>
                            <td></td>
                            <td>26</td>
                            <td><input class="easyui-textbox" id="26_reviseShiftCode" name="26_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="26_restShiftCode"   name="26_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="26_breakfast"       name="26_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="26_dinner"          name="26_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="26_morningCommute"  name="26_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="26_nightCommute"    name="26_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="26_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="26_overtime">Detail</a></td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td><input class="easyui-textbox" id="12_reviseShiftCode" name="12_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="12_restShiftCode"   name="12_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="12_breakfast"       name="12_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="12_dinner"          name="12_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="12_morningCommute"  name="12_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="12_nightCommute"    name="12_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="12_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="12_overtime">Detail</a></td>
                            <td></td>
                            <td>27</td>
                            <td><input class="easyui-textbox" id="27_reviseShiftCode" name="27_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="27_restShiftCode"   name="27_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="27_breakfast"       name="27_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="27_dinner"          name="27_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="27_morningCommute"  name="27_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="27_nightCommute"    name="27_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="27_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="27_overtime">Detail</a></td>
                            </tr>
                        <tr>
                            <td>13</td>
                            <td><input class="easyui-textbox" id="13_reviseShiftCode" name="13_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="13_restShiftCode"   name="13_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="13_breakfast"       name="13_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="13_dinner"          name="13_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="13_morningCommute"  name="13_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="13_nightCommute"    name="13_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="13_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="13_overtime">Detail</a></td>
                            <td></td>
                            <td>28</td>
                            <td><input class="easyui-textbox" id="28_reviseShiftCode" name="28_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="28_restShiftCode"   name="28_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="28_breakfast"       name="28_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="28_dinner"          name="28_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="28_morningCommute"  name="28_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="28_nightCommute"    name="28_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="28_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="28_overtime">Detail</a></td>
                            </tr>
                        <tr>
                            <td>14</td>
                            <td><input class="easyui-textbox" id="14_reviseShiftCode" name="14_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="14_restShiftCode"   name="14_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="14_breakfast"       name="14_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="14_dinner"          name="14_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="14_morningCommute"  name="14_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="14_nightCommute"    name="14_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="14_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="14_overtime">Detail</a></td>
                            <td></td>
                            <td><p id='29_shiftDate'>29</p></td>
                            <td><input class="easyui-textbox" id="29_reviseShiftCode" name="29_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="29_restShiftCode"   name="29_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="29_breakfast"       name="29_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="29_dinner"          name="29_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="29_morningCommute"  name="29_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="29_nightCommute"    name="29_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="29_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="29_overtime">Detail</a></td>
                            </tr>
                        <tr>
                            <td>15</td>
                            <td><input class="easyui-textbox" id="15_reviseShiftCode" name="15_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="15_restShiftCode"   name="15_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="15_breakfast"       name="15_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="15_dinner"          name="15_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="15_morningCommute"  name="15_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="15_nightCommute"    name="15_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="15_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="15_overtime">Detail</a></td>
                            <td></td>
                            <td><p id='30_shiftDate'>30</p></td>
                            <td><input class="easyui-textbox" id="30_reviseShiftCode" name="30_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="30_restShiftCode"   name="30_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="30_breakfast"       name="30_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="30_dinner"          name="30_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="30_morningCommute"  name="30_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="30_nightCommute"    name="30_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="30_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="30_overtime">Detail</a></td>
                            </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><p id='31_shiftDate'>31</p></td>
                            <td><input class="easyui-textbox" id="31_reviseShiftCode" name="31_reviseShiftCode" style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="31_restShiftCode"   name="31_restShiftCode"   style="width:30px" readonly="true"></td>
                            <td><input class="easyui-textbox" id="31_breakfast"       name="31_breakfast"       style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="31_dinner"          name="31_dinner"          style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="31_morningCommute"  name="31_morningCommute"  style="width:30px" ></td>
                            <td><input class="easyui-textbox" id="31_nightCommute"    name="31_nightCommute"    style="width:30px" ></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="31_absence" >Detail</a></td>
                            <td> <a href="#" class="easyui-linkbutton"  id="31_overtime">Detail</a></td>
                        </tr>                       
                        
                        
                        </table>
                    </div>     
                    <div style="text-align:left;padding:5px 0">
                        <table style="width:480px">
                            <tr><td style="font-weight:bold;">BreakFast</td>
                                <td style="font-weight:bold;">Dinner</td>
                                <td style="font-weight:bold;">Morning Commute</td>                                
                                <td style="font-weight:bold;">Night Commute</td>                                
                            </tr>
                            <tr><td><span id="bCount"></span></td>
                                <td><span id="dCount"></span></td>
                                <td><span id="mCount"></span></td>
                                <td><span id="nCount"></span></td>
                            </tr>
                        </table>
                    </div>                          
                    <div style="text-align:left;padding:5px 0">
                        <a id="saveBtn"    href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Set</a>                        
                        <a id="cancelBtn"  href="javascript:void(0)" class="easyui-linkbutton" onclick="" style="width:80px">Cancel</a>
                    </div>  
                    <div id="dlg" class="easyui-dialog" title="Information Dialog" data-options="iconCls:'icon-save'" style="width:780px;height:420px;padding:10px">
                        <table id="infoDg"  style="width:100%;height:355px" data-options="
                        rownumbers:true,
                        singleSelect:true,
                        autoRowHeight:true">
                        
                        </table>
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
                    jsApp.ajax_findAll();                   
                });         
                //Reset Button
                $('#resetBtn').on('click', function(event) {          
                    $('#criteria_departmentCode').textbox('setValue', '');
                    $('#criteria_employeeNo').textbox('setValue', ''); 
                    $('#criteria_yearMonth').textbox('setValue', '');                   
                });     
                    

                //Set Button
                $('#saveBtn').on('click', function(event) { 
                    var valid = false;
                    valid = appForm.form('validate');
                    if(valid) {
                        var action = httpDispatcher + '/psp/missing/setBDMNBy';

                        $.ajax({
                            url: action,
                            data: appForm.serialize(),
                            type:"POST",
                            dataType:'json',
                            success: function(data){
                                if(data.message != null &&data.message != '') {
                                    $.messager.alert('Success',data.message,'info');
                                }     
                                jsApp.ajax_fresh();
                            },                            
                            error:function(XMLHttpRequest, textStatus, errorThrown) {
                                jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            }
                        });
                    } else {
                        $.messager.alert('Info', 'Validation Error.');
                    }
                });     
                
                    
                //Cancel Button
                $('#cancelBtn').on('click', function(event) {   
                    jsApp.togglePanel();
                });     
                
                //Double Click Row
                $('#dg').datagrid({
                    onDblClickRow: function(index,row){
                        $('#employeeNo').val(row.employeeNo);
                        $('#yearMonth').val(row.yearMonth);
                        $('#employeeName').val(row.firstName+' '+ row.lastName);
                        
                        jsApp.ajax_fresh();
                        jsApp.togglePanel();
                        
                    }
                });         
                //-------------------------------------------------------------
                
                
                
                
                
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
                    $('#dlg').dialog('close');
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
                ajax_fresh : function () {
                    // ajax to query data
                    $.ajax({
                        url: httpDispatcher + '/psp/missing/findBy',
                        data: appForm.serialize(),
                        type:"POST",
                        dataType:'json',
                        success: function(data){
                        	var theShiftDate = [];
                        	
                            // setting the end of month
                            var dayOfMonth = data.dayOfMonth;                               
                            for(var j=29; j<32; j++) { // default: hide 29, 30, 31                                  
                                $('#'+j+'_shiftDate').hide();
                                $('#'+j+'_reviseShiftCode').textbox('hide');
                                $('#'+j+'_restShiftCode').textbox('hide');
                                $('#'+j+'_breakfast').textbox('hide');
                                $('#'+j+'_dinner').textbox('hide');
                                $('#'+j+'_morningCommute').textbox('hide');
                                $('#'+j+'_nightCommute').textbox('hide'); 
                                $('#'+j+'_absence').hide();
                                $('#'+j+'_overtime').hide();
                            }
                            for(var k=29; k<=dayOfMonth; k++) {
                                $('#'+k+'_shiftDate').show();
                                $('#'+k+'_reviseShiftCode').textbox('show');
                                $('#'+k+'_restShiftCode').textbox('show');
                                $('#'+k+'_breakfast').textbox('show');
                                $('#'+k+'_dinner').textbox('show');
                                $('#'+k+'_morningCommute').textbox('show');
                                $('#'+k+'_nightCommute').textbox('show');
                                $('#'+k+'_absence').show();
                                $('#'+k+'_overtime').show();
                            }
                            
                            // set by data
                            for(var i=0; i< data.rows.length; i++) {
                                var bean = data.rows[i];
                                var shiftDate = bean.shiftDate;
                                theShiftDate[i] = shiftDate;
                                
                                $('#'+shiftDate+'_id').val(bean.id);
                                $('#'+shiftDate+'_operateAtTime').val(bean.operateAtTime);
                                $('#'+shiftDate+'_reviseShiftCode').textbox('setValue', bean.reviseShiftCode);
                                $('#'+shiftDate+'_restShiftCode').textbox('setValue',   bean.restShiftCode);
                                $('#'+shiftDate+'_breakfast').textbox('setValue',       bean.breakfast);
                                $('#'+shiftDate+'_dinner').textbox('setValue',          bean.dinner);
                                $('#'+shiftDate+'_morningCommute').textbox('setValue',  bean.morningCommute);
                                $('#'+shiftDate+'_nightCommute').textbox('setValue',    bean.nightCommute);
                                                               
                                if(bean.hasAbsence) {                                                                	
                                	$('#'+shiftDate+'_absence').show();
                                    $('#'+shiftDate+'_absence').on('click', function(event) { 
                                	    jsApp.gotoAbsence();
                                	    return;
                                	});   
                                } else {                                	
                                	$('#'+shiftDate+'_absence').hide();
                                }
                                
                                if(bean.hasOvertime) {                                
                                    $('#'+shiftDate+'_overtime').show();                                    
                                    $('#'+shiftDate+'_overtime').on('click', function(event) { 
                                        jsApp.gotoOvertime();
                                        return;
                                    });   
                                } else {
                                    $('#'+shiftDate+'_overtime').hide();                                                                                                      
                                }
                                
                            }   


                            $("#employeeNo").text(data.employeeNo);
                            $("#name").text(data.name);
                            $("#yearMonth").text(data.yearMonth);
                            
                            $("#bCount").text(data.bCount);
                            $("#dCount").text(data.dCount);
                            $("#mCount").text(data.mCount);
                            $("#nCount").text(data.nCount);
                            
                            
                            
                            
                        },                            
                        error:function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                        }
                    });
                    
                },
                ajax_findAll : function() {
                    $('#dg').datagrid({
                        url: httpDispatcher +'/psp/missing/indexListOfDepartment',
                        method:'post',
                        rownumbers:true,
                        pagination:true,
                        singleSelect:true,
                        autoRowHeight:false,
                        collapsible:true,
                        pageSize:10,
                        async: false,
                        queryParams: { 'departmentCode': $('#criteria_departmentCode').textbox("getValue"),
                                       'employeeNo': $('#criteria_employeeNo').textbox("getValue"),                        
                                       'yearMonth': $('#criteria_yearMonth').textbox("getValue")
                        },                      
                        columns:[[
                            {width:90, align:'right',field:'departmentCode', title:'Department'},
                            {width:90, align:'right',field:'employeeNo',     title:'Employee NO'},                          
                            {width:180,align:'right',field:'firstName',      title:'First Name'},
                            {width:120,align:'right',field:'lastName',       title:'Last Name'},
                            {width:90, align:'right',field:'yearMonth',      title:'Year Month'}
                        ]],
                        onLoadSuccess: function(result) {                           
                        }, 
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            $('#dg').datagrid('loadData', {"total":0,"rows":[]});
                        }
                        
                    }); 
                }, 
                gotoAbsence : function () {
                    $('#dlg').dialog('open');
                    $('#infoDg').datagrid({
                        url: httpDispatcher +'/psp/missing/queryAbsence',
                        method:'post',
                        rownumbers:true,
                        pagination:true,
                        singleSelect:true,
                        autoRowHeight:false,
                        collapsible:true,
                        pageSize:10,
                        async: false,
                        queryParams: { 'employeeNo': $('#employeeNo').val(),                        
                                        'yearMonth': $('#yearMonth').val()
                        },                      
                        columns:[[
                            {width:200,  align:'right',field:'absence',             title:'Absence'},
                            {width:140, align:'right',field:'totalFromString',     title:'Total From'},                          
                            {width:140, align:'right',field:'totalToString',       title:'Total To'}
                        ]],
                        onLoadSuccess: function(result) {                           
                        }, 
                        onLoadError: function(XMLHttpRequest, textStatus, errorThrown) {
                            jsApp.ajaxMsg(XMLHttpRequest, textStatus, errorThrown);
                            $('#dg').datagrid('loadData', {"total":0,"rows":[]});
                        }
                        
                    }); 
                    
                }, 
                gotoOvertime : function () {
                	$('#dlg').dialog('open');
                    $('#infoDg').datagrid({
                        url: httpDispatcher +'/psp/missing/queryOvertime',
                        method:'post',
                        rownumbers:true,
                        pagination:true,
                        singleSelect:true,
                        autoRowHeight:false,
                        collapsible:true,
                        pageSize:10,
                        async: false,
                        queryParams: { 'employeeNo': $('#employeeNo').val(),                        
                                        'yearMonth': $('#yearMonth').val()
                        },                      
                        columns:[[
                            {width:200, align:'right',field:'overtime',            title:'Overtime'},
                            {width:140, align:'right',field:'fromString',          title:'From'},
                            {width:140, align:'right',field:'toString',            title:'To'}
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