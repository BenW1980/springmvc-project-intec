package be.intec.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.CompletedDeal;
import be.intec.project.entities.User;

@Repository
public class CompletedDealDaoImpl implements CompletedDealDao{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addCompletedDeal(CompletedDeal completedDeal) {
		entityManager.persist(completedDeal);
		
	}

	@Override
	public CompletedDeal getCompletedDeal(Long id) {
		return entityManager.find(CompletedDeal.class, id);
	}

	@Override
	public List<CompletedDeal> listDoneDealsForUser(User user) {
		TypedQuery<CompletedDeal> query = entityManager.createNamedQuery(
				"findAllDoneDealsForUser", CompletedDeal.class);
		query.setParameter("user", user);
		return query.getResultList();
	}
	
	@Override
	public List<CompletedDeal> listAllCompletedDealsForUser(User user) {
		TypedQuery<CompletedDeal> query = entityManager.createNamedQuery(
				"findAllCompletedDealsForUser", CompletedDeal.class);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public void removeCompletedDeal(Long id) {
		CompletedDeal completedDeal = entityManager.find(CompletedDeal.class, id);
		if (completedDeal != null) {
			entityManager.remove(completedDeal);
			entityManager.flush();
		}
		
	}

	@Override
	public void update(CompletedDeal completedDeal) {
		try {
			entityManager.merge(completedDeal);
			entityManager.flush();
		} catch (RuntimeException e) {
			entityManager.clear();
			throw e;
		}
		
	}

	


}
