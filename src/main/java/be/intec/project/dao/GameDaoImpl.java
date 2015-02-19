package be.intec.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.Game;

@Repository
public class GameDaoImpl implements GameDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addGame(Game game) {
		entityManager.persist(game);
	}

	@Override
	public List<Game> listGame() {
		TypedQuery<Game> query = entityManager.createNamedQuery("findAllGames",
				Game.class);
		return query.getResultList();
	}

	@Override
	public List<Game> listGame(String username) {
		TypedQuery<Game> query = entityManager.createNamedQuery(
				"findAllGamesByUser", Game.class);
		query.setParameter("username", username);
		return query.getResultList();
	}

	@Override
	public List<Game> listGamePerPlatform(String platformName) {
		TypedQuery<Game> query = entityManager.createNamedQuery(
				"findAllGamesByPlatform", Game.class);
		query.setParameter("platformName", platformName);
		return query.getResultList();
	}

	@Override
	public Game getGame(long id) {
		return entityManager.find(Game.class, id);
	}

	@Override
	public void removeGame(long id) {
		Game game = entityManager.find(Game.class, id);
		if (game != null) {
			entityManager.remove(game);
			entityManager.flush();
		}

	}

	@Override
	public void update(Game game) {
		try {
			entityManager.merge(game);
			entityManager.flush();
		} catch (RuntimeException e) {
			entityManager.clear();
			throw e;
		}

	}

}
