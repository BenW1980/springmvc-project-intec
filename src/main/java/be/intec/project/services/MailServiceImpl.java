package be.intec.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.MailDao;
import be.intec.project.entities.Mail;
import be.intec.project.exceptions.EmailExistsException;

@Service
@Transactional
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mailDao;

	@Override
	public void addMail(Mail mail) {
		
		if (mailDao.getMail(mail.getMail()) != null) {
			throw new EmailExistsException();

		} else {
			mailDao.addMail(mail);
		}

	}

	@Override
	public Mail getMail(String mail) {
		return mailDao.getMail(mail);
	}

	@Override
	public void removeMail(String mail) {
		mailDao.removeMail(mail);
		
	}

}
