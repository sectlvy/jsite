/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.sys.dao;

import com.nmf.site.common.persistence.CrudDao;
import com.nmf.site.common.persistence.annotation.MyBatisDao;
import com.nmf.site.modules.sys.entity.Role;

/**
 * 角色DAO接口
 * @author 北冥
 * @version 2013-12-05
 */
@MyBatisDao
public interface RoleDao extends CrudDao<Role> {

	public Role getByName(Role role);
	
	public Role getByEnname(Role role);

	/**
	 * 维护角色与菜单权限关系
	 * @param role
	 * @return
	 */
	public int deleteRoleMenu(Role role);

	public int insertRoleMenu(Role role);
	
	/**
	 * 维护角色与公司部门关系
	 * @param role
	 * @return
	 */
	public int deleteRoleOffice(Role role);

	public int insertRoleOffice(Role role);

}
