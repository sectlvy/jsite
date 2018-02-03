/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.biz.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nmf.site.common.persistence.Page;
import com.nmf.site.common.service.CrudService;
import com.nmf.site.common.utils.StringUtils;
import com.nmf.site.modules.biz.dao.member.BizMemberDao;
import com.nmf.site.modules.biz.entity.member.BizMember;

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