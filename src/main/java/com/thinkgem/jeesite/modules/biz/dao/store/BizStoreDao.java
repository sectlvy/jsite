/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.biz.dao.store;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.biz.entity.store.BizStore;

/**
 * 门店DAO接口
 * @author 北冥
 * @version 2018-01-31
 */
@MyBatisDao
public interface BizStoreDao extends CrudDao<BizStore> {
	
}