package cn.ghang.store.service;

import java.util.Date;

import javax.annotation.Resource;

import cn.ghang.store.bean.User;
import cn.ghang.store.mapper.UserMapper;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	//从Spring中找到一个BeanID为config的bean，获取
	//其salt属性的值，注入到salt变量中
	@Value("#{config.salt}")
	private String salt;
	
	public void register(User user) {
		if (findUserByUsername(user.getUsername()) != null) {
			return;
		}
		if (checkPhoneExists(user.getPhone())) {
			return;
		}
		if (checkEmailExists(user.getEmail())) {
			return;
		}
		userMapper.createUser(user);
	}

	public void register(
			String username, 
			String password, 
			String phone, 
			String email) {
		User user = new User();
		Date now = new Date();
		
		user.setUsername(username);
		
		//密码摘要加密
		System.out.println(salt);
		String pwd=DigestUtils.md5Hex(password+salt);
		System.out.println(pwd);
		
		user.setPassword(pwd);
		user.setPhone(phone);
		user.setEmail(email);
		
		user.setDisabled(0);
		user.setCreatedTime(now);
		user.setCreatedUser("System");
		user.setModifiedTime(now);
		user.setModifiedUser("System");
		
		register(user);
	}
	
	public User findUserByUsername(String username) {
		return userMapper.findUserByUsername(username);
	}

	public boolean checkPhoneExists(String phone) {
		if (userMapper
				.getRecordCountByPhone(phone) > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean checkEmailExists(String email) {
		return userMapper
				.getRecordCountByEmail(email) > 0;
	}

	public User login(String username, 
			String password) {
		System.out.println("登陆功能");
		//为了测试AOP功能添加的 测试代码 
		if(username.equals("chenghen2")) {
			System.out.println("异常");
			throw new RuntimeException("出异常了");
		}
		
		User u = findUserByUsername(username);
		if (u == null) {
			return null;
		} else {
			//比较摘要加密以后的密码
			String pwd = DigestUtils.md5Hex(password+salt);
			if (u.getPassword().equals(pwd)) {
				return u;
			} else {
				return null;
			}
		}
	}

	public void updateUserInfo(
			Integer id, String username, 
			String phone, String email) {
		// 根据id在数据库中查询用户信息
		User user = userMapper.findUserById(id);
		// 如果用户提交的用户名为空
		// 则替换为当前数据库中的用户名
		if (username == null || "".equals(username)) {
			username = user.getUsername();
		}
		// 如果用户提交的手机号为空
		// 则替换为当前数据库中的手机号
		if (phone == null || "".equals(phone)) {
			phone = user.getPhone();
		}
		// 如果用户提交的邮箱为空
		// 则替换为当前数据库中的邮箱
		if (email == null || "".equals(email)) {
			email = user.getEmail();
		}
		// 通过持久层处理
		userMapper.updateUserInfo(id, username, phone, email);
	}

	public int updatePassword(Integer uid, 
			String oldPassword, 
			String newPassword) {
		// 初始化：参数、返回值
		int state = -1;
		
		// 处理业务
		// 根据uid获取用户信息
		User user = userMapper.findUserById(uid);
		// 判断用户输入的旧密码是否正确
		String pwd = DigestUtils.md5Hex(oldPassword+salt);
		if (user.getPassword().equals(pwd)) {
			// 密码正确，允许修改
			String newpwd = DigestUtils.md5Hex(newPassword+salt);
			userMapper.updatePassword(uid, newpwd);
			// 给正确的返回值
			state = 1;
		}
		
		// 返回
		return state;
	}

}
