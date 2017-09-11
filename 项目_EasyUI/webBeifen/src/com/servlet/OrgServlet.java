package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.dao.OrgDao;
import com.dao.impl.OrgDaoImpl;
import com.model.Org;

public class OrgServlet extends HttpServlet {
	
	private OrgDao	odao = new OrgDaoImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String method = request.getParameter("method");
			if("getOrgList".equals(method)){
				getOrgList(request , response);
			} else if("save".equals(method)){
				save(request , response);
			} else if("update".equals(method)){
				update(request, response);
			} else if("delete".equals(method)){
				delete(request , response);
			}
	}
	
	/**
	 * 获取组织机构数据 
	 * @param request
	 * @param response
	 */
	private void getOrgList(HttpServletRequest request,
			HttpServletResponse response) {
		try{
			String id = request.getParameter("id");
			List<Org> ogrList = this.odao.findList(id);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(JSON.toJSONString(ogrList));				
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 保存方法
	 * @param request
	 * @param response
	 */
	private void save(HttpServletRequest request, HttpServletResponse response) {
		try {
			String name = request.getParameter("name");
			String parentId = request.getParameter("parentId");
			String principal = request.getParameter("principal");
			String count = request.getParameter("count");
			String description = request.getParameter("description");
			
			Org org = new Org();
			org.setName(name);
			org.setDescription(description);
			org.setParent_id(Integer.parseInt(parentId));
			org.setCount(Integer.parseInt(count));
			org.setPrincipal(principal);
			
			this.odao.save(org);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void update(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	private void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
