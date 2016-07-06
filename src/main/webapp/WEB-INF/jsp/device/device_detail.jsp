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

    <title>查看设备详情</title>

    <%@include file="../common/head.jsp" %>
</head>

<body>

<div class="container-fluid" style="width: 1000px">
    <div class="row">
        <div class="col-md-8">
            <h2>
                ${device.dname}
                <small>${device.deviceType.dtname}</small>
            </h2>
        </div>
        <div class="col-md-3 col-md-offset-1">
            <div class="btn-group" style="margin-top: 25px;" role="group" aria-label="...">
                <button type="button" class="btn btn-default">打印</button>
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        导出
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="#">PDF</a></li>
                        <li><a href="#">WORD</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <br>
    <%--<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">--%>
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
            <table class="table table-bordered">
                <tr>
                    <td class="active"><strong>设备编号</strong></td>
                    <td>${device.dno}</td>
                    <td class="active"><strong>资产编号</strong></td>
                    <td>${device.dcode}</td>
                    <td class="active"><strong>设备名称</strong></td>
                    <td>${device.dname}</td>
                </tr>
                <tr>
                    <td class="active"><strong>设备位置</strong></td>
                    <td>${device.cabinet.cno} ${device.dplace}</td>
                    <td class="active"><strong>运维单位</strong></td>
                    <td>${device.department}</td>
                    <td class="active"><strong>责任人</strong></td>
                    <td>${device.person}</td>
                </tr>
            </table>
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
            <table class="table table-bordered">
                <tr>
                    <td class="active"><strong>设备型号</strong></td>
                    <td>${device.dmodel}</td>
                    <td class="active"><strong>所属网络</strong></td>
                    <td>${device.nettype}</td>
                    <td class="active"><strong>IP地址</strong></td>
                    <td>${device.dip}</td>
                </tr>
                <tr>
                    <td class="active"><strong>设备状态</strong></td>
                    <td>${device.dstatus}</td>
                    <td class="active"><strong>序列号</strong></td>
                    <td>${device.serialNumber}</td>
                    <td class="active"><strong>投运日期</strong></td>
                    <td><fmt:formatDate value="${device.useDate}" pattern="yyyy年MM月dd日"/></td>
                </tr>
            </table>
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
    <%--</div>--%>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>