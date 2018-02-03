/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.biz.web.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nmf.site.common.config.Global;
import com.nmf.site.common.persistence.Page;
import com.nmf.site.common.utils.StringUtils;
import com.nmf.site.common.web.BaseController;
import com.nmf.site.modules.biz.entity.store.BizStore;
import com.nmf.site.modules.biz.service.store.BizStoreService;

/**
 * 门店Controller
 * @author 北冥
 * @version 2018-01-31
 */
@Controller
@RequestMapping(value = "${adminPath}/biz/store/bizStore")
public class BizStoreController extends BaseController {

	@Autowired
	private BizStoreService bizStoreService;
	
	@ModelAttribute
	public BizStore get(@RequestParam(required=false) String id) {
		BizStore entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = bizStoreService.get(id);
		}
		if (entity == null){
			entity = new BizStore();
		}
		return entity;
	}
	
	@RequiresPermissions("biz:store:bizStore:view")
	@RequestMapping(value = {"list", ""})
	public String list(BizStore bizStore, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BizStore> page = bizStoreService.findPage(new Page<BizStore>(request, response), bizStore); 
		model.addAttribute("page", page);
		return "modules/biz/store/bizStoreList";
	}

	@RequiresPermissions("biz:store:bizStore:view")
	@RequestMapping(value = "form")
	public String form(BizStore bizStore, Model model) {
		model.addAttribute("bizStore", bizStore);
		return "modules/biz/store/bizStoreForm";
	}

	@RequiresPermissions("biz:store:bizStore:edit")
	@RequestMapping(value = "save")
	public String save(BizStore bizStore, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, bizStore)){
			return form(bizStore, model);
		}
		bizStoreService.save(bizStore);
		addMessage(redirectAttributes, "保存门店成功");
		return "redirect:"+Global.getAdminPath()+"/biz/store/bizStore/?repage";
	}
	
	@RequiresPermissions("biz:store:bizStore:edit")
	@RequestMapping(value = "delete")
	public String delete(BizStore bizStore, RedirectAttributes redirectAttributes) {
		bizStoreService.delete(bizStore);
		addMessage(redirectAttributes, "删除门店成功");
		return "redirect:"+Global.getAdminPath()+"/biz/store/bizStore/?repage";
	}

}