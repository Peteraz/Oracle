package mis.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import mis.dao.MisstakeDAO;
import mis.entity.Misstake;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Preconditions;
import com.opensymphony.xwork2.ActionContext;

import common.BaseAction;
import common.Md5Utils;

//业务处理Action

//action是多实例的，对每一个请求都会new一个action,所以不必担心，参数会冲突
@SuppressWarnings("serial")
@Results( { @Result(name = "login", location = "/login.jsp"),                              //登录
	        @Result(name = "main", location = "/WEB-INF/main.jsp"),                        //主页
	        @Result(name = "mainpage", location = "/WEB-INF/mainpage.jsp"),                //首页
	        @Result(name = "userinfo", location = "/WEB-INF/userinfo.jsp"),                //个人资料
	        @Result(name = "usermanager", location = "/WEB-INF/usermanager.jsp"),          //用户管理
	        @Result(name = "topicmanager", location = "/WEB-INF/topicmanager.jsp")         //题库管理
	})
public class MisstakeAction extends BaseAction {
	// ///////////////////////////////////////////////////////////////引入的DAO
	//spring自动注入
	@Autowired  
	private  HttpServletRequest request; 
	@Autowired
	private MisstakeDAO dao;

		
	// ///////////////////////////////////////////////////////////////属性参数
	private List<Misstake> list;

	// 拿实体类当组合参数，实际上是它的属性帮我们传参了，常用
	private Misstake entity;            //错题实体

	// ///////////////////////////////////////////////////////////////业务逻辑方法
	
	
	//查找用户错题
	public void misstake() throws Exception{
		List<Misstake> misstakes=new ArrayList<Misstake>();
		int uid=Integer.valueOf(request.getParameter("uid"));
		misstakes=dao.misstake(uid);
		getResponse().getWriter().write(JSON.toJSONString(misstakes));
		
	} 
	
	//删除错题
	public void delmisstake() throws Exception{
		Misstake misstake=new Misstake();
		int id=Integer.valueOf(request.getParameter("id"));
		dao.delete(id);
		
		getResponse().getWriter().write("1");
	}

	
    ////////////////////////////////////////////////////////////////////实现get/set
	public Misstake getEntity() {
		return entity;
	}

	public void setEntity(Misstake entity) {
		this.entity = entity;
	}
	
	public List<Misstake> getList() {
		return list;
	}

	public void setList(List<Misstake> list) {
		this.list = list;
	}
}
