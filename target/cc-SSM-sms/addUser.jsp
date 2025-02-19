<%--
  Created by IntelliJ IDEA.
  User: cc
  Date: 2022/11/23
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/public.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市订单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> 系统管理员</span> , 欢迎你！</p>
        <a href="${pageContext.request.contextPath}/login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="#">订单管理</a></li>
                <li><a href="#">供应商管理</a></li>
                <li><a href="${pageContext.request.contextPath}/getUsers.do">用户管理</a></li>
                <li><a href="#">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <input type="hidden" id="path" name="path" value="/SMBMS"/>
    <input type="hidden" id="referer" name="referer" value="http://localhost:8080jsp/user.do?method=query"/>

    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath}/add.do">
                <input type="hidden" name="method" value="add">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="userCode">用户编码：</label>
                    <input type="text" name="userCode" id="userCode" value="">
                    <!-- 放置提示信息 -->
                    <font color="red"></font>
                </div>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="userPassword">用户密码：</label>
                    <input type="password" name="userPassword" id="userPassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="ruserPassword">确认密码：</label>
                    <input type="password" name="ruserPassword" id="ruserPassword" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label>用户性别：</label>
                    <select name="gender" id="gender">
                        <option value="1" selected="selected">男</option>
                        <option value="2">女</option>
                    </select>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="phone">用户电话：</label>
                    <input type="text" name="phone" id="phone" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="address">用户地址：</label>
                    <input name="address" id="address" value="">
                </div>
                <div>
                    <label>用户角色：</label>
                    <!-- 列出所有的角色分类 -->
                    <select name="userRole" id="userRole">
                        <option value="1">系统管理员</option>
                        <option value="2">经理</option>
                        <option value="3" selected="selected">普通员工</option>
                    </select>
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="button" name="save" id="save" value="保存">
                    <input type="button" name="back" id="back" value="返回">
                </div>
            </form>
        </div>
    </div>
</section>

<footer class="footer">
    版权归XXXX
</footer>
<script type="text/javascript" src="js/time.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="calendar/WdatePicker.js"></script>
</body>
</html>
<%--<script type="text/javascript" src="js/useradd.js"></script>--%>
<script>
    $(function () {
        $("#save").click(function () {
            // form表单对象.submit()
            $("#userForm").submit();
        })
        $("#back").click(function () {
            window.history.go(-1);
        })
    });
</script>
