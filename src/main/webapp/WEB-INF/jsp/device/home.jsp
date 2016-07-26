<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0041)http://localhost:8080/cherry/home/ -->
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/images/cherry-32x32.png">

    <title>Cherry</title>

    <%@include file="../common/head.jsp" %>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://localhost:8080/cherry/home/#">云间一石</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="http://localhost:8080/cherry/home/#">导航</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">皮肤</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">用户</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">帮助</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="搜索...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="http://localhost:8080/cherry/home/#">首页</a>
                </li>
                <li><a href="http://localhost:8080/cherry/home/#">报表</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">分析</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">导出</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="http://localhost:8080/cherry/home/">机房巡视</a></li>
                <li><a href="http://localhost:8080/cherry/home/">班组资料</a></li>
                <li><a href="http://localhost:8080/cherry/home/">工作日志</a></li>
                <li><a href="http://localhost:8080/cherry/home/">库房管理</a></li>
                <li class="active"><a href="http://localhost:8080/device/home/">资产设备 <span
                        class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="http://localhost:8080/cherry/home/">系统配置</a></li>
                <li><a href="http://localhost:8080/cherry/home/">偏好设置</a></li>
                <li><a href="http://localhost:8080/cherry/home/">关于</a></li>
            </ul>
            <%--<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">--%>
            <%--<div class="panel panel-default">--%>
            <%--<div class="panel-heading" role="tab" id="headingOne">--%>
            <%--<h4 class="panel-title">--%>
            <%--<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">--%>
            <%--资产设备--%>
            <%--</a>--%>
            <%--</h4>--%>
            <%--</div>--%>
            <%--<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">--%>
            <%--<div class="panel-body">--%>
            <%--<ul class="nav nav-sidebar">--%>
            <%--<li><a href="http://localhost:8080/cherry/home/">资产查询</a></li>--%>
            <%--<li><a href="http://localhost:8080/cherry/home/">资产维护</a></li>--%>
            <%--<li><a href="http://localhost:8080/cherry/home/">定制导出</a></li>--%>
            <%--</ul>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="panel panel-default">--%>
            <%--<div class="panel-heading" role="tab" id="headingTwo">--%>
            <%--<h4 class="panel-title">--%>
            <%--<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">--%>
            <%--机房巡视--%>
            <%--</a>--%>
            <%--</h4>--%>
            <%--</div>--%>
            <%--<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">--%>
            <%--<div class="panel-body">--%>
            <%--巡视记录--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="panel panel-default">--%>
            <%--<div class="panel-heading" role="tab" id="headingThree">--%>
            <%--<h4 class="panel-title">--%>
            <%--<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">--%>
            <%--库房管理--%>
            <%--</a>--%>
            <%--</h4>--%>
            <%--</div>--%>
            <%--<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">--%>
            <%--<div class="panel-body">--%>
            <%--台账盘点--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">资产设备</h1>
            <div class="container-fluid">
                <form class="form-inline">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="dropdown">
                                    <label for="deviceType">设备类型: </label>
                                    <select id="deviceType" class="form-control">
                                        <c:forEach var="deviceType" items="${deviceTypeList}">
                                            <option value="${deviceType.dtid}">${deviceType.dtname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="dno">设备编号: </label>
                                <input type="text" class="form-control" id="dno" placeholder="请输入设备编号">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="person">责任人: </label>
                                <input type="text" class="form-control" id="person" placeholder="请输入责任人">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="dropdown">
                                    <label for="roomid">所在机房: </label>
                                    <select id="roomid" class="form-control">
                                        <c:forEach var="room" items="${roomList}">
                                            <option value="${room.rid}">${room.rname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="department">运维部门: </label>
                                <input type="text" class="form-control" id="department" placeholder="请输入部门">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <button type="button" class="btn btn-primary"> &nbsp;&nbsp;&nbsp;查&nbsp;&nbsp;&nbsp;询&nbsp;&nbsp;&nbsp;</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <br><br>
            <div class="text-right" style="margin-bottom: 5px">
                <a class="btn btn-info" href="/device/add" target="_blank" role="button">新增</a>
                <button class="btn btn-info" type="button">修改</button>
                <button class="btn btn-danger" type="button" onclick="batchDelete()">删除</button>
                <button class="btn btn-info" type="button" onclick="exportExcel()">导出</button>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover" style="width: 1500px;">
                    <thead>
                    <tr class="info">
                        <th>
                            <input type="checkbox" id="cbtn_all">
                        </th>
                        <th>编号</th>
                        <th>名称</th>
                        <th>位置</th>
                        <th>责任人</th>
                        <th>投运日期</th>
                        <th>型号</th>
                        <th>所属网络</th>
                        <th>设备型号</th>
                        <th>资产编码</th>
                        <th>IP地址</th>
                        <th>设备状态</th>
                        <th>序列号</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form class="form-inline">
                        <c:forEach var="device" items="${list}">
                            <tr>
                                <td>
                                    <input type="checkbox" name="cbtn_id" value="${device.did}">
                                </td>
                                <td><a href="/device/${device.did}/detail" target="_blank">${device.dno}</a></td>
                                <td>${device.dname}</td>
                                <td>${device.cabinet.cno} ${device.dplace}</td>
                                <td>${device.person}</td>
                                <td><fmt:formatDate value="${device.useDate}" pattern="yyyy-MM-dd"/></td>
                                <td>${device.dmodel}</td>
                                <td>${device.nettype}</td>
                                <td>${device.dmodel}</td>
                                <td>${device.dcode}</td>
                                <td>${device.dip}</td>
                                <td>${device.dstatus}</td>
                                <td>${device.serialNumber}</td>
                            </tr>
                        </c:forEach>
                    </form>
                    </tbody>
                </table>

            </div>
            <nav>
                <ul class="pagination">
                    <li class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
    //以Excel格式,导出全部数据
    function exportExcel(){
        window.open("/device/exportExcel4All", "_blank", "width=300px, height=200px, menubar=no, scrollbar=no");
    }
    // 全选复选框,控制ID复选框
    $(function (){
        $('#cbtn_all').click(function(){
            if(this.checked){
                $(':checkbox[name="cbtn_id"]').prop("checked", true);
            }else{
                $(':checkbox[name="cbtn_id"]').prop("checked", false);
            }
        });

        $(':checkbox[name="cbtn_id"]').click(function () {
            allchk();

        })
    });
    //ID复选框,控制全选复选框
    function allchk() {
        var cb_total = $(':checkbox[name="cbtn_id"]').size();
        var cb_num = 0;
        $(':checkbox[name="cbtn_id"]').each(function () {
            if($(this).prop("checked") == true){
                cb_num ++;
            }
        });
        if(cb_total == cb_num){
            $('#cbtn_all').prop("checked", true);
        }else{
            $('#cbtn_all').prop("checked", false);
        }
    }
    // 批量删除
    function batchDelete(){
        var IDs = new Array();
        $(':checkbox[name="cbtn_id"]').each(function(){
           if($(this).prop("checked") == true){
               IDs.push($(this).val());
           }
        });
        if(IDs.length > 0){
            var indata = {deviceIDs:IDs};
            $.post("/device/delete", indata, function(data){
                alert("ok");
            }, 'json');
        }else{
            alert("请选择要删除的记录。");
        }

    }
</script>

</body>
</html>