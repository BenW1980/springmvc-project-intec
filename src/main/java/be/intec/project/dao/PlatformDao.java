package be.intec.project.dao;

import java.util.List;

import be.intec.project.entities.Platform;

public interface PlatformDao {
	
	public void addPlatform(Platform platform);
	
	public void removePlatform(String platformName);
	
	public List<Platform> listPlatform();

}
