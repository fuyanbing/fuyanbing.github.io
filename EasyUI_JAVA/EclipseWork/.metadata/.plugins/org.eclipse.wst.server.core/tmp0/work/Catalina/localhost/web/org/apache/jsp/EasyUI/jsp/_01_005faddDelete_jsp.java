/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.75
 * Generated at: 2017-05-18 03:26:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.EasyUI.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class _01_005faddDelete_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"EasyUI/css/easyui.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"EasyUI/css/icon.css\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"EasyUI/js/jquery-1.7.2.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"EasyUI/js/jquery.easyui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"EasyUI/js/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"EasyUI/css/yemian.css\" />\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("\t/**\r\n");
      out.write("\t\t表单验证\r\n");
      out.write("\t**/\r\n");
      out.write("\t//自定义的效验器\r\n");
      out.write("\t$.extend($.fn.validatebox.defaults.rules,{\r\n");
      out.write("\t\t//a<value<b\r\n");
      out.write("\t\tmidLength:{\r\n");
      out.write("\t\t\tvalidator:function(value,param){\r\n");
      out.write("\t\t\t\treturn value.length >= param[0] && value.length <= param[1];\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tmessage:''\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\t//value == c\r\n");
      out.write("\t\tequalLength:{\r\n");
      out.write("\t\t\tvalidator:function(value,param){\r\n");
      out.write("\t\t\t\treturn value.length == param[0];\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tmessage:''\r\n");
      out.write("\t\t}\r\n");
      out.write("\t})\r\n");
      out.write("\t//年龄验证\r\n");
      out.write("\t$('#age').numberbox({\r\n");
      out.write("\t\tmin:0,\r\n");
      out.write("\t\tmax:150,\r\n");
      out.write("\t\trequired:true,\t\t\t\t\t\t\t//定义是否字段应被输入。\r\n");
      out.write("\t\tmissingMessage:'年龄必填！',\t\t\t\t//当文本框是空时出现的提示文字。\r\n");
      out.write("\t\tprecision:0\t\t\t\t\t\t\t\t//显示在小数点后面的最大精度。\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//出生日期验证\r\n");
      out.write("\t$('#birthday').datebox({\r\n");
      out.write("\t\trequired:true,\r\n");
      out.write("\t\tmissingMessage:'生日必填！',\r\n");
      out.write("\t\teditable:false\t\t\t\t\t\t\t//定义是否用户可以往文本域中直接输入文字。\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//薪水验证\r\n");
      out.write("\t$('#salary').numberbox({\r\n");
      out.write("\t\tmin:1000,\r\n");
      out.write("\t\tmax:20000,\r\n");
      out.write("\t\trequired:true,\r\n");
      out.write("\t\tmissingMessage:'薪水必填！',\r\n");
      out.write("\t\tprecision:2\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t//开始时间结束时间验证\r\n");
      out.write("\t$('#startTime,#endTime').datetimebox({\r\n");
      out.write("\t\trequired:true,\r\n");
      out.write("\t\tmissingMessage:'时间必填！',\r\n");
      out.write("\t\teditable:false\r\n");
      out.write("\t});\r\n");
      out.write("\t/**\r\n");
      out.write("\t\t初始化数据表格\r\n");
      out.write("\t**/\r\n");
      out.write("\tvar flag ; //undefined 判断新增和修改方法\r\n");
      out.write("\t$('#t_user').datagrid({\r\n");
      out.write("\t\tidField:'id',\t\t\t\t\t\t\t\t\t//标识字段。\r\n");
      out.write("\t\ttitle:'用户列表',\t\t\t\t\t\t\t\t\t//列的标题文字。\r\n");
      out.write("\t\tfit:true,\t\t\t\t\t\t\t\t\t\t//Calendar 当设置为 true 时，则设置日历的尺寸以适应它的父容器\r\n");
      out.write("\t\theight:450,\r\n");
      out.write("\t\turl:'UserServlet?method=getList',//从远程站点请求数据的 URL。\r\n");
      out.write("\t\tfitColumns:true,//True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。\r\n");
      out.write("\t\tstriped:true,//True 就把行条纹化。（即奇偶行使用不同背景色）\r\n");
      out.write("\t\tloadMsg:'数据正在加载,请耐心等待.......',//当从远程站点加载数据时，显示的提示信息。\r\n");
      out.write("\t\trownumbers:true,//True 就会显示行号的列。\r\n");
      out.write("\t\trowStyler:function(index,record){//返回例如 'background:red' 的样式，该函数需要两个参数：\trowIndex： 行的索引，从 0 开始。rowData： 此行相应的记录。\r\n");
      out.write("\t\t\tif(record.age > 25){\r\n");
      out.write("\t\t\t\treturn \"background:red\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\tfrozenColumns:[[\t\t\t\t\t\t//冻结列特性，不要与fitColumns特性一起使用\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tfield:'ck',\r\n");
      out.write("\t\t\t\twidth:50,\r\n");
      out.write("\t\t\t\tcheckbox:true\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t]],\r\n");
      out.write("\t\tcolumns:[[\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tfield:'username',\r\n");
      out.write("\t\t\t\ttitle:'用户名',\r\n");
      out.write("\t\t\t\twidth:100,\r\n");
      out.write("\t\t\t\talign:'center',\r\n");
      out.write("\t\t\t\tstyler:function(value,record){\r\n");
      out.write("\t\t\t\t\tif(value == 'admin'){\r\n");
      out.write("\t\t\t\t\t\treturn 'background:blue;';\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'password',\r\n");
      out.write("\t\t\t\ttitle:'密码',\r\n");
      out.write("\t\t\t\twidth:100,\r\n");
      out.write("\t\t\t\t//hidden:true  隐藏当前列\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'age',\r\n");
      out.write("\t\t\t\ttitle:'年龄',\r\n");
      out.write("\t\t\t\twidth:100,\r\n");
      out.write("\t\t\t\tsortable:true\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'sex',\r\n");
      out.write("\t\t\t\ttitle:'性别',\r\n");
      out.write("\t\t\t\twidth:50,\r\n");
      out.write("\t\t\t\tformatter:function(value,record,index){\r\n");
      out.write("\t\t\t\t\tif(value == 1){\r\n");
      out.write("\t\t\t\t\t\treturn '<span style=color:red; >男</span>';\r\n");
      out.write("\t\t\t\t\t}else if(value == 2){\r\n");
      out.write("\t\t\t\t\t\treturn '<span style=color:green; >女</span>';\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'birthday',\r\n");
      out.write("\t\t\t\ttitle:'生日',\r\n");
      out.write("\t\t\t\twidth:100,\r\n");
      out.write("\t\t\t\tsortable:true\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'startTime',\r\n");
      out.write("\t\t\t\ttitle:'开始时间',\r\n");
      out.write("\t\t\t\twidth:150\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'endTime',\r\n");
      out.write("\t\t\t\ttitle:'结束时间',\r\n");
      out.write("\t\t\t\twidth:150\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'city' ,\r\n");
      out.write("\t\t\t\ttitle:'所属城市' ,\r\n");
      out.write("\t\t\t\twidth:100 ,\r\n");
      out.write("\t\t\t\tformatter:function(value , record , index){\r\n");
      out.write("\t\t\t\t\t/*  if(value==1){\r\n");
      out.write("\t\t\t\t\t\treturn '北京';\r\n");
      out.write("\t\t\t\t\t} else if(value == 2){\r\n");
      out.write("\t\t\t\t\t\treturn '上海';\r\n");
      out.write("\t\t\t\t\t} else if(value == 3){\r\n");
      out.write("\t\t\t\t\t\treturn '深圳';\r\n");
      out.write("\t\t\t\t\t} else if(value == 4){\r\n");
      out.write("\t\t\t\t\t\treturn '长春';\r\n");
      out.write("\t\t\t\t\t}  */\r\n");
      out.write("\t\t\t\t\tvar str = '';\r\n");
      out.write("\t\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\t\ttype:'post',\r\n");
      out.write("\t\t\t\t\t\turl:'UserServlet?method=getCityName',\r\n");
      out.write("\t\t\t\t\t\tcache:false,\r\n");
      out.write("\t\t\t\t\t\tasync:false, //同步请求\r\n");
      out.write("\t\t\t\t\t\tdata:{id:value},\r\n");
      out.write("\t\t\t\t\t\tdataType:'json',\r\n");
      out.write("\t\t\t\t\t\tsuccess:function(result){\r\n");
      out.write("\t\t\t\t\t\t\tstr = result.name;\r\n");
      out.write("\t\t\t\t\t\t\t//console.info(result);\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\treturn str; \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'salary' ,\r\n");
      out.write("\t\t\t\ttitle:'薪水' ,\r\n");
      out.write("\t\t\t\twidth:100\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:'description' ,\r\n");
      out.write("\t\t\t\ttitle:'个人描述' ,\r\n");
      out.write("\t\t\t\twidth:150 , \r\n");
      out.write("\t\t\t\tformatter:function(value , record , index){\r\n");
      out.write("\t\t\t\t\treturn '<span title='+value+'>'+value+'</span>';\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t]],\r\n");
      out.write("\t\tpagination:true,\r\n");
      out.write("\t\tpageSize:10,\r\n");
      out.write("\t\tpageList:[5,10,15,20,50],\r\n");
      out.write("\t\ttoolbar:[\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ttext:'新增用户',\r\n");
      out.write("\t\t\t\ticonCls:'icon-add',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\tflag = 'add',\r\n");
      out.write("\t\t\t\t\t$('#mydialog').dialog({\r\n");
      out.write("\t\t\t\t\t\ttitle:'新增用户'\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t$('#myform').get(0).reset();\t\t\t//重置表格\r\n");
      out.write("\t\t\t\t\t$('#mydialog').dialog('open');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'修改用户',\r\n");
      out.write("\t\t\t\ticonCls:'icon-edit',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\tflag = 'edit';\r\n");
      out.write("\t\t\t\t\tvar arr = $('#t_user').datagrid('getSelections');//过去所有选中的面板（panel）\r\n");
      out.write("\t\t\t\t\tif(arr.length != 1){\r\n");
      out.write("\t\t\t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t\t\t\ttitle:'提示信息！',\r\n");
      out.write("\t\t\t\t\t\t\tmsg:'只能选择一行记录进行修改！'\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t$('#mydialog').dialog({\r\n");
      out.write("\t\t\t\t\t\t\ttitle:'修改用户'\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t$('#mydialog').dialog('open');//打开窗口\r\n");
      out.write("\t\t\t\t\t\t$('#myform').get(0).reset();//重置表单\r\n");
      out.write("\t\t\t\t\t\t$('#myform').form('load',{  \t//装载数据\r\n");
      out.write("\t\t\t\t\t\t\tid:arr[0].id,\r\n");
      out.write("\t\t\t\t\t\t\tusername:arr[0].username,\r\n");
      out.write("\t\t\t\t\t\t\tpassword:arr[0].password,\r\n");
      out.write("\t\t\t\t\t\t\tsex:arr[0].sex,\r\n");
      out.write("\t\t\t\t\t\t\tage:arr[0].age,\r\n");
      out.write("\t\t\t\t\t\t\tbirthday:arr[0].birthday,\r\n");
      out.write("\t\t\t\t\t\t\tcity:arr[0].city,\r\n");
      out.write("\t\t\t\t\t\t\tsalary:arr[0].salary,\r\n");
      out.write("\t\t\t\t\t\t\tstartTime:arr[0].startTime,\r\n");
      out.write("\t\t\t\t\t\t\tendTime:arr[0].endTime,\r\n");
      out.write("\t\t\t\t\t\t\tdescription:arr[0].description\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'删除用户',\r\n");
      out.write("\t\t\t\ticonCls:'icon-remove',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\tvar arr = $('#t_user').datagrid('getSelections');\r\n");
      out.write("\t\t\t\t\tif(arr.length<=0){\r\n");
      out.write("\t\t\t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t\t\t\ttitle:'提示信息！',\r\n");
      out.write("\t\t\t\t\t\t\tmsg:'至少选择一行记录进行删除！'\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t$.messager.confirm('提示信息','确认删除？',function(r){\r\n");
      out.write("\t\t\t\t\t\t\tif(r){\r\n");
      out.write("\t\t\t\t\t\t\t\tvar ids = '' ;\r\n");
      out.write("\t\t\t\t\t\t\t\tfor(var i=0; i<arr.length; i++){\r\n");
      out.write("\t\t\t\t\t\t\t\t\tids += arr[i].id + ',' ;\r\n");
      out.write("\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\tids = ids.substring(0,ids.length-1);\r\n");
      out.write("\t\t\t\t\t\t\t\t$.post('UserServlet?method=delete' ,{ids:ids},function(result){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t//1、刷新表格数据\r\n");
      out.write("\t\t\t\t\t\t\t\t\t$('#t_user').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t//2、清空选中的\r\n");
      out.write("\t\t\t\t\t\t\t\t\t$('#t_user').datagrid('unselectAll');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t//3、提示成功\r\n");
      out.write("\t\t\t\t\t\t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\ttitle:'提示信息！',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tmsg:'操作成功！'\r\n");
      out.write("\t\t\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\t\treturn ;\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'查询用户',\r\n");
      out.write("\t\t\t\ticonCls:'icon-search',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\t//展开指定的面板（panel），'region' 参数可能的值是：'north'、'south'、'east'、'west'。\r\n");
      out.write("\t\t\t\t\t$('#lay').layout('expand' , 'north');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t]\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t/***\r\n");
      out.write("\t*\t表单提交方法\r\n");
      out.write("\t*/\r\n");
      out.write("\t$('#btn1').click(function(){\r\n");
      out.write("\t\tif($('#myform').form('validate')){\t\t//validate 进行表单字段验证，当全部字段都有效时返回 true 。这个方法和 validatebox 插件一起使用。\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\ttype:'post',\r\n");
      out.write("\t\t\t\turl:flag=='add'?'UserServlet?method=save':'UserServlet?method=update',\r\n");
      out.write("\t\t\t\tcache:false,\r\n");
      out.write("\t\t\t\tdata:$('#myform').serialize(),\r\n");
      out.write("\t\t\t\tdataType:'json',\r\n");
      out.write("\t\t\t\tsuccess:function(result){\r\n");
      out.write("\t\t\t\t\t//1 关闭窗口\r\n");
      out.write("\t\t\t\t\t$('#mydialog').dialog('close');\r\n");
      out.write("\t\t\t\t\t//2 刷新 datagrid\r\n");
      out.write("\t\t\t\t\t$('#t_user').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t//3、清空选中的\r\n");
      out.write("\t\t\t\t\t$('#t_user').datagrid('unselectAll');\r\n");
      out.write("\t\t\t\t\t//4 提示信息\r\n");
      out.write("\t\t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t\t\ttitle:result.status,\r\n");
      out.write("\t\t\t\t\t\tmsg:result.message\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\terror:function(result){\r\n");
      out.write("\t\t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t\t\ttitle:result.status,\r\n");
      out.write("\t\t\t\t\t\tmsg:result.message\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\t \r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\ttitle:'提示信息！',\r\n");
      out.write("\t\t\t\tmsg:'数据验证不通过,不能保存！'\r\n");
      out.write("\t\t\t})\r\n");
      out.write("\t\t}\r\n");
      out.write("\t})\r\n");
      out.write("\t\r\n");
      out.write("\t/***\r\n");
      out.write("\t*\t关闭窗口\r\n");
      out.write("\t*/\r\n");
      out.write("\t$('#btn2').click(function(){\r\n");
      out.write("\t\t$('#mydialog').dialog('close');\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t/***\r\n");
      out.write("\t*\t搜索查询\r\n");
      out.write("\t*/\r\n");
      out.write("\t$('#searchbtn').click(function(){\r\n");
      out.write("\t\t$('#t_user').datagrid('load',serializeForm($('#mysearch')));\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t/***\r\n");
      out.write("\t*\t重置搜索\r\n");
      out.write("\t*/\r\n");
      out.write("\t$('#clearbtn').click(function(){\r\n");
      out.write("\t\t$('#mysearch').form('clear');\r\n");
      out.write("\t\t$('#t_user').datagrid('load',{});\r\n");
      out.write("\t})\r\n");
      out.write("\r\n");
      out.write("});\r\n");
      out.write("//js方法： 序列化表单\r\n");
      out.write("function serializeForm(form){\r\n");
      out.write("\tvar obj = {};\r\n");
      out.write("\t$.each(form.serializeArray(),function(index){\r\n");
      out.write("\t\tif(obj[this['name']]){\r\n");
      out.write("\t\t\tobj[this['name']] = obj[this['name']] + ',' + this['value'];\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\tobj[this['name']] = this['value'];\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\treturn obj;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<title>DataGrid 数据表格 增删改查</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"lay\" class=\"easyui-layout\" style=\"width:1200px;height:475px; margin: 0 auto;\" > \r\n");
      out.write("    <div region=\"north\" title=\"用户查询\"   style=\"height:100px;\">\r\n");
      out.write("    \t<form id=\"mysearch\" method=\"post\">\r\n");
      out.write("    \t\t用户名 <input name=\"username\" class=\"easyui-validatebox\" value=\"\" /> &nbsp; &nbsp;\r\n");
      out.write("    \t\t开始时间 <input name=\"startTime\" class=\"easyui-datetimebox\" style=\"width:160px\" editable=\"false\" value=\"\" /> &nbsp; &nbsp;\r\n");
      out.write("    \t\t结束时间 <input name=\"endTime\" class=\"easyui-datetimebox\" style=\"width:160px\" editable=\"false\" value=\"\" /> &nbsp; &nbsp;\r\n");
      out.write("    \t\t<a id=\"searchbtn\" class=\"easyui-linkbutton\">查询</a>\r\n");
      out.write("    \t\t<a id=\"clearbtn\" class=\"easyui-linkbutton\">清空</a>\r\n");
      out.write("    \t</form>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div region=\"center\" style=\"height:375px;\"><table id=\"t_user\"></table></div>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"mydialog\"  title=\"新增用户\"  modal=true  class=\"easyui-dialog\"  closed=true  style=\"width:300px\">\r\n");
      out.write("\t<form id=\"myform\" action=\"\" method=\"post\">\r\n");
      out.write("\t    <input type=\"hidden\" name=\"id\" value=\"\" />\r\n");
      out.write("\t    <table>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>用户名:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" name=\"username\" class=\"easyui-validatebox\" required=true validType=\"midLength[2,5]\" missingMessage=\"用户名必填！\" invalidMessage=\"用户名必须在2到5个字符之间！\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>密码:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" name=\"password\" class=\"easyui-validatebox\" required=true validType=\"equalLength[4]\" missingMessage=\"密码必填！\" invalidMessage=\"密码必须为4位\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>性别:</td>\r\n");
      out.write("\t    \t\t<td>\r\n");
      out.write("\t    \t\t\t男:<input type=\"radio\" checked=\"checked\" name=\"sex\" value=\"1\" />\r\n");
      out.write("\t    \t\t\t女:<input type=\"radio\" name=\"sex\" value=\"2\" />\r\n");
      out.write("\t    \t\t</td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>年龄:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" id=\"age\" name=\"age\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>出生日期:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" id=\"birthday\" name=\"birthday\" style=\"width:160px;\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>所属城市:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" name=\"city\" class=\"easyui-combobox\" url=\"UserServlet?method=getCity\" valueField=\"id\" textField=\"name\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>薪水:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" id=\"salary\" name=\"salary\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>开始时间:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" id=\"startTime\" name=\"startTime\" style=\"width:160px;\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>结束时间:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" id=\"endTime\" name=\"endTime\" style=\"width:160px;\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr>\r\n");
      out.write("\t    \t\t<td>个人描述:</td>\r\n");
      out.write("\t    \t\t<td><input type=\"text\" name=\"description\" class=\"easyui-validatebox\" required=true validType=\"midLength[5,50]\" missingMessage=\"个人描述必填\" invalidMessage=\"描述必须在5到50个字符之间！\" value=\"\" /></td>\r\n");
      out.write("\t    \t</tr>\r\n");
      out.write("\t    \t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t<a id=\"btn1\" class=\"easyui-linkbutton\">确定</a>&nbsp;\r\n");
      out.write("\t\t\t\t\t<a id=\"btn2\" class=\"easyui-linkbutton\">关闭</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t    </table>\r\n");
      out.write("\t</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
