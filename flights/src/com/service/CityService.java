package com.service;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.model.City;
import com.model.Flight;
public class CityService {

public boolean cityExists(City city){
	 Session session = HibernateUtil.openSession();
	 boolean result = false;
	 Transaction tx = null;
	 try{
		 tx = session.getTransaction();
		 tx.begin();
		 Query query = session.createQuery("from City where id='"+city.getId()+"'");
		 City f = (City)query.uniqueResult();
		 tx.commit();
		 if(f!=null) result = true;
	 }catch(Exception ex){
		 if(tx!=null){
			 tx.rollback();
		 }
	 }finally{
		 session.close();
	 }
	 return result;
}

public boolean saveCity(City city) {
	 Session session = HibernateUtil.openSession();
	 int cityId = -1;	
	 Transaction tx = null;	
	 try {
		 tx = session.getTransaction();
		 tx.begin();
		 cityId = (Integer) session.save(city);
		 city.setId(cityId);
		 tx.commit();
	 } catch (Exception e) {
		 if (tx != null) {
			 tx.rollback();
		 }
		 e.printStackTrace();
	 } finally {
		 session.close();
	 }	
	 return true;
}

public boolean updateCity(City city) {
	 Session session = HibernateUtil.openSession();
	 Transaction tx = null;	
	 try {
		 tx = session.getTransaction();
		 tx.begin();
		 session.update(city);
		 tx.commit();
	 } catch (Exception e) {
		 if (tx != null) {
			 tx.rollback();
		 }
		 e.printStackTrace();
	 } finally {
		 session.close();
	 }	
	 return true;
}

public boolean deleteCity(int id) {
	 Session session = HibernateUtil.openSession();
	 Transaction tx = null;	
	 try {
		 tx = session.getTransaction();
		 tx.begin();
     	 Query query = session.createQuery("DELETE City WHERE id = '"+id+"'");
		 query.executeUpdate();
         tx.commit();
	 } catch (Exception e) {
		 if (tx != null) {
			 tx.rollback();
		 }
		 e.printStackTrace();
	 } finally {
		 session.close();
	 }	
	 return true;
}

public City getCityById(int id) {
	 Session session = HibernateUtil.openSession();
	 Transaction tx = null;
	 City f = new City();
	 try{
		 tx = session.getTransaction();
		 tx.begin();
		 Query query = session.createQuery("from City where id='"+id+"'");
		 f = (City)query.uniqueResult();
		 tx.commit();
		 
	 }catch(Exception ex){
		 if(tx!=null){
			 tx.rollback();
		 }
	 }finally{
		 session.close();
	 }
	 return f;
}
public List<City> getListOfCities(){
    List<City> list = new ArrayList<City>();
    Session session = HibernateUtil.openSession();
    Transaction tx = null;        
    try {
        tx = session.getTransaction();
        tx.begin();
        list = session.createQuery("from City").list();                        
        tx.commit();
    } catch (Exception e) {
        if (tx != null) {
            tx.rollback();
        }
        e.printStackTrace();
    } finally {
        session.close();
    }
    return list;
}
}