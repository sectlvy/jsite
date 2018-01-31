/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.t2.web;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.t2.entity.T2;
import com.thinkgem.jeesite.modules.t2.service.T2Service;

/**
 * 测试Controller
 * @author 卢康乐
 * @version 2018-01-30
 */
@Controller
@RequestMapping(value = "${adminPath}/t2/t2")
public class T2Controller extends BaseController {

	@Autowired
	private T2Service t2Service;
	
	@ModelAttribute
	public T2 get(@RequestParam(required=false) String id) {
		T2 entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = t2Service.get(id);
		}
		if (entity == null){
			entity = new T2();
		}
		return entity;
	}
	
	@RequiresPermissions("t2:t2:view")
	@RequestMapping(value = {"list", ""})
	public String list(T2 t2, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<T2> page = t2Service.findPage(new Page<T2>(request, response), t2); 
		model.addAttribute("page", page);
		return "modules/t2/t2List";
	}

	@RequiresPermissions("t2:t2:view")
	@RequestMapping(value = "form")
	public String form(T2 t2, Model model) {
		model.addAttribute("t2", t2);
		return "modules/t2/t2Form";
	}

	@RequiresPermissions("t2:t2:edit")
	@RequestMapping(value = "save")
	public String save(T2 t2, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, t2)){
			return form(t2, model);
		}
		t2Service.save(t2);
		addMessage(redirectAttributes, "保存卢康乐测试成功");
		return "redirect:"+Global.getAdminPath()+"/t2/t2/?repage";
	}
	
	@RequiresPermissions("t2:t2:edit")
	@RequestMapping(value = "delete")
	public String delete(T2 t2, RedirectAttributes redirectAttributes) {
		t2Service.delete(t2);
		addMessage(redirectAttributes, "删除卢康乐测试成功");
		return "redirect:"+Global.getAdminPath()+"/t2/t2/?repage";
	}

}