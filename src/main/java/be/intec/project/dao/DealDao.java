package be.intec.project.dao;

import java.util.List;

import be.intec.project.entities.Deal;
import be.intec.project.entities.User;

public interface DealDao {

	public void addDeal(Deal deal);

	public Deal getDeal(Long id);
	
	public List<Deal> findAllSenderGamesInDeals(Long id);
	
	public List<Deal> findAllReceiverGamesInDeals(Long id);

	public List<Deal> listNewDealsForUser(User user);

	public List<Deal> listMadeDeals(User user);

	public List<Deal> listAllDealsForUser(User user);

	public List<Deal> listConfirmedDealsForUser(User user);
	
	public List<Deal> listAllDoneDealsNotYetConfirmed(User user);

	public void removeDeal(Long id);

	public void update(Deal deal);
}
