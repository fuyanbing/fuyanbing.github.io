package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.dao.ResourceDao;
import com.dao.impl.ResourceDaoImpl;
import com.dto.TreeDTO;
import com.model.Resource;

/**
 * EasyUI tree 加载 增删改查。。。。。。
 * */
public class ResourceServlet extends HttpServlet {
	private ResourceDao rdao = new ResourceDaoImpl();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		
		if("loadTree".equals(method)){
			loadTree(request , response);
		} else if("changeLevel".equals(method)){
			changeLevel(request , response);
		} else if("save".equals(method)){
			save(request , response);
		} else if("update".equals(method)){
			update(request,response);
		} else if("delete".equals(method)){
			delete(request ,response);
		}
	}

	/**
	 * 加载tree的数据方法
	 * */
	private void loadTree(HttpServletRequest request,
			HttpServletResponse response) {
		try{
			String id = request.getParameter("id");
			List<TreeDTO> treelist = this.rdao.getChildrenByParentId(id);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(JSON.toJSONString(treelist));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 改变节点的层次结构方法  
	 * @param request
	 * @param response
	 */
	private void changeLevel(HttpServletRequest request,
			HttpServletResponse response) {

		try{
			String targetId = request.getParameter("targetId");
			String sourceId = request.getParameter("sourceId");
			String point    = request.getParameter("point");
			//得到目标对象
			Resource  target = this.rdao.findById(Integer.parseInt(targetId));
			//得到操作的对象(源对象)
			Resource  source = this.rdao.findById(Integer.parseInt(sourceId));
			// append  top bottom
			if("append".equals(point)){
				source.setParent_id(target.getId());
			} else {
				source.setParent_id(target.getParent_id());
			}
			this.rdao.update(source);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	private void save(HttpServletRequest request, HttpServletResponse response) {

		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) {
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}


	
	
	
	
	
	
	
}
