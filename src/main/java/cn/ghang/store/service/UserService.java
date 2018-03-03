package cn.ghang.store.service;

import cn.ghang.store.bean.User;

public interface UserService {

	void register(User user);
	
	void register(
			String username, 
			String password, 
			String phone, 
			String email);
	
	User findUserByUsername(String username);
	
	boolean checkPhoneExists(String phone);
	
	boolean checkEmailExists(String email);
	
	/**
	 * @return 如果登录成功，返回登录成功的用户的信息，
	 *  如果登录失败，则返回null
	 */
	User login(String username, String password);
	
	void updateUserInfo(Integer id, String username,
			String phone, String email);
	
	int updatePassword(Integer uid, 
		    String oldPassword,
		    String newPassword);
	
}
