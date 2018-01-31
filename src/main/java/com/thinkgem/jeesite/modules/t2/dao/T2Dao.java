/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.t2.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.t2.entity.T2;

/**
 * 测试DAO接口
 * @author 卢康乐
 * @version 2018-01-30
 */
@MyBatisDao
public interface T2Dao extends CrudDao<T2> {
	
}