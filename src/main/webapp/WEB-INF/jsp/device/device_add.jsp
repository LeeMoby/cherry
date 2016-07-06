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

    <title>新增资产设备</title>

    <%@include file="../common/head.jsp" %>
    <style type="text/css">
        #scrollable-dropdown-menu .tt-dropdown-menu {
            max-height: 150px;
            overflow-y: auto;
        }
    </style>
</head>

<body>

<div class="container-fluid" style="width: 1000px">
    <div class="row">
        <div class="col-md-8">
            <h2>
                新增资产设备
                <small>标*的为必填项</small>
            </h2>
        </div>
        <div class="col-md-3 col-md-offset-1" style="margin-top: 25px; padding-left: 90px;">
            <button type="button" class="btn btn-primary" onclick="submitForm()">保&nbsp;&nbsp;存</button>
            <button type="button" class="btn btn-default" onclick="closeWindow()">取&nbsp;&nbsp;消</button>
        </div>
    </div>
    <br>
    <%--<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">--%>
    <div class="panel panel-primary">
        <div class="panel-heading" role="tab" id="headDetail">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseDetail"
                   aria-expanded="true" aria-controls="collapseDetail">
                    基本信息
                </a>
            </h4>
        </div>
        <div id="collapseDetail" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headDetail">
            <div class="panel-body">
                <form class="form-inline">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="dno">设备编号: </label>
                            <input type="text" class="form-control" id="dno" name="dno" placeholder="请输入设备编号">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dcode">资产编号: </label>
                            <input type="text" class="form-control" id="dcode" name="dcode" placeholder="请输入资产编号">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dname">设备名称: </label>
                            <input type="text" class="form-control" id="dname" name="dname" placeholder="请输入设备名称">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="cno">设备位置: </label>
                            <input type="text" data-provide="typeahead" class="form-control" id="cno"
                                   placeholder="请输入机柜编号" autocomplete="off">
                            <input type="hidden" class="form-control" id="cid" name="cid">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dplace">机柜位置: </label>
                            <input type="text" class="form-control" id="dplace" name="dplace" placeholder="请输入机柜位置">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="department">运维单位: </label>
                            <input type="text" class="form-control" id="department" name="department" placeholder="请输入运维单位">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="person">责&nbsp;&nbsp;任&nbsp;&nbsp;人: </label>
                            <input type="text" class="form-control" id="person" name="person" placeholder="请输入责任人">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading" role="tab" id="headExt">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseExt"
                   aria-expanded="true" aria-controls="collapseExt">
                    扩展信息
                </a>
            </h4>
        </div>
        <div id="collapseExt" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headExt">
            <div class="panel-body">
                <form class="form-inline">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="dno">设备型号: </label>
                            <input type="text" class="form-control" id="dmodel" name="dmodel" placeholder="请输入设备型号">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dcode">所属网络: </label>
                            <input type="text" class="form-control" id="nettype" name="nettype" placeholder="请输入所属网络">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dname">&nbsp;&nbsp;IP&nbsp;&nbsp;地址: </label>
                            <input type="text" class="form-control" id="dip" name="dip" placeholder="请输入IP地址">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="cno">设备状态: </label>
                            <input type="text" class="form-control" id="dstatus" name="dstatus" placeholder="请输入设备状态">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="dplace">序&nbsp;&nbsp;列&nbsp;&nbsp;号: </label>
                            <input type="text" class="form-control" id="serialNumber" name="serialNumber" placeholder="请输入序列号">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="department">投运日期: </label>
                            <input type="text" class="form-control" id="useDate" name="useDate" placeholder="请输入投运日期">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-heading" role="tab" id="headOverhaul">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOverhaul"
                   aria-expanded="true" aria-controls="collapseOverhaul">
                    检修记录
                </a>
            </h4>
        </div>
        <div id="collapseOverhaul" class="panel-collapse collapse in" role="tabpanel"
             aria-labelledby="headOverhaul">
            <div class="panel-body">
                <p>...</p>
            </div>
        </div>
    </div>
    <div class="panel panel-warning">
        <div class="panel-heading" role="tab" id="headFault">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFault"
                   aria-expanded="true" aria-controls="collapseFault">
                    故障记录
                </a>
            </h4>
        </div>
        <div id="collapseFault" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headFault">
            <div class="panel-body">
                <p>...</p>
            </div>
        </div>
    </div>
    <div class="panel panel-danger">
        <div class="panel-heading" role="tab" id="headDefect">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseDefect"
                   aria-expanded="true" aria-controls="collapseDefect">
                    隐患记录
                </a>
            </h4>
        </div>
        <div id="collapseDefect" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headDefect">
            <div class="panel-body">
                <p>...</p>
            </div>
        </div>
    </div>
    <%--</div>--%>
</div>
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
    function submitForm(){
        var theForm = document.forms[0];
        // 检查表单

        // 提交表单
        theForm.action = "/device/save";
        theForm.method = "post";
        theForm.submit();
    }
    function closeWindow(){
        if(confirm("关闭该页面,数据将不会保存,是否关闭?")){
            window.close();
        }
    }
    //    var substringMatcher = function (strs) {
    //        return function findMatches(q, cb) {
    //            var matches, substringRegex;
    //
    //            // an array that will be populated with substring matches
    //            matches = [];
    //
    //            // regex used to determine if a string contains the substring `q`
    //            substrRegex = new RegExp(q, 'i');
    //
    //            // iterate through the pool of strings and for any string that
    //            // contains the substring `q`, add it to the `matches` array
    //            $.each(strs, function (i, str) {
    //                if (substrRegex.test(str)) {
    //                    matches.push(str);
    //                }
    //            });
    //
    //            cb(matches);
    //        };
    //    };
    //
    //    var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
    //        'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
    //        'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
    //        'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
    //        'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
    //        'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
    //        'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
    //        'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
    //        'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    //    ];
    //
    //    $('#cno').typeahead({
    //                hint: true,
    //                highlight: true,
    //                minLength: 1
    //            },
    //            {
    //                name: 'states',
    //                source: substringMatcher(states)
    //            });
    //    // 自动完成控件-机柜
    //    $('#cno').typeahead({
    //        source: function (query, process) {
    //            return $.ajax({
    //                url: '/cabinet/list',
    //                type: 'get',
    //                data: {cno: query},
    //                dataType: 'json',
    //                success: function (result) {
    //                    // 这里的数据解析根据后台传入格式的不同而不同
    //                    if(result.code == "1") {
    //                        var json = JSON.parse(result.data.data);
    //                        var resultList = json.list.map(function (item) {
    //                            var aItem = { id: item.cid, name: item.cno };
    //                            return JSON.stringify(aItem);
    //                        });
    //                        return process(resultList);
    //                    } else {
    //                        alert(result.msg);
    //                    }
    //                }
    //            });
    //        },
    //        matcher: function (obj) {
    //            var item = JSON.parse(obj);
    //            return ~item.name.toLowerCase().indexOf(this.query.toLowerCase())
    //        },
    //
    //        sorter: function (items) {
    //            var beginswith = [], caseSensitive = [], caseInsensitive = [], item;
    //            while (aItem = items.shift()) {
    //                var item = JSON.parse(aItem);
    //                if (!item.name.toLowerCase().indexOf(this.query.toLowerCase()))
    //                    beginswith.push(JSON.stringify(item));
    //                else if (~item.name.indexOf(this.query)) caseSensitive.push(JSON.stringify(item));
    //                else caseInsensitive.push(JSON.stringify(item));
    //            }
    //
    //            return beginswith.concat(caseSensitive, caseInsensitive)
    //
    //        },
    //
    //        highlighter: function (obj) {
    //            var item = JSON.parse(obj);
    //            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
    //            return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
    //                return '<strong>' + match + '</strong>'
    //            })
    //        },
    //
    //        updater: function (obj) {
    //            var item = JSON.parse(obj);
    //            $('#cid').attr('value', item.id);
    //            return item.name;
    //        }
    //
    //    })
</script>

</body>
</html>