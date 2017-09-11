package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.dao.ProvinceDao;
import com.dao.impl.ProvinceDaoImpl;
import com.model.City;
import com.model.Province;


public class ProvinceServlet extends HttpServlet {
	private ProvinceDao pdao = new ProvinceDaoImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("getPro".equals(method)){
			getPro(request,response);
		}else if("getCity".equals(method)){
			getCity(request,response);
		}
	}
	
	/**
	 * 获取所有的省份
	 * */
	private void getPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Province> plist = this.pdao.findAll();
			response.setContentType("text/thml;charset=utf-8");
			response.getWriter().write(JSON.toJSONString(plist));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/***
	 *根据省份的ID获取所有的城市 
	 * */
	private void getCity(HttpServletRequest request,HttpServletResponse response) {
		try {
			String pid = request.getParameter("pid");
			List<City> clist = this.pdao.findCitiesByProId(Integer.parseInt(pid));
			
			response.setContentType("text/thml;charset=utf-8");
			response.getWriter().write(JSON.toJSONString(clist));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
