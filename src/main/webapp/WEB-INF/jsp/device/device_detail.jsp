<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0041)http://localhost:8080/cherry/home/ -->
<html lang="UTF-8">
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
                ${device.name}

                <small>${device.deviceType.name}</small>
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
                        <label>设备类型: </label>
                        ${device.deviceType.name}

                    </div>
                    <div class="form-group col-md-4">
                        <label>设备名称: </label>
                        ${device.name}
                    </div>
                    <div class="form-group col-md-4">
                        <label>设备编号: </label>
                        ${device.code}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>国网编号: </label>
                        ${device.codeSgcc}
                    </div>
                    <div class="form-group col-md-4">
                        <label>设备用途: </label>
                        ${device.use}
                    </div>
                    <div class="form-group col-md-4">
                        <label>投运日期: </label>
                        <fmt:formatDate value="${device.useDate}" pattern="yyyy-MM-dd"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>设备状态: </label>
                        ${device.status}
                    </div>
                    <div class="form-group col-md-4">
                        <label>所属网络: </label>
                        ${device.network}
                    </div>
                    <div class="form-group col-md-4">
                        <label>&nbsp;&nbsp;IP&nbsp;&nbsp;地址: </label>
                        ${device.ipAddress}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>管理部门: </label>
                        ${device.department.name}
                    </div>
                    <div class="form-group col-md-4">
                        <label>责&nbsp;&nbsp;任&nbsp;&nbsp;人: </label>
                        ${device.employee.name}
                    </div>
                    <div class="form-group col-md-4">
                        <label>联系电话: </label>
                        ${device.mgtPhone}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>所在机房: </label>
                        ${device.room.id}
                    </div>
                    <div class="form-group col-md-4">
                        <label>所在机柜:&nbsp;</label>
                        ${device.cabinet.name}
                    </div>
                    <div class="form-group col-md-4">
                        <label>柜内位置: </label>
                        ${device.cabinetPosition}
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
                        <label">采购方式: </label>
                        ${device.purchaseMethod}
                    </div>
                    <div class="form-group col-md-4">
                        <label>制&nbsp;&nbsp;造&nbsp;&nbsp;商: </label>
                        ${device.manufacturer}
                    </div>
                    <div class="form-group col-md-4">
                        <label>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌: </label>
                        ${device.brand}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>系&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;列: </label>
                        ${device.series}
                    </div>
                    <div class="form-group col-md-4">
                        <label>型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号: </label>
                        ${device.model}
                    </div>
                    <div class="form-group col-md-4">
                        <label>序&nbsp;&nbsp;列&nbsp;&nbsp;号: </label>
                        ${device.serialNumber}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>出厂日期: </label>
                        <fmt:formatDate value="${device.manufactureDate}" pattern="yyyy-MM-dd"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label>运维厂商: </label>
                        ${device.maintenanceSupplier}
                    </div>
                    <div class="form-group col-md-4">
                        <label>售后截止: </label>
                        <fmt:formatDate value="${device.serviceExpiryDate}" pattern="yyyy-MM-dd"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>维保开始: </label>
                        <fmt:formatDate value="${device.maintenanceDateStart}" pattern="yyyy-MM-dd"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label>维保结束: </label>
                        <fmt:formatDate value="${device.maintenanceDateEnd}" pattern="yyyy-MM-dd"/>
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
    <%--</div>--%>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>