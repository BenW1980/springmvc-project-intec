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

@NamedQueries({ @NamedQuery(name = "findAllDoneDealsForUser", query = "select d from CompletedDeal d where (d.sender = :user or d.receiver = :user) and d.confirmedDealViewed = 1 and  d.actionTaken = 1 order by d.completedDealid desc") })
@Entity
@Table(name = "completed_deals")
public class CompletedDeal implements Serializable {

	private static final long serialVersionUID = 1854288732562962565L;

	@Id
	@GeneratedValue
	@Column(name = "completeddealid")
	private Long completedDealid;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver")
	@Valid
	private User receiver;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender")
	@Valid
	private User sender;

	@Column(name = "receiver_game")
	private String receiverGame;

	@Column(name = "sender_game")
	private String senderGame;

	private String message;

	private boolean unread;

	private String status;

	private String date;

	private boolean actionTaken;

	private boolean confirmedDealViewed;

	public CompletedDeal() {

	}

	public CompletedDeal(Deal deal) {
		this.receiver = deal.getReceiver();
		this.sender = deal.getSender();
		this.receiverGame = deal.getReceiverGame().toString();
		this.senderGame = deal.getSenderGame().toString();
		this.message = deal.getMessage();
		this.unread = deal.isUnread();
		this.status = deal.getStatus();
		this.date = deal.getDate();
		this.actionTaken = deal.isActionTaken();
		this.confirmedDealViewed = deal.isConfirmedDealViewed();
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public Long getCompletedDealid() {
		return completedDealid;
	}

	public void setCompletedDealid(Long completedDealid) {
		this.completedDealid = completedDealid;
	}

	public String getReceiverGame() {
		return receiverGame;
	}

	public void setReceiverGame(String receiverGame) {
		this.receiverGame = receiverGame;
	}

	public String getSenderGame() {
		return senderGame;
	}

	public void setSenderGame(String senderGame) {
		this.senderGame = senderGame;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isUnread() {
		return unread;
	}

	public void setUnread(boolean unread) {
		this.unread = unread;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public boolean isActionTaken() {
		return actionTaken;
	}

	public void setActionTaken(boolean actionTaken) {
		this.actionTaken = actionTaken;
	}

	public boolean isConfirmedDealViewed() {
		return confirmedDealViewed;
	}

	public void setConfirmedDealViewed(boolean confirmedDealViewed) {
		this.confirmedDealViewed = confirmedDealViewed;
	}

	public String getDealFinal() {
		return "Voltooi";
	}

}
