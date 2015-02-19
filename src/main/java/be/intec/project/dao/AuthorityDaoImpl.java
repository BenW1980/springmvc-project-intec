package be.intec.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.Authority;

@Repository
public class AuthorityDaoImpl implements AuthorityDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addAuthority(Authority authority) {
		entityManager.persist(authority);

	}

}
