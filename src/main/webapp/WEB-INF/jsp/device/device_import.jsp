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

    <title>导入设备信息</title>

    <%@include file="../common/head.jsp" %>

</head>

<body>
<div class="container-fluid" style="width: 600px">
    <h2>导入设备信息</h2>
    <p>
    <dl>
        <dt>
            导入步骤:
        </dt>
        <dd>
            <ol>
                <li>下载导入模板;</li>
                <li>根据模板格式,在Excel中插入/编辑需要导入的数据;</li>
                <li>将编辑好的文件上传到服务器,完成导入。</li>
            </ol>
        </dd>
    </dl>

    </p>
    <div class="row">
        <div class="col-md-12">请先下载导入模板: <a href="/template/设备导入模板.xls"><span
                class="glyphicon glyphicon-save-file" aria-hidden="true"></span>设备导入模板.xls</a></div>
    </div>
    <br>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="exampleInputFile">请上传包含数据的Excel文件:</label>
                        <input type="file" id="exampleInputFile">
                        <p class="help-block">请务必保持模板的列顺序及格式一致。</p>
                    </div>
                </div>
            </div>
            <br>
            <div class="form-group">
                <button type="submit" class="btn btn-default">提交</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">

</script>
</body>
</html>