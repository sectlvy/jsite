/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.sys.dao;

import com.nmf.site.common.persistence.TreeDao;
import com.nmf.site.common.persistence.annotation.MyBatisDao;
import com.nmf.site.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author 北冥
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
