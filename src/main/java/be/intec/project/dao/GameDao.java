package be.intec.project.dao;

import java.util.List;

import be.intec.project.entities.Game;

public interface GameDao {

	public void addGame(Game game);

	public List<Game> listGame();
	
	public List<Game> listGame(String username);

	public Game getGame(long id);
	
	public List<Game> listGamePerPlatform(String platformName);

	public void removeGame(long id);
	
	public void update (Game game);
	

}
