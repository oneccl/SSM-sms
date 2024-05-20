<%--
  Created by IntelliJ IDEA.
  User: cc
  Date: 2022/11/23
  Time: 16:02
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
    <input type="hidden" id="referer" name="referer"
           value="http://localhost:8080jsp/provider.do?method=query&queryProCode=&queryProName="/>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面</span>
        </div>
        <div class="search">
            <form method="get" action="${pageContext.request.contextPath}/getUsers.do">
                <input name="method" value="query" class="input-text" type="hidden">
                <span>用户名：</span>
                <input name="name" class="input-text" type="text">

                <span>用户角色：</span>
                <select name="role">
                    <option value="0">--请选择--</option>
                    <option value="1">系统管理员</option>
                    <option value="2">经理</option>
                    <option value="3">普通员工</option>
                </select>

                <input type="hidden" name="pageIndex" value="1"/>
                <input value="查 询" type="submit" id="searchbutton">

                <a href="${pageContext.request.contextPath}/addUser.jsp">添加用户</a>
            </form>
        </div>
        <!--用户-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">用户编码</th>
                <th width="20%">用户名称</th>
                <th width="10%">性别</th>
                <th width="10%">年龄</th>
                <th width="10%">电话</th>
                <th width="10%">用户角色</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td><span>${user.userCode}</span></td>
                    <td><span>${user.userName}</span></td>
                    <td><span>
                        <c:choose>
                            <c:when test="${user.gender eq 1}">男</c:when>
                            <c:otherwise>女</c:otherwise>
                        </c:choose>
                    </span></td>
                    <td><span>${user.age}</span></td>
                    <td><span>${user.phone}</span></td>
                    <td><span>${user.role.roleName}</span></td>
                    <td>
                        <span><a class="viewUser" href="${pageContext.request.contextPath}/view.do?id=${user.userId}">
                            <img src="images/read.png" alt="查看" title="查看"/></a></span>
                        <span><a class="modifyUser"
                                 href="${pageContext.request.contextPath}/toModify.do?id=${user.userId}">
                            <img src="images/xiugai.png" alt="修改" title="修改"/></a></span>
                        <span><a class="deleteUser"
                                 href="${pageContext.request.contextPath}/remove.do?id=${user.userId}">
                            <img src="images/schu.png" alt="删除" title="删除"/></a></span>
                    </td>
                </tr>
            </c:forEach>

        </table>
        <input type="hidden" id="totalPageCount" value="3"/>

        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
            <script type="text/javascript">

            </script>
        </head>
        <body>
        <div class="page-bar">
            <ul class="page-num-ul clearfix">
                <li>共${page.total}条记录&nbsp;&nbsp;&nbsp; ${page.pageNum}/${page.pages}页</li>
                &nbsp;&nbsp;
                <a href="getUsers.do?pageNo=${page.navigateFirstPage}">首页</a>
                <a href="getUsers.do?pageNo=${page.prePage}">上一页</a>
                <a href="getUsers.do?pageNo=${page.nextPage}">下一页</a>
                <a href="getUsers.do?pageNo=${page.navigateLastPage}">最后一页</a>
                &nbsp;&nbsp;
            </ul>
            <span class="page-go-form"><label>跳转至</label>
	        <input type="text" name="inputPage" id="inputPage" class="page-key"/>页
	        <button type="button" id="goPage" class="page-btn">GO</button>
		</span>
        </div>
        </body>
        <script type="text/javascript" src="js/rollpage.js"></script>
        </html>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
    版权归XXXX
</footer>
<script type="text/javascript" src="js/time.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="calendar/WdatePicker.js"></script>
</body>
</html>
<%--<script type="text/javascript" src="js/userlist.js"></script>--%>
<script>
    $(function () {
        $("#goPage").click(function () {
            let input = $("#inputPage").val();
            if (input <= 0){
                input = 1;
            }
            if (input > ${page.pages}){
                input = ${page.pages};
            }
            location.href = "/getUsers.do?pageNo=" + input;
        })
    });
</script>
