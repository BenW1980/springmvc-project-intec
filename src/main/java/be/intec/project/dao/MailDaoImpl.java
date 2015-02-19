package be.intec.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.Mail;

@Repository
public class MailDaoImpl implements MailDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addMail(Mail mail) {
		try {
			entityManager.persist(mail);
		} catch (RuntimeException e) {
			entityManager.clear();
			throw e;
		}

	}

	@Override
	public Mail getMail(String mail) {
		return entityManager.find(Mail.class, mail);
	}

	@Override
	public void removeMail(String mail) {
		Mail email = entityManager.find(Mail.class, mail);
		if (email != null) {
			entityManager.remove(email);
			entityManager.flush();
		}
		
	}

}
