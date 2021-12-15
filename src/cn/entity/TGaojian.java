package cn.entity;

/**
 * TProject entity. @author MyEclipse Persistence Tools
 */

public class TGaojian implements java.io.Serializable {

	// Fields

	private Integer id;
	private TUser tuser;//
	private TUser suser;//
	private String name;
	private String pcontent;
	private String ppath;
	private String ttime;
	private String stime;
	private Double tprice;
	private Double sprice;
	private String status;
	private Integer isdel;

	// Constructors

	/** default constructor */
	public TGaojian() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TUser getTuser() {
		return tuser;
	}

	public void setTuser(TUser tuser) {
		this.tuser = tuser;
	}

	public TUser getSuser() {
		return suser;
	}

	public void setSuser(TUser suser) {
		this.suser = suser;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPpath() {
		return ppath;
	}

	public void setPpath(String ppath) {
		this.ppath = ppath;
	}

	public String getTtime() {
		return ttime;
	}

	public void setTtime(String ttime) {
		this.ttime = ttime;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public Double getTprice() {
		return tprice;
	}

	public void setTprice(Double tprice) {
		this.tprice = tprice;
	}

	public Double getSprice() {
		return sprice;
	}

	public void setSprice(Double sprice) {
		this.sprice = sprice;
	}

	

	
}