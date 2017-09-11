package com.dao;

import java.util.List;

import com.base.BaseDao;
import com.model.Org;

public interface OrgDao extends BaseDao<Org>{
	List<Org> findList (String id) throws Exception;
	public List<Org> getChildren(int id) throws Exception;
}
