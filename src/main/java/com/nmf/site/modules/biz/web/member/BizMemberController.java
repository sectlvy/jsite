/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.biz.web.member;

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
import com.nmf.site.modules.biz.entity.member.BizMember;
import com.nmf.site.modules.biz.service.member.BizMemberService;

/**
 * 会员Controller
 * @author 北冥
 * @version 2018-01-31
 */
@Controller
@RequestMapping(value = "${adminPath}/biz/member/bizMember")
public class BizMemberController extends BaseController {

	@Autowired
	private BizMemberService bizMemberService;
	
	@ModelAttribute
	public BizMember get(@RequestParam(required=false) String id) {
		BizMember entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = bizMemberService.get(id);
		}
		if (entity == null){
			entity = new BizMember();
		}
		return entity;
	}
	
	@RequiresPermissions("biz:member:bizMember:view")
	@RequestMapping(value = {"list", ""})
	public String list(BizMember bizMember, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BizMember> page = bizMemberService.findPage(new Page<BizMember>(request, response), bizMember); 
		model.addAttribute("page", page);
		return "modules/biz/member/bizMemberList";
	}

	@RequiresPermissions("biz:member:bizMember:view")
	@RequestMapping(value = "form")
	public String form(BizMember bizMember, Model model) {
		model.addAttribute("bizMember", bizMember);
		return "modules/biz/member/bizMemberForm";
	}

	@RequiresPermissions("biz:member:bizMember:edit")
	@RequestMapping(value = "save")
	public String save(BizMember bizMember, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, bizMember)){
			return form(bizMember, model);
		}
		bizMemberService.save(bizMember);
		addMessage(redirectAttributes, "保存会员成功");
		return "redirect:"+Global.getAdminPath()+"/biz/member/bizMember/?repage";
	}
	
	@RequiresPermissions("biz:member:bizMember:edit")
	@RequestMapping(value = "delete")
	public String delete(BizMember bizMember, RedirectAttributes redirectAttributes) {
		bizMemberService.delete(bizMember);
		addMessage(redirectAttributes, "删除会员成功");
		return "redirect:"+Global.getAdminPath()+"/biz/member/bizMember/?repage";
	}

}