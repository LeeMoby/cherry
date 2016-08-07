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
            <a class="navbar-brand" href="http://localhost:8080/cherry/home/#">云间一石</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="http://localhost:8080/cherry/home/#">导航</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">皮肤</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">用户</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">帮助</a></li>
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
                <li><a href="http://localhost:8080/cherry/home/#">首页</a>
                </li>
                <li><a href="http://localhost:8080/cherry/home/#">报表</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">分析</a></li>
                <li><a href="http://localhost:8080/cherry/home/#">导出</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="http://localhost:8080/cherry/home/">机房巡视</a></li>
                <li><a href="http://localhost:8080/cherry/home/">班组资料</a></li>
                <li><a href="http://localhost:8080/cherry/home/">工作日志</a></li>
                <li><a href="http://localhost:8080/cherry/home/">库房管理</a></li>
                <li class="active"><a href="http://localhost:8080/device/home/">资产设备 <span
                        class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav nav-sidebar"> 
                <li><a href="http://localhost:8080/cherry/home/">系统配置</a></li>
                <li><a href="http://localhost:8080/cherry/home/">偏好设置</a></li>
                <li><a href="http://localhost:8080/cherry/home/">关于</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <!-- <h1 class="page-header">资产设备</h1> -->

            <!-- 选项卡组件（菜单项nav-tabs）-->
            <ul id="myTab" class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#index" role="tab" data-toggle="tab">首页</a></li>
                <li><a href="#server" role="tab" data-toggle="tab">服务器</a></li>
                <li><a href="#storage" role="tab" data-toggle="tab">存储</a></li>
                <li><a href="#network" role="tab" data-toggle="tab">网络</a></li>
                <li><a href="#safety" role="tab" data-toggle="tab">安全</a></li>
                <li><a href="#multimedia" role="tab" data-toggle="tab">音视频</a></li>
                <li><a href="#other" role="tab" data-toggle="tab">其他</a></li>
            </ul>
            <!-- 选项卡面板 -->
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="index">
                    <h3 >概要</h3>
                    <p>
                        截止目前6类硬件设备共257台, 其中服务器104台, 存储设备18台, 网络设备54台, 安全设备21台, 音视频设备19台, 其他设备74台。 正常运行215台。 内网设备192台, 外网设备36台。
                    </p>
                    <h3>统计</h3>
                    <!-- 统计图表 2 X 2 -->
                    <div class="row">
                        <div class="col-md-6">
                            <canvas id="myChart1" width="400" height="400"></canvas>
                        </div>
                        <div class="col-md-6">
                            <canvas id="myChart2" width="400" height="400"></canvas>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <canvas id="myChart3" width="400" height="400"></canvas>
                        </div>
                        <div class="col-md-6">
                            <canvas id="myChart4" width="400" height="400"></canvas>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <canvas id="myChart5" width="400" height="400"></canvas>
                        </div>
                        <div class="col-md-6">
                            <canvas id="myChart6" width="400" height="400"></canvas>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="server">
                    <%@include file="deviceServer.jsp" %>
                </div>
                <div class="tab-pane fade" id="storage">
                    <%@include file="deviceStorage.jsp" %>
                </div>
                <div class="tab-pane fade" id="network">
                    <%@include file="deviceNetwork.jsp" %>
                </div>
                <div class="tab-pane fade" id="safety">
                    <%@include file="deviceSafety.jsp" %>
                </div>
                <div class="tab-pane fade" id="multimedia">
                    <%@include file="deviceMultimedia.jsp" %>
                </div>
                <div class="tab-pane fade" id="other">
                    <%@include file="deviceOther.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/footer.jsp" %>
<!-- chart.js -->
<script src="/resources/chartjs/Chart.min.js"></script>
<script type="text/javascript">
    // 绘制图表
    // chart1

    var myData1 = {
        // x轴的标示
        labels : ["2016-01","2016-02","2016-03","2016-04","2016-05","2016-06","2016-07"],
        // 数据，数组中的每一个object代表一条线
        datasets : [
            {
                label: "服务器设备",
                // 填充颜色
                fillColor : "rgba(220,220,220,0.5)",
                // 线的颜色
                strokeColor : "rgba(220,220,220,1)",
                // 点的填充颜色
                pointColor : "rgba(220,220,220,1)",
                // 点的边线颜色
                pointStrokeColor : "#fff",
                // 与x轴标示对应的数据
                data : [65,59,90,190,56,55,40]
            },
            {
                label: "网络设备",
                fillColor : "rgba(151,187,205,0)",
                strokeColor : "rgba(151,187,205,1)",
                pointColor : "rgba(151,187,205,1)",
                pointStrokeColor : "#fff",
                data : [28,48,40,19,96,27,100]
            }
        ]

    };
    var myCanvas1 = document.getElementById("myChart1");
    var myCtx1 = myCanvas1.getContext("2d");
    new Chart(myCtx1, {type: "line", data: myData1});

    // chart2
    var myData2 = {
        // x轴的标示
        labels : ["2016-01","2016-02","2016-03","2016-04","2016-05","2016-06"],
        // 数据，数组中的每一个object代表一条线
        datasets: [
            {
                label: "存储设备",
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
                data: [65, 59, 80, 81, 56, 55]
            },
            {
                label: "安全设备",
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
                data: [45, 34, 23, 13, 34, 51]
            }
        ]

    };
    var myCanvas2 = document.getElementById("myChart2");
    var myCtx2 = myCanvas2.getContext("2d");
    new Chart(myCtx2, {type: "bar", data: myData2});

    // chart3
    var myData3 = {
        labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
        datasets: [
            {
                label: "My First dataset",
                backgroundColor: "rgba(179,181,198,0.2)",
                borderColor: "rgba(179,181,198,1)",
                pointBackgroundColor: "rgba(179,181,198,1)",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(179,181,198,1)",
                data: [65, 59, 90, 81, 56, 55, 40]
            },
            {
                label: "My Second dataset",
                backgroundColor: "rgba(255,99,132,0.2)",
                borderColor: "rgba(255,99,132,1)",
                pointBackgroundColor: "rgba(255,99,132,1)",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(255,99,132,1)",
                data: [28, 48, 40, 19, 96, 27, 100]
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
            label: 'My dataset' // for legend
        }],
        labels: [
            "Red",
            "Green",
            "Yellow",
            "Grey",
            "Blue"
        ]
    };
    var myCanvas4 = document.getElementById("myChart4");
    var myCtx4 = myCanvas4.getContext("2d");
    new Chart(myCtx4, {type: "polarArea", data: myData4});

    // chart5
    var myData5 = {
        labels: [
            "Red",
            "Blue",
            "Yellow"
        ],
        datasets: [
            {
                data: [300, 50, 100],
                backgroundColor: [
                    "#FF6384",
                    "#36A2EB",
                    "#FFCE56"
                ],
                hoverBackgroundColor: [
                    "#FF6384",
                    "#36A2EB",
                    "#FFCE56"
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
                label: 'First Dataset',
                data: [
                    {
                        x: 20,
                        y: 30,
                        r: 15
                    },
                    {
                        x: 40,
                        y: 10,
                        r: 10
                    },
                    {
                        x: 23,
                        y: 34,
                        r: 31
                    }
                ],
                backgroundColor:"#FF6384",
                hoverBackgroundColor: "#FF6384"
            }]
    };
    var myCanvas6 = document.getElementById("myChart6");
    var myCtx6 = myCanvas6.getContext("2d");
    new Chart(myCtx6, {type: "bubble", data: myData6});




</script>

</body>
</html>