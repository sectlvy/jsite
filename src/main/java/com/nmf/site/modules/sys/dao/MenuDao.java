/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.sys.dao;

import java.util.List;

import com.nmf.site.common.persistence.CrudDao;
import com.nmf.site.common.persistence.annotation.MyBatisDao;
import com.nmf.site.modules.sys.entity.Menu;

/**
 * 菜单DAO接口
 * @author 北冥
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);
	
}
