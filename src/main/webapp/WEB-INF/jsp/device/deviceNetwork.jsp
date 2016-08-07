<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="margin-top: 30px">
    <form class="form-inline">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="dn_name">设备名称: </label>
                        <input type="text" class="form-control" id="dn_name" placeholder="请输入设备名称">
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dn_code">设备编号: </label>
                    <input type="text" class="form-control" id="dn_code" placeholder="请输入设备编号">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dn_emp">责任人: </label>
                    <input type="text" class="form-control" id="dn_emp" placeholder="请输入责任人">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="dn_roomid">所在机房: </label>
                        <select id="dn_roomid" class="form-control">
                            <c:forEach var="room" items="${roomList}">
                                <option value="${room.id}">${room.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dn_dept">运维部门: </label>
                    <input type="text" class="form-control" id="dn_dept" placeholder="请输入部门">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <button type="button" class="btn btn-primary"> &nbsp;&nbsp;&nbsp;查&nbsp;&nbsp;&nbsp;询&nbsp;&nbsp;&nbsp;</button>
                </div>
            </div>
        </div>
    </form>
</div>
<br><br>
<div class="text-right" style="margin-bottom: 5px">
    <a class="btn btn-info" href="/device/add" target="_blank" role="button">新增</a>
    <button class="btn btn-info" type="button">修改</button>
    <button class="btn btn-danger" type="button" onclick="dn_batchDelete()">删除</button>
    <button class="btn btn-info" type="button" onclick="dn_exportExcel()">导出</button>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-striped table-hover" style="width: 1500px;">
        <thead>
        <tr class="info">
            <th>
                <input type="checkbox" id="cbtn_dn_all" onclick="dn_allchkbtn()">
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
            <c:forEach var="device" items="${deviceNetworkList}">
                <tr>
                    <td>
                        <input type="checkbox" name="cbtn_dn_id" value="${device.id}" onclick="dn_allchk()">
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
    function dn_exportExcel() {
        window.open("/device/exportExcel4All", "_blank", "width=300px, height=200px, menubar=no, scrollbar=no");
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
    function dn_allchkbtn(){
        if ($('#cbtn_dn_all').prop("checked") == true) {
            $(':checkbox[name="cbtn_dn_id"]').prop("checked", true);
        } else {
            $(':checkbox[name="cbtn_dn_id"]').prop("checked", false);
        }

    }
    //ID复选框,控制全选复选框
    function dn_allchk() {
        var cb_total = $(':checkbox[name="cbtn_dn_id"]').size();
        var cb_num = 0;
        $(':checkbox[name="cbtn_dn_id"]').each(function () {
            if ($(this).prop("checked") == true) {
                cb_num++;
            }
        });
        if (cb_total == cb_num) {
            $('#cbtn_dn_all').prop("checked", true);
        } else {
            $('#cbtn_dn_all').prop("checked", false);
        }
    }
    // 批量删除
    function dn_batchDelete() {
        var IDs = new Array();
        $(':checkbox[name="cbtn_dn_id"]').each(function () {
            if ($(this).prop("checked") == true) {
                IDs.push($(this).val());
            }
        });
        if (IDs.length > 0) {
            var indata = {deviceIDs: IDs};
            $.post("/device/delete", indata, function (data) {
                var msg = "删除" + (data > 0 ? "成功" : "失败") + "。已删除" + data + "条记录。";
                alert(msg);
            }, 'json');
        } else {
            alert("请选择要删除的记录。");
        }

    }
</script>