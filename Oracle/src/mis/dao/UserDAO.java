package mis.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mis.entity.User;

import org.springframework.stereotype.Repository;

import common.BaseDAO;

//业务逻辑DAO

//spring自动注入
@Repository
public class UserDAO extends BaseDAO<User> {

	public User login(String name,String pwd)
	{
		User result=null;
		String hql = "from User n where 1=1 ";                    //加1=1是为了当这个检索语句不存在的话，还有1=1这个永真的在.这样就避免了SQL出错

		List<Object> obj = new ArrayList<Object>();

		if (name != null && !name.equals("")) {
			hql += "and n.username = ? ";   // 组合hql
			obj.add(name);                  // 组合参数
		}
		if (pwd != null && !pwd.equals("")) {
			hql += "and n.password=?";
			obj.add(pwd);
		}

		List<User> lu=this.getListByHQL(hql, obj); // 使用basedao封装的getListByHQL
        if(lu!=null&&lu.size()>0)
		  result=lu.get(0);
		return result;
		
	}
	
	//查找用户
	public User find(String username,String phone,String userType)
	{
		User result=null;
		String hql = "from User n where 1=1";
		List<Object> obj = new ArrayList<Object>();

		if (username != null && !username.equals("")) {
			hql += "n.username = ? ";       // 组合hql
			obj.add(username);                  // 组合参数
		}
		
		if (phone != null && !phone.equals("")) {
			hql += "and n.phone= ? ";
			obj.add(phone);
		}
		
		if (userType != null && !userType.equals("")) {
			hql += "and n.userType= ? ";
			obj.add(userType);
		}
		
		List<User> lu=this.getListByHQL(hql, obj); // 使用basedao封装的getListByHQL
        if(lu!=null&&lu.size()>0)
		  result=lu.get(0);    
		return result;
	}
		 	
    public String getIpAddr(HttpServletRequest request) { 
        String ip = request.getHeader("x-forwarded-for"); 
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("Proxy-Client-IP"); 
        } 
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("WL-Proxy-Client-IP"); 
        } 
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getRemoteAddr(); 
        } 
        return ip; 
    } 	
	
}
