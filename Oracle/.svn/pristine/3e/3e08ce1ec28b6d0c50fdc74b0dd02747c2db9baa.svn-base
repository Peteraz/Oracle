package mis.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

//实体类
@Entity
@Table(name = "answer")
//表名
public class Answer {
	// 主键
	@Id
	@GenericGenerator(name = "generator", strategy = "identity")  //@GeneratedValue的generator属性和@GenericGenerator的name属性要一样，strategy属性表示hibernate的主键生成策略
	@GeneratedValue(generator = "generator")
	private int id; 
	private int userId;  
	private String testType; 
	private String type;     
	private String category;  
	private String qList;    
	private String aList;  
	private String myAList; 
	private int mark;
	private String testTime;    
	private int useTime;  
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getqList() {
		return qList;
	}
	public void setqList(String qList) {
		this.qList = qList;
	}
	public String getaList() {
		return aList;
	}
	public void setaList(String aList) {
		this.aList = aList;
	}
	public String getMyAList() {
		return myAList;
	}
	public void setMyAList(String myAList) {
		this.myAList = myAList;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public String getTestTime() {
		return testTime;
	}
	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}
	public int getUseTime() {
		return useTime;
	}
	public void setUseTime(int useTime) {
		this.useTime = useTime;
	}
}
