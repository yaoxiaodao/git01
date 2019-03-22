<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <h3>入门程序</h3>
    <%--相对路径前面不能加/--%>
        <a href="user/hello">入门程序</a>
    <a href="param.jsp">参数绑定测试页面</a>
    <a href="anno.jsp">注解测试页面</a>


    <a href="user/testRequestMapping?username=heihei">RequestMapping注解</a>

</body>
</html>
