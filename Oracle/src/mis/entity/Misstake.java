package mis.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Id;
import javax.persistence.Table;


//实体类
@Entity
@Table(name = "misstake")  //对应数据库的表
//表名
public class Misstake {
	// 主键
	@Id
	@GenericGenerator(name = "generator", strategy = "identity")  //@GeneratedValue的generator属性和@GenericGenerator的name属性要一样，strategy属性表示hibernate的主键生成策略
	@GeneratedValue(generator = "generator")
	private int id;           	//id
	private int uid;  	    //用户id
	private String question;    //题目
	private String a;     		//选项a
	private String b;  		    //选项b
	private String c;           //选项c
	private String d;           //选项d
	private String e;           //选项e
	private String answer;      //答案
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	public String getE() {
		return e;
	}
	public void setE(String e) {
		this.e = e;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

}