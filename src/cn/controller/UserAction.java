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

import cn.dao.GonggaoDao;
import cn.dao.NewsDao;
import cn.dao.UserDao;
import cn.entity.TGonggao;
import cn.entity.TNews;
import cn.entity.TUser;
import cn.util.Const;
import cn.util.PageBean;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction {
	private Integer id;
	private String username;
	private String password;
	private Integer role;
	private String password1;
	private String name;
	private TUser user = new TUser();
	private List<TUser> list = new ArrayList<TUser>();
	private PageBean pageBean = new PageBean();
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	@Autowired
	@Qualifier("newsDao")
	private NewsDao newsDao;
	@Autowired
	@Qualifier("gonggaoDao")
	private GonggaoDao gonggaoDao;

	// 
	public String login() throws Exception {
		session.setAttribute("role", role);// 
		String hql = "from TUser u where username=? and password=? and role=? and isdel=0";
		List<TUser> list = userDao.getByHql(hql, username, password,role);
		if (list != null && list.size() > 0) {
			TUser user = list.get(0);
			session.setAttribute("currentUser", user);
			//
			List<TNews> newsList=newsDao.getByHql("from TNews order by id desc");
			if(newsList.size()>8){
				newsList=newsList.subList(0, 8);
			}
			session.setAttribute("newsList", newsList);
			List<TGonggao> gonggaoList=gonggaoDao.getByHql("from TGonggao order by id desc");
			if(gonggaoList.size()>8){
				gonggaoList=gonggaoList.subList(0, 8);
			}
			session.setAttribute("gonggaoList", gonggaoList);
			return "index";
		} else {
			request.setAttribute("msg", "Error in password");
			return "login";
		}
	}

	

	public String logout() throws Exception {
		Integer role = (Integer) session.getAttribute("role");
		TUser user = (TUser) session.getAttribute("currentUser");
		session.removeAttribute("currentUser");
		session.removeAttribute("role");
		return "login";
	}

	// 
	public String detail() {
		user = userDao.get(TUser.class, id);
		return "detail";
	}

	// 
	public String list() {
		String hqlCount = "select count(*) from TUser u where role!=0 and isdel=0";
		String hql = "from TUser u where role!=0 and isdel=0";
		if (name != null && !"".equals(name)) {
			hqlCount += " and u.name like '%" + name + "%'";
			hql += " and u.name like '%" + name + "%'";
		}
		hqlCount += " order by u.id";
		hql += " order by u.id";
		pageBean.setTotalCount(userDao.getCount(hqlCount));
		list = userDao.getByPage(hql, pageBean.getPageNo(), pageBean
				.getPageSize());
		return SUCCESS;
	}
	//
	public String jsontlist() throws IOException {
		String hql = "from TUser u where isdel=0 and role=2";
		list = userDao.getByHql(hql);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONArray.toJSONString(list));
		out.close();
		return null;
	}
	
	public String jsonlist() throws IOException {
		String hql = "from TUser u where isdel=0 and role!=0";
		list = userDao.getByHql(hql);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONArray.toJSONString(list));
		out.close();
		return null;
	}
	

	public String add() throws IOException {
		user.setRole(2);
		user.setIsdel(0);
		userDao.add(user);	
		return "list";
	}
	
	public String reg() throws IOException {
		user.setRole(1);
		user.setIsdel(0);
		userDao.add(user);	
		request.setAttribute("msg", "Registered successfully");
		return "login";
	}
	
	public String jsondetail() throws IOException {
		TUser user = userDao.get(TUser.class, id);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONObject.toJSONString(user));
		out.close();
		return null;
	}

	public String update() throws IOException {
		TUser u = userDao.get(TUser.class, id);
		if(!StringUtils.isNullOrEmpty(user.getName())){
			u.setName(user.getName());
		}
		if(!StringUtils.isNullOrEmpty(user.getPhone())){
			u.setPhone(user.getPhone());
		}
		userDao.update(u);
		return "list";
	}
	
	public String updateuser() throws IOException {
		TUser u = userDao.get(TUser.class, id);
		if(!StringUtils.isNullOrEmpty(user.getName())){
			u.setName(user.getName());
		}
		if(!StringUtils.isNullOrEmpty(user.getPhone())){
			u.setPhone(user.getPhone());
		}
		userDao.update(u);
		session.setAttribute("currentUser", u);
		request.setAttribute("msg", "modify successfully");
		return "updateuser";
	}


	public String delete() {
		TUser user = userDao.get(TUser.class, id);
		user.setIsdel(1);
		userDao.update(user);
		return "list";
	}

	public String updatepwd() {
		TUser user = (TUser) session.getAttribute("currentUser");
		if (!password.equals(user.getPassword())) {
			request.setAttribute("msg", "original password is incorrect");
			return "updatepwd";
		} else {
			user.setPassword(password1);
			userDao.update(user);
		}

		request.setAttribute("msg", "The password is successfully changed. Please log in again");
		return "login";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public TUser getUser() {
		return user;
	}



	public void setUser(TUser user) {
		this.user = user;
	}



	public List<TUser> getList() {
		return list;
	}



	public void setList(List<TUser> list) {
		this.list = list;
	}



	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


}
