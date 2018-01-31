/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.t2.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 测试Entity
 * @author 卢康乐
 * @version 2018-01-30
 */
public class T2 extends DataEntity<T2> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	private String fx;		// fx
	
	public T2() {
		super();
	}

	public T2(String id){
		super(id);
	}

	@Length(min=0, max=255, message="name长度必须介于 0 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="fx长度必须介于 0 和 255 之间")
	public String getFx() {
		return fx;
	}

	public void setFx(String fx) {
		this.fx = fx;
	}
	
}