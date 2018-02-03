/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nmf.site.common.service.CrudService;
import com.nmf.site.common.utils.CacheUtils;
import com.nmf.site.modules.sys.dao.DictDao;
import com.nmf.site.modules.sys.entity.Dict;
import com.nmf.site.modules.sys.utils.DictUtils;

/**
 * 字典Service
 * @author 北冥
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class DictService extends CrudService<DictDao, Dict> {
	
	/**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}

	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

}
