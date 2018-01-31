/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.biz.dao.member;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.biz.entity.member.BizMember;

/**
 * 会员DAO接口
 * @author 北冥
 * @version 2018-01-31
 */
@MyBatisDao
public interface BizMemberDao extends CrudDao<BizMember> {
	
}