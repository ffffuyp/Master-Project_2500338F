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

import cn.dao.NewsDao;
import cn.entity.TNews;
import cn.entity.TUser;
import cn.util.Const;
import cn.util.PageBean;

@Controller("newsAction")
@Scope("prototype")
public class NewsAction extends BaseAction {
	private Integer id;
	private String name;

	private TNews news = new TNews();
	private List<TNews> list = new ArrayList<TNews>();
	private PageBean pageBean = new PageBean();
	@Autowired
	@Qualifier("newsDao")
	private NewsDao newsDao;

	
	// 
	public String detail() {
		news = newsDao.get(TNews.class, id);
		return "detail";
	}

	// 
	public String list() {
		String hqlCount = "select count(*) from TNews u where 1=1";
		String hql = "from TNews u where 1=1";		
		
		pageBean.setTotalCount(newsDao.getCount(hqlCount));
		list = newsDao.getByPage(hql, pageBean.getPageNo(), pageBean
				.getPageSize());
		return SUCCESS;
	}

	public String add() throws IOException {
		news.setNtime(Const.getCurrentTime());
		newsDao.add(news);
		return "list";
	}

	
	public String jsondetail() throws IOException {
		TNews news = newsDao.get(TNews.class, id);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONObject.toJSONString(news));
		out.close();
		return null;
	}
	
	public String jsonlist() throws IOException {
		String hql = "from TNews u";
		list = newsDao.getByHql(hql);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(JSONArray.toJSONString(list));
		out.close();
		return null;
	}

	public String update() throws IOException {
		TNews u = newsDao.get(TNews.class, id);
		if(!StringUtils.isNullOrEmpty(news.getContent())){
			u.setContent(news.getContent());
		}
		if(!StringUtils.isNullOrEmpty(news.getTitle())){
			u.setTitle(news.getTitle());
		}
		if(!StringUtils.isNullOrEmpty(news.getPath())){
			u.setPath(news.getPath());
		}
		u.setNtime(Const.getCurrentTime());
		
		newsDao.update(u);
		return "list";
	}


	public String delete() {
		TNews news = newsDao.get(TNews.class, id);
		newsDao.delete(news);
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

	public TNews getNews() {
		return news;
	}

	public void setNews(TNews news) {
		this.news = news;
	}

	public List<TNews> getList() {
		return list;
	}

	public void setList(List<TNews> list) {
		this.list = list;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public NewsDao getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	
}
