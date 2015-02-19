package be.intec.project.dao;

import be.intec.project.entities.Mail;

public interface MailDao {
	
	public void addMail(Mail mail);

	public Mail getMail(String mail);
	
	public void removeMail(String mail);
	
}
