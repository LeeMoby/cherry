<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0041) -->
<html lang="UTF-8">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/images/cherry-32x32.png">

    <title>Cherry</title>
    <%@include file="/WEB-INF/jsp/common/head.jsp" %>
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
            <a class="navbar-brand" href="#">云间一石</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">导航</a></li>
                <li><a href="#">皮肤</a></li>
                <li><a href="#">用户</a></li>
                <li><a href="#">帮助</a></li>
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
                <li><a href="#">首页</a>
                </li>
                <li><a href="#">报表</a></li>
                <li><a href="#">分析</a></li>
                <li><a href="#">导出</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">机房巡视</a></li>
                <li><a href="">班组资料</a></li>
                <li class="active"><a href="/document/home/">工作日志<span
                        class="sr-only">(current)</span></a></li>
                <li><a href="">库房管理</a></li>
                <li><a href="/device/home/">资产设备</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="#">系统配置</a></li>
                <li><a href="#">偏好设置</a></li>
                <li><a href="#">关于</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <!-- <h1 class="page-header">资产设备</h1> -->

            <!-- 选项卡组件（菜单项nav-tabs）-->
            <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li <c:if test="${activeTab == 'index'}">class="active"</c:if>><a href="#index" role="tab"
                                                                                  data-toggle="tab">首页</a></li>
                <li <c:if test="${activeTab == '日报'}">class="active"</c:if>><a href="#server" role="tab"
                                                                                data-toggle="tab">日报</a></li>
                <li <c:if test="${activeTab == '周报'}">class="active"</c:if>><a href="#storage" role="tab"
                                                                               data-toggle="tab">周报</a></li>
                <li <c:if test="${activeTab == '月报'}">class="active"</c:if>><a href="#network" role="tab"
                                                                               data-toggle="tab">月报</a></li>
                <li <c:if test="${activeTab == '其他'}">class="active"</c:if>><a href="#safety" role="tab"
                                                                               data-toggle="tab">其他</a></li>
            </ul>
            <!-- 选项卡面板 -->
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade <c:if test="${activeTab == 'index'}">in active</c:if>" id="index">
                    <h3>概要</h3>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '日报'}">in active</c:if>" id="server">
                    <%@include file="documentDaily.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '周报'}">in active</c:if>" id="storage">
                    <%@include file="documentWeekly.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '月报'}">in active</c:if>" id="network">
                    <%@include file="documentMonthly.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '其他'}">in active</c:if>" id="safety">
                    <%@include file="documentOther.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/footer.jsp" %>
<script type="text/javascript">

</script>
</body>
</html>