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
                    <label for="cid">设备位置: </label>
                    <input type="text" data-provide="typeahead" class="form-control" id="cid" placeholder="请输入设备位置" autocomplete="off">
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
    var substringMatcher = function(strs) {
        return function findMatches(q, cb) {
            var matches, substringRegex;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function(i, str) {
                if (substrRegex.test(str)) {
                    matches.push(str);
                }
            });

            cb(matches);
        };
    };

    var states = ['22AA', '22AB', '22AC', '22AD', '22AE',
        '22AF', '22AG', '22AH', '22AI', '22AJ', '22AK',
        '22BA', '22BB', '22BC', '22BD', '22BE',
        '22BF', '22BG', '22BH', '22BI', '22BJ', '22BK',
        '22CA', '22CB', '22CC', '22CD', '22CE',
        '22CF', '22CG', '22CH', '22CI', '22CJ', '22CK',
        '22DA', '22DB', '22DC', '22DD', '22DE',
        '22DF', '22DG', '22DH', '22DI', '22DJ', '22DK',
        '22EA', '22EB', '22EC', '22ED', '22EE',
        '22EF', '22EG', '22EH', '22EI', '22EJ', '22EK',
        '22FA', '22FB', '22FC', '22FD', '22FE',
        '22FF', '22FG', '22FH', '22FI', '22FJ', '22FK',
        '21AA', '21AB', '21AC', '21AD', '21AE',
        '21AF', '21AG', '21AH', '21AI', '21AJ', '21AK',
        '21BA', '21BB', '21BC', '21BD', '21BE',
        '21BF', '21BG', '21BH', '21BI', '21BJ', '21BK',
        '21CA', '21CB', '21CC', '21CD', '21CE',
        '21CF', '21CG', '21CH', '21CI', '21CJ', '21CK',
        '21DA', '21DB', '21DC', '21DD', '21DE',
        '21DF', '21DG', '21DH', '21DI', '21DJ', '21DK',
        '21EA', '21EB', '21EC', '21ED', '21EE',
        '21EF', '21EG', '21EH', '21EI', '21EJ', '21EK',
        '21FA', '21FB', '21FC', '21FD', '21FE',
        '21FF', '21FG', '21FH', '21FI', '21FJ', '21FK',
        '12AA', '12AB', '12AC', '12AD', '12AE',
        '12AF', '12AG', '12AH', '12AI', '12AJ', '12AK',
        '12BA', '12BB', '12BC', '12BD', '12BE',
        '12BF', '12BG', '12BH', '12BI', '12BJ', '12BK',
        '12CA', '12CB', '12CC', '12CD', '12CE',
        '12CF', '12CG', '12CH', '12CI', '12CJ', '12CK',
        '12DA', '12DB', '12DC', '12DD', '12DE',
        '12DF', '12DG', '12DH', '12DI', '12DJ', '12DK',
        '12EA', '12EB', '12EC', '12ED', '12EE',
        '12EF', '12EG', '12EH', '12EI', '12EJ', '12EK',
        '12FA', '12FB', '12FC', '12FD', '12FE',
        '12FF', '12FG', '12FH', '12FI', '12FJ', '12FK',
        '13AA', '13AB', '13AC', '13AD', '13AE',
        '13AF', '13AG', '13AH', '13AI', '13AJ', '13AK',
        '13BA', '13BB', '13BC', '13BD', '13BE',
        '13BF', '13BG', '13BH', '13BI', '13BJ', '13BK',
        '13CA', '13CB', '13CC', '13CD', '13CE',
        '13CF', '13CG', '13CH', '13CI', '13CJ', '13CK',
        '13DA', '13DB', '13DC', '13DD', '13DE',
        '13DF', '13DG', '13DH', '13DI', '13DJ', '13DK',
        '13EA', '13EB', '13EC', '13ED', '13EE',
        '13EF', '13EG', '13EH', '13EI', '13EJ', '13EK',
        '13FA', '13FB', '13FC', '13FD', '13FE',
        '13FF', '13FG', '13FH', '13FI', '13FJ', '13FK'
    ];

    $('#cid').typeahead({
                hint: true,
                highlight: true,
                minLength: 1
            },
            {
                name: 'states',
                source: substringMatcher(states)
            });
</script>
</body>
</html>