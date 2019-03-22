package com.itheima.dao;

import com.itheima.domain.Items;
import org.apache.ibatis.annotations.Select;

//接口上面不需要加注解@repository
public interface ItemsDao {
    @Select("select * from items where id = #{id}")
    public Items findById(Integer id);
}
