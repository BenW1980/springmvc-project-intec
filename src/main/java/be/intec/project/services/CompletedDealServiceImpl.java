package be.intec.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.CompletedDealDao;
import be.intec.project.entities.CompletedDeal;
import be.intec.project.entities.User;

@Service
@Transactional
public class CompletedDealServiceImpl implements CompletedDealService {

	@Autowired
	private CompletedDealDao completedDealDao;

	@Override
	public void addCompletedDeal(CompletedDeal completedDeal) {
		completedDealDao.addCompletedDeal(completedDeal);

	}

	@Override
	public CompletedDeal getCompletedDeal(Long id) {
		return completedDealDao.getCompletedDeal(id);
	}

	@Override
	public List<CompletedDeal> listDoneDealsForUser(User user) {
		return completedDealDao.listDoneDealsForUser(user);
	}

	@Override
	public void removeCompletedDeal(Long id) {
		completedDealDao.removeCompletedDeal(id);

	}

	@Override
	public void update(CompletedDeal completedDeal) {
		completedDealDao.update(completedDeal);

	}

	@Override
	public List<CompletedDeal> listAllCompletedDealsForUser(User user) {
		return completedDealDao.listAllCompletedDealsForUser(user);
	}

}
