<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/29
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="param/testParam?username=雷全明&password=123">请求参数绑定</a><br>
    把数据封装Account类中
    <%--name属性的值必须和实体类的成员变量名一致--%>
    <form action="param/saveAccount" method="post">
        姓名：<input type="text" name="username" /><br/>
        密码：<input type="text" name="password" /><br/>
        金额：<input type="text" name="money" /><br/>
        用户姓名：<input type="text" name="user.uname" /><br/>
        用户年龄：<input type="text" name="user.age" /><br/>
        <input type="submit" value="提交" />
    </form>
    <br>
    把数据封装Account类中，类中存在list和map的集合
    <form action="param/saveAccount" method="post">
        姓名：<input type="text" name="username" /><br/>
        密码：<input type="text" name="password" /><br/>
        金额：<input type="text" name="money" /><br/>
        <%--封装javabean时候,name值得用集合名[索引].属性名--%>
        用户姓名：<input type="text" name="list[0].uname" /><br/>
        用户年龄：<input type="text" name="list[0].age" /><br/>
        <%--封装javabean中的map,name值:集合名[key].属性名--%>
        用户姓名：<input type="text" name="map['one'].uname" /><br/>
        用户年龄：<input type="text" name="map['one'].age" /><br/>
        <input type="submit" value="提交" />
    </form>
    <br>
        支持数组类型的封装
    <form action="param/saveAccount" method="post">
        <%--name:数组名[索引].属性名--%>
        id1：<input type="text" name="users[0].uname" /><br/>
        id2：<input type="text" name="users[1].uname" /><br/>
        <input type="submit" value="提交数组" />
    </form>






    自定义类型转换器
    <form action="param/saveUser" method="post">
        用户姓名：<input type="text" name="uname" /><br/>
        用户年龄：<input type="text" name="age" /><br/>
        用户生日：<input type="text" name="date" /><br/>
        <input type="submit" value="提交" />
    </form>



    <a href="param/testServlet">Servlet原生的API</a>

</body>
</html>
