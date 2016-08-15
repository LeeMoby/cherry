<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="margin-top: 30px">
    <form id="dm_form_query" class="form-inline">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="dm_name">名称: </label>
                        <input type="text" class="form-control" id="dm_name" name="name"
                               value="<c:out value="${deviceMultimedia.name}"/>" placeholder="请输入设备名称">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dm_code">编号: </label>
                    <input type="text" class="form-control" id="dm_code" name="code"
                           value="<c:out value="${deviceMultimedia.code}"/>" placeholder="请输入设备编号">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dm_ipAddress"> IP: </label>
                    <input type="text" class="form-control" id="dm_ipAddress" name="ipAddress"
                           value="<c:out value="${deviceMultimedia.ipAddress}"/>" placeholder="请输入IP地址">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="dm_brand">品牌: </label>
                        <input type="text" class="form-control" id="dm_brand" name="brand"
                               value="<c:out value="${deviceMultimedia.brand}"/>" placeholder="请输入设备品牌">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dm_roomid">机房: </label>
                    <select id="dm_roomid" name="roomId" class="form-control">
                        <option value="">全部</option>
                        <c:forEach var="room" items="${roomList}">
                            <option value="${room.id}"
                                    <c:if test="${deviceMultimedia.roomId == room.id}">selected</c:if>>${room.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <button type="button" class="btn btn-primary" onclick="dm_query()"> &nbsp;&nbsp;&nbsp;查&nbsp;&nbsp;&nbsp;询&nbsp;&nbsp;&nbsp;</button>
                </div>
            </div>
        </div>
    </form>
</div>
<br><br>
<div class="text-right" style="margin-bottom: 5px">
    <a class="btn btn-info" href="/device/multimedia/add" target="_blank" role="button">新增</a>
    <button class="btn btn-info" type="button">修改</button>
    <button class="btn btn-danger" type="button" onclick="dm_batchDelete()">删除</button>
    <button class="btn btn-info" type="button" data-toggle="modal" data-target="#dm_importModal">导入</button>
    <button class="btn btn-info" type="button" onclick="dm_exportExcel()">导出</button>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-striped table-hover" style="width: 1500px;">
        <thead>
        <tr class="info">
            <th>
                <input type="checkbox" id="cbtn_dm_all" onclick="dm_allchkbtn()">
            </th>
            <th>编号</th>
            <th>名称</th>
            <th>位置</th>
            <th>责任人</th>
            <th>投运日期</th>
            <th>品牌</th>
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
            <c:forEach var="device" items="${deviceMultimediaList}">
                <tr>
                    <td>
                        <input type="checkbox" name="cbtn_dm_id" value="${device.id}" onclick="dm_allchk()">
                    </td>
                    <td><a href="/device/multimedia/${device.id}/detail" target="_blank">${device.code}</a></td>
                    <td>${device.name}</td>
                    <td>${device.cabinet.name} ${device.cabinetPosition}</td>
                    <td>${device.employee.name}</td>
                    <td><fmt:formatDate value="${device.useDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${device.brand}</td>
                    <td>${device.network}</td>
                    <td>${device.model}</td>
                    <td>${device.codeSgcc}</td>
                    <td>${device.ipAddress}</td>
                    <td>${device.status}</td>
                    <td>${device.serialNumber}</td>
                </tr>
            </c:forEach>
        </form>
        </tbody>
    </table>

</div>


<%--<nav>--%>
<%--<ul class="pagination">--%>
<%--<li class="disabled">--%>
<%--<a href="#" aria-label="Previous">--%>
<%--<span aria-hidden="true">&laquo;</span>--%>
<%--</a>--%>
<%--</li>--%>
<%--<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>--%>
<%--<li><a href="#">2</a></li>--%>
<%--<li><a href="#">3</a></li>--%>
<%--<li><a href="#">4</a></li>--%>
<%--<li><a href="#">5</a></li>--%>
<%--<li>--%>
<%--<a href="#" aria-label="Next">--%>
<%--<span aria-hidden="true">&raquo;</span>--%>
<%--</a>--%>
<%--</li>--%>
<%--</ul>--%>
<%--</nav>--%>
<div id="dm_importModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">导入设备信息</h4>
            </div>
            <div class="modal-body">
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
                                    <label for="btn_inputFile">请上传包含数据的Excel文件:</label>
                                    <input type="file" name="btn_inputFile" id="btn_inputFile" multiple class="file" data-preview-file-type="text">
                                    <p class="help-block">请务必保持模板的列顺序及格式一致。</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">导入</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
    //以Excel格式,导出全部数据
    function dm_exportExcel() {
        window.location.href = "/device/multimedia/export";
    }

    function dm_query() {
        var theForm = document.getElementById("dm_form_query");
        theForm.action = "/device/multimedia/query";
        theForm.method = "post";
        theForm.submit();
    }

    // 全选按钮
    function dm_allchkbtn() {
        if ($('#cbtn_dm_all').prop("checked") == true) {
            $(':checkbox[name="cbtn_dm_id"]').prop("checked", true);
        } else {
            $(':checkbox[name="cbtn_dm_id"]').prop("checked", false);
        }

    }
    //ID复选框,控制全选复选框
    function dm_allchk() {
        var cb_total = $(':checkbox[name="cbtn_dm_id"]').size();
        var cb_num = 0;
        $(':checkbox[name="cbtn_dm_id"]').each(function () {
            if ($(this).prop("checked") == true) {
                cb_num++;
            }
        });
        if (cb_total == cb_num) {
            $('#cbtn_dm_all').prop("checked", true);
        } else {
            $('#cbtn_dm_all').prop("checked", false);
        }
    }
    // 批量删除
    function dm_batchDelete() {
        var IDs = new Array();
        $(':checkbox[name="cbtn_dm_id"]').each(function () {
            if ($(this).prop("checked") == true) {
                IDs.push($(this).val());
            }
        });
        if (IDs.length > 0) {
            var indata = {deviceIDs: IDs};
            $.post("/device/multimedia/delete", indata, function (data) {
                var msg = "删除" + (data > 0 ? "成功" : "失败") + "。已删除" + data + "条记录。";
                alert(msg);

            }, 'json');
            window.location.reload();
        } else {
            alert("请选择要删除的记录。");
        }

    }

    $(function () {
        //0.初始化fileinput
        var oFileInput = new FileInput();
        oFileInput.Init("btn_inputFile", "/device/multimedia/upload");
    });

    //初始化fileinput
    var FileInput = function () {
        var oFile = new Object();

        //初始化fileinput控件（第一次初始化）
        oFile.Init = function (ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            //初始化上传控件的样式
            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['xls', 'xlsx'],//接收的文件后缀
                showUpload: true, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                //dropZoneEnabled: false,//是否显示拖拽区域
                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                //minFileCount: 0,
                maxFileCount: 5, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount: true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！"
            });

            //导入文件上传完成之后的事件
            $("#btn_inputFile").on("fileuploaded", function (event, data, previewId, index) {
                $("#myModal").modal("hide");
                var data = data.response.lstOrderImport;
                if (data == undefined) {
                    toastr.error('文件格式类型不正确');
                    return;
                }
//                //1.初始化表格
//                var oTable = new TableInit();
//                oTable.Init(data);
//                $("#div_startimport").show();
            });
        };
        return oFile;
    };

</script>