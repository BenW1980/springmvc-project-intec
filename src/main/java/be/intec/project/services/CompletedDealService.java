package be.intec.project.services;

import java.util.List;

import be.intec.project.entities.CompletedDeal;
import be.intec.project.entities.User;

public interface CompletedDealService {

	public void addCompletedDeal(CompletedDeal completedDeal);

	public CompletedDeal getCompletedDeal(Long id);

	public List<CompletedDeal> listDoneDealsForUser(User user);
	
	public List<CompletedDeal> listAllCompletedDealsForUser(User user);

	public void removeCompletedDeal(Long id);

	public void update(CompletedDeal completedDeal);

}
