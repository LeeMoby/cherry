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
            <!-- 选项卡组件（菜单项nav-tabs）-->
            <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#server" role="tab" data-toggle="tab">服务器</a></li>
                <li><a href="#storage" role="tab" data-toggle="tab">存储</a></li>
                <li><a href="#network" role="tab" data-toggle="tab">网络</a></li>
                <li><a href="#safety" role="tab" data-toggle="tab">安全</a></li>
                <li><a href="#multimedia" role="tab" data-toggle="tab">音视频</a></li>
                <li><a href="#other" role="tab" data-toggle="tab">其他</a></li>
            </ul>
            <!-- 选项卡面板 -->
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="server">服务器设备</div>
                <div class="tab-pane fade" id="storage">存储设备</div>
                <div class="tab-pane fade" id="network">网络设备</div>
                <div class="tab-pane fade" id="safety">安全设备</div>
                <div class="tab-pane fade" id="multimedia">音视频设备</div>
                <div class="tab-pane fade" id="other">其他设备</div>
            </div>
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
                var msg = "删除" + (data > 0? "成功" : "失败") + "。已删除" + data + "条记录。";
                alert(msg);
            }, 'json');
        }else{
            alert("请选择要删除的记录。");
        }

    }
</script>

</body>
</html>