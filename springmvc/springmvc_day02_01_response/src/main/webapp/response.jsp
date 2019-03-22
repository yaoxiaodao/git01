<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/1
  Time: 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="js/jquery.min.js"></script>

    <script>
        // 页面加载，绑定单击事件
        $(function () {
            $("#btn").click(function () {
                // alert("hello btn");
                // 发送ajax请求
                $.ajax({
                    // 编写json格式，设置属性和值
                    url: "user/testAjax",
                    contentType: "application/json;charset=UTF-8",
                    data: '{"username":"hehe","password":"123","age":30}',//当这个没有单引号,数据不是json格式,而是变成了&连接的字符串,而且User封装不上
                    dataType: "json",
                    type: "post",
                    success: function (data) {
                        // data服务器端响应的json的数据，进行解析
                        alert(data);
                        alert(data.username);
                        alert(data.password);
                        alert(data.age);
                    }
                });

            });

            $("#btn1").click(function () {
                alert("hello btn1");
                // 发送ajax请求 这个发送过去的请求参数格式是username=hehe&password=123&age=30
                //大括号里面的username不管加不加双引号,只要方法参数不加@requestbody都能封装成功
                //post 方式的异步请求不能发送json格式的数据,只会被拼接成&形式连接的字符串
                $.post("user/testAjax1", {"username":"hehe","password":"123","age":30},
                    function(data){
                        alert(data);
                        alert(data.username);
                        alert(data.password);
                        alert(data.age);
                    }, "json");
            });

        });

    </script>

</head>
<body>

<a href="user/testString">testString</a>

<br/>

<a href="user/testVoid">testVoid</a>

<br/>

<a href="user/testModelAndView">testModelAndView</a>

<br/>

<a href="user/testForwardOrRedirect">testForwardOrRedirect</a>

<br/>

<button id="btn">发送原始ajax的请求</button>

<button id="btn1">发送封装ajax的请求</button>

</body>
</html>
