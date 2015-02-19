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
		@NamedQuery(name = "findAllGames", query = "select g from Game g order by g.title asc"),
		@NamedQuery(name = "findAllGamesByUser", query = "select g from Game g where g.user.username = :username order by g.title asc"),
		@NamedQuery(name = "findAllGamesByPlatform", query = "select g from Game g where g.platform.platformName = :platformName order by g.title asc") })
@Entity
@Table(name = "games")
public class Game implements Serializable {

	private static final long serialVersionUID = 9073766374319070309L;

	@Id
	@GeneratedValue
	private Long gameId;

	@NotBlank
	@Size(max = 70)
	private String title;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "username")
	@Valid
	private User user;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "platformName")
	@Valid
	private Platform platform;

	@Column(name = "manual")
	private boolean manualPresent;

	@Column(name = "box")
	private boolean boxPresent;

	public Game() {

	}

	public Game(String title, User user, Platform platform,
			boolean manualPresent, boolean boxPresent) {
		this.title = title;
		this.user = user;
		this.platform = platform;
		this.manualPresent = manualPresent;
		this.boxPresent = boxPresent;
	}

	public Long getGameId() {
		return gameId;
	}

	public String getIdAsString() {
		return new Long(gameId).toString();
	}

	public void setGameId(Long gameId) {
		this.gameId = gameId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isManualPresent() {
		return manualPresent;
	}

	public void setManualPresent(boolean manualPresent) {
		this.manualPresent = manualPresent;
	}

	public boolean isBoxPresent() {
		return boxPresent;
	}

	public void setBoxPresent(boolean boxPresent) {
		this.boxPresent = boxPresent;
	}

	public Platform getPlatform() {
		return platform;
	}

	public void setPlatform(Platform platform) {
		this.platform = platform;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return title + "  (" + platform.getPlatformName() + ")  ";
	}

}
