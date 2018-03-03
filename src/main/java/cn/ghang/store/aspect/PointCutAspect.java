package cn.ghang.store.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/**
 * AOP 组件，用于测试切入点表达式
 */
@Component  //将DemoAspect交给Spring管理
@Aspect		//声明当前Bean组件是一个切面组件
public class PointCutAspect {
	
	/**
	 * Bean组件切入点，对两个Bean组件进行切入
	 * 如下程序将在 userService 和 dictService
	 * 全部方法之前执行 test()方法
	 */
	//@Before("bean(userService) || bean(dictService)")
	public void test() {
		System.out.println("Point Cut Test!");
	}
	
	/**
	 * 切入点表达式 bean(*Service) 将会拦截全部的
	 * 业务方法，每个业务方法之前都会执行 test1()
	 * 方法。使用这种方式进行切入时候,建议有统一的
	 * 命名规范。
	 */
	//@Before("bean(*Service)")
	public void test1() {
		System.out.println("Point Cut Test1");
	}
	
	/**
	 * 类的切入点：如下切入点表达式将test2()方法切入到
	 * UserServiceImpl 的全部方法之前执行。
	 */
	//@Before("within(UserServiceImpl)")
	public void test2() {
		System.out.println("Point Cut Test2!");
	}
	
	//@Before("within(cn.tedu.store.service.*ServiceImpl)")
	public void test3() {
		System.out.println("Point Cut Test3!");
	}
	
	/**
	 * 方法切入点：只切入到login方法
	 */
	//@Before("execution(* cn.tedu.store.service.*Service.login(..))")
	public void test4() {
		System.out.println("Point Cut Test4!");
	}

}
