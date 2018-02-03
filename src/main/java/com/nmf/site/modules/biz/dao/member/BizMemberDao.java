/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.biz.dao.member;

import com.nmf.site.common.persistence.CrudDao;
import com.nmf.site.common.persistence.annotation.MyBatisDao;
import com.nmf.site.modules.biz.entity.member.BizMember;

/**
 * 会员DAO接口
 * @author 北冥
 * @version 2018-01-31
 */
@MyBatisDao
public interface BizMemberDao extends CrudDao<BizMember> {
	
}