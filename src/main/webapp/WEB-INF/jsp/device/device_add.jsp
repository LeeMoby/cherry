<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>

<html lang="UTF-8">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/images/cherry-32x32.png">

    <title>新增资产设备</title>

    <%@include file="../common/head.jsp" %>

</head>

<body>

<div class="container-fluid" style="width: 1000px">
    <div class="row">
        <div class="col-md-8">
            <h2>
                新增资产设备
                <small>标*的为必填项</small>
            </h2>
        </div>
        <div class="col-md-3 col-md-offset-1" style="margin-top: 25px; padding-left: 90px;">
            <button type="button" class="btn btn-primary" onclick="submitForm()">保&nbsp;&nbsp;存</button>
            <button type="button" class="btn btn-default" onclick="closeWindow()">取&nbsp;&nbsp;消</button>
        </div>
    </div>
    <br>
    <%--<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">--%>
    <form class="form-inline">
        <div class="panel panel-primary">
            <div class="panel-heading" role="tab" id="headDetail">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseDetail"
                       aria-expanded="true" aria-controls="collapseDetail">
                        基本信息
                    </a>
                </h4>
            </div>
            <div id="collapseDetail" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headDetail">
                <div class="panel-body">

                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="deviceTypeId">设备类型: </label>
                            <select id="deviceTypeId" name="deviceTypeId" class="form-control">
                                <c:forEach var="deviceType" items="${deviceTypeList}">
                                    <option value="${deviceType.id}" <c:if test="${deviceType.nameAbbr == activeTab}">selected</c:if>>${deviceType.name}</option>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="form-group col-md-4">
                            <label for="name">设备名称: </label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入设备名称">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="code">设备编号: </label>
                            <input type="text" class="form-control" id="code" name="code" placeholder="请输入设备编号">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="codeSgcc">国网编号: </label>
                            <input type="text" class="form-control" id="codeSgcc" name="codeSgcc" placeholder="请输入国网编号">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="use">设备用途: </label>
                            <input type="text" class="form-control" id="use" name="use" placeholder="请输入设备用途">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="useDate">投运日期: </label>
                            <input type="text" class="form-control" id="useDate" name="useDate" placeholder="设备投运日期">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="status">设备状态: </label>
                            <input type="text" class="form-control" id="status" name="status" placeholder="请输入设备状态">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="network">所属网络: </label>
                            <input type="text" class="form-control" id="network" name="network" placeholder="请输入所属网络">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="ipAddress">&nbsp;&nbsp;IP&nbsp;&nbsp;地址: </label>
                            <input type="text" class="form-control" id="ipAddress" name="ipAddress" placeholder="请输入IP地址">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="mgtDeptId">管理部门: </label>
                            <select id="mgtDeptId" name="mgtDeptId" class="form-control">
                                <c:forEach var="department" items="${departmentList}">
                                    <option value="${department.id}" <c:if test="${department.id == 1002}">selected</c:if>>${department.nameAbbr}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="mgtEmployeeId">责&nbsp;&nbsp;任&nbsp;&nbsp;人: </label>
                            <select id="mgtEmployeeId" name="mgtEmployeeId" class="form-control">
                                <c:forEach var="employee" items="${employeeList}">
                                    <option value="${employee.id}" <c:if test="${employee.id == 1002}">selected</c:if>>${employee.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="mgtPhone">联系电话: </label>
                            <input type="text" class="form-control" id="mgtPhone" name="mgtPhone" placeholder="请输入联系电话">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="roomId">所在机房: </label>
                            <select id="roomId" name="roomId" class="form-control">
                                <c:forEach var="room" items="${roomList}">
                                    <option value="${room.id}">${room.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <table style="border: 0px;padding: inherit;">
                                <tr>
                                    <td><label for="cabinetName" style="margin-top: 6px;">所在机柜:&nbsp;</label></td>
                                    <td><input type="text" class="form-control" id="cabinetName" name="cabinet.name"
                                               placeholder="请输入机柜编号"></td>
                                </tr>
                            </table>
                            <%--<input type="hidden" id="cabinetId" name="cabinetId">--%>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="cabinetPosition">柜内位置: </label>
                            <input type="text" class="form-control" id="cabinetPosition" name="cabinetPosition"
                                   placeholder="请输入机柜内起止U数">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading" role="tab" id="headExt">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseExt"
                       aria-expanded="true" aria-controls="collapseExt">
                        扩展信息
                    </a>
                </h4>
            </div>
            <div id="collapseExt" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headExt">
                <div class="panel-body">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="purchaseMethod">采购方式: </label>
                            <input type="text" class="form-control" id="purchaseMethod" name="purchaseMethod"
                                   placeholder="请输入采购方式">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="manufacturer">制&nbsp;&nbsp;造&nbsp;&nbsp;商: </label>
                            <input type="text" class="form-control" id="manufacturer" name="manufacturer"
                                   placeholder="请输入制造商">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="brand">品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌: </label>
                            <input type="text" class="form-control" id="brand" name="brand" placeholder="请输入品牌">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="series">系&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;列: </label>
                            <input type="text" class="form-control" id="series" name="series" placeholder="请输入系列">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="model">型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号: </label>
                            <input type="text" class="form-control" id="model" name="model" placeholder="请输入型号">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="serialNumber">序&nbsp;&nbsp;列&nbsp;&nbsp;号: </label>
                            <input type="text" class="form-control" id="serialNumber" name="serialNumber"
                                   placeholder="请输入序列号">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="manufactureDate">出厂日期: </label>
                            <input type="text" class="form-control" id="manufactureDate" name="manufactureDate" placeholder="设备出厂日期">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="maintenanceSupplier">运维厂商: </label>
                            <input type="text" class="form-control" id="maintenanceSupplier" name="maintenanceSupplier"
                                   placeholder="请输入运维厂商">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="serviceExpiryDate">售后截止: </label>
                            <input type="text" class="form-control" id="serviceExpiryDate" name="serviceExpiryDate" placeholder="售后服务截止日期">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="maintenanceDateStart">维保开始: </label>
                            <input type="text" class="form-control" id="maintenanceDateStart" name="maintenanceDateStart"
                                   placeholder="维保开始日期">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="maintenanceDateEnd">维保结束: </label>
                            <input type="text" class="form-control" id="maintenanceDateEnd" name="maintenanceDateEnd"
                                   placeholder="维保结束日期">
                        </div>
                        <div class="form-group col-md-4">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading" role="tab" id="headOverhaul">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOverhaul"
                       aria-expanded="true" aria-controls="collapseOverhaul">
                        检修记录
                    </a>
                </h4>
            </div>
            <div id="collapseOverhaul" class="panel-collapse collapse in" role="tabpanel"
                 aria-labelledby="headOverhaul">
                <div class="panel-body">
                    <p>...</p>
                </div>
            </div>
        </div>
        <div class="panel panel-warning">
            <div class="panel-heading" role="tab" id="headFault">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFault"
                       aria-expanded="true" aria-controls="collapseFault">
                        故障记录
                    </a>
                </h4>
            </div>
            <div id="collapseFault" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headFault">
                <div class="panel-body">
                    <p>...</p>
                </div>
            </div>
        </div>
        <div class="panel panel-danger">
            <div class="panel-heading" role="tab" id="headDefect">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseDefect"
                       aria-expanded="true" aria-controls="collapseDefect">
                        隐患记录
                    </a>
                </h4>
            </div>
            <div id="collapseDefect" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headDefect">
                <div class="panel-body">
                    <p>...</p>
                </div>
            </div>
        </div>
    </form>
    <%--</div>--%>
</div>
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
    $('#useDate').datepicker({
        format: "yyyy-mm-dd",
        language: "zh-CN"
    });
    $('#manufactureDate').datepicker({
        format: "yyyy-mm-dd",
        language: "zh-CN"
    });
    $('#serviceExpiryDate').datepicker({
        format: "yyyy-mm-dd",
        language: "zh-CN"
    });
    $('#maintenanceDateStart').datepicker({
        format: "yyyy-mm-dd",
        language: "zh-CN"
    });
    $('#maintenanceDateEnd').datepicker({
        format: "yyyy-mm-dd",
        language: "zh-CN"
    });
    function submitForm() {
        var theForm = document.forms[0];
        // 检查表单

        // 提交表单
        var urlType = "";
        <c:if test="${activeTab == '服务器'}"> urlType = "server";</c:if>
        <c:if test="${activeTab == '存储'}"> urlType = "storage";</c:if>
        <c:if test="${activeTab == '网络'}"> urlType = "network";</c:if>
        <c:if test="${activeTab == '安全'}"> urlType = "safety";</c:if>
        <c:if test="${activeTab == '音视频'}"> urlType = "multimedia";</c:if>
        <c:if test="${activeTab == '其他'}"> urlType = "other";</c:if>
        theForm.action = "/device/" + urlType + "/save";
        theForm.method = "post";
        theForm.submit();
    }
    function closeWindow() {
        if (confirm("关闭该页面,数据将不会保存,是否关闭?")) {
            window.close();
        }
    }
    var substringMatcher = function (strs) {
        return function findMatches(q, cb) {
            var matches;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function (i, str) {
                if (substrRegex.test(str)) {
                    matches.push(str);
                }
            });

            cb(matches);
        };
    };

    var cabinets = ["12AA", "12AB", "12AC", "12AD", "12AE", "12AF", "12AG", "12AH", "12AI", "12BA", "12BB", "12BC", "12BD", "12BE", "12BF", "12BG", "12BH", "12CA", "12CB", "12CC", "12CD", "12CE", "12CF", "12CG", "12CH", "13AA", "13AB", "13AC", "13AD", "13AE", "13AF", "13AG", "13AH", "13BA", "13BB", "13BC", "13BD", "13BE", "13BF", "13BG", "13BH", "13CA", "13CB", "13CC", "13CD", "13CE", "13CF", "13CG", "13CH", "21AA", "21AB", "21AC", "21AD", "21AE", "21AF", "21AG", "21AH", "21AI", "21AJ", "21AK", "21AL", "21AM", "21BA", "21BB", "21BC", "21BD", "21BE", "21BF", "21BG", "21BH", "21BI", "21BJ", "21BK", "21BL", "21BM", "21BN", "21BO", "21BP", "21CA", "21CB", "21CC", "21CD", "21CE", "21CF", "21CG", "21CH", "21CI", "21CJ", "21CK", "21CL", "21CM", "21CN", "21DA", "21DB", "21DC", "21DD", "21DE", "21DF", "21DG", "21DH", "21DI", "21DJ", "21DK", "21DL", "21DM", "21DN", "21DO", "21DP", "21EA", "21EB", "21EC", "21ED", "21EE", "21EF", "21EG", "21EH", "21EI", "21EJ", "21EK", "21EL", "21EM", "21EN", "21EO", "21EP", "21FG", "21FH", "21GF", "21GG", "21GH", "21GI", "21HF", "21HG", "21HH", "21HI", "22AA", "22AB", "22AC", "22AD", "22AE", "22AF", "22AG", "22AH", "22AI", "22AJ", "22AK", "22AL", "22BA", "22BB", "22BC", "22BD", "22BE", "22BF", "22BG", "22BH", "22BI", "22BJ", "22BK", "22BL", "22BM", "22BN", "22BO", "22BP", "22CA", "22CB", "22CC", "22CD", "22CE", "22CF", "22CG", "22CH", "22CI", "22CJ", "22CK", "22CL", "22CM", "22CN", "22DA", "22DB", "22DC", "22DD", "22DE", "22DF", "22DG", "22DH", "22DI", "22DJ", "22DK", "22DL", "22DM", "22DN", "22DO", "22DP"];

    $('#cabinetName').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            },
            {
                name: 'states',
                source: substringMatcher(cabinets)
            });
    /*
     $('#cabinetName').typeahead({
     source: function (query, process) {
     return $.ajax({
     url: '/basedata/cabinet/search',
     type: 'post',
     data: {cabinetName: query},
     dataType: 'json',
     success: function (result) {
     if (result.code == "1") {
     var json = JSON.parse(result.data.data);
     var resultList = json.cabinetList.map(function (item) {
     var aItem = {id: item.id, name: item.name};
     return JSON.stringify(aItem);
     });
     return process(resultList);
     } else {
     alert(result.msg);
     }
     }
     });
     },
     matcher: function (obj) {
     var item = JSON.parse(obj);
     return ~item.name.toLowerCase().indexOf(this.query.toLowerCase())
     },

     sorter: function (items) {
     var beginswith = [], caseSensitive = [], caseInsensitive = [], item;
     while (aItem = items.shift()) {
     var item = JSON.parse(aItem);
     if (!item.name.toLowerCase().indexOf(this.query.toLowerCase()))
     beginswith.push(JSON.stringify(item));
     else if (~item.name.indexOf(this.query)) caseSensitive.push(JSON.stringify(item));
     else caseInsensitive.push(JSON.stringify(item));
     }

     return beginswith.concat(caseSensitive, caseInsensitive)

     },

     highlighter: function (obj) {
     var item = JSON.parse(obj);
     var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
     return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
     return '<strong>' + match + '</strong>'
     })
     },

     updater: function (obj) {
     var item = JSON.parse(obj);
     $('#cabinetId').attr('value', item.id);
     return item.name;
     }

     })
     */
</script>

</body>
</html>