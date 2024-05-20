<%--
  Created by IntelliJ IDEA.
  User: cc
  Date: 2022/11/23
  Time: 16:05
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
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath}/modify.do">
                <input type="hidden" name="method" value="modifyexe">
                <input type="hidden" name="userId" value="${user.userId}"/>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${user.userName}">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="gender">用户性别：</label>
                    <select name="gender" id="gender">
                        <option value="1" <c:if test="${user.gender eq 1}">selected="selected"</c:if> >男</option>
                        <option value="2" <c:if test="${user.gender eq 2}">selected="selected"</c:if> >女</option>
                    </select>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday" value="${user.birthday}"
                           readonly="readonly" onclick="WdatePicker();">
                    <font color="red"></font>
                </div>

                <div>
                    <label for="phone">用户电话：</label>
                    <input type="text" name="phone" id="phone" value="${user.phone}">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="address">用户地址：</label>
                    <input type="text" name="address" id="address" value="${user.address}">
                </div>
                <div>
                    <label>用户角色：</label>
                    <!-- 列出所有的角色分类 -->
                    <input type="hidden" id="rid"/>
                    <select name="userRole" id="userRole">
                        <c:forEach items="${roleList}" var="role">
                        <option value="${role.roleId}" <c:if test="${user.userRole eq role.roleId}">selected="selected"</c:if> >${role.roleName}</option>
                        </c:forEach>
                    </select>
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="button" name="save" id="save" value="保存"/>
                    <input type="button" id="back" name="back" value="返回"/>
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
<%--<script type="text/javascript" src="js/usermodify.js"></script>--%>
<script>
    $(function () {
        $("#save").click(function () {
            $("#userForm").submit();
        })
        $("#back").click(function () {
            window.history.back();
        })
    });
</script>