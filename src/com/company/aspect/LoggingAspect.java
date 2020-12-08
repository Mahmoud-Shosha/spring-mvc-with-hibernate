package com.company.aspect;

import java.util.logging.Logger;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class LoggingAspect {
	
	private final Logger myLogger = Logger.getLogger(getClass().getName());

}
