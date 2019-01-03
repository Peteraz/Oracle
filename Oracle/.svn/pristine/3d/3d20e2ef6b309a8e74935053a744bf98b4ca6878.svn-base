package mis.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import mis.dao.AnswerDAO;
import mis.dao.OracleDAO;
import mis.dao.UserDAO;
import mis.entity.Answer;
import mis.entity.Oracle;
import mis.entity.OracleDto;
import mis.entity.User;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import sun.security.krb5.Asn1Exception;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Preconditions;
import com.opensymphony.xwork2.ActionContext;

import common.BaseAction;
import common.Md5Utils;

//业务处理Action

//action是多实例的，对每一个请求都会new一个action,所以不必担心，参数会冲突
@SuppressWarnings("serial")
@Results( { @Result(name = "testDetail", location = "/WEB-INF/myTestDetail.jsp"),                              //登录
	        
	})
public class AnswerAction extends BaseAction {
	// ///////////////////////////////////////////////////////////////引入的DAO
	//spring自动注入
	@Autowired  
	private  HttpServletRequest request;
	@Autowired  
	private AnswerDAO dao;
	@Autowired  
	private OracleDAO odao;
	
	// 拿实体类当组合参数，实际上是它的属性帮我们传参了，常用
	private Answer entity;
	
	// ///////////////////////////////////////////////////////////////业务逻辑方法
	
	//添加考试详情
	public void addtestDetail() throws Exception{
		String userId=request.getParameter("uid");
		String testType=request.getParameter("testType");
		String qList=request.getParameter("qList");
		String aList=request.getParameter("aList");
		String myAList=request.getParameter("myAList");
		String mark=request.getParameter("mark");
		String testTime=request.getParameter("testTime");
		String useTime=request.getParameter("useTime");
		Answer ans=new Answer();
        ans.setUserId(Integer.valueOf(userId));
        ans.setTestType(testType);
        ans.setqList(qList);
        ans.setaList(aList);
        ans.setMyAList(myAList);
        ans.setMark(Integer.valueOf(mark));
        ans.setTestTime(testTime);
        ans.setUseTime(Integer.valueOf(useTime));       
		dao.add(ans);
		getResponse().getWriter().write(String.valueOf(ans.getId()));	
	}

	//考试详情
	public String testDetail() {
		try {		
			String id = getRequest().getParameter("testId");
			if(id!=null&&id!=""){
				Answer answer = dao.get(Integer.parseInt(id));
			
				String[] qArray = answer.getqList().split(",");
				String[] mAArray = answer.getMyAList().split("_");
				List<OracleDto> testDetail = new ArrayList<OracleDto>();
				for(int i=0;i<qArray.length;i++){
					Oracle o = odao.get(Integer.parseInt(qArray[i]));
					testDetail.add(new OracleDto(i+1,o.getQuestion(),o.getA(),o.getB(),o.getC(),o.getD(),o.getE(),o.getAnswer(),o.getqType(),mAArray[i],mAArray[i].equals(o.getAnswer())?"正确":"错误"));
				}
				getRequest().setAttribute("answer", answer);
				getRequest().setAttribute("tDetail", testDetail);
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "testDetail";
	}
	
	////////////////////////////////////////////////////////////////////实现get/set
	
	public Answer getEntity() {
		return entity;
	}

	public void setEntity(Answer entity) {
		this.entity = entity;
	} 
	
}
