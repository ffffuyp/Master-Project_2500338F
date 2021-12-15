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
	 * 增加
	 */
	public Serializable add(T t);
	/**
	 * 删除
	 */
	public void delete(T t);
	/**
	 * 修改
	 */
	public void update(T t);
	/**
	 * 根据主键查找
	 */
	public T get(Class entityClass, Serializable pk);
	/**
	 * 根据Class对象查找
	 */
	public List<T> getAll(Class entityClass);
	/**
	 * 根据sql语句查找
	 */
	public List<T> getByHql(String hql);
	/**
	 * 带参数的sql语句
	 */
	public List<T> getByHql(String hql, Object... args);
	/**
	 * 分页查找
	 */
	public List<T> getByPage(String hql, int page,int pageSize);
	/**
	 * 查找记录数
	 */
	public Integer getCount(String hql);
	/**
	 * 查找记录数
	 */
	public Integer getCount(String hql,Object... param);
	/**
	 * 查找最大编号
	 */
	public Integer getMax(String hql);
	/**
	 * 分页查找
	 */
	public List<T> getByPage(DetachedCriteria dc,int page,int pageSize);
	/**
	 * 查找记录数
	 */
	public Integer getCount(DetachedCriteria dc);
	
	public Double tongji(String hql);
}
