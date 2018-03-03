package cn.ghang.store.service;

import java.util.List;

import javax.annotation.Resource;

import cn.ghang.store.bean.dict.Area;
import cn.ghang.store.bean.dict.City;
import cn.ghang.store.bean.dict.Province;
import org.springframework.stereotype.Service;

import cn.ghang.store.mapper.DictMapper;

@Service("dictService")
public class DictServiceImpl implements DictService {
	
	@Resource
	private DictMapper dictMapper;

	public List<Province> getProvinceList() {
		return dictMapper.getProvinceList();
	}

	public List<City> getCityList(String provinceCode) {
		return dictMapper.getCityList(provinceCode);
	}

	public List<Area> getAreaList(String cityCode) {
		return dictMapper.getAreaList(cityCode);
	}

	public String getProvinceNameByCode(String provinceCode) {
		return dictMapper.getProvinceNameByCode(provinceCode);
	}

	public String getCityNameByCode(String cityCode) {
		return dictMapper.getCityNameByCode(cityCode);
	}

	public String getAreaNameByCode(String areaCode) {
		return dictMapper.getAreaNameByCode(areaCode);
	}

}
