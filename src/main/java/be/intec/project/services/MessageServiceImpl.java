package be.intec.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.MessageDao;
import be.intec.project.entities.Message;
import be.intec.project.entities.User;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;

	@Override
	public List<Message> listMessage() {
		return messageDao.listMessage();
	}

	@Override
	public List<Message> listThreads(Long id) {
		return messageDao.listThreads(id);
	}

	@Override
	public List<Message> listNewMessagesForReceiver(User user) {
		return messageDao.listNewMessagesForReceiver(user);
	}

	@Override
	public List<Message> listAllMessagesInThread(Long id) {
		return messageDao.listAllMessagesInThread(id);
	}
	
	@Override
	public List<Message> listNewThreadSubjects(User user) {
		return messageDao.listNewThreadSubjects(user);
	}

	@Override
	public List<Message> listThreadSubjects(User user) {
		return messageDao.listThreadSubjects(user);
	}

	@Override
	public List<Message> listNewMessagesInThread(User user,Long id) {
		return messageDao.listNewMessagesInThread(user,id);
	}
	
	@Override
	public List<Message> listOldMessagesInThread(User user, Long id) {
		return messageDao.listOldMessagesInThread(user, id);
	}

	@Override
	public Message getMessage(long id) {
		return messageDao.getMessage(id);
	}

	@Override
	public Message getMessageBySubject(String subject) {
		return messageDao.getMessageBySubject(subject);
	}

	@Override
	public void removeMessage(long id) {
		messageDao.removeMessage(id);

	}

	@Override
	public void addMessage(Message message) {
		messageDao.addMessage(message);

	}

	@Override
	public void update(Message message) {
		messageDao.update(message);

	}

	

	

}
