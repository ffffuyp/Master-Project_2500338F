package cn.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.HibernateCallback;

//泛型Dao
public interface GenericDao<T> {
	/**
	 * 
	 */
	public Serializable add(T t);
	/**
	 * delete
	 */
	public void delete(T t);
	/**
	 * edit
	 */
	public void update(T t);
	/**
	 * search by pk
	 */
	public T get(Class entityClass, Serializable pk);
	/**
	 * search by class
	 */
	public List<T> getAll(Class entityClass);
	/**
	 * search by sql
	 */
	public List<T> getByHql(String hql);
	/**
	 * sql
	 */
	public List<T> getByHql(String hql, Object... args);
	/**
	 * page
	 */
	public List<T> getByPage(String hql, int page,int pageSize);
	/**
	 * record
	 */
	public Integer getCount(String hql);
	/**
	 * record num
	 */
	public Integer getCount(String hql,Object... param);
	/**
	 * max record
	 */
	public Integer getMax(String hql);
	/**
	 * search by page
	 */
	public List<T> getByPage(DetachedCriteria dc,int page,int pageSize);
	/**
	 * search record num
	 */
	public Integer getCount(DetachedCriteria dc);
	
	public Double tongji(String hql);
}
