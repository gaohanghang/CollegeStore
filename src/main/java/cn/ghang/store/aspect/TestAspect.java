package cn.ghang.store.aspect;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * 切面（儿）组件
 * aspect： 切面
 */
@Component	//将DemoAspect交给Spring管理
@Aspect		//声明当前Bean组件是一个切面组件
public class TestAspect {
	
	//环绕通知
	//@Around("bean(*Service)")
	public Object test(ProceedingJoinPoint jp) throws Throwable {
		try {
			long t1 = System.currentTimeMillis();
			
			Object val = jp.proceed();
			
			long t2 = System.currentTimeMillis();
			Signature m = jp.getSignature(); //获取签名(方法名，参数列表)
			System.out.println((t2-t1)+":"+m);
			return val;
		}catch (Exception e) {
			//继续抛出业务异常
			throw e;
		}
		
	}
}
