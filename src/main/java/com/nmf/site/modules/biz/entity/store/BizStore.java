/**
 * Copyright &copy; 2012-2016 com.nmf All rights reserved.
 */
package com.nmf.site.modules.biz.entity.store;

import org.hibernate.validator.constraints.Length;

import com.nmf.site.common.persistence.DataEntity;

/**
 * 门店Entity
 * @author 北冥
 * @version 2018-01-31
 */
public class BizStore extends DataEntity<BizStore> {
	
	private static final long serialVersionUID = 1L;
	private String storeAccount;		// 门店账户
	private String storeName;		// 名店名称
	private String storeMobile;		// 手机号码
	private String address;		// 门店地址
	private String password;		// password
	
	public BizStore() {
		super();
	}

	public BizStore(String id){
		super(id);
	}

	@Length(min=0, max=255, message="门店账户长度必须介于 0 和 255 之间")
	public String getStoreAccount() {
		return storeAccount;
	}

	public void setStoreAccount(String storeAccount) {
		this.storeAccount = storeAccount;
	}
	
	@Length(min=1, max=255, message="名店名称长度必须介于 1 和 255 之间")
	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	@Length(min=1, max=255, message="手机号码长度必须介于 1 和 255 之间")
	public String getStoreMobile() {
		return storeMobile;
	}

	public void setStoreMobile(String storeMobile) {
		this.storeMobile = storeMobile;
	}
	
	@Length(min=1, max=255, message="门店地址长度必须介于 1 和 255 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=1, max=255, message="password长度必须介于 1 和 255 之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}