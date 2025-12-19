package com.secj3303.dao;

import com.secj3303.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Save or update user
     */
    public User save(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(user);
        return user;
    }

    /**
     * Find user by ID
     */
    public User findById(int userId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(User.class, userId);
    }

    /**
     * Find user by email (for login)
     */
    public User findByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery(
            "FROM User u WHERE LOWER(u.email) = LOWER(:email)", User.class);
        query.setParameter("email", email);
        List<User> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

    /**
     * Get all users
     */
    public List<User> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("FROM User u ORDER BY u.createdAt DESC", User.class);
        return query.getResultList();
    }

    /**
     * Delete user by ID (cascades to subclass tables like professionals, students, admins)
     */
    public void deleteById(int userId) {
        Session session = sessionFactory.getCurrentSession();
        User user = session.get(User.class, userId);
        if (user != null) {
            session.delete(user);
        }
    }
}
