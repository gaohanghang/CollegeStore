package cn.ghang.store.aspect;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/**
 * 切面（儿）组件
 * aspect: 切面
 * 
 * 前置通知
 * 后置通知
 * 环绕通知Around
 */
@Component  //将DemoAspect交给Spring管理
@Aspect		//声明当前Bean组件是一个切面组件
public class DemoAspect {
	
	public DemoAspect() {
		System.out.println("创建：demoAspect");
	}
	/** 
	 * @Before("bean(userService)")注解的意义：
	 * 在userService bean的全部方法之前执行test 方法，
	 * 这个注解声明会被Spring 自动处理，并且执行
	 * Before 之前
	 */
	//@Before("bean(userService)") //执行时间
	public void test() {
		System.out.println("Hello World!");
	}

	/**
	 * 在 userService 的全部方法之后(After)执行
	 */
	//@After("bean(userService)")
	public void test2() {
		System.out.println("Hello @After!");
	}
	
	/**
	 * 在目标方法没有异常情况下执行
	 */
	//@AfterReturning("bean(userService)")
	public void test3() {
		System.out.println("Hello @AfterReturning");
	}
	
	/**
	 * 在目标方法有异常情况下执行
	 */
	//@AfterThrowing("bean(userService)")
	public void test4() {
		System.out.println("Hello @AfterThrowing");
	}
	
	/**
	 * Around 通知: 对应的AOP方法：
	 * 	1. 必须有 参数 ProceedingJoinPoint 
	 *  2. 必须有返回值 Object
	 *  3. 必须抛出异常 Throwable
	 * @param jp
	 * @return
	 * @throws Throwable
	 */
	//@Around("bean(userService)")
	public Object test5(ProceedingJoinPoint jp) throws Throwable {
		//Proceeding 进行，处理
		//Join 连接
		//Point 点
		//ProceedingJoinPoint 处理过程的连接点
		System.out.println("Around Before");
		//jp.proceed() 调用了目标业务方法，其返回值
		//就是业务方法返回的业务处理结果
		Object obj = jp.proceed();
		//jp 对象中包含被调用目标方法的全部信息
		//其中 getSinature 返回方法的签名，包括：
		//方法和方法的参数类型列表
		//签名，获取方法名和参数列表，即方法
		Signature method = jp.getSignature();
		System.out.println(method);
		
		System.out.println("Around After:"+obj);
		return obj;
	}
}
