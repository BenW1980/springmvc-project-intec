package be.intec.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.DealDao;
import be.intec.project.entities.Deal;
import be.intec.project.entities.User;

@Service
@Transactional
public class DealServiceImpl implements DealService {

	@Autowired
	private DealDao dealDao;

	@Override
	public void addDeal(Deal deal) {
		dealDao.addDeal(deal);

	}

	@Override
	public Deal getDeal(Long id) {
		return dealDao.getDeal(id);
	}

	@Override
	public List<Deal> listNewDealsForUser(User user) {
		return dealDao.listNewDealsForUser(user);
	}

	@Override
	public void removeDeal(Long id) {
		dealDao.removeDeal(id);

	}

	@Override
	public List<Deal> listAllDealsForUser(User user) {
		return dealDao.listAllDealsForUser(user);
	}

	@Override
	public void update(Deal deal) {
		dealDao.update(deal);

	}

	@Override
	public List<Deal> listMadeDeals(User user) {
		return dealDao.listMadeDeals(user);
	}

	@Override
	public List<Deal> listConfirmedDealsForUser(User user) {
		return dealDao.listConfirmedDealsForUser(user);
	}

	@Override
	public List<Deal> findAllSenderGamesInDeals(Long id) {
		return dealDao.findAllSenderGamesInDeals(id);
	}

	@Override
	public List<Deal> findAllReceiverGamesInDeals(Long id) {
		return dealDao.findAllReceiverGamesInDeals(id);
	}

	@Override
	public List<Deal> listAllDoneDealsNotYetConfirmed(User user) {
		return dealDao.listAllDoneDealsNotYetConfirmed(user);
	}

}
