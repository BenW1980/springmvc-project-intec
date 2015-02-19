package be.intec.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.GameDao;
import be.intec.project.entities.Game;

@Service
@Transactional
public class GameServiceImpl implements GameService {

	@Autowired
	private GameDao gameDao;

	@Override
	public void addGame(Game game) {
		gameDao.addGame(game);
	}

	@Override
	public List<Game> listGame() {
		return gameDao.listGame();
	}

	@Override
	public List<Game> listGame(String username) {
		return gameDao.listGame(username);
	}
	
	@Override
	public List<Game> listGamePerPlatform(String platformName) {
		return gameDao.listGamePerPlatform(platformName);
	}

	@Override
	public Game getGame(long id) {
		return gameDao.getGame(id);
	}

	@Override
	public void removeGame(long id) {
		
		gameDao.removeGame(id);

	}

	@Override
	public void update(Game game) {
		gameDao.update(game);
		
	}

	
	

	

}
