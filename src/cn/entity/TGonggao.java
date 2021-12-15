package cn.entity;

/**
 * TGonggao entity. @author MyEclipse Persistence Tools
 */

public class TGonggao implements java.io.Serializable {

	// Fields

	private Integer id;
	private String content;
	private String gtime;

	// Constructors

	/** default constructor */
	public TGonggao() {
	}

	

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGtime() {
		return this.gtime;
	}

	public void setGtime(String gtime) {
		this.gtime = gtime;
	}



}