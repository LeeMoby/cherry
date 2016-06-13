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
                <li class="active"><a href="http://localhost:8080/device/home/">资产设备 <span class="sr-only">(current)</span></a></li>
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
            <form class="form-inline">
                <div class="row placeholders">
                    <div class="col-sm-4 placeholder">
                        <div class="form-group">
                            <label for="dno">设备编号: </label>
                            <input type="text" class="form-control" id="dno" placeholder="请输入设备编号">
                        </div>
                        <br><br>
                        <div class="form-group">
                            <label for="did">序 列 号: </label>
                            <input type="text" class="form-control" id="did" placeholder="请输入设备编号">
                        </div>
                    </div>
                    <div class="col-sm-4 placeholder">
                        <div class="form-group">
                            <label for="dname">设备名称: </label>
                            <input type="text" class="form-control" id="dname" placeholder="请输入设备名称">
                        </div>
                    </div>
                    <div class="col-sm-4 placeholder">
                        <div class="form-group">
                            <label for="person">责任人: </label>
                            <input type="text" class="form-control" id="person" placeholder="请输入责任人">
                        </div>
                        <br><br>
                        <div class="form-group">
                            <button type="button" class="btn btn-primary"> &nbsp;&nbsp;&nbsp;查&nbsp;&nbsp;&nbsp;询&nbsp;&nbsp;&nbsp;</button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="text-right" style="margin-bottom: 5px">
                <a class="btn btn-info" href="#" role="button">新增</a>
                <button class="btn btn-info" type="batchDel">删除</button>
                <button class="btn btn-info" type="batchUpdate">修改</button>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                    <tr class="info">
                        <th>#</th>
                        <th>编号</th>
                        <th>名称</th>
                        <th>位置</th>
                        <th>责任人</th>
                        <th>投运日期</th>
                        <th>型号</th>
                        <th>所属网络</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="device" items="${list}">
                        <tr>
                            <td>${device.did}</td>
                            <td>${device.dno}</td>
                            <td>${device.dname}</td>
                            <td>${device.cabinet.cno} ${device.dplace}</td>
                            <td>${device.person}</td>
                            <td><fmt:formatDate value="${device.useDate}" pattern="yyyy-MM-dd"/></td>
                            <td>${device.dmodel}</td>
                            <td>${device.nettype}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
</div>

<%@include file="../common/footer.jsp" %>


</body>
</html>