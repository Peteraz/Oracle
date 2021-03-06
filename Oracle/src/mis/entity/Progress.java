package mis.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

//实体类
@Entity
@Table(name = "progress")
//表名
public class Progress {
	// 主键
	@Id
	@GenericGenerator(name = "generator", strategy = "identity")  //@GeneratedValue的generator属性和@GenericGenerator的name属性要一样，strategy属性表示hibernate的主键生成策略
	@GeneratedValue(generator = "generator")
	private int id;    
	private int userId;  
	private String type;     
	private String category; 
	private int frequency;
	private int isPass;
	private String createTime;

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
	public int getFrequency() {
		return frequency;
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	public int getIsPass() {
		return isPass;
	}
	public void setIsPass(int isPass) {
		this.isPass = isPass;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
