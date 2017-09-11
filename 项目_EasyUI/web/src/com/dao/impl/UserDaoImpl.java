package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.base.BaseDaoImpl;
import com.dao.UserDao;
import com.model.User;
import com.util.DBUtils;


public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
	
	/**
	 * 分页查询列表信息
	 * */
	public List<User> findByPagination(int currentPage, int pageSize,Map<String,Object>m) throws Exception{
		Connection conn = DBUtils.createConn();
		String sql = " select * from user where 1=1";
		
		Set<Entry<String,Object>> set = m.entrySet();
		Iterator io = set.iterator();//返回了一个实例
		while(io.hasNext()){
			Map.Entry<String, Object> me = (Map.Entry<String, Object>) io.next();
			if("username".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " and " + me.getKey() + " like '%" + me.getValue() + "%'" ;
			}
			if("startTime".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " and " + me.getKey() + " >= '" + me.getValue() + "'" ;
			}
			if("endTime".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " and " + me.getKey() + " <= '" + me.getValue() + "'" ;
			}
			if("sort".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " order by " + me.getValue();
			}
			if("order".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " " + me.getValue();
			}
		}
		sql = sql + " limit " + (currentPage-1)*pageSize + " , " + pageSize ;
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		ResultSet rs = ps.executeQuery();
		
		List<User> ulist = new ArrayList<User>();
		while(rs.next()){
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setAge(rs.getInt("age"));
			user.setBirthday(rs.getString("birthday"));
			user.setCity(rs.getInt("city"));
			user.setSalary(rs.getString("salary"));
			user.setSex(rs.getString("sex"));
			user.setStartTime(rs.getString("startTime"));
			user.setEndTime(rs.getString("endTime"));
			user.setDescription(rs.getString("description"));
			
			ulist.add(user);
		}
		return ulist;
	}
	
	
	/**
	 *  查询表中的所有记录数 
	 * */
	public int getTotal(Map<String, Object> m) throws Exception {
		Connection conn = DBUtils.createConn();
		String sql = " select count(*) from user where 1=1";
		
		Set<Entry<String,Object>> set = m.entrySet();
		Iterator io = set.iterator();//返回了一个实例
		while(io.hasNext()){
			Map.Entry<String, Object> me = (Map.Entry<String, Object>) io.next();
			if("username".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " and " + me.getKey() + " like '%" + me.getValue() + "%'" ;
			}
			if("startTime".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " and " + me.getKey() + " >= '" + me.getValue() + "'" ;
			}
			if("endTime".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " and " + me.getKey() + " <= '" + me.getValue() + "'" ;
			}
			if("sort".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " order by " + me.getValue();
			}
			if("order".equals(me.getKey()) && !"".equals(me.getValue())){
				sql += " " + me.getValue();
			}
		}
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		ResultSet rs = ps.executeQuery();//用于产生单个结果集的语句
		int count = 0;
		if(rs.next()){
			count = rs.getInt(1);
		}
		return count;
	}


	/**
	 * 根据名字查询记录  comboBox 搜索城市用到过
	 */
	public List<User> searchByName(String q) throws Exception {
		Connection conn = DBUtils.createConn();
		String sql = " select * from user where username like '%" + q + "%'";
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		ResultSet rs = ps.executeQuery();
		List<User> ulist = new ArrayList<User>();
		while(rs.next()){
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setAge(rs.getInt("age"));
			user.setBirthday(rs.getString("birthday"));
			user.setCity(rs.getInt("city"));
			user.setSalary(rs.getString("salary"));
			user.setSex(rs.getString("sex"));
			user.setStartTime(rs.getString("startTime"));
			user.setEndTime(rs.getString("endTime"));
			user.setDescription(rs.getString("description"));
			
			ulist.add(user);
		}
		return ulist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}