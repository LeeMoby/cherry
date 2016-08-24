<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="margin-top: 30px">
    <form id="dm_form_query" class="form-inline">
        <div class="row">
            月报
        </div>
    </form>
</div>



<script type="text/javascript">
    //以Excel格式,导出全部数据
    function dm_exportExcel() {
        window.location.href = "/document/monthly/export";
    }



</script>