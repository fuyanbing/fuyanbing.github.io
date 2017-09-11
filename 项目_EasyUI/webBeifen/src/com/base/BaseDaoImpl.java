package com.base;

//动态的获取信息及动态调用方法的机制在Java中称为“反射”（reflection）
import java.lang.reflect.Field;
//Method 提供关于类或接口上单独某个方法（以及如何访问该方法）的信息。所反映的方法可能是类方法或实例方法（包括抽象方法）。
//Method 允许在匹配要调用的实参与底层方法的形参时进行扩展转换；但如果要进行收缩转换，则会抛出 IllegalArgumentException。 
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;//表示预编译的SQL语句的对象。
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBUtils;






/**
 * jdbc连接 1.创建连接对象 2拼sql  3 preparedstatement * 
 * **/
public class BaseDaoImpl<Entity> implements BaseDao<Entity>{
	//public
	protected Class clazz;
	
	public BaseDaoImpl(){
		//输出打印(this.getClass());
		//ParameterizedType获取java泛型参数类型
		//getGenericSuperclass方法可以获取当前对象的直接超类的 Type
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		//带有真是类型参数对象
		// 使用getGenericSuperclass()和getActualTypeArguments()将DAO做成泛型 
		clazz = (Class)pt.getActualTypeArguments()[0];
		System.out.println(clazz);
	}
	
	/**
	 * 保存方法   新增用户
	 * */
	public void save(Entity obj) throws Exception {
		
		//obj.getSimpleName();
		Connection conn = DBUtils.createConn();
		String sql = "insert into " +  clazz.getSimpleName() + " values(null ";
		// 可以获取本类所声明的变量
		Field[] fs = clazz.getDeclaredFields();
		//System.out.println(fs.length);
		
		for (int i = 1; i < fs.length; i++) {
			sql += ",? " ;
		}
		sql = sql + ")";
		//System.out.println(sql);
		
		//进行预编译
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		
		//ps.setString(1, user.getName());
		
		for (int i = 1; i < fs.length; i++) {
			//拼接方法的名称
			String MethodName = "get" +Character.toUpperCase(fs[i].getName().charAt(0)) + fs[i].getName().substring(1) ;
			System.out.println(MethodName);
			Method m = clazz.getMethod(MethodName);
			ps.setObject(i, m.invoke(obj));
		}
		ps.executeUpdate();
		DBUtils.close(ps);
		DBUtils.close(conn);
		
	}
	
	/**
	 * 更新方法  修改用户
	 * */
	public void update(Entity obj) throws Exception{
		
		Connection conn = DBUtils.createConn();
		//update user set name = ?, age = ?, where id =?
		String sql = " update " + clazz.getSimpleName() + " set ";
		//getDeclaredFields()：获得类的所有属性； 
		Field[] fs = clazz.getDeclaredFields();
		for (int i=1; i<fs.length; i++){
			sql += fs[i].getName() + "=?,"; 
		}
		
		sql = sql.substring(0,sql.length()-1) + " where id = ? ";
		
		//进行预编译
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		
		for(int i=1; i<fs.length; i++){
			String methodName = "get" + Character.toUpperCase(fs[i].getName().charAt(0)) + fs[i].getName().substring(1);
			Method m = clazz.getMethod(methodName);
			ps.setObject(i, m.invoke(obj));// user.getName();
		}
		Method m2 = clazz.getMethod("getId");
		ps.setInt(fs.length,(Integer)m2.invoke(obj));
		
		ps.executeUpdate();
		DBUtils.close(ps);
		DBUtils.close(conn);
	}

	/**
	 * 删除方法  删除一条或多条用户数据
	 * */
	public void delete(int id) throws Exception {
		Connection conn = DBUtils.createConn();
		String sql = " delete from " + clazz.getSimpleName() + " where id =" +id;
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		ps.executeUpdate(sql);
		DBUtils.close(ps);
		DBUtils.close(conn);
	}

	/**
	 * 根据id查找对象
	 * */
	public Entity findById(int id) throws Exception {
		//连接数据库
		Connection conn = DBUtils.createConn();
		//拼接字符串
		String sql = " select * from " +  clazz.getSimpleName() + " where id = " + id;
		//进行预编译
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		//跟数据库某一张具体的表产生交互，并获得其中的数据，获得该数据的结果集
		ResultSet rs = ps.executeQuery();
		//newInstance实际上是把new这个方式分解为两步,即，首先调用class的加载方法加载某个类，然后实例化。 
		//这样分步的好处是显而易见的。我们可以在调用class的静态加载方法forName时获得更好的灵活性，提供给了我们降耦的手段。
		Entity entity = (Entity) clazz.newInstance();
		if(rs.next()){
			Field[] fs = clazz.getDeclaredFields();
			for(int i = 0; i<fs.length; i++){
				//拼接方法的名称
				String MethodName = "set" +Character.toUpperCase(fs[i].getName().charAt(0)) + fs[i].getName().substring(1) ;
				Method m = clazz.getDeclaredMethod(MethodName, fs[i].getType());
				m.invoke(entity, rs.getObject(fs[i].getName()));
			}
		}
		DBUtils.close(rs);
		DBUtils.close(ps);
		DBUtils.close(conn);
		return entity;
	} 
	
	
	/**
	 * 查询所有 城市省份
	 * */
	public List<Entity> findAll() throws Exception {
		Connection conn = DBUtils.createConn();
		String sql = " select * from " + clazz.getSimpleName();
		PreparedStatement ps = DBUtils.getPs(conn, sql);
		
		List<Entity> list = new ArrayList<Entity>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			Entity entity = (Entity)clazz.newInstance();
			//newInstance: 弱类型。低效率。只能调用无参构造。
			//new: 强类型。相对高效。能调用任何public构造。
			//newInstance()是实现IOC、反射、面对接口编程 和 依赖倒置 等技术方法的必然选择，new 只能实现具体类的实例化，不适合于接口编程。
			
			Field[] fs = clazz.getDeclaredFields(); 
			//getFields()获得某个类的所有的公共（public）的字段，包括父类。 
			//getDeclaredFields()获得某个类的所有申明的字段，即包括public、private和proteced，但是不包括父类的申明字段。 
			//同样类似的还有getConstructors()和getDeclaredConstructors()，getMethods()和getDeclaredMethods()。
			
			for(int i=0; i<fs.length; i++){
				String methodName = "set" + Character.toUpperCase(fs[i].getName().charAt(0)) + fs[i].getName().substring(1);
				Method m = clazz.getMethod(methodName, fs[i].getType());
				m.invoke(entity, rs.getObject(fs[i].getName()));
			}
			list.add(entity);
		}
		DBUtils.close(rs);
		DBUtils.close(ps);
		DBUtils.close(conn);
		return list;
	}

	/**
	 * 条件查询的反射封装方法
	 */
	
	public List<Entity> queryListForParams(String sql,Object[] params) throws Exception{
		Connection conn = DBUtils.createConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List list = new ArrayList();
		try{
			//建立statement对象（封装了sql）
			ps = conn.prepareStatement(sql);
			if(params != null){
				for(int i=0; i<params.length; i++){
					ps.setObject(i+1, params[i]);
				}
			}
			Field[] fs = clazz.getDeclaredFields();
			rs = ps.executeQuery();
			while(rs.next()){
				Object obj = clazz.getConstructor().newInstance();
				for(int i=0; i<fs.length; i++){
					String methodName = "set" + fs[i].getName().substring(0,1).toUpperCase() + fs[i].getName().substring(1);
					Method m = clazz.getMethod(methodName,fs[i].getType());
					Object value = rs.getObject(fs[i].getName());
					m.invoke(obj, value);
				}
				list.add(obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtils.close(rs);
			DBUtils.close(ps);
			DBUtils.close(conn);
		}
		return list;
	}
	
	
	
	
	
	
}
