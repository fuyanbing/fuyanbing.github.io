package com.dao;

import java.util.List;

import com.base.BaseDao;
import com.dto.TreeDTO;
import com.model.Resource;

public interface ResourceDao extends BaseDao<Resource>{

	List<TreeDTO> getChildrenByParentId(String id) throws Exception;
	
	public List<Resource> getChildren(int pid) throws Exception;

}
