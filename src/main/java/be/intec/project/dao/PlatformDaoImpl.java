package be.intec.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.Platform;

@Repository
public class PlatformDaoImpl implements PlatformDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Platform> listPlatform() {
		TypedQuery<Platform> query = entityManager.createNamedQuery(
				"findAllPlatforms", Platform.class);
		return query.getResultList();

	}

	@Override
	public void addPlatform(Platform platform) {
		try {
			entityManager.persist(platform);
		} catch (RuntimeException e) {
			entityManager.clear();
			throw e;
		}

	}

	@Override
	public void removePlatform(String platformName) {
		Platform platform = entityManager.find(Platform.class, platformName);
		if (platform != null) {
			entityManager.remove(platform);
			entityManager.flush();
		}

	}

}
