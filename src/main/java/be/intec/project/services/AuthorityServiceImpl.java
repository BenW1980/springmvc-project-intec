package be.intec.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.AuthorityDao;
import be.intec.project.entities.Authority;

@Service
@Transactional
public class AuthorityServiceImpl implements AuthorityService{
	
	@Autowired
	private AuthorityDao authorityDao;

	@Override
	public void addAuthority(Authority authority) {
		authorityDao.addAuthority(authority);
		
	}
	
	

}
