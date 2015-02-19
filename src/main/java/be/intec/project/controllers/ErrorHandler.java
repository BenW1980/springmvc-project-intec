package be.intec.project.controllers;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorHandler {

	@ExceptionHandler(DataAccessException.class)
	public String handleDatabaseException(DataAccessException ex) {
		return "databasedown";
	}

	@ExceptionHandler(Exception.class)
	public String handleUnforeseenException(Exception ex) {
		return "oops";
	}
	

}
