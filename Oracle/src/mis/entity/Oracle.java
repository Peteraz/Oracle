package mis.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

//实体类
@Entity
@Table(name = "oracle")
//表名
public class Oracle {
	// 主键
	@Id
	@GenericGenerator(name = "generator", strategy = "identity")   //@GeneratedValue的generator属性和@GenericGenerator的name属性要一样，strategy属性表示hibernate的主键生成策略
	@GeneratedValue(generator = "generator")
	private int id;              //id
	private String question;     //题目
    private String a;            //选项a
    private String b;            //选项b
    private String c;            //选项c
    private String d;            //选项d
    private String e;            //选项e
    private String answer;       //答案
    private String type;         //类型
    private String category;     //分类
    private int qType;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getqType() {
		return qType;
	}
	public void setqType(int qType) {
		this.qType = qType;
	}
}