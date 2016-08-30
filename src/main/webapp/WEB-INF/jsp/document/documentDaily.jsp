<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="margin-top: 30px">
    <form id="dd_form" class="form-inline">
        <div class="page-header">
            <h2>网络安全及支撑系统组工作日报
                <small>${nowDate}&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" id="btn_exportDaily" onclick="exportDaily()">生成日报</button></small>
            </h2>
        </div>
        <h3>今日重点工作完成情况</h3>
        <div class="row">
            <table id="tableDaily"></table>
        </div>
        <h3>明日重点工作计划安排</h3>
        <div class="row">
            <table id="tableDailyNext"></table>
        </div>


    </form>
</div>

<script type="text/javascript">
    // 导出日报
    function exportDaily() {
//        window.location.href = "/document/export";
        var theForm = document.getElementById("dd_form");
        theForm.action = "/document/export";
        theForm.method = "post";
        theForm.submit();
    }


</script>
