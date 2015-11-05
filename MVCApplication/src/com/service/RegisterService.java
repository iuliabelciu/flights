package com.service;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.model.Flight;
import com.model.User;
public class RegisterService {

public boolean flightExists(Flight flight){
	 Session session = HibernateUtil.openSession();
	 boolean result = false;
	 Transaction tx = null;
	 try{
		 tx = session.getTransaction();
		 tx.begin();
		 Query query = session.createQuery("from Flight where id='"+flight.getId()+"'");
		 Flight f = (Flight)query.uniqueResult();
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

public boolean saveFlight(Flight flight) {
	 Session session = HibernateUtil.openSession();
	 int flightId = -1;
	 if(flightExists(flight)) return false;	
	 Transaction tx = null;	
	 try {
		 tx = session.getTransaction();
		 tx.begin();
		 flightId = (Integer) session.save(flight);
		 flight.setId(flightId);
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

public boolean updateFlight(Flight flight) {
	 Session session = HibernateUtil.openSession();
	 Transaction tx = null;	
	 try {
		 tx = session.getTransaction();
		 tx.begin();
		 session.update(flight);
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

public boolean deleteFlight(int id) {
	 Session session = HibernateUtil.openSession();
	 Transaction tx = null;	
	 try {
		 tx = session.getTransaction();
		 tx.begin();
     	 Query query = session.createQuery("DELETE Flight WHERE id = '"+id+"'");
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
}