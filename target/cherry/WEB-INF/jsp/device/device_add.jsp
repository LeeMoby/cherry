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

<div class="container-fluid" style="width: 800px">
    <h2>
        新增资产设备
        <small>标*的为必填项</small>
    </h2>
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
                <div class="form-group">
                    <label for="cno">设备位置: </label>
                    <input type="text" data-provide="typeahead" class="form-control" id="cno" placeholder="请输入机柜号码" autocomplete="off">
                    <input type="hidden" class="form-control" id="cid">
                </div>
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
                ...
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
    // 自动完成控件-机柜
    $('#cno').typeahead({
        source: function (query, process) {
            return $.ajax({
                url: '/showoff/watermark/fetchTopics',
                type: 'post',
                data: {topicName: query},
                dataType: 'json',
                success: function (result) {
                    // 这里的数据解析根据后台传入格式的不同而不同
                    if(result.code == "1") {
                        var json = JSON.parse(result.data.data);
                        var resultList = json.topicList.map(function (item) {
                            var aItem = { id: item.id, name: item.displayName };
                            return JSON.stringify(aItem);
                        });
                        return process(resultList);
                    } else {
                        alert(result.msg);
                    }
                }
            });
        },
        matcher: function (obj) {
            var item = JSON.parse(obj);
            return ~item.name.toLowerCase().indexOf(this.query.toLowerCase())
        },

        sorter: function (items) {
            var beginswith = [], caseSensitive = [], caseInsensitive = [], item;
            while (aItem = items.shift()) {
                var item = JSON.parse(aItem);
                if (!item.name.toLowerCase().indexOf(this.query.toLowerCase()))
                    beginswith.push(JSON.stringify(item));
                else if (~item.name.indexOf(this.query)) caseSensitive.push(JSON.stringify(item));
                else caseInsensitive.push(JSON.stringify(item));
            }

            return beginswith.concat(caseSensitive, caseInsensitive)

        },

        highlighter: function (obj) {
            var item = JSON.parse(obj);
            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
            return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                return '<strong>' + match + '</strong>'
            })
        },

        updater: function (obj) {
            var item = JSON.parse(obj);
            $('#cid').attr('value', item.id);
            return item.name;
        }

    })
</script>

</body>
</html>