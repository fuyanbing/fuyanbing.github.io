package com.servlet;

import java.io.IOException; //IO流异常
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException; //Servlet异常
import javax.servlet.http.HttpServlet;//提供要作为子类的抽象类，以创建适合于Web站点的HTTP Servlet。
import javax.servlet.http.HttpServletRequest;//servlet容器创建一个HttpServletRequest 对象，并将其作为参数传递给Servlet的服务方法（doGet，doPost，等）。
//定义一个对象以帮助servlet向客户端发送响应。servlet容器创建一个ServletResponse对象，并将其作为参数传递给servlet的service方法。
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.alibaba.fastjson.JSON;
import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.model.City;
import com.model.User;



public class UserServlet extends HttpServlet{
	
	private UserDao udao = new UserDaoImpl();
	
	//	doGet，由服务器（通过调用service方法），以允许一个servlet处理GET请求。
	public void doGet(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		//由服务器（通过调用service方法），以允许servlet来处理POST请求。HTTP POST方法允许客户端单次向Web服务器发送无限长度的数据，并且当发布诸如信用卡号的信息时是有用的。
		doPost(request,response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
		
		request.setCharacterEncoding("utf-8");
		//得到的都是String类型的。或者是用于读取提交的表单中的值（http://a.jsp?id=123中的123），或者是某个表单提交过去的数据；
		String method = request.getParameter("method");
		//比较字符串与指定的对象。其结果是true当且仅当参数不为null，并且是一个String对象，这个对象表示相同的字符序列
		if("getCity".equals(method)){
			getCity(request,response);
		}else if("save".equals(method)){
			save(request,response);
		}else if("getList".equals(method)){
			getList(request , response);
		} else if("update".equals(method)){
			update(request , response);
		} else if("delete".equals(method)){
			delete(request , response);
		} else if("getCityName".equals(method)){
			getCityName(request , response);
		} else if("searchName".equals(method)){
			searchName(request , response);
		}
	}


	/**
	 * 获取城市数据 / 新增修改弹层 获取城市信息
	 * */
	private void getCity(HttpServletRequest request,
		HttpServletResponse response) {
		try{
			List<City> clist = new ArrayList<City>();
			clist.add(new City(1,"北京",0));
			clist.add(new City(2,"上海",0));
			clist.add(new City(3,"深圳",0));
			clist.add(new City(4,"长春",0));
			response.setContentType("text/thml;charset=utf-8");
			//String str = JSONArray.fromObject(clist).toString();
			String str =JSON.toJSONString(clist);
			response.getWriter().write(str);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 用户保存方法、新增用户 
	 */
	//JDK5.0后的新特性，你在使用IDE如eclipse的时候，当你定义了一个变量如int a=0;但是你后面根本就没有使用到这个变量，这一行的前面会有一个黄色的警告标志，你将鼠标移动到上面会提示“这个变量从未被使用”，你用上面的标注后就没有这个提示了。
	@SuppressWarnings("unused")
	private void save(HttpServletRequest request,
		HttpServletResponse response) {
		try{
			//获取值
			String username = request.getParameter("username");//getParameter()是获取POST/GET传递的参数值
			String password = request.getParameter("password");
			String sex = request.getParameter("sex");
			int age = Integer.parseInt(request.getParameter("age"));
			String birthday = request.getParameter("birthday");
			int city = Integer.parseInt(request.getParameter("city"));
			String salary = request.getParameter("salary");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String description = request.getParameter("description");
			//设置值
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setSex(sex);
			user.setAge(age);
			user.setBirthday(birthday);
			user.setCity(city);
			user.setSalary(salary);
			user.setStartTime(startTime);
			user.setEndTime(endTime);
			user.setDescription(description);
			
			this.udao.save(user);
			
			response.setContentType("text/html;charset=utf-8");
			String str = "{\"status\":\"ok\",\"message\":\"操作成功\"}";
			response.getWriter().write(str);
			
		}catch(Exception e){
			response.setContentType("text/html;charset=utf-8");
			String str = "{\"status\":\"fail\",\"message\":\"操作失败\"}";
			try{
				response.getWriter().write(str);
			}catch(IOException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取用户列表信息
	 */
	private void getList(HttpServletRequest request,
		HttpServletResponse response){
		try{
			int currentPage = Integer.parseInt(request.getParameter("page"));
			int pageSize = Integer.parseInt(request.getParameter("rows"));
			
			String username = request.getParameter("username") == null?"":request.getParameter("username");
			String startTime = request.getParameter("startTime") == null?"":request.getParameter("startTime");
			String endTime = request.getParameter("endTime") == null?"":request.getParameter("endTime");
			String order = request.getParameter("order") == null?"":request.getParameter("order");
			String sort = request.getParameter("sort") == null?"":request.getParameter("sort");
			
			Map<String,Object> m = new HashMap<String,Object>();
			m.put("username", username);
			m.put("startTime", startTime);
			m.put("endTime", endTime);
			m.put("order", order);
			m.put("sort", sort);
			
			List<User> ulist = this.udao.findByPagination(currentPage,pageSize,m);
			int total = this.udao.getTotal(m);
			response.setContentType("text/html;charset=utf-8");
			/*String json = "{\"total\":" + total + ",\"rows\":" +JSONArray.fromObject(ulist).toString() + "}";*/
			String json = "{\"total\":" + total + ",\"rows\":" + JSON.toJSONString(ulist) + "}";
			response.getWriter().write(json);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 修改用户
	 */
	private void update(HttpServletRequest request, HttpServletResponse response) {
		try{
			int id = Integer.parseInt(request.getParameter("id"));
			User user = this.udao.findById(id);
			
			//获取值
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String sex = request.getParameter("sex");
			int age = Integer.parseInt(request.getParameter("age"));
			String birthday = request.getParameter("birthday");
			int city = Integer.parseInt(request.getParameter("city"));
			String salary = request.getParameter("salary");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String description = request.getParameter("description");
			
			//设置值
			user.setUsername(username);
			user.setPassword(password);
			user.setSex(sex);
			user.setAge(age);
			user.setBirthday(birthday);
			user.setCity(city);
			user.setSalary(salary);
			user.setStartTime(startTime);
			user.setEndTime(endTime);
			user.setDescription(description);
			
			this.udao.update(user);
			
			response.setContentType("text/html;charset=utf-8");
			String str = "{\"status\":\"ok\",\"message\":\"操作成功\"}";
			response.getWriter().write(str);
			
		}catch(Exception e){
			response.setContentType("text/html;charset=utf-8");
			String str = "{\"status\":\"fail\",\"message\":\"操作失败\"}";
			try{
				response.getWriter().write(str);
			}catch(IOException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	

	/**
	 * 删除一条或多条用户数据
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) {
		try{
			String[] ids = request.getParameter("ids").split(",");
			for (int i=0; i<ids.length; i++){
				this.udao.delete(Integer.parseInt(ids[i]));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 根据城市id号 获取指定城市对象 
	 */
	private void getCityName(HttpServletRequest request,
		HttpServletResponse response){
		try{
			List<City> clist = new ArrayList<City>();
			clist.add(new City(1,"北京",0));
			clist.add(new City(2,"上海",0));
			clist.add(new City(3,"深圳",0));
			clist.add(new City(4,"长春",0));
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			for(Iterator iterator = clist.iterator(); iterator.hasNext();){
				City city = (City) iterator.next();
				if(city.getId() == id){
					response.setContentType("text/thml;charset=utf-8");
					response.getWriter().write(JSON.toJSONString(city));
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	/**
	 * comboBox 城市搜索 自动搜索的方法 
	 * */
	private void searchName(HttpServletRequest request,
			HttpServletResponse response) {
		try{
			String q = request.getParameter("q") == null?"":request.getParameter("q");
			List<User> ulist = this.udao.searchByName(q.trim());
			response.setContentType("text/thml;charset=utf-8");
			response.getWriter().write(JSON.toJSONString(ulist));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}