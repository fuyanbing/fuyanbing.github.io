package com.dao;

import java.util.List;

import com.base.BaseDao;
import com.model.City;
import com.model.Province;

public interface ProvinceDao extends BaseDao<Province> {
	
	List<City> findCitiesByProId(int parseInt) throws Exception;

}
