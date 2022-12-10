package com.controller.vendor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.dao.seller.impl.DAOStoreSellerImpl;
import com.entity.Store;

public class SellerConfig {
	public static Store getStoreByCookies(HttpServletRequest req) {
		int storeId = 0;
		for(Cookie cookie : req.getCookies())
			if(cookie.getName().equals("id"))
				storeId = Integer.valueOf(cookie.getValue());
		Store store = new DAOStoreSellerImpl().getStoreByUserId(storeId);
		return store;
	}
}
