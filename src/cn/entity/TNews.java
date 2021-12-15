package cn.entity;

/**
 * TNews entity. @author MyEclipse Persistence Tools
 */

public class TNews implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String content;
	private String ntime;
	private String path;

	// Constructors

	/** default constructor */
	public TNews() {
	}

	/** full constructor */
	public TNews(String title, String content, String ntime) {
		this.title = title;
		this.content = content;
		this.ntime = ntime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNtime() {
		return this.ntime;
	}

	public void setNtime(String ntime) {
		this.ntime = ntime;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}