package mis.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import mis.dao.OracleDAO;
import mis.entity.Oracle;
import mis.entity.User;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Preconditions;
import com.opensymphony.xwork2.ActionContext;

import common.BaseAction;
import common.Md5Utils;
import common.ReadExcelUtils;

//业务处理Action

//action是多实例的，对每一个请求都会new一个action,所以不必担心，参数会冲突
@SuppressWarnings("serial")
@Results( { @Result(name = "login", location = "/login.jsp"),                              //登录
			@Result(name = "topicmanager", location = "/WEB-INF/topicmanager.jsp")         //题库管理
	})
public class OracleAction extends BaseAction {
	// ///////////////////////////////////////////////////////////////引入的DAO
		//spring自动注入
		@Autowired  
		private  HttpServletRequest request; 
		@Autowired
		private OracleDAO dao;
		
		private File qExcel;
		
	    private String qExcelFileName ;  // 上传文件的名字 ,FileName 固定的写法  
	    private String qExcelContentType ; //上传文件的类型， ContentType 固定的写法  
		
		// ///////////////////////////////////////////////////////////////属性参数
		private List<Oracle> list;
		
		// 拿实体类当组合参数，实际上是它的属性帮我们传参了，常用
		private Oracle entity;            //用户实体

		// ///////////////////////////////////////////////////////////////业务逻辑方法
		 
		//题库管理
		public String topicmanager() throws Exception{
			getRequest().setAttribute("oracles", dao.listall());
			System.err.println(JSON.toJSONString(dao.listall()));    //查看有没有错误
			return "topicmanager";
		}
		//添加
		public void add() throws Exception {		       
		    //密码用了md5加密
		    Oracle o = entity;
		    //o.setType("a");
		    dao.add(o);
		    getResponse().sendRedirect("oracle!topicmanager.action");
		}
		//文件添加题目
		public void addByExcel() throws Exception {		       
			if(qExcel!=null){
				System.out.println("-----------addByExcel start-----------");
				//String filepath = qExcel.getPath();  
	            ReadExcelUtils excelReader = new ReadExcelUtils(qExcel.getPath(), qExcelFileName);  
	            // 对读取Excel表格标题测试  
	            //	          String[] title = excelReader.readExcelTitle();  
	            //	          System.out.println("获得Excel表格的标题:");  
	            //	          for (String s : title) {  
	            //	              System.out.print(s + " ");  
	            //	          }     
	           // 对读取Excel表格内容测试
	            Map<Integer, Map<Integer,Object>> map = excelReader.readExcelContent();  
	            System.out.println("获得Excel表格的内容:");  
	            for (int i = 1; i <= map.size(); i++) {
	            	Oracle o = new Oracle();
	            	Map<Integer,Object> m = map.get(i);
	            	o.setQuestion(m.get(0).toString());
	            	o.setA(m.get(1).toString());
	            	o.setB(m.get(2).toString());
	            	o.setC(m.get(3).toString());
	            	o.setD(m.get(4).toString());
	            	o.setE(m.get(5).toString());
	            	o.setAnswer(m.get(6).toString());
	            	o.setType(m.get(7).toString());
	            	o.setCategory(m.get(8).toString());
	                dao.add(o); 
	            }  
				System.out.println("-----------addByExcel save end-----------");
				
				System.out.println("-----------addByExcel end-----------");
			}
			
		    getResponse().sendRedirect("oracle!topicmanager.action");
		}
		
		//删除
		public void del() throws Exception {		       
		    dao.delete(entity.getId());
		    getResponse().sendRedirect("oracle!topicmanager.action");
		}
		
		//修改
		public void edit() throws Exception {		       
		    dao.update(entity);
		    getResponse().sendRedirect("oracle!topicmanager.action");
		}
		
		//每天一练
		public void selectOracle() throws Exception {	
			List<Oracle> ol=new ArrayList<Oracle>();
			String type=request.getParameter("type");
			String category=request.getParameter("category");
			ol=dao.selectOracle(type, category);			
			getResponse().getWriter().write(JSON.toJSONString(ol));     
		}
		
		//模拟考试随机题目
		public void RandomOracle() throws Exception {		       
		    int n=0;
		    int count=0;
		    List<Oracle> ol=new ArrayList<Oracle>();
		    n=dao.Oracles();                         //题目数量
		    /* count=(3*n)/4;    */                   //抽出4分之3的题目数量
		    count=25;
		    ol=dao.RandomsOracle(count);
		    getResponse().getWriter().write(JSON.toJSONString(ol));     
		}	
		
		//阶段考试
		public void ExamOracle() throws Exception {		       
		    int n=0;
		    int count=0;
		    List<Oracle> ol=new ArrayList<Oracle>();
		    String type=request.getParameter("type");
		    n=dao.typeOracles(type);                       //题目数量
		    /*count=(7*n)/8;                           //抽出4分之3的题目数量*/	
		    count=1;
		    ol=dao.ExamsOracle(type,count);
		    getResponse().getWriter().write(JSON.toJSONString(ol));     
		}	
		
        ////////////////////////////////////////////////////////////////////实现get/set
		public List<Oracle> getList() {
			return list;
		}

		public void setList(List<Oracle> list) {
			this.list = list;
		}

		public Oracle getEntity() {
			return entity;
		}

		public void setEntity(Oracle entity) {
			this.entity = entity;
		}
		public File getQExcel() {
			return qExcel;
		}
		public void setQExcel(File qExcel) {
			this.qExcel = qExcel;
		}
	      
	    public String getQExcelFileName() {  
	        return qExcelFileName;  
	    }  
	    public void setQExcelFileName(String qExcelFileName) {  
	        this.qExcelFileName = qExcelFileName;  
	    }  
	    public String getQExcelContentType() {  
	        return qExcelContentType;  
	    }  
	    public void setQExcelContentType(String qExcelContentType) {  
	        this.qExcelContentType = qExcelContentType;  
	    } 
}    
