package be.intec.project.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@NamedQueries({
		@NamedQuery(name = "findAllMessages", query = "select m from Message m"),
		@NamedQuery(name = "findAllThreadSubjects", query = "select m from Message m where (m.sender = :user or m.receiver = :user) and m.firstMessageInThread = 1 order by m.id desc"),
		@NamedQuery(name = "findAllThreads", query = "select m from Message m where m.threadid = :id order by m.id desc"),

		@NamedQuery(name = "findNewMessagesForReceiver", query = "select m from Message m where m.receiver =:user and m.readByReceiver = 0"),
		@NamedQuery(name = "numberOfMessagesInThread", query = "select m from Message m where m.threadid = :id"),
		@NamedQuery(name = "findNewMessagesInThread", query = "select m from Message m where m.sender != :user and  m.threadid = :id and (m.firstMessageInThread = 1 or m.firstMessageInThread = 0) and m.readByReceiver = 0 order by m.id desc"),
		@NamedQuery(name = "findOldMessagesInThread", query = "select m from Message m where(m.sender = :user or m.receiver = :user) and m.threadid = :id  order by m.id desc") })
@Entity
@Table(name = "messages")
public class Message implements Serializable {

	private static final long serialVersionUID = 8052446398149315485L;

	@Id
	@GeneratedValue
	private Long id;

	private Long threadid;

	@NotBlank
	@Size(max = 40)
	private String subject;

	@NotBlank
	private String content;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sender")
	@Valid
	private User sender;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "receiver")
	@Valid
	private User receiver;

	private String date;

	@Column(name = "read_by_sender")
	private boolean readBySender;

	@Column(name = "read_by_receiver")
	private boolean readByReceiver;

	@Column(name = "firstmessage")
	private boolean firstMessageInThread;

	public Message() {
	}

	public Message(Long threadid, String subject, String content, User sender, User receiver, String date,
			boolean readBySender, boolean readByReceiver, boolean firstMessageInThread) {
		this.threadid = threadid;
		this.subject = subject;
		this.content = content;
		this.sender = sender;
		this.receiver = receiver;
		this.date = date;
		this.readBySender = readBySender;
		this.readByReceiver = readByReceiver;
		this.firstMessageInThread = firstMessageInThread;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getThreadid() {
		return threadid;
	}

	public void setThreadid(Long threadid) {
		this.threadid = threadid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public boolean isReadBySender() {
		return readBySender;
	}

	public void setReadBySender(boolean readBySender) {
		this.readBySender = readBySender;
	}

	public boolean isReadByReceiver() {
		return readByReceiver;
	}

	public void setReadByReceiver(boolean readByReceiver) {
		this.readByReceiver = readByReceiver;
	}

	public boolean isFirstMessageInThread() {
		return firstMessageInThread;
	}

	public void setFirstMessageInThread(boolean firstMessageInThread) {
		this.firstMessageInThread = firstMessageInThread;
	}

}
