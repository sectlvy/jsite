/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.biz.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.biz.entity.member.BizMember;
import com.thinkgem.jeesite.modules.biz.dao.member.BizMemberDao;

/**
 * 会员Service
 * @author 北冥
 * @version 2018-01-31
 */
@Service
@Transactional(readOnly = true)
public class BizMemberService extends CrudService<BizMemberDao, BizMember> {

	
	public BizMember get(String id) {
		BizMember bizMember = super.get(id);
		return bizMember;
	}
	
	public List<BizMember> findList(BizMember bizMember) {
		return super.findList(bizMember);
	}
	
	public Page<BizMember> findPage(Page<BizMember> page, BizMember bizMember) {
		return super.findPage(page, bizMember);
	}
	
	@Transactional(readOnly = false)
	public void save(BizMember bizMember) {
		super.save(bizMember);
	}
	
	@Transactional(readOnly = false)
	public void delete(BizMember bizMember) {
		super.delete(bizMember);
	}
	
}