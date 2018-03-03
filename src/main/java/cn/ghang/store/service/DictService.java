package cn.ghang.store.service;

import java.util.List;

import cn.ghang.store.bean.dict.Area;
import cn.ghang.store.bean.dict.City;
import cn.ghang.store.bean.dict.Province;

public interface DictService {

	List<Province> getProvinceList();

	List<City> getCityList(String provinceCode);

	List<Area> getAreaList(String cityCode);

	String getProvinceNameByCode(String provinceCode);

	String getCityNameByCode(String cityCode);

	String getAreaNameByCode(String areaCode);

}
