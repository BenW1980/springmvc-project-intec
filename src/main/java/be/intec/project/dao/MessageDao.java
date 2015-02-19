package be.intec.project.dao;

import java.util.List;

import be.intec.project.entities.Message;
import be.intec.project.entities.User;

public interface MessageDao {

	public void addMessage(Message message);

	public List<Message> listMessage();

	public List<Message> listThreadSubjects(User user);

	public List<Message> listNewThreadSubjects(User user);

	public List<Message> listThreads(Long id);

	public List<Message> listNewMessagesForReceiver(User user);

	public List<Message> listNewMessagesInThread(User user, Long id);

	public List<Message> listOldMessagesInThread(User user, Long id);

	public List<Message> listAllMessagesInThread(Long id);

	public Message getMessage(long id);

	public Message getMessageBySubject(String subject);

	public void removeMessage(long id);

	public void update(Message message);

}
