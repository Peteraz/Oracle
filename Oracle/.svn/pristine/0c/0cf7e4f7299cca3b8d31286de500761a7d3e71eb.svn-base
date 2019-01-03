package mis.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mis.entity.Misstake;
import mis.entity.Oracle;

import org.springframework.stereotype.Repository;

import common.BaseDAO;

//业务逻辑DAO

//spring自动注入
@Repository
public class OracleDAO extends BaseDAO<Oracle> {
	//Oracle题目条数
	public int Oracles(){
		int n=0;
		String hql="select count(0) from Oracle";
		int x=this.getListByHQLN(hql);
		n=x;
		return n;
	}
	
	//模拟考试
	public List<Oracle> RandomsOracle(int n){
		List<Oracle> result=new ArrayList<Oracle>();
		String hql="from Oracle o order by rand()";				
		
		List<Oracle> lr=this.getListByHQLL(hql , n);   	// 使用basedao封装的getListByHQLT
		if(lr!=null && lr.size()>0)
			result=lr;
		return result;
	}
	
	//某种类型的题目条数
	public int typeOracles(String type){
		int n=0;
		String hql="select count(0) from Oracle where ";
		List<Object> obj=new ArrayList<Object>();
		
		if(type!=null && !type.equals("")){
			hql+="type = ? ";								// 组合hql
			obj.add(type);									// 组合参数
		}
		
		int x=this.getListByHQLN(hql,obj);
		n=x;
		return n;
	}
	
	//阶段考试
	public List<Oracle> ExamsOracle(String type,int l){
		List<Oracle> result=new ArrayList<Oracle>();
		List<Object> obj=new ArrayList<Object>();
		
		String hql="from Oracle o where ";
		
		if(type!=null && !type.equals("")){
			hql+="o.type = ?";								// 组合hql
			obj.add(type);									// 组合参数
		}
		
		List<Oracle> list=this.getListByHQL(hql, obj, l);
		if(list!=null && list.size()>0)
			result=list;
		return result;
	}
	
	//每天一练
	public List<Oracle> selectOracle(String type,String category){
		List<Oracle> result=new ArrayList<Oracle>();
		List<Object> obj=new ArrayList<Object>();
		
		String hql="from Oracle o where ";
		
		if(type!=null && !type.equals("")){
			hql+="o.type = ? ";								// 组合hql
			obj.add(type);									// 组合参数
		}
		
		if(category!=null && !category.equals("")){
			hql+="and o.category = ? ";								// 组合hql
			obj.add(category);									// 组合参数
		}
		
		List<Oracle> list=this.getListByHQL(hql, obj);
		if(list!=null && list.size()>0)
			result=list;
		return result;
	}
}
