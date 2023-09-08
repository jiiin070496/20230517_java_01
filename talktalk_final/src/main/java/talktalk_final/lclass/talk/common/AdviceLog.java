package talktalk_final.lclass.talk.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;


@Aspect
@Component
public class AdviceLog {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	@Pointcut("execution(public * talktalk_final.lclass..*Dao.*(..))")
	public void daoPointCut() {}
	@Pointcut("execution(public * talktalk_final.lclass..*Service.*(..))")
	public void servicePointCut() {}
	@Pointcut("execution(public * talktalk_final.lclass..*Controller.*(..))")
	public void controllerPointCut() {}
	
	@Around("daoPointCut()")
	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		Object[] args = pjp.getArgs();
		for(int i = 0; i<args.length; i++) {
			logger.debug("▷DAO args["+i+"] "+args[i]+"");
		}
		Object robj = null;
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		robj = pjp.proceed();
		stopwatch.stop();
		
		logger.debug("▷[ Dao 포인트컷! ▷] = "+robj);
		return robj;
		
	}
	@Around("servicePointCut()")
	public Object aroundSrvLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("▷▷["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("▷▷Service args["+i+"] "+args[i]+"");
		}
		Object robj = null;
		robj = pjp.proceed();
		logger.debug("▷▷[ Service 포인트 컷! ▷▷]"+robj);
		return robj;
	}
	@Around("controllerPointCut()")
	public Object aroundCtrLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		Object[] args = pjp.getArgs();
		for(int i = 0; i<args.length; i++) {
			logger.debug("▷▷▷Controller args["+i+"] "+args[i]+"");
		}
		Object robj = null;
		robj = pjp.proceed();
		logger.debug("▷▷▷[ Controller 포인트 컷! ▷▷▷ ]= "+robj);
		return robj;
		
	}
	
}