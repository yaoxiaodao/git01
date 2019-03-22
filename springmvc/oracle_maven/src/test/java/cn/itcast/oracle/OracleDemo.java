package cn.itcast.oracle;

import oracle.jdbc.OracleTypes;
import org.junit.Test;

import java.sql.*;

public class OracleDemo {

    /**
     * 调用sql语句进行查询
     * @throws Exception
     */
    @Test
    public void javaCallOracle() throws Exception {
        //加载数据库驱动
        Class.forName("oracle.jdbc.driver.OracleDriver");
        //获取数据库连接
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.10:1521:orcl", "scott", "tiger");
        //获取预编译对象
        PreparedStatement pstm = connection.prepareStatement("SELECT  * from emp where empno = ?");
        //给参数赋值
        pstm.setObject(1,7788);
        //执行数据库查询操作
        ResultSet resultSet = pstm.executeQuery();
        while (resultSet.next()){
            System.out.println(resultSet.getString("ename"));
        }
        //释放资源
        resultSet.close();
        pstm.close();
        connection.close();
    }

    /**
     * java调用存储过程 查询年薪
     * @throws Exception
     */
    @Test
    public void javaCallProcedure() throws Exception {
        //加载数据库驱动
        Class.forName("oracle.jdbc.driver.OracleDriver");
        //获取数据库连接
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.10:1521:orcl", "scott", "tiger");
        //使用存储过程
        CallableStatement cstm = connection.prepareCall("{call p_yearsal(?,?)}");
        //给参数赋值
        cstm.setObject(1,7788);
        cstm.registerOutParameter(2, OracleTypes.NUMBER);
        //执行数据库查询操作
        cstm.execute();
        System.out.println(cstm.getObject(2));
        //释放资源
        cstm.close();
        connection.close();
    }

    /**
     * java调用存储函数
     * @throws Exception
     */
    @Test
    public void javaCallFunction() throws Exception {
        //加载数据库驱动
        Class.forName("oracle.jdbc.driver.OracleDriver");
        //获取数据库连接
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.6.10:1521:orcl", "scott", "tiger");
        //使用存储过程
        CallableStatement cstm = connection.prepareCall("{?=call f_yearsal(?)}");
        //给参数赋值
        cstm.setObject(2,7788);
        cstm.registerOutParameter(1, OracleTypes.NUMBER);
        //执行数据库查询操作
        cstm.execute();
        System.out.println(cstm.getObject(1));
        //释放资源
        cstm.close();
        connection.close();
    }

}
