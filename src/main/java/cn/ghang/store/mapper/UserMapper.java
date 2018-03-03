package cn.ghang.store.mapper;

import cn.ghang.store.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	
	void createUser(User user);
	
	User findUserByUsername(@Param("username") String username);
	
	User findUserById(@Param("id") Integer id);
	
	Integer getRecordCountByPhone(@Param("phone") String phone);
	
	Integer getRecordCountByEmail(@Param("email") String email);
	
	void updateUserInfo(@Param("id") Integer id,@Param("username") String username,@Param("phone") String phone,@Param("email") String email);
	
	void updatePassword(@Param("id") Integer uid,@Param("password") String newPassword);
	
}
