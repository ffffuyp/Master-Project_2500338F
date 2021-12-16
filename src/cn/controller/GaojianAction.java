package cn.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;

import cn.dao.GaojianDao;
import cn.dao.UserDao;
import cn.entity.TGaojian;
import cn.entity.TUser;
import cn.util.Const;
import cn.util.PageBean;

@Controller("gaojianAction")
@Scope("prototype")
public class GaojianAction extends BaseAction {
	private Integer id;
	private Integer tid;
	private Integer sid;
	private String name;
	private TGaojian gaojian = new TGaojian();
	private List<TGaojian> list = new ArrayList<TGaojian>();
	private PageBean pageBean = new PageBean();
	@Autowired
	@Qualifier("gaojianDao")
	private GaojianDao gaojianDao;
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;

	// 
	public String view() {
		gaojian = gaojianDao.get(TGaojian.class, id);
		return "view";
	}
	// 
	public String detail() {
		gaojian = gaojianDao.get(TGaojian.class, id);
		return "detail";
	}
	// 
	public String list() {
		Integer role=(Integer)session.getAttribute("role");
		TUser user=(TUser)session.getAttribute("currentUser");
		String hqlCount = "select count(*) from TGaojian u where isdel=0";
		String hql = "from TGaojian u where isdel=0";
		if (name != null && !"".equals(name)) {
			hqlCount += " and u.name like '%" + name + "%'";
			hql += " and u.name like '%" + name + "%'";
		}
		//
		if(role==1){
			hqlCount += " and u.tuser.id="+user.getId();
			hql += " and u.tuser.id="+user.getId();
		}
		if(role==2){
			hqlCount += " and u.suser.id="+user.getId();
			hql += " and u.suser.id="+user.getId();
		}
		hqlCount += " order by u.id desc";
		hql += " order by u.id desc";
		pageBean.setTotalCount(gaojianDao.getCount(hqlCount));
		list = gaojianDao.getByPage(hql, pageBean.getPageNo(), pageBean
				.getPageSize());
		return SUCCESS;
	}
	
	public String list2() {
		Integer role=(Integer)session.getAttribute("role");
		TUser user=(TUser)session.getAttribute("currentUser");
		String hqlCount = "select count(*) from TGaojian u where isdel=0";
		String hql = "from TGaojian u where isdel=0";
		if (name != null && !"".equals(name)) {
			hqlCount += " and u.name like '%" + name + "%'";
			hql += " and u.name like '%" + name + "%'";
		}
		
		hqlCount += " order by u.id desc";
		hql += " order by u.id desc";
		pageBean.setTotalCount(gaojianDao.getCount(hqlCount));
		list = gaojianDao.getByPage(hql, pageBean.getPageNo(), pageBean
				.getPageSize());
		return "success2";
	}
	
	// 
	public String list3() {
		Integer role=(Integer)session.getAttribute("role");
		TUser user=(TUser)session.getAttribute("currentUser");
		String hqlCount = "select count(*) from TGaojian u where isdel=0 and u.status!='Not review'";
		String hql = "from TGaojian u where isdel=0 and u.status!='Not review'";
		if (name != null && !"".equals(name)) {
			hqlCount += " and u.name like '%" + name + "%'";
			hql += " and u.name like '%" + name + "%'";
		}
		
		if(role==2){
			hqlCount += " and u.suser.id="+user.getId();
			hql += " and u.suser.id="+user.getId();
		}
		hqlCount += " order by u.id desc";
		hql += " order by u.id desc";
		pageBean.setTotalCount(gaojianDao.getCount(hqlCount));
		list = gaojianDao.getByPage(hql, pageBean.getPageNo(), pageBean
				.getPageSize());
		return "success3";
	}
	
	public String add() throws IOException {
		Integer role=(Integer)session.getAttribute("role");
		TUser user=(TUser)session.getAttribute("currentUser");
		if(role==1){
			gaojian.setTuser(user);
		}
		gaojian.setTtime(Const.getCurrentDay());
		gaojian.setStatus("Not review");
		gaojian.setIsdel(0);
		gaojianDao.add(gaojian);
		return "list";
	}
	
	
	public String jsondetail() throws IOException {
		TGaojian gaojian = gaojianDao.get(TGaojian.class, id);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONObject.toJSONString(gaojian));
		out.close();
		return null;
	}
	
	public String jsonlist() throws IOException {
		String hql = "from TGaojian u where isdel=0";
		list = gaojianDao.getByHql(hql);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONArray.toJSONString(list));
		out.close();
		return null;
	}

	
	public void isexists() throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String hql = "from TGaojian u where isdel=0 and u.name='"+name+"'";
		List<TGaojian> pros=gaojianDao.getByHql(hql);
		if(pros!=null && pros.size()>0){
			out.print(1);
		}else{
			out.print(0);
		}
		out.close();
	}
	
	public String update() throws IOException {	
		TGaojian u = gaojianDao.get(TGaojian.class, id);
		if(!StringUtils.isNullOrEmpty(gaojian.getName())){
			u.setName(gaojian.getName());
		}
		if(!StringUtils.isNullOrEmpty(gaojian.getPcontent())){
			u.setPcontent(gaojian.getPcontent());
		}
		if(!StringUtils.isNullOrEmpty(gaojian.getPpath())){
			u.setPpath(gaojian.getPpath());
		}
		if(!StringUtils.isNullOrEmpty(gaojian.getTtime())){
			u.setTtime(gaojian.getTtime());
		}
		if(!StringUtils.isNullOrEmpty(gaojian.getStime())){
			u.setStime(gaojian.getStime());
		}
		gaojianDao.update(u);
		return "list";
	}
	
//	public String update2() throws IOException {	
//		TGaojian u = gaojianDao.get(TGaojian.class, id);
//		if(gaojian.getTprice()!=null){
//			u.setTprice(gaojian.getTprice());
//		}
//		gaojianDao.update(u);
//		return "list2";
//	}
//	
//	public String update3() throws IOException {	
//		TGaojian u = gaojianDao.get(TGaojian.class, id);
//		if(gaojian.getSprice()!=null){
//			u.setSprice(gaojian.getSprice());
//		}
//		gaojianDao.update(u);
//		return "list3";
//	}

	public String fp(){
		TUser user=userDao.get(TUser.class, sid);
		TGaojian g = gaojianDao.get(TGaojian.class, id);
		g.setSuser(user);
		g.setStatus("Assigned");
		gaojianDao.update(g);
		return "list";
	}
	
	public String sh(){
		TGaojian g = gaojianDao.get(TGaojian.class, id);
		g.setStatus("Reviewed");
		g.setStime(Const.getCurrentDay());
		gaojianDao.update(g);
		return "list";
	}
	public String reje(){
		TGaojian g = gaojianDao.get(TGaojian.class, id);
		g.setStatus("Rejected");
		g.setStime(Const.getCurrentDay());
		gaojianDao.update(g);
		return "list";
	}


	public String delete() {
		TGaojian gaojian = gaojianDao.get(TGaojian.class, id);
		gaojian.setIsdel(1);
		gaojianDao.update(gaojian);
		return "list";
	}
	public String delete2() {
		TGaojian gaojian = gaojianDao.get(TGaojian.class, id);
		gaojian.setTprice(0.0);
		gaojianDao.update(gaojian);
		return "list2";
	}
	public String delete3() {
		TGaojian gaojian = gaojianDao.get(TGaojian.class, id);
		gaojian.setSprice(0.0);
		gaojianDao.update(gaojian);
		return "list3";
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public TGaojian getGaojian() {
		return gaojian;
	}

	public void setGaojian(TGaojian gaojian) {
		this.gaojian = gaojian;
	}

	public List<TGaojian> getList() {
		return list;
	}

	public void setList(List<TGaojian> list) {
		this.list = list;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public GaojianDao getGaojianDao() {
		return gaojianDao;
	}

	public void setGaojianDao(GaojianDao gaojianDao) {
		this.gaojianDao = gaojianDao;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
