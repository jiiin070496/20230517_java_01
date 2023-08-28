package kh.lclass.db1.common;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

//@Aspect
//@Component
public class AdviceLogXml {
//	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
//	
//	//@Pointcut("execution(타겟메소드)")
//	//매개변수 없거나 여러개 있을때 - ..
//	//1개 이상일때 - *
//	@Pointcut("execution(public * kh.lclass.db1..*Dao.*(..))")
//	public void daoPointCut() {}
//	@Pointcut("execution(public * kh.lclass.db1..*Service.*(..))")
//	public void servicePointCut() {}
//	@Pointcut("execution(public * kh.lclass.db1..*Controller.*(..))")
//	public void controllerPointCut() {}
//	
//	@Around("daoPointCut()")
//	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
//		logger.debug("["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
//
//		Object[] args = pjp.getArgs();
//		for(int i = 0; i<args.length; i++) {
//			logger.debug("-args["+i+"] "+args[i]+"");
//		}
//		
//		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간.
//		robj = pjp.proceed(); // 타겟메소드 실행!!! Around에서 가장 중요한 메소드
//		logger.debug("-[ Dao- ]= "+robj);
//		return robj; // 타겟메소드를 호출한 메소드에 return함
//		
//	}
//	@Around("servicePointCut()")
//	public Object aroundSrvLog(ProceedingJoinPoint pjp) throws Throwable {
//		logger.debug("["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
//		Object[] args = pjp.getArgs();
//		for(int i = 0; i<args.length; i++) {
//			logger.debug("--args["+i+"] "+args[i]+"");
//		}
//		
//		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간.
//		robj = pjp.proceed(); // 타겟메소드 실행!!! Around에서 가장 중요한 메소드
//		logger.debug("--[ Srv-- ]= "+robj);
//		return robj; // 타겟메소드를 호출한 메소드에 return함
//		
//	}
//	@Around("controllerPointCut()")
//	public Object aroundCtrLog(ProceedingJoinPoint pjp) throws Throwable {
//		logger.debug("["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
//		Object[] args = pjp.getArgs();
//		for(int i = 0; i<args.length; i++) {
//			logger.debug("---args["+i+"] "+args[i]+"");
//		}
//		
//		Object robj = null; // 타겟메소드로부터 return 값을 받아 저장할 공간.
//		robj = pjp.proceed(); // 타겟메소드 실행		
//		logger.debug("---[ Ctr--- ]= "+robj);
//		return robj; // 타겟메소드를 호출한 메소드에 return함
//		
//	}
	
}
