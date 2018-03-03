package cn.ghang.store.bean;

public class Outter {
	void Test2() {
		Outter.Inner2 inner2 = new Outter.Inner2();
		System.out.println(inner2.i);
		System.out.println(inner2.string);
		System.out.println(Outter.Inner2.string);
	}
	static class Inner2{
		int i = 5;
		static String string = "Hello"; // 定义错误!
	}
}
