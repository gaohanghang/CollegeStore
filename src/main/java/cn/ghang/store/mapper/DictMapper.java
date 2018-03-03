package cn.ghang.store.mapper;

import java.util.List;

import cn.ghang.store.bean.dict.Area;
import cn.ghang.store.bean.dict.City;
import cn.ghang.store.bean.dict.Province;

public interface DictMapper {

	List<Province> getProvinceList();

	List<City> getCityList(String provinceCode);

	List<Area> getAreaList(String cityCode);

	String getProvinceNameByCode(String provinceCode);

	String getCityNameByCode(String cityCode);

	String getAreaNameByCode(String areaCode);


	
}
