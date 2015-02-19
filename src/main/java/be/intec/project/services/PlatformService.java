package be.intec.project.services;

import java.util.List;

import be.intec.project.entities.Platform;

public interface PlatformService {

	public List<Platform> listPlatform();

	public void addPlatform(Platform platform);

	public void removePlatform(String platformName);

}
