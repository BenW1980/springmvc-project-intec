
package be.intec.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.intec.project.dao.PlatformDao;
import be.intec.project.entities.Platform;

@Service
@Transactional
public class PlatformServiceImpl implements PlatformService {

	@Autowired
	private PlatformDao platformDao;

	@Override
	public List<Platform> listPlatform() {
		return platformDao.listPlatform();

	}

	@Override
	public void addPlatform(Platform platform) {
		platformDao.addPlatform(platform);

	}

	@Override
	public void removePlatform(String platformName) {
		platformDao.removePlatform(platformName);

	}

}
