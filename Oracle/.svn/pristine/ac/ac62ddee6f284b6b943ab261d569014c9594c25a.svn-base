package mis.dao;

import java.util.ArrayList;
import java.util.List;

import mis.entity.Answer;
import mis.entity.Progress;

import org.hibernate.mapping.Array;
import org.springframework.stereotype.Repository;

import common.BaseDAO;

//业务逻辑DAO

//spring自动注入
@Repository
public class ProgressDAO extends BaseDAO<Progress> {
	//查找是否已存在通过的阶段
	public Progress have(int uid,String type){
	    Progress result=new Progress();
	    List<Object> obj=new ArrayList<Object>();
	    String hql="form Progress p where 1=1 ";
	    
	    if(uid!=0)
	    {
	    	hql+="and p.uid = ? ";
	    	obj.add(uid);
	    }
	    
	    if(type!=null && !type.equals(""))
	    {
	    	hql+="and p.type = ? ";
	    	obj.add(type);
	    }
	    
	    hql+="and p.isPass = 1";
	    
	    List<Progress> list=this.getListByHQL(hql, obj);
	    if(list!=null && list.size()>0)
	    	result=list.get(0);
		return result;
	}
}
