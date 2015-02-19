package be.intec.project.services;

import be.intec.project.entities.Mail;

public interface MailService {
	
	public void addMail(Mail mail);
	
	public Mail getMail(String mail);
	
	public void removeMail(String mail);

}
