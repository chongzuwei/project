package com.secj3303.dao;

import com.secj3303.model.Resource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class ResourceDao {

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Save or update resource
     */
    public Resource save(Resource resource) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(resource);
        return resource;
    }

    /**
     * Find resource by ID
     */
    public Resource findById(int resourceId) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Resource.class, resourceId);
    }

    /**
     * Get all resources ordered by creation date
     */
    public List<Resource> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<Resource> query = session.createQuery(
            "FROM Resource r ORDER BY r.createdAt DESC", Resource.class);
        return query.getResultList();
    }

    /**
     * Find resources by uploader email
     */
    public List<Resource> findByUploaderEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query<Resource> query = session.createQuery(
            "FROM Resource r WHERE LOWER(r.uploadedBy) = LOWER(:email) ORDER BY r.createdAt DESC", 
            Resource.class);
        query.setParameter("email", email);
        return query.getResultList();
    }

    /**
     * Search resources by term and/or category
     */
    public List<Resource> search(String searchTerm, String category) {
        Session session = sessionFactory.getCurrentSession();
        StringBuilder hql = new StringBuilder("FROM Resource r WHERE 1=1");
        
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            hql.append(" AND (LOWER(r.title) LIKE :searchTerm OR LOWER(r.description) LIKE :searchTerm)");
        }
        
        if (category != null && !category.trim().isEmpty() && !"all".equalsIgnoreCase(category)) {
            hql.append(" AND LOWER(r.category) = LOWER(:category)");
        }
        
        hql.append(" ORDER BY r.createdAt DESC");
        
        Query<Resource> query = session.createQuery(hql.toString(), Resource.class);
        
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            query.setParameter("searchTerm", "%" + searchTerm.toLowerCase() + "%");
        }
        
        if (category != null && !category.trim().isEmpty() && !"all".equalsIgnoreCase(category)) {
            query.setParameter("category", category);
        }
        
        return query.getResultList();
    }

    /**
     * Delete resource by ID
     */
    public void deleteById(int resourceId) {
        Session session = sessionFactory.getCurrentSession();
        Resource resource = session.get(Resource.class, resourceId);
        if (resource != null) {
            session.delete(resource);
        }
    }
}
