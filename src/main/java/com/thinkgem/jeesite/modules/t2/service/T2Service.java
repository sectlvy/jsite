/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.t2.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.t2.entity.T2;
import com.thinkgem.jeesite.modules.t2.dao.T2Dao;

/**
 * 测试Service
 * @author 卢康乐
 * @version 2018-01-30
 */
@Service
@Transactional(readOnly = true)
public class T2Service extends CrudService<T2Dao, T2> {

	public T2 get(String id) {
		return super.get(id);
	}
	
	public List<T2> findList(T2 t2) {
		return super.findList(t2);
	}
	
	public Page<T2> findPage(Page<T2> page, T2 t2) {
		return super.findPage(page, t2);
	}
	
	@Transactional(readOnly = false)
	public void save(T2 t2) {
		super.save(t2);
	}
	
	@Transactional(readOnly = false)
	public void delete(T2 t2) {
		super.delete(t2);
	}
	
}