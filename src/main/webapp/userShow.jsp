<%--
  Created by IntelliJ IDEA.
  User: cc
  Date: 2022/11/24
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>用户编号：</strong><span>${viewUser.userCode}</span></p>
            <p><strong>用户名称：</strong><span>${viewUser.userName}</span></p>
            <p><strong>用户性别：</strong>
                <span>
            		<c:choose>
                        <c:when test="${viewUser.gender eq 1}">男</c:when>
                        <c:otherwise>女</c:otherwise>
                    </c:choose>
				</span>
            </p>
            <p><strong>出生日期：</strong><span>${viewUser.birthday}</span></p>
            <p><strong>用户电话：</strong><span>${viewUser.phone}</span></p>
            <p><strong>用户地址：</strong><span>${viewUser.address}</span></p>
            <p><strong>用户角色：</strong><span>${viewUser.role.roleName}</span></p>
            <div class="providerAddBtn">
                <input type="button" id="back" name="back" value="返回" onclick="back()">
            </div>
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
<script>
    function back() {
        window.history.back();
    }
</script>
