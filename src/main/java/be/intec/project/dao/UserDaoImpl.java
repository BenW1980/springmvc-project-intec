package be.intec.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.User;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addUser(User user) {
		try {
			entityManager.persist(user);
		} catch (RuntimeException e) {
			entityManager.clear();
			throw e;
		}

	}

	@Override
	public User getUser(String username) {
		return entityManager.find(User.class, username);
	}

	@Override
	public List<User> listUsers() {
		TypedQuery<User> query = entityManager.createNamedQuery("findAllUsers", User.class);
		return query.getResultList();
	}

}
