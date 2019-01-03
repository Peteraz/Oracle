package common;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mis.entity.User;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.google.common.base.Preconditions;
import com.opensymphony.xwork2.ActionSupport;


//提取的公共Action
public class BaseAction extends ActionSupport{
	
	
	// 取得Request/Response/Session的简化函数 //
		
		/**
		 * 取得HttpRequest的简化方法.
		 */
		public static HttpServletRequest getRequest() {
			return ServletActionContext.getRequest();
		}

		/**
		 * 取得HttpResponse的简化方法.
		 */
		public static HttpServletResponse getResponse() {
			return ServletActionContext.getResponse();
		}
		
		/**
		 * 取得HttpSession的简化方法.
		 */
		public static HttpSession getSession() {
			return ServletActionContext.getRequest().getSession();
		}
		
		/**
		 * 取得application的简化方法.
		 */
		public static ServletContext   getapplication() {
			return  getSession().getServletContext();
		}
		
		
		/**
		 * 发送普通的json
		 */
		public static void ajaxSendJson(Object obj) throws Exception{
			ajaxSendJson(obj,false);
		}
		
		/**
		 * 发送普通的json，带日期
		 */
		public static void ajaxSendJson(Object obj,boolean isDate) throws Exception{
			String result="";
			if(isDate)
				result=JSON.toJSONString(obj,SerializerFeature.WriteDateUseDateFormat);
			else
				result=JSON.toJSONString(obj);
			getResponse().getWriter().write(result);
		}
		
		/**
		 *发送success
		 * 
		 */
		public static void ajaxSendSuccess()throws Exception{
			getResponse().getWriter().write(JSON.toJSONString("success"));
		}
		
		/**
		 * 返回json给前台
		 */
		protected void jsonPrint(HttpServletResponse response,Integer status,String msg,Object data){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("status", status);
			map.put("msg", msg);
			map.put("data", data);
            try {
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setContentType("text/plain; charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
				response.getWriter().print(JSONArray.toJSONString(map));
				response.getWriter().flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/**
		 * 获取session中的用户信息
		 */
		public User getSessionUser() {
			User user = (User) getSession().getAttribute("user");
	    	return user;
		}
		
	    /**
	     * 获取当前时间 格式yyyy-MM-dd HH:mm:ss
	     * @return
	     */
		public String getNowDate(){   
		    String temp_str="";   
		    Date dt = new Date();   
		    //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
		    temp_str=sdf.format(dt);   
		    return temp_str;   
		} 
		/** 
		* 获得指定日期的后n天 
		* @param specifiedDay 
		* @return 
		*/ 
		public String getSpecifiedDayAfter(String specifiedDay,int days){ 
		Calendar c = Calendar.getInstance(); 
		Date date=null; 
		try {
			date = new SimpleDateFormat("yy-MM-dd HH:mm:ss").parse(specifiedDay);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	 
		c.setTime(date); 
		int day=c.get(Calendar.DATE); 
		c.set(Calendar.DATE,day+days); 

		String dayAfter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(c.getTime()); 
		return dayAfter; 
		}
		

}
