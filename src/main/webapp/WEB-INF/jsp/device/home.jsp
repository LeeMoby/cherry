<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0041) -->
<html lang="UTF-8">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/images/cherry-32x32.png">

    <title>Cherry</title>
    <%@include file="/WEB-INF/jsp/common/head.jsp" %>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">云间一石</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">导航</a></li>
                <li><a href="#">皮肤</a></li>
                <li><a href="#">用户</a></li>
                <li><a href="#">帮助</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="搜索...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="#">首页</a>
                </li>
                <li><a href="#">报表</a></li>
                <li><a href="#">分析</a></li>
                <li><a href="#">导出</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">机房巡视</a></li>
                <li><a href="">班组资料</a></li>
                <li><a href="">工作日志</a></li>
                <li><a href="">库房管理</a></li>
                <li class="active"><a href="/device/home/">资产设备 <span
                        class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="#">系统配置</a></li>
                <li><a href="#">偏好设置</a></li>
                <li><a href="#">关于</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <!-- <h1 class="page-header">资产设备</h1> -->

            <!-- 选项卡组件（菜单项nav-tabs）-->
            <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li <c:if test="${activeTab == 'index'}">class="active"</c:if>><a href="#index" role="tab"
                                                                                  data-toggle="tab">首页</a></li>
                <li <c:if test="${activeTab == '服务器'}">class="active"</c:if>><a href="#server" role="tab"
                                                                                data-toggle="tab">服务器</a></li>
                <li <c:if test="${activeTab == '存储'}">class="active"</c:if>><a href="#storage" role="tab"
                                                                               data-toggle="tab">存储</a></li>
                <li <c:if test="${activeTab == '网络'}">class="active"</c:if>><a href="#network" role="tab"
                                                                               data-toggle="tab">网络</a></li>
                <li <c:if test="${activeTab == '安全'}">class="active"</c:if>><a href="#safety" role="tab"
                                                                               data-toggle="tab">安全</a></li>
                <li <c:if test="${activeTab == '音视频'}">class="active"</c:if>><a href="#multimedia" role="tab"
                                                                                data-toggle="tab">音视频</a></li>
                <li <c:if test="${activeTab == '其他'}">class="active"</c:if>><a href="#other" role="tab"
                                                                               data-toggle="tab">其他</a></li>
            </ul>
            <!-- 选项卡面板 -->
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade <c:if test="${activeTab == 'index'}">in active</c:if>" id="index">
                    <h3>概要</h3>
                    <p>
                        截止目前6类硬件设备共257台, 其中服务器104台, 存储设备18台, 网络设备54台, 安全设备21台, 音视频设备19台, 其他设备74台。 正常运行215台。 内网设备192台,
                        外网设备36台。
                    </p>
                    <h3>统计</h3>
                    <!-- 统计图表 2 X 2 -->
                    <div class="row">
                        <div class="col-md-6">
                            <canvas id="myChart1" width="550px" height="550px"></canvas>
                        </div>
                        <div class="col-md-6">
                            <canvas id="myChart2" width="550px" height="550px"></canvas>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <canvas id="myChart3" width="550px" height="550px"></canvas>
                        </div>
                        <div class="col-md-6">
                            <canvas id="myChart4" width="550px" height="550px"></canvas>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <canvas id="myChart5" width="550px" height="550px"></canvas>
                        </div>
                        <div class="col-md-6">
                            <canvas id="myChart6" width="550px" height="550px"></canvas>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '服务器'}">in active</c:if>" id="server">
                    <%@include file="deviceServer.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '存储'}">in active</c:if>" id="storage">
                    <%@include file="deviceStorage.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '网络'}">in active</c:if>" id="network">
                    <%@include file="deviceNetwork.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '安全'}">in active</c:if>" id="safety">
                    <%@include file="deviceSafety.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '音视频'}">in active</c:if>" id="multimedia">
                    <%@include file="deviceMultimedia.jsp" %>
                </div>
                <div class="tab-pane fade <c:if test="${activeTab == '其他'}">in active</c:if>" id="other">
                    <%@include file="deviceOther.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal, 导入功能-->
<div id="importModal" class="modal fade" tabindex="-1" role="dialog">
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
                        <form id="inputForm" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group" id="dm_inputDiv">
                                        <label for="inputFile">请上传包含数据的Excel文件:</label>
                                        <input type="file" name="inputFile" id="inputFile" multiple class="file">
                                        <p id="inputFileError" class="help-block">请务必保持模板的列顺序及格式一致。</p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">导入</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<%@include file="/WEB-INF/jsp/common/footer.jsp" %>
<!-- chart.js -->
<script src="/resources/chartjs/Chart.min.js"></script>
<script type="text/javascript">
    // 绘制图表
    // chart1

    var myData1 = {
        // x轴的标示
        labels: ["2011", "2012", "2013", "2014", "2015", "2016"],
        // 数据，数组中的每一个object代表一条线
        datasets: [
            {
                label: "服务器",
                // 填充颜色
                fillColor: "rgba(159,200,92,0.5)",
                // 线的颜色
                strokeColor: "rgba(159,200,92,1)",
                // 点的填充颜色
                pointColor: "rgba(159,200,92,1)",
                // 点的边线颜色
                pointStrokeColor: "#fff",
                // 与x轴标示对应的数据
                data: [23, 25, 31, 40, 56, 55]
            },
            {
                label: "存储",
                fillColor: "rgba(151,187,205,0)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [12, 15, 18, 21, 27, 27]
            },
            {
                label: "网络",
                fillColor: "rgba(151,187,205,0)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [4, 8, 16, 20, 22, 22]
            },
            {
                label: "安全",
                fillColor: "rgba(151,187,205,0)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [16, 16, 16, 27, 36, 40]
            },
            {
                label: "音视频",
                fillColor: "rgba(0,187,205,0)",
                strokeColor: "rgba(0,187,205,1)",
                pointColor: "rgba(0,187,205,1)",
                pointStrokeColor: "#fff",
                data: [6, 12, 18, 20, 25, 27]
            },
            {
                label: "其他",
                fillColor: "rgba(151,187,205,0)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [25, 31, 35, 36, 46, 51]
            }
        ]

    };
    var myCanvas1 = document.getElementById("myChart1");
    var myCtx1 = myCanvas1.getContext("2d");
    new Chart(myCtx1, {type: "line", data: myData1});

    // chart2
    var myData2 = {
        // x轴的标示
        labels: ["服务器", "存储", "网络", "安全", "音视频", "其他"],
        // 数据，数组中的每一个object代表一条线
        datasets: [
            {
                label: "在运",
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1,
                data: [65, 53, 57, 61, 56, 55]
            }
        ]

    };
    var myCanvas2 = document.getElementById("myChart2");
    var myCtx2 = myCanvas2.getContext("2d");
    new Chart(myCtx2, {type: "bar", data: myData2});

    // chart3
    var myData3 = {
        labels: ["服务器", "存储", "网络", "安全", "音视频", "其他"],
        datasets: [
            {
                label: "灾备建设一期",
                backgroundColor: "rgba(179,181,198,0.2)",
                borderColor: "rgba(179,181,198,1)",
                pointBackgroundColor: "rgba(179,181,198,1)",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(179,181,198,1)",
                data: [31, 23, 16, 10, 33, 40]
            },
            {
                label: "灾备建设二期",
                backgroundColor: "rgba(255,99,132,0.2)",
                borderColor: "rgba(255,99,132,1)",
                pointBackgroundColor: "rgba(255,99,132,1)",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(255,99,132,1)",
                data: [56, 31, 36, 31, 42, 67]
            }
        ]
    };
    var myCanvas3 = document.getElementById("myChart3");
    var myCtx3 = myCanvas3.getContext("2d");
    new Chart(myCtx3, {type: "radar", data: myData3});

    // chart4
    var myData4 = {
        datasets: [{
            data: [
                11,
                16,
                7,
                3,
                14
            ],
            backgroundColor: [
                "#FF6384",
                "#4BC0C0",
                "#FFCE56",
                "#E7E9ED",
                "#36A2EB"
            ],
            label: '灾备演练' // for legend
        }],
        labels: [
            "甘肃",
            "青海",
            "宁夏",
            "新疆",
            "西藏"
        ]
    };
    var myCanvas4 = document.getElementById("myChart4");
    var myCtx4 = myCanvas4.getContext("2d");
    new Chart(myCtx4, {type: "polarArea", data: myData4});

    // chart5
    var myData5 = {
        labels: [
            "甘肃",
            "青海",
            "宁夏",
            "新疆",
            "西藏"
        ],
        datasets: [
            {
                data: [23, 31, 16, 24, 41],
                backgroundColor: [
                    "#FF6384",
                    "#36A2EB",
                    "#FFCE56",
                    "#70CC33",
                    "#CC33CC"
                ],
                hoverBackgroundColor: [
                    "#FF6384",
                    "#36A2EB",
                    "#FFCE56",
                    "#70CC33",
                    "#CC33CC"
                ]
            }]
    };
    var myCanvas5 = document.getElementById("myChart5");
    var myCtx5 = myCanvas5.getContext("2d");
    new Chart(myCtx5, {type: "doughnut", data: myData5}); // type: "doughnut"    type: "pie"

    // chart6
    var myData6 = {
        datasets: [
            {
                label: '一级检修',
                data: [
                    {
                        x: 1,
                        y: 2,
                        r: 15
                    },
                    {
                        x: 3,
                        y: 2,
                        r: 10
                    },
                    {
                        x: 5,
                        y: 3,
                        r: 25
                    },
                    {
                        x: 7,
                        y: 6,
                        r: 31
                    },
                    {
                        x: 9,
                        y: 6,
                        r: 13
                    }
                ],
                backgroundColor: "#FF6384",
                hoverBackgroundColor: "#FF6384"
            }, {
                label: '二级检修',
                data: [
                    {
                        x: 1,
                        y: 4,
                        r: 15
                    },
                    {
                        x: 3,
                        y: 7,
                        r: 10
                    },
                    {
                        x: 5,
                        y: 9,
                        r: 31
                    },
                    {
                        x: 7,
                        y: 6,
                        r: 27
                    },
                    {
                        x: 12,
                        y: 11,
                        r: 19
                    }
                ],
                backgroundColor: "#33CCCC",
                hoverBackgroundColor: "#33CCCC"
            }]
    };
    var myCanvas6 = document.getElementById("myChart6");
    var myCtx6 = myCanvas6.getContext("2d");
    new Chart(myCtx6, {type: "bubble", data: myData6});

    var modalImportDeviceURL = "";
    // modal
    $('#importModal').on('shown.bs.modal', function (e) {
        modalImportDeviceURL = e.relatedTarget.name;
    });

    // file-input
    $('#inputFile').fileinput({
        language: 'zh',
        uploadUrl: '/device/' + modalImportDeviceURL + '/upload',
        uploadAsync: false,
        showPreview: true,
        showUpload: false, // hide upload button
        showRemove: false, // hide remove button
//        allowedPreviewTypes: ['image', 'html', 'text', 'video', 'audio', 'flash'],
        allowedFileExtensions: ["xls", "xlsx"],
        minFileCount: 1,
        maxFileCount: 5
    });
    $('#inputFile').on('fileuploaderror', function (event, data, previewId, index) {
        var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;
        console.log(data);
        console.log('File upload error');
    });
    $('#inputFile').on('fileerror', function (event, data) {
        console.log(data.id);
        console.log(data.index);
        console.log(data.file);
        console.log(data.reader);
        console.log(data.files);
    });
    $('#inputFile').on('fileuploaded', function (event, data, previewId, index) {
        var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;
        console.log('File uploaded triggered');
    });

    //    // 上传控件初始化
    //    $("#dm_inputFile").fileinput({
    //        showPreview: false,
    //        allowedFileExtensions: ["xls", "xlsx"],
    //        elErrorContainer: "#dm_inputFileError",
    //        browseClass: "btn btn-success",
    //        browseLabel: "查找文件",
    //        browseIcon: "<i class='glyphicon glyphicon-search'></i>",
    //        removeClass: "btn btn-danger",
    //        removeLabel: "删除",
    //        removeIcon: "<i class='glyphicon glyphicon-trash'></i>",
    //        uploadClass: "btn btn-info",
    //        uploadLabel: "上传",
    //        uploadIcon: "<i class='glyphicon glyphicon-upload'></i>"
    //    });

    //    $("#dm_inputForm").submit(function (event) {
    //        var formData = new FormData(this);
    //        event.preventDefault();
    //
    //        var grid = $("[data-role='dm_inputGrid']");
    //        $.ajax({
    //            url: '/device/multimedia/upload',
    //            type: 'POST',
    //            data: formData,
    //            contentType: false,
    //            processData: false,
    //            success: function (data) {
    //                if (data.result == 'success') {
    //                    grid.message({
    //                        type: 'success',
    //                        content: '上传成功'
    //                    });
    //                    $("#dm_inputDiv").slideToggle("slow");
    //                    grid.grid('refresh');
    //                } else {
    //                    grid.message({
    //                        type: 'error',
    //                        content: data.result
    //                    });
    //                }
    //            },
    //            error: function () {
    //                grid.message({
    //                    type: 'error',
    //                    content: '上传失败'
    //                });
    //            }
    //        });
    //    });

</script>

</body>
</html>