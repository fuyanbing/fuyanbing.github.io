package com.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;



public class DBUtils {
	private static Properties props = new Properties();
	
	static{
		InputStream is = null;
		
		is = DBUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try{
			props.load(is);//Properties类提供了Load方法，支持以inputstream为参数，读取配置文件。
		}catch(IOException e){
			e.printStackTrace();//输入输出异常，往往是在字符流、文件读或者写时发生的异常。
		}finally{
			if(is != null){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//获取连接
	public static Connection createConn(){
		Connection conn = null;
			try {
				Class.forName((String)props.get("driver"));
				//ip地址 + 数据库 用户名 密码
				conn = DriverManager.getConnection((String)props.get("url"), (String)props.get("username"), (String)props.get("password"));
			} catch (ClassNotFoundException e) {//说明无法找到指定的类异常
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return conn;
	}
	
	//编译执行
	public static PreparedStatement getPs(Connection conn,String sql){
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}
	
	public static void close(Connection conn){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs){
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement ps){
		if(ps != null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
}
