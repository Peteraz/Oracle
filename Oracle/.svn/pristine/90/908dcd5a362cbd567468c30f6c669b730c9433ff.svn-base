package mis.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mis.entity.Misstake;
import mis.entity.User;

import org.springframework.stereotype.Repository;

import common.BaseDAO;

//业务逻辑DAO

//spring自动注入
@Repository
public class MisstakeDAO extends BaseDAO<Misstake> {
	//查找用户错题 
	public List<Misstake> misstake(int id){
		List<Misstake> result=new ArrayList<Misstake>();
        List<Object> obj=new ArrayList<Object>();
        
        String hql="from Misstake m where ";
		
		if(id!=0){
			hql+="m.uid = ? ";								// 组合hql
			obj.add(id);									   // 组合参数
		}
		List<Misstake> list=this.getListByHQL(hql, obj);
		if(list!=null && list.size()>0)
			result=list;
		return  result;
	}
	
	//查找要删除的错题
	public Misstake delmisstake(int id,int uid){
		Misstake result=new Misstake();
		List<Object> obj=new ArrayList<Object>();
		
		String hql="from Misstake m where ";
		
		if(id!=0){
			hql+="m.id = ? ";								// 组合hql
			obj.add(id);									// 组合参数
		}
		
		if(uid!=0){
			hql+="m.uid = ? ";								// 组合hql
			obj.add(id);									// 组合参数
		}
		
		List<Misstake> list=this.getListByHQL(hql, obj);
		if(list!=null && list.size()>0)
			result=list.get(0);
		return result;
	}
}