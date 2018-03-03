package cn.ghang.store.service;

import java.util.List;

import javax.annotation.Resource;

import cn.ghang.store.bean.Address;
import cn.ghang.store.mapper.AddressMapper;
import org.springframework.stereotype.Service;

@Service("addressService")
public class AddressServiceImpl implements AddressService {

	@Resource
	private DictService dictService;

	@Resource
	private AddressMapper addressMapper;

	public void addAddress(Address address) {
		generateAddressDistrict(address);
		System.out.println("AddressService:"+address);
		// 判断当前用户的收货人数据的数量是否为0
		Integer count = addressMapper.getRecordCountByUid(address.getUid());
		System.out.println("count:"+count);
		if (count == null) {
			// 将接下来要增加的数据标识为“是默认收货人”
			address.setIsDefault(1);
		}
		// 执行增加
		addressMapper.addAddress(address);
	}

	public List<Address> getAddressList(Integer uid) {
		return addressMapper.getAddressList(uid);
	}

	public void delete(Integer id, Integer uid) {
		// 获取将要删除的数据的信息，先保存到内存中的变量中
		Address addr = getAddressById(id, uid);
		// 执行删除
		addressMapper.delete(id, uid);

		// 获取当前用户的收货人数据的数量
		Integer count = addressMapper.getRecordCountByUid(uid);
		// 判断数量，如果为0，则不需要考虑再将哪条设置为默认的问题
		if (count == 0) {
			return;
		}

		// 判断刚才删除的数据是否为默认收货人
		if (addr.getIsDefault() == 1) {
			// 默认收货人数据已经被删除，则找到现有的数据中的第1条
			Integer newDefaultAddressId = addressMapper.getFirstRecordId(uid);
			// 设置新的默认收货人
			setDefaultAddress(newDefaultAddressId, uid);
		}
		// 不需要写else
		// 如果刚才删除的不是默认收货人，则没有影响
	}

	public Address getAddressById(Integer id, Integer uid) {
		return addressMapper.getAddressById(id, uid);
	}

	public void updateAddressById(Address address) {
		generateAddressDistrict(address);
		addressMapper.updateAddressById(address);
	}

	public void setDefaultAddress(Integer id, Integer uid) {
		addressMapper.cancelAllDefaultAddress(uid);
		addressMapper.setDefaultAddress(id, uid);
	}

	private void generateAddressDistrict(Address address) {
		String provinceName = dictService.getProvinceNameByCode(address.getRecvProvince());
		String cityName = dictService.getCityNameByCode(address.getRecvCity());
		String areaName = dictService.getAreaNameByCode(address.getRecvArea());

		String district = provinceName + "," + cityName + "," + areaName + ",";

		address.setRecvDistrict(district);
	}

}
