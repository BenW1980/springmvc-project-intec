package be.intec.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import be.intec.project.entities.Message;
import be.intec.project.entities.User;

@Repository
public class MessageDaoImpl implements MessageDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addMessage(Message message) {
		entityManager.persist(message);
	}

	@Override
	public List<Message> listMessage() {
		TypedQuery<Message> query = entityManager.createNamedQuery("findAllMessages", Message.class);
		return query.getResultList();
	}

	@Override
	public List<Message> listThreads(Long id) {
		TypedQuery<Message> query = entityManager.createNamedQuery("findAllThreads", Message.class);
		query.setParameter("id", id);
		return query.getResultList();
	}

	@Override
	public List<Message> listNewMessagesForReceiver(User user) {
		TypedQuery<Message> query = entityManager.createNamedQuery("findNewMessagesForReceiver", Message.class);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public List<Message> listAllMessagesInThread(Long id) {
		TypedQuery<Message> query = entityManager.createNamedQuery("numberOfMessagesInThread", Message.class);
		query.setParameter("id", id);
		return query.getResultList();
	}

	@Override
	public List<Message> listThreadSubjects(User user) {
		TypedQuery<Message> query = entityManager.createNamedQuery("findAllThreadSubjects", Message.class);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public List<Message> listNewThreadSubjects(User user) {
		TypedQuery<Message> query = entityManager.createNamedQuery("findAllNewThreadSubjects", Message.class);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public List<Message> listNewMessagesInThread(User user, Long id) {
		TypedQuery<Message> query = entityManager.createNamedQuery("findNewMessagesInThread", Message.class);
		query.setParameter("id", id);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public List<Message> listOldMessagesInThread(User user, Long id) {
		TypedQuery<Message> query = entityManager.createNamedQuery("findOldMessagesInThread", Message.class);
		query.setParameter("id", id);
		query.setParameter("user", user);
		return query.getResultList();
	}

	@Override
	public Message getMessage(long id) {
		return entityManager.find(Message.class, id);
	}

	@Override
	public Message getMessageBySubject(String subject) {
		return entityManager.find(Message.class, subject);
	}

	@Override
	public void removeMessage(long id) {
		Message message = entityManager.find(Message.class, id);
		if (message != null) {
			entityManager.remove(message);
			entityManager.flush();
		}

	}

	@Override
	public void update(Message message) {
		try {
			entityManager.merge(message);
			entityManager.flush();
		} catch (RuntimeException e) {
			entityManager.clear();
			throw e;
		}

	}

}
