package be.intec.project.dao;

import java.util.List;

import be.intec.project.entities.User;

public interface UserDao {
	
	public void addUser(User user);
	
	public User getUser(String username);
	
	
	public List<User> listUsers();
	
	


}
