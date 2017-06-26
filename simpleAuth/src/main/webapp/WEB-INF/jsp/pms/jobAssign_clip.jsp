                <table width="850px">
                    <tr><td>A/C Registr:</td>   <td>${sessionScope.assign.workPackage.acRegistr}</td>
                        <td style="text-align:right">
                            W/P name:</td>      <td>${sessionScope.assign.workPackage.wpno} </td>
                        <td style="text-align:right">
                            Start Date:</td>    <td>${sessionScope.assign.workPackage.formattedStartDate}</td>
                        <td style="text-align:right">
                            End Date:</td>      <td>${sessionScope.assign.workPackage.formattedEndDate}</td>
                    </tr>
                    <tr><td>
                            Shift:</td>          <td><select id="shift" name="shift" class="easyui-combobox"
                                                            data-options="panelHeight:65,required: true"
                                                            style="width: 80px;">
                                                        <c:forEach var="shift" items="${requestScope.shift}">
                                                            <option value="${shift.code}" >${shift.description}</option>
                                                        </c:forEach>
                                                            <option value="" SELECTED></option>
                                                    </select>
                                                </td>
                        <td style="text-align:right">
                            Qualification:</td> <td colspan="3"><select id="qualification" name="qualification" class="easyui-combobox"
                                                            data-options="panelHeight:65,required: true"
                                                            style="width: 290px;">
                                                        <c:forEach var="scope" items="${requestScope.scope}">
                                                            <option value="${scope.CODE}" >${scope.CODE}-${scope.DESCRIPTION}</option>
                                                        </c:forEach>
                                                            <option value="" SELECTED></option>
                                                    </select>
                                                </td>                          
                        
                        
                        
                        <td style="text-align:right">
                            Creator:</td>        <td><input id="create_by" name="create_by"
                                                                       data-options="readonly:true"
                                                                       class="easyui-textbox"
                                                                       style="width: 100px;"
                                                                       value="${sessionScope.assign.createBy}">
                                                </td>

                    </tr>
                    <tr><td>Date Assign:</td>    <td><input id="assignDateString" name="assignDateString" class="easyui-datebox"
                                                           style="width: 120px;"
                                                           data-options="formatter:egatFormatter,parser:egatParser, required:true">
                                                </td>
                        <td style="text-align:right">
                            Status:</td>        <td colspan="5"><select id="status" name="status" class="easyui-combobox"
                                                            data-options="panelHeight:65,required: true"
                                                            style="width: 300px;">                                                            
                                                            <option value="L" SELECTED>ON JOB ASSIGN</option>
                                                            <option value="N">DRAFT</option>
                                                    </select>
                                                </td>                                
                    </tr>
                </table> 