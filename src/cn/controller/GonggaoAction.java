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
import cn.entity.TGonggao;
import cn.entity.TUser;
import cn.util.Const;
import cn.util.PageBean;

@Controller("gonggaoAction")
@Scope("prototype")
public class GonggaoAction extends BaseAction {
	private Integer id;
	private String name;

	private TGonggao gonggao = new TGonggao();
	private List<TGonggao> list = new ArrayList<TGonggao>();
	private PageBean pageBean = new PageBean();
	@Autowired
	@Qualifier("gonggaoDao")
	private GonggaoDao gonggaoDao;

	
	// 详情
	public String detail() {
		gonggao = gonggaoDao.get(TGonggao.class, id);
		return "detail";
	}

	// 列表
	public String list() {
		TUser user=(TUser)session.getAttribute("currentUser");
		Integer role=(Integer)session.getAttribute("role");
		String hqlCount = "select count(*) from TGonggao u where 1=1";
		String hql = "from TGonggao u where 1=1";
		
		
		pageBean.setTotalCount(gonggaoDao.getCount(hqlCount));
		list = gonggaoDao.getByPage(hql, pageBean.getPageNo(), pageBean
				.getPageSize());
		return SUCCESS;
	}

	public String add() throws IOException {
		gonggao.setGtime(Const.getCurrentTime());
		gonggaoDao.add(gonggao);
		return "list";
	}

	
	public String jsondetail() throws IOException {
		TGonggao gonggao = gonggaoDao.get(TGonggao.class, id);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONObject.toJSONString(gonggao));
		out.close();
		return null;
	}
	
	public String jsonlist() throws IOException {
		String hql = "from TGonggao u";
		list = gonggaoDao.getByHql(hql);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONArray.toJSONString(list));
		out.close();
		return null;
	}

	public String update() throws IOException {
		TGonggao u = gonggaoDao.get(TGonggao.class, id);
		if(!StringUtils.isNullOrEmpty(gonggao.getContent())){
			u.setContent(gonggao.getContent());
		}
		u.setGtime(Const.getCurrentTime());
		
		gonggaoDao.update(u);
		return "list";
	}


	public String delete() {
		TGonggao gonggao = gonggaoDao.get(TGonggao.class, id);
		gonggaoDao.delete(gonggao);
		return "list";
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

	public TGonggao getGonggao() {
		return gonggao;
	}

	public void setGonggao(TGonggao gonggao) {
		this.gonggao = gonggao;
	}

	public List<TGonggao> getList() {
		return list;
	}

	public void setList(List<TGonggao> list) {
		this.list = list;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public GonggaoDao getGonggaoDao() {
		return gonggaoDao;
	}

	public void setGonggaoDao(GonggaoDao gonggaoDao) {
		this.gonggaoDao = gonggaoDao;
	}

	
}
