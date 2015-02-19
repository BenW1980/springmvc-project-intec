package be.intec.project.dao;

import java.util.List;

import be.intec.project.entities.CompletedDeal;
import be.intec.project.entities.User;

public interface CompletedDealDao {

	public void addCompletedDeal(CompletedDeal completedDeal);

	public CompletedDeal getCompletedDeal(Long id);

	public List<CompletedDeal> listDoneDealsForUser(User user);
	
	public List<CompletedDeal> listAllCompletedDealsForUser(User user);

	public void removeCompletedDeal(Long id);

	public void update(CompletedDeal completedDeal);
}
