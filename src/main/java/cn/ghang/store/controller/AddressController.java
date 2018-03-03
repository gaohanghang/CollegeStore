package cn.ghang.store.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.ghang.store.bean.Address;
import cn.ghang.store.bean.ResponseResult;
import cn.ghang.store.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/address")
public class AddressController
	extends BaseController {

	@Resource
	private AddressService addressService;
	
	@RequestMapping(value="/handle_add_address.do",
			method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Void> handleAddAddress(
			Address address,
			HttpSession session) {
		ResponseResult<Void> rr = new ResponseResult<Void>();
		
		Integer uid = getUidFromSession(session);
		address.setUid(uid);
		System.out.println("增加收货人");
		System.out.println(address);
		addressService.addAddress(address);
		System.out.println("jjjjj收货人");
		
		rr.setState(ResponseResult.STATE_OK);
		rr.setMessage("删除成功");

		
		return rr;
	}
	
	@ResponseBody
	@RequestMapping("/list.do")
	public ResponseResult<List<Address>> 
		getAddressList(HttpSession session) {
		ResponseResult<List<Address>> rr
			= new ResponseResult<List<Address>>();
		
		Integer uid = getUidFromSession(session);
		
		List<Address> list 
			= addressService.getAddressList(uid);
		
		rr.setState(ResponseResult.STATE_OK);
		rr.setData(list);
		
		return rr;
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public ResponseResult<Void> delete(
		Integer id, HttpSession session) {
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		Integer uid = getUidFromSession(session);
		
		addressService.delete(id, uid);
		
		rr.setState(ResponseResult.STATE_OK);
		rr.setMessage("删除成功");
		
		return rr;
	}
	
	@RequestMapping("/get_address.do")
	@ResponseBody
	public ResponseResult<Address> 
		getAddressById(
			Integer id, 
			HttpSession session) {
		ResponseResult<Address> rr
			= new ResponseResult<Address>();
		
		Integer uid = getUidFromSession(session);
		
		Address address 
			= addressService.getAddressById(id, uid);
		
		if (address == null) {
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("获取数据失败！请检查数据列表或刷新后再次尝试");
		} else {
			rr.setState(ResponseResult.STATE_OK);
			rr.setData(address);
		}
		
		return rr;
	}

	@RequestMapping(
			method=RequestMethod.POST, 
			value="/handle_update_address.do")
	@ResponseBody
	public ResponseResult<Void> handleUpdateAddress(
		Address address, 
		HttpSession session) {
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		// 获取session中的uid
		Integer uid = getUidFromSession(session);
		// 并设置给address参数
		address.setUid(uid);
		
		// 执行修改
		addressService.updateAddressById(address);
		
		// 确定返回值
		rr.setState(ResponseResult.STATE_OK);
		rr.setMessage("编辑成功");
		
		return rr;
	}
	
	@RequestMapping("/set_default.do")
	@ResponseBody
	public ResponseResult<Void> setDefaultAddress(
		Integer id, HttpSession session) {
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		Integer uid = getUidFromSession(session);
		
		addressService.setDefaultAddress(id, uid);
		
		rr.setState(ResponseResult.STATE_OK);
		
		return rr;
	}
}
