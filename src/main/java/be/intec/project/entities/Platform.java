package be.intec.project.entities;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@NamedQueries({ @NamedQuery(name = "findAllPlatforms", query = "select p from Platform p order by p.ordering asc") })
@Entity
@Table(name = "platforms")
public class Platform implements Serializable {

	private static final long serialVersionUID = 970555773390888218L;

	@Id
	@NotBlank
	private String platformName;

	private String ordering;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "platform")
	private Set<Game> games = new HashSet<>();

	public Platform() {

	}

	public Platform(String platformName) {
		this.platformName = platformName;
	}

	public Platform(String platformName, Set<Game> games) {
		this.platformName = platformName;
		this.games = games;
	}

	public String getPlatformName() {
		return platformName;
	}

	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}

	public Set<Game> getGames() {
		return games;
	}

	public void setGames(Set<Game> games) {
		this.games = games;
	}

	public String getOrdering() {
		return ordering;
	}

	public void setOrdering(String ordering) {
		this.ordering = ordering;
	}

	@Override
	public String toString() {
		return platformName;
	}

}
