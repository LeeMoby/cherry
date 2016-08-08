<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="margin-top: 30px">
    <form id="dst_form_query" class="form-inline">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="dst_name">名称: </label>
                        <input type="text" class="form-control" id="dst_name" name="name" value="<c:out value="${deviceStorage.name}"/>" placeholder="请输入设备名称">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dst_code">编号: </label>
                    <input type="text" class="form-control" id="dst_code" name="code" value="<c:out value="${deviceStorage.code}"/>" placeholder="请输入设备编号">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dst_ipAddress"> IP: </label>
                    <input type="text" class="form-control" id="dst_ipAddress" name="ipAddress" value="<c:out value="${deviceStorage.ipAddress}"/>" placeholder="请输入IP地址">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="dst_brand">品牌: </label>
                        <input type="text" class="form-control" id="dst_brand" name="brand" value="<c:out value="${deviceStorage.brand}"/>" placeholder="请输入设备品牌">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dst_roomid">机房: </label>
                    <select id="dst_roomid" name="roomId" class="form-control">
                        <option value="">全部</option>
                        <c:forEach var="room" items="${roomList}">
                            <option value="${room.id}" <c:if test="${deviceStorage.roomId == room.id}">selected</c:if>>${room.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <button type="button" class="btn btn-primary" onclick="dst_query()"> &nbsp;&nbsp;&nbsp;查&nbsp;&nbsp;&nbsp;询&nbsp;&nbsp;&nbsp;</button>
                </div>
            </div>
        </div>
    </form>
</div>
<br><br>
<div class="text-right" style="margin-bottom: 5px">
    <a class="btn btn-info" href="/device/storage/add" target="_blank" role="button">新增</a>
    <button class="btn btn-info" type="button">修改</button>
    <button class="btn btn-danger" type="button" onclick="dst_batchDelete()">删除</button>
    <button class="btn btn-info" type="button" onclick="dst_exportExcel()">导出</button>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-striped table-hover" style="width: 1500px;">
        <thead>
        <tr class="info">
            <th>
                <input type="checkbox" id="cbtn_dst_all" onclick="dst_allchkbtn()">
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
            <c:forEach var="device" items="${deviceStorageList}">
                <tr>
                    <td>
                        <input type="checkbox" name="cbtn_dst_id" value="${device.id}" onclick="dst_allchk()">
                    </td>
                    <td><a href="/device/${device.id}/detail" target="_blank">${device.code}</a></td>
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

<script type="text/javascript">
    //以Excel格式,导出全部数据
    function dst_exportExcel() {
        window.location.href = "/device/storage/export";
    }

    function dst_query(){
        var theForm = document.getElementById("dst_form_query");
        theForm.action = "/device/storage/query";
        theForm.method = "post";
        theForm.submit();
    }
    // 全选复选框,控制ID复选框
    //    $(function () {
    //        $('#cbtn_all').click(function () {
    //            if (this..prop("checked") == true) {
    //                $(':checkbox[name="cbtn_id"]').prop("checked", true);
    //            } else {
    //                $(':checkbox[name="cbtn_id"]').prop("checked", false);
    //            }
    //        });
    //
    //        $(':checkbox[name="cbtn_id"]').click(function () {
    //            allchk();
    //
    //        })
    //    });
    function dst_allchkbtn() {
        if ($('#cbtn_dst_all').prop("checked") == true) {
            $(':checkbox[name="cbtn_dst_id"]').prop("checked", true);
        } else {
            $(':checkbox[name="cbtn_dst_id"]').prop("checked", false);
        }

    }
    //ID复选框,控制全选复选框
    function dst_allchk() {
        var cb_total = $(':checkbox[name="cbtn_dst_id"]').size();
        var cb_num = 0;
        $(':checkbox[name="cbtn_dst_id"]').each(function () {
            if ($(this).prop("checked") == true) {
                cb_num++;
            }
        });
        if (cb_total == cb_num) {
            $('#cbtn_dst_all').prop("checked", true);
        } else {
            $('#cbtn_dst_all').prop("checked", false);
        }
    }
    // 批量删除
    function dst_batchDelete() {
        var IDs = new Array();
        $(':checkbox[name="cbtn_dst_id"]').each(function () {
            if ($(this).prop("checked") == true) {
                IDs.push($(this).val());
            }
        });
        if (IDs.length > 0) {
            var indata = {deviceIDs: IDs};
            $.post("/device/storage/delete", indata, function (data) {
                var msg = "删除" + (data > 0 ? "成功" : "失败") + "。已删除" + data + "条记录。";
                alert(msg);

            }, 'json');
            window.location.reload();
        } else {
            alert("请选择要删除的记录。");
        }

    }
</script>