package be.intec.project.entities;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

@NamedQueries({ @NamedQuery(name = "findAllUsers", query = "select u from User u order by u.username asc") })
@Entity
@Table(name = "users")
public class User implements Serializable {

	private static final long serialVersionUID = 8309932377370884911L;

	@Id
	@NotBlank()
	private String username;

	@NotBlank()
	private String password;

	@Transient
	private String confirmPassword;

	private boolean enabled;

	@Column(name = "regdate")
	private String regDate;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "mail")
	@Valid
	private Mail mail;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Authority> authorities = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<Game> games = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sender")
	private Set<Deal> senderDeals = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "receiver")
	private Set<Deal> receiverDeals = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sender")
	private Set<CompletedDeal> completedSenderDeals = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "receiver")
	private Set<CompletedDeal> completedReceiverDeals = new HashSet<>();

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "sender")
	private Set<Message> senderMessages = new HashSet<>();

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "receiver")
	private Set<Message> receiverMessages = new HashSet<>();

	public User() {

	}

	public User(String username, Mail mail, String password, boolean enabled, String regDate) {
		this.username = username;
		this.mail = mail;
		this.password = password;
		this.enabled = enabled;
		this.regDate = regDate;
	}

	public User(String username, Mail mail, String password, boolean enabled, Set<Game> games) {
		this.username = username;
		this.mail = mail;
		this.password = password;
		this.enabled = enabled;
		this.games = games;
	}

	public User(String username, Mail mail, String password, boolean enabled, Set<Game> games,
			Set<Authority> authorities) {
		this.username = username;
		this.mail = mail;
		this.password = password;
		this.enabled = enabled;
		this.games = games;
		this.authorities = authorities;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<Deal> getSenderDeals() {
		return senderDeals;
	}

	public void setSenderDeals(Set<Deal> senderDeals) {
		this.senderDeals = senderDeals;
	}

	public Set<Deal> getReceiverDeals() {
		return receiverDeals;
	}

	public void setReceiverDeals(Set<Deal> receiverDeals) {
		this.receiverDeals = receiverDeals;
	}

	public Set<CompletedDeal> getCompletedSenderDeals() {
		return completedSenderDeals;
	}

	public void setCompletedSenderDeals(Set<CompletedDeal> completedSenderDeals) {
		this.completedSenderDeals = completedSenderDeals;
	}

	public Set<CompletedDeal> getCompletedReceiverDeals() {
		return completedReceiverDeals;
	}

	public void setCompletedReceiverDeals(Set<CompletedDeal> completedReceiverDeals) {
		this.completedReceiverDeals = completedReceiverDeals;
	}

	public Set<Message> getSenderMessages() {
		return senderMessages;
	}

	public void setSenderMessages(Set<Message> senderMessages) {
		this.senderMessages = senderMessages;
	}

	public Set<Message> getReceiverMessages() {
		return receiverMessages;
	}

	public void setReceiverMessages(Set<Message> receiverMessages) {
		this.receiverMessages = receiverMessages;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Game> getGames() {
		return games;
	}

	public void setGames(Set<Game> games) {
		this.games = games;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Mail getMail() {
		return mail;
	}

	public void setMail(Mail mail) {
		this.mail = mail;
	}

	public Set<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<Authority> authorities) {
		this.authorities = authorities;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return username;
	}

}
