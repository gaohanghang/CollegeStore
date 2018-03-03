package cn.ghang.store.mapper;

import java.util.List;

import cn.ghang.store.bean.Address;
import org.apache.ibatis.annotations.Param;

public interface AddressMapper {
	
	void addAddress(Address address);
	
	List<Address> getAddressList(Integer uid);
	
	void delete(@Param("id") Integer id, @Param("uid") Integer uid);
	
	Address getAddressById(@Param("id") Integer id, @Param("uid") Integer uid);
	
	void updateAddressById(Address address);
	
	void setDefaultAddress(@Param("id") Integer id, @Param("uid") Integer uid);

	void cancelAllDefaultAddress(Integer uid);
	
	/**
	 * 获取当前登录的用户的第1条记录的ID
	 * @param uid 当前登录的用户的uid
	 * @return 当前登录的用户的第1条记录的ID
	 */
	Integer getFirstRecordId(Integer uid);
	
	/**
	 * 获取当前登录的用户的数据的数量
	 * @param uid 当前登录的用户的uid
	 * @return 当前登录的用户的数据的数量
	 */
	Integer getRecordCountByUid(Integer uid);
	
}
