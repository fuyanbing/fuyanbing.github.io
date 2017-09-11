package com.dao;

import java.util.List;
import java.util.Map;

import com.base.BaseDao;
import com.model.User;


public interface UserDao extends BaseDao<User> {
	//分页查询列表信息
	List<User> findByPagination(int currentPage, int pageSize,Map<String, Object> m) throws Exception;
	//总计
	public int getTotal(Map<String ,Object> m) throws Exception ;
	//combobox 城市搜索
	List<User> searchByName(String q) throws Exception;
	
}
