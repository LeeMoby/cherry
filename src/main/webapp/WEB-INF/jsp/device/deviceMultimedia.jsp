<div class="container-fluid">
    <form class="form-inline">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="deviceType">设备类型: </label>
                        <select id="deviceType" class="form-control">
                            <c:forEach var="deviceType" items="${deviceTypeList}">
                                <option value="${deviceType.dtid}">${deviceType.dtname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="dno">设备编号: </label>
                    <input type="text" class="form-control" id="dno" placeholder="请输入设备编号">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="person">责任人: </label>
                    <input type="text" class="form-control" id="person" placeholder="请输入责任人">
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <div class="dropdown">
                        <label for="roomid">所在机房: </label>
                        <select id="roomid" class="form-control">
                            <c:forEach var="room" items="${roomList}">
                                <option value="${room.rid}">${room.rname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="department">运维部门: </label>
                    <input type="text" class="form-control" id="department" placeholder="请输入部门">
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
    <button class="btn btn-danger" type="button" onclick="batchDelete()">删除</button>
    <button class="btn btn-info" type="button" onclick="exportExcel()">导出</button>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-striped table-hover" style="width: 1500px;">
        <thead>
        <tr class="info">
            <th>
                <input type="checkbox" id="cbtn_all">
            </th>
            <th>编号</th>
            <th>名称</th>
            <th>位置</th>
            <th>责任人</th>
            <th>投运日期</th>
            <th>型号</th>
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
            <c:forEach var="device" items="${list}">
                <tr>
                    <td>
                        <input type="checkbox" name="cbtn_id" value="${device.did}">
                    </td>
                    <td><a href="/device/${device.did}/detail" target="_blank">${device.dno}</a></td>
                    <td>${device.dname}</td>
                    <td>${device.cabinet.cno} ${device.dplace}</td>
                    <td>${device.person}</td>
                    <td><fmt:formatDate value="${device.useDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${device.dmodel}</td>
                    <td>${device.nettype}</td>
                    <td>${device.dmodel}</td>
                    <td>${device.dcode}</td>
                    <td>${device.dip}</td>
                    <td>${device.dstatus}</td>
                    <td>${device.serialNumber}</td>
                </tr>
            </c:forEach>
        </form>
        </tbody>
    </table>

</div>
<nav>
    <ul class="pagination">
        <li class="disabled">
            <a href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li>
            <a href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>