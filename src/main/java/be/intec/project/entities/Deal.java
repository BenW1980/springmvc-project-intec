package be.intec.project.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@NamedQueries({
		@NamedQuery(name = "findAllSenderGamesInDeals", query = "select d from Deal d where d.senderGame.gameId = :id"),
		@NamedQuery(name = "findAllReceiverGamesInDeals", query = "select d from Deal d where d.receiverGame.gameId = :id"),
		@NamedQuery(name = "findAllDealsForUser", query = "select d from Deal d where d.sender = :user or d.receiver = :user"),
		@NamedQuery(name = "findAllNewDealsForUser", query = "select d from Deal d where d.receiver = :user and d.unread = 1 and d.status like 'Te behandelen'"),
		@NamedQuery(name = "findMadeDeals", query = "select d from Deal d where d.sender = :user and d.unread = 1 and d.status like 'Te behandelen'"),
		@NamedQuery(name = "findAllConfirmedDealsForUser", 
		query = "select d from Deal d where d.sender = :user and  d.status like 'Aangenomen' and d.confirmedDealViewed = 0"),
		@NamedQuery(name = "findAllDoneDealsNotYetConfirmed", 
		query = "select d from Deal d where  d.receiver = :user and d.confirmedDealViewed = 0 and d.actionTaken = 1 order by d.dealid desc") })
@Entity
@Table(name = "deals")
public class Deal implements Serializable {

	private static final long serialVersionUID = 1854288732562962565L;

	@Id
	@GeneratedValue
	private Long dealid;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver")
	@Valid
	private User receiver;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender")
	@Valid
	private User sender;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver_game")
	@NotNull
	private Game receiverGame;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender_game")
	@NotNull
	private Game senderGame;

	private String message;

	private boolean unread;

	private String status;

	private String date;

	private boolean actionTaken;

	private boolean confirmedDealViewed;

	@Transient
	private String dealFinal;

	@Transient
	private List<Game> theirGameList;

	@Transient
	private List<Game> yourGameList;

	public Deal() {

	}

	public Deal(User receiver, User sender, Game receiverGame, Game senderGame,
			String subject, String message, boolean unread, String status,
			String date, boolean actionTaken, boolean confirmedDealViewed) {
		this.receiver = receiver;
		this.sender = sender;
		this.receiverGame = receiverGame;
		this.senderGame = senderGame;
		this.message = message;
		this.unread = unread;
		this.status = status;
		this.date = date;
		this.actionTaken = actionTaken;
		this.confirmedDealViewed = confirmedDealViewed;
	}

	public Long getDealid() {
		return dealid;
	}

	public void setDealid(Long dealid) {
		this.dealid = dealid;
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

	public List<Game> getTheirGameList() {
		return theirGameList;
	}

	public void setTheirGameList(List<Game> theirGameList) {
		this.theirGameList = theirGameList;
	}

	public List<Game> getYourGameList() {
		return yourGameList;
	}

	public void setYourGameList(List<Game> yourGameList) {
		this.yourGameList = yourGameList;
	}

	public Game getReceiverGame() {
		return receiverGame;
	}

	public void setReceiverGame(Game receiverGame) {
		this.receiverGame = receiverGame;
	}

	public Game getSenderGame() {
		return senderGame;
	}

	public void setSenderGame(Game senderGame) {
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

	public void setDealFinal(String dealFinal) {
		this.dealFinal = dealFinal;
	}

}
