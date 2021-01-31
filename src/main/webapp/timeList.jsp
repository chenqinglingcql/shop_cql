<%--
  Created by IntelliJ IDEA.
  User: cql
  Date: 2021/1/31
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <style>
        *{
            padding: 0px;
            margin: 0px;
        }

        .container{
            width:1255px;
            height:680px ;
            position: relative;
            margin: 0px auto;
        }

        .info{
            margin-left: 42px;
            height: 700px;

        }

        span{
            line-height: 25px;
            font-size: 15px;
            color: #9F9F9F;
            font-family: 新宋体;
        }

        .search_index{
            background-color: #009688;
        }
        /*太湖图片*/
        .taihu{
            width:1215px;
            height: 300px;
            background:url("img/taihu2.jpg") no-repeat  ;
            background-size: 100%;
        }
        p,p>span{
            color: whitesmoke;
        }
        th{
           text-align: center;
        }


    </style>
<body>
<div class="container">
    <%--头部--%>
    <div>
        <jsp:include page="header.jsp"></jsp:include>
    </div>
    <%--主体--%>
    <div>
        <div class="info">

            <div  class="taihu">
            </div>
            <%--购票须知--%>
            <div class="search_index">
                <div>
                    <p><img src="img/logo_wuxi.png" ></p>
                    <p><input type="button" onclick="goupiaoxuzhi()" value="【网上购票须知】" style="background: none;border:none;color: whitesmoke"></p>
                </div>
                <div >
                    <p>购票流程</p>
                    <p>
                        <span><img src="img/shubiao.png">选择客票</span>
                        <span><img src="img/denglu.png">登录</span>
                        <span><img src="img/tijiaoziliao.png">填写资料</span>
                        <span><img src="img/zhifu.png">网上支付</span>
                        <span><img src="img/shouye.png.png">购票完成</span>
                    </p>
                </div>

            </div>
            <%--搜索框--%>
            <form name="myform" method="post" style="padding: 20px; margin-left: 250px">
                <input type="text" class="lauyi-input" id="laydate" placeholder="请选择日期" style="height: 30px">
                <select name="biglocation" onChange="changelocation(document.myform.biglocation.options[document.myform.biglocation.selectedIndex].value)" style="height: 30px">
                    <option selected value="0">--请选择省--</option>
                    <option value="01">上海</option>
                    <option value="02">江西</option>
                    <option value="03">安徽</option>
                    <option value="04">浙江</option>
                </select>
                <select name="smalllocation" style="height: 30px">
                    <option selected value="0">--请选择市--</option>
                </select>
                <input type="submit" value="查找" style="height: 30px;width: 100px;background-color: #009688;color: whitesmoke">
            </form>

            <%--表格--%>
            <div class="table">
                <table class="layui-table"  style="text-align: center">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>班车号</th>
                        <th>终点站</th>
                        <th>发车时间</th>
                        <th>车型</th>
                        <th>票价</th>
                        <th>剩余票数</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>K526</td>
                        <td>南京</td>
                        <td>14：00</td>
                        <td>大型坐席高级</td>
                        <td>￥52.00</td>
                        <td>55</td>
                        <td>
                            <input type="button" value="预订" style="background-color: #00ad9f; width:100px;height:30px;color: whitesmoke">
                        </td>
                    </tr>
                    <tr>
                        <td>K526</td>
                        <td>南京</td>
                        <td>14：00</td>
                        <td>大型坐席高级</td>
                        <td>￥52.00</td>
                        <td>55</td>
                        <td><input type="button" value="预订" style="background-color: #00ad9f; width:100px;height:30px;color: whitesmoke"></td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>


    </div>
    <%--尾部--%>
    <div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>



</div>

<script src="../layui/layui.js"></script>
<%--购票须知弹窗--%>
<script>
    /*日期插件*/
    layui.use('laydate',function ({}) {
        var laydate=layui.laydate;
        laydate.render({
            elem:'#laydate'
        });
    });
    /*购物须知弹窗*/
    function goupiaoxuzhi() {
        layui.use('layer',function () {
            var layer=layui.layer;
            layer.open({
                type:1,
                /*按钮*/
                btn:['确认'],
                /*按钮居中放置*/
                btnAlign:'c',
                title:'网上购票须知',
                /*弹出动画：1 从上到下 5：渐显*/
                anim:5,
                /*是否出现滚动*/
                scrollbar:true,
                /*是否显示关闭按钮*/
                closeBtn:1,
                area:['400px','500px'],
                content:'<div style="padding: 20px">\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">一、购票范围</div>\n' +
                    '            <span>本网站购票系统24小时为您提供无锡客运有限公司所属无锡汽车客运站、新世纪站、无锡华东城、无锡招商城等始发的各线客票（有特殊通知时除外），网上售票日期为网上出现的可售票日期。目前本网站仅发售普通客票，不发售军票等优惠票，如需购买请带好相关证件到车站售票窗口购买。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">二、订票提交</div>\n' +
                    '            <span>当您在确认购票张数后，请您填写正确的个人信息（姓名、联系方式）以便于在班次变动时能及时与您取得联系。由于网上发售的客票资源有限，您需购买的客票超过限额时，请您拨打客服热线：0510-82588188，我们会给您提供及时的帮助！网上购票系统限购当前时间二小时后的客票。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">三、付款时限</div>\n' +
                    '            <span> 订票成功后请在10分钟内付款，否则系统将自动取消您的订票。</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；">四、购买流程</div>\n' +
                    '            <span>本网站购票可通过银联、支付宝和移动手机三种方式支付，旅客在订票成功后即可向本网站提交购票申请， 10分钟内选择以上三种支付方式中的任何一种完成支付，网站在得到银行的确认消息后，将正式为购票者记账，并将购票成功的信息反馈，同时给出《行程单》，请您务必按照操作流程及时记录您的订单号和取票密码，然后打印行程单，凭行程单或订单号可直接到检票口检票乘车！</span>\n' +
                    '        </p>\n' +
                    '        <p>\n' +
                    '            <div class="layui_title" style="color: #9F9F9F;line-height: 35px; font-size: 14px;font-family:楷体；"> 五、取票办法</div>\n' +
                    '            <span>您可以使用行程单或订单号直接到检票口检票上车，如需换取客票，凭网上购票时系统给出的订单号和取票密码到下列地点换取客票。换取客票后需凭客票乘车，原行程单自动作废。您的购票订单号和取票密码请注意保密，如由于您的泄密造成损失，本站概不负责。</span>\n' +
                    '        </p>\n' +
                    '    </div>'
            })
        });
    }
</script>
</body>
</html>
