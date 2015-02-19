package be.intec.project.services;

import java.util.List;

import be.intec.project.entities.User;

public interface UserService {

	public void addUser(User user);

	public User getUser(String username);

	public List<User> listUsers();

}
