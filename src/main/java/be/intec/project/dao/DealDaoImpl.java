package be.intec.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.Deal;
import be.intec.project.entities.User;

@Repository
public class DealDaoImpl implements DealDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addDeal(Deal deal) {
		entityManager.persist(deal);

	}		

	@Override
	public Deal getDeal(Long id) {
		return entityManager.find(Deal.class, id);
	}

	@Override
	public List<Deal> listNewDealsForUser(User user) {
		TypedQuery<Deal> query = entityManager.createNamedQuery(
				"findAllNewDealsForUser", Deal.class);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public List<Deal> listAllDealsForUser(User user) {
		TypedQuery<Deal> query = entityManager.createNamedQuery(
				"findAllDealsForUser", Deal.class);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public List<Deal> listMadeDeals(User user) {
		TypedQuery<Deal> query = entityManager.createNamedQuery(
				"findMadeDeals", Deal.class);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public List<Deal> listConfirmedDealsForUser(User user) {
		TypedQuery<Deal> query = entityManager.createNamedQuery(
				"findAllConfirmedDealsForUser", Deal.class);
		query.setParameter("user", user);
		return query.getResultList();
	}
	
	@Override
	public List<Deal> listAllDoneDealsNotYetConfirmed(User user) {
		TypedQuery<Deal> query = entityManager.createNamedQuery(
				"findAllDoneDealsNotYetConfirmed", Deal.class);
		query.setParameter("user", user);
		return query.getResultList();
	}
	
	@Override
	public List<Deal> findAllSenderGamesInDeals(Long id) {
		TypedQuery<Deal> query = entityManager.createNamedQuery(
				"findAllSenderGamesInDeals", Deal.class);
		query.setParameter("id", id);
		return query.getResultList();

	}

	@Override
	public List<Deal> findAllReceiverGamesInDeals(Long id) {
		TypedQuery<Deal> query = entityManager.createNamedQuery(
				"findAllReceiverGamesInDeals", Deal.class);
		query.setParameter("id", id);
		return query.getResultList();
	}

	@Override
	public void removeDeal(Long id) {
		Deal deal = entityManager.find(Deal.class, id);
		if (deal != null) {
			entityManager.remove(deal);
			entityManager.flush();
		}

	}

	@Override
	public void update(Deal deal) {
		try {
			entityManager.merge(deal);
			entityManager.flush();
		} catch (RuntimeException e) {
			entityManager.clear();
			throw e;
		}

	}

	

	

}
