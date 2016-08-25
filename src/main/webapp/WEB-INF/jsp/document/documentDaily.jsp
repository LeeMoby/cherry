<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="margin-top: 30px">
    <form id="dd_form" class="form-inline">
        <div class="page-header">
            <h2>网络安全及支撑系统组工作日报
                <small>${nowDate}&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" id="btn_exportDaily" onclick="exportDaily()">生成日报</button></small>
            </h2>
        </div>

        <div class="container-fluid">
            <table id="table"></table>
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
