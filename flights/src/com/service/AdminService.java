package com.service;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.model.Flight;
public class AdminService {

	public List<Flight> getListOfFlights(){
        List<Flight> list = new ArrayList<Flight>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Flight").list();                        
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