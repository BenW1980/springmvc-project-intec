package be.intec.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.UserDao;
import be.intec.project.entities.User;
import be.intec.project.exceptions.UserExistsException;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public void addUser(User user) {

		if (userDao.getUser(user.getUsername()) != null) {
			throw new UserExistsException();

		} else {
			userDao.addUser(user);
		}
	}

	@Override
	public User getUser(String username) {
		return userDao.getUser(username);
	}

	@Override
	public List<User> listUsers() {
		return userDao.listUsers();
	}

}
