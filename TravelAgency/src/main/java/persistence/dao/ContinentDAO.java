package persistence.dao;

import config.HibernateUtil;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import persistence.entities.Continent;

import javax.persistence.NoResultException;
import javax.persistence.Query;


@Repository
public class ContinentDAO {

    public void insertContinent(Continent continent) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(continent);
        session.getTransaction().commit();
        session.close();
    }

    public void insertContinent(Continent continent, Session session) {
        session.save(continent);
    }

    public Continent findContinent(String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query queryFindContinent = session.createNamedQuery("selectContinent");
        queryFindContinent.setParameter("name", name);
        Continent continent = null;
        try {
            continent = (Continent) queryFindContinent.getSingleResult();
        } catch (NoResultException e) {
            System.out.println(e.getMessage());
        }
        session.getTransaction().commit();
        session.close();
        return continent;
    }

    public Continent findContinent(String name, Session session) {
        Query queryFindContinent = session.createNamedQuery("selectContinent");
        queryFindContinent.setParameter("name", name);
        Continent continent = null;
        try {
            continent = (Continent) queryFindContinent.getSingleResult();
        } catch (NoResultException e) {
            System.out.println(e.getMessage());
        }
        return continent;
    }

}
