package cn.itcast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 控制器类
@SuppressWarnings("all")
@Controller//把这个类交给IOC容器管理
@RequestMapping(path="/user")//请求映射注解 放在类上声明一级目录 前面的/可以省略,但是不规范
public class HelloController {

    /**
     * 入门案例
     * @return
     */
    @RequestMapping(path="/hello")//请求映射注解 放在方法上声明二级目录 前面的/可以省略,但是不规范
    public String sayHello(){
        System.out.println("Hello StringMVC");
        return "success";
    }

    /**
     * RequestMapping注解
     * @return
     */
    //查看源码得知,value属性和path作用是一样的,互相起了别名
    /*
    * method:规定该方法能接受的请求方式
    * params:规定该方法接受的请求参数中必须有什么属性 key = value样式的字符串
    * header:用于指定限制请求头的参数*/
    @RequestMapping(value="/testRequestMapping",params = {"username=heihei"},headers = {"Accept"})
    public String testRequestMapping(){
        System.out.println("测试RequestMapping注解...");
        return "success";
    }

}
