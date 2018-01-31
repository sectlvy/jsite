/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.biz.service.store;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.biz.entity.store.BizStore;
import com.thinkgem.jeesite.modules.biz.dao.store.BizStoreDao;

/**
 * 门店Service
 * @author 北冥
 * @version 2018-01-31
 */
@Service
@Transactional(readOnly = true)
public class BizStoreService extends CrudService<BizStoreDao, BizStore> {

	public BizStore get(String id) {
		return super.get(id);
	}
	
	public List<BizStore> findList(BizStore bizStore) {
		return super.findList(bizStore);
	}
	
	public Page<BizStore> findPage(Page<BizStore> page, BizStore bizStore) {
		return super.findPage(page, bizStore);
	}
	
	@Transactional(readOnly = false)
	public void save(BizStore bizStore) {
		super.save(bizStore);
	}
	
	@Transactional(readOnly = false)
	public void delete(BizStore bizStore) {
		super.delete(bizStore);
	}
	
}