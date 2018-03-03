package cn.ghang.store.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ghang.store.bean.ResponseResult;
import cn.ghang.store.bean.User;
import cn.ghang.store.service.UserService;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user")
public class UserController
	extends BaseController {
	
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping("/register.do")
	public String showRegister() {
		return "register";
	}
	
	@RequestMapping("/login.do")
	public String showLogin() {
		return "login";
	}
	
	@RequestMapping("/user_center.do")
	public String showUserCenter(
			ModelMap modelMap,
			HttpSession session) {
		// 从Session中获取当前登录的用户的用户名
		String username = 
				session.getAttribute("username").toString();
		// 通过用户名查询用户的完整信息
		User user =
				userService.findUserByUsername(username);
		// 封装用户的完整信息，以准备转发
		modelMap.addAttribute("user", user);
		
		// 执行转发
		return "user_center";
	}
	
	@RequestMapping("/user_password.do")
	public String showUpdatePassword() {
		return "user_password";
	}
	
	@RequestMapping("/address.do")
	public String showAddress() {
		return "address";
	}
	
	@RequestMapping("/uploadForm.do")
	public String showUpload() {
		return "upload";
	}
	
	@RequestMapping("/checkUsername.do")
	@ResponseBody
	public ResponseResult<Void>
		checkUsername(String username) {
		// 声明返回值
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		// 判断用户名是否已经被注册
		if (userService.findUserByUsername(username) 
				== null) {
			// 没有找到用户名匹配的记录，即没有被注册
			rr.setState(ResponseResult.STATE_OK);
			rr.setMessage("该用户名可以使用");
		} else {
			// 找到了用户名匹配的记录，则用户名已经被注册 
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("该用户名已经被注册");
		}
		
		// 返回
		return rr;
	}
	
	@RequestMapping(
			method=RequestMethod.POST,
			value="/checkLoginUsername.do")
	@ResponseBody
	public ResponseResult<Void> 
		checkLoginUsername(String username) {
		// 声明返回值
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		// 判断用户名是否存在
		if (userService.findUserByUsername(username) 
				== null) {
			// 用户名不存在
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("用户名不存在");
		} else {
			// 用户名存在 
			rr.setState(ResponseResult.STATE_OK);
			rr.setMessage("用户名正确");
		}
		
		// 返回
		return rr;
	}
	
	@RequestMapping("/checkPhone.do")
	@ResponseBody
	public ResponseResult<Void>
		checkPhone(String phone) {
		// 准备返回值
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		// 处理业务
		if (userService.checkPhoneExists(phone)) {
			// 手机号已经存在（被注册），则错误
			// 不允许再使用这个手机号注册新账号
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("该手机号已经被注册");
		} else {
			// 手机号不存在，即没有被注册
			rr.setState(ResponseResult.STATE_OK);
			rr.setMessage("该手机号可以使用");
		}
		
		// 返回
		return rr;
	}
	
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public ResponseResult<Void> 
		checkEmail(String email) {
		// 准备返回值
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		// 处理业务
		if (userService.checkEmailExists(email)) {
			// 存在，则不允许再使用这个邮箱来注册新账号
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("该邮箱已经被注册");
		} else {
			// 不存在，则邮箱可用
			rr.setState(ResponseResult.STATE_OK);
			rr.setMessage("该邮箱可以使用");
		}
		
		// 返回
		return rr;
	}
	
	@RequestMapping("/handleRegister.do")
	@ResponseBody
	public ResponseResult<Void>
		handleRegister(
				@RequestParam("uname") String username,
				@RequestParam("upwd") String password,
				String phone,
				String email) {
		System.out.println("username=" + username);
		System.out.println("password=" + password);
		System.out.println("phone=" + phone);
		System.out.println("email=" + email);
		
		// 声明返回值
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		// 处理业务
		userService.register(username, password, phone, email);
		rr.setState(ResponseResult.STATE_OK);
		rr.setMessage("注册成功");
		
		// 返回
		return rr;
	}
	
	@RequestMapping("/handleLogin.do")
	@ResponseBody
	public ResponseResult<Void>
		handleLogin(
				@RequestParam("lname") String username, 
				@RequestParam("lwd") String password,
				HttpSession session) {
		ResponseResult<Void> rr
			= new ResponseResult<Void>();
		
		User u = userService.login(username, password);
		if (u == null) {
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("用户名或密码错误");
		} else {
			rr.setState(ResponseResult.STATE_OK);
			rr.setMessage("登录成功");
			
			// 处理Session
			session.setAttribute("uid", u.getId());
			session.setAttribute("username", u.getUsername());
		}
		
		return rr;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../main/index.do";
	}
	
	@RequestMapping(value="update_user_info.do",
			method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Void> 
		updateUserInfo(
				String username, 
				String phone, 
				String email, 
				HttpSession session) {
		ResponseResult<Void> rr 
			= new ResponseResult<Void>();
		
		Integer id = getUidFromSession(session);
		userService.updateUserInfo(
				id, username, phone, email);
		
		rr.setState(ResponseResult.STATE_OK);
		rr.setMessage("修改个人信息成功");
		
		return rr;
	}
	
	@RequestMapping(method=RequestMethod.POST,
			value="/update_password.do")
	@ResponseBody
	public ResponseResult<Void> 
		handleUpdatePassword(
			@RequestParam("old_password") 
				String oldPassword,
			@RequestParam("new_password") 
				String newPassword,
			HttpSession session) {
		// 初始化：参数、返回值
		ResponseResult<Void> rr 
			= new ResponseResult<Void>();
		Integer uid;
		int state;
		String message;
		
		// 执行业务
		// 通过Session对象获取uid
		uid = getUidFromSession(session);
		// 执行
		state = userService.updatePassword(
			uid, oldPassword, newPassword);
		message = state == 1 ?
				"修改密码成功" :
				"修改密码失败，旧密码不正确";
		// 准备返回值
		rr.setState(state);
		rr.setMessage(message);
		
		// 返回
		return rr;
	}
	

	
	/**
	 * 下载Excel
	 * application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
	 */
	@RequestMapping(value="downloadExcel.do",
			produces="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
	@ResponseBody
	public byte[] downloadExcel(HttpServletResponse response)
		throws Exception{
		//手工设置 下载头 Content-Disposition
		response.setHeader(
			"Content-Disposition", 
			"attachment; filename=\"ok.xlsx\"");
		byte[] bytes=createExcel();
		return bytes;
	}
	
	
	/**
	 * 利用Excel API POI 创建Excel对象
	 * @throws IOException 
	 */
	private byte[] createExcel() throws IOException{
		//创建工作簿
		XSSFWorkbook workbook=new XSSFWorkbook();
		//在工作簿中添加工作表
		XSSFSheet sheet1=
			workbook.createSheet("花名册");
		//在工作表中添加两行
		XSSFRow head=sheet1.createRow(0);
		XSSFRow row=sheet1.createRow(1);
		//第一行做为表头
		XSSFCell c0= head.createCell(0);
		//表头第一个格子添加 “编号”
		c0.setCellValue("编号"); 
		head.createCell(1).setCellValue("姓名");
		head.createCell(2).setCellValue("年龄");
		
		row.createCell(0).setCellValue(1);
		row.createCell(1).setCellValue("范传奇");
		row.createCell(2).setCellValue(12);
		
		//将Excel对象保存为bytes 
		ByteArrayOutputStream out=
				new ByteArrayOutputStream();
		workbook.write(out); 
		out.close();
		byte[] bytes=out.toByteArray();
		return bytes;
	}
	


	/**
	 * 	弹框提示下载图片
	 * Content-Disposition: 
	 *	attachment; filename="fname.ext"
	 * 参考：RFC2616 19.5.1 Content-Disposition
	 * @param value	映射URL
	 * @param produces	设置Content-Type属性
	 * @return	byte[]	会被注解@ResponseBody自动
	 * 处理放置到响应消息的Body中发送到客户端,还会根据byte[]数组长度自动
	 * 设置 响应头部的Content-Length属性
	 * @throws IOException 
	 */
	@RequestMapping(value="downloadImage.do",
			produces="image/png")
	@ResponseBody
	public byte[] downloadImage(
			HttpServletResponse response)
		throws Exception{
		//手工设置 下载头 Content-Disposition
		response.setHeader(
			"Content-Disposition", 
			"attachment; filename=\"ok.png\"");
		byte[] bytes=createPng("OK");
		return bytes;
	}
	
	/**
	 * 生成验证码图片控制器
	 * 其中 value="code.do"用于映射URL
	 * produces="image/png" 用于设置响应头中的
	 * Content-Type 属性
	 * 返回值	byte[] 会被注解@ResponseBody自动
	 * 处理放置到响应消息的Body中发送到客户端
	 * 
	 * @ResponseBody 还会根据 byte[] 数组长度自动
	 * 设置 响应头部的Content-Length属性
	 * 
	 * @param value	映射URL
	 * @param produces	设置Content-Type属性
	 * @return	byte[]	会被注解@ResponseBody自动
	 * 处理放置到响应消息的Body中发送到客户端,还会根据byte[]数组长度自动
	 * 设置 响应头部的Content-Length属性
	 * @throws IOException 
	 */
	@RequestMapping(value="code.do",produces="image/png")
	@ResponseBody
	public byte[] code(HttpSession session) throws IOException {
		String code = genCode(4);
		session.setAttribute("code", code);
		byte[] png = createPng(code);
		return png;
	}
	
	/**
	 * 生成验证码图片
	 * @param code
	 * @return
	 * @throws IOException
	 */
	private byte[] createPng(String code) throws IOException {
		//宽，高，
		//1. 利用BufferedImage 创建 img 对象
		BufferedImage bufferedImage = new BufferedImage(100, 37, BufferedImage.TYPE_3BYTE_BGR);
		//设置一个黄色像素点
		bufferedImage.setRGB(50,20,0xffff00);
		
		//graphics图像
		Graphics2D graphics2d = bufferedImage.createGraphics();
		
		Random random = new Random();
		//生成随机颜色：
		Color c = new Color(random.nextInt(0xffffff));
		
		//填充图像的背景
		graphics2d.setColor(c);
		/*
		 * raphics2d.fillRect(0,0,100,40);
		 * x - 要填充矩形的 x 坐标。
		 * y - 要填充矩形的 y 坐标。
		 * width - 要填充矩形的宽度。
		 * height - 要填充矩形的高度。
		 */
		graphics2d.fillRect(0,0,100,37);
		
		//绘制500个随机点
		for(int i=0;i<500;i++) {
			int x = random.nextInt(100);
			int y = random.nextInt(37);
			int rgb = random.nextInt(0xffffff);
			bufferedImage.setRGB(x,y,rgb);
		}
		
		//设置平滑抗锯齿绘制
		graphics2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, 
				RenderingHints.VALUE_ANTIALIAS_ON);
		//设置字体大小
		graphics2d.setFont(new Font(Font.SANS_SERIF,Font.PLAIN,30));
		graphics2d.setColor(new Color(random.nextInt(0xffffff)));
		graphics2d.drawString(code, 10, 30);
		
		//随机绘制10条线段
		for(int i=0; i<10; i++){
			int x1=random.nextInt(100);
			int y1=random.nextInt(37);
			int x2=random.nextInt(100);
			int y2=random.nextInt(37);
			graphics2d.drawLine(x1, y1, x2, y2);
		}
		
		//2. 利用ImageIO将 img 编码为png 相当于一个酱油瓶，装入byte[]
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ImageIO.write(bufferedImage, "png", out);
		out.close();
		byte[] bytes = out.toByteArray();
		return bytes;
	}
	

	private static String chs="345678abcdefhjkmnpqrstuvwxyABCDEFGHJL";
	/**
	 * 生成验证码字符串
	 * @param len
	 * @return
	 */
	private String genCode(int len){
		char[] code = new char[len];
		Random random = new Random();
		for (int i = 0; i < code.length; i++) {
			code[i] = chs.charAt(random.nextInt(chs.length()));
		}
		return new String(code); 
	}
	/**
	 * 检查验证码
	 */
	@RequestMapping("checkCode.do")
	@ResponseBody
	public ResponseResult<Void> checkCode(String code, HttpSession session){
		ResponseResult<Void> rr= new ResponseResult<Void>();
		String c = (String)session.getAttribute("code");
		if(c !=null && c.equalsIgnoreCase(code)){
			rr.setState(ResponseResult.STATE_OK);
			rr.setMessage("验证码检查通过");
		}else{
			rr.setState(ResponseResult.STATE_ERROR);
			rr.setMessage("验证码错误"); 
		}
		return rr;
	}
	
	/**
	 * 处理上载请求
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="upload.do",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Void> upload(@RequestParam("userfile1") MultipartFile image,@RequestParam("username") String username,HttpServletRequest request) throws IllegalStateException, IOException{
				//打桩输出上载结果
				System.out.println(username);
				System.out.println(image);
				//获取上载文件信息
				System.out.println(image.getContentType());
				System.out.println(image.getName());
				System.out.println(image.getOriginalFilename());
				System.out.println(image.getSize());
				//保存到文件系统
				String path="/images/upload";//WEB路径
				path = request.getServletContext().getRealPath(path);
				System.out.println(path); 
				//创建upload文件夹
				File dir = new File(path);
				dir.mkdir();
				File file=new File(dir, image.getOriginalFilename());
				
				//将上载文件保存到文件中
				image.transferTo(file);
				
				ResponseResult<Void> rr=new ResponseResult<Void>();
				rr.setState(ResponseResult.STATE_OK);
				rr.setMessage("上载成功");
				return rr;
	}
	
	/**
	 * 处理上载请求,保存多个文件
	 */
	@RequestMapping(value="uploadImages.do",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Void> uploadImages(
			@RequestParam("images") MultipartFile[] images,
			HttpServletRequest request) throws IllegalStateException, 
			IOException{
				//保存到文件系统
				String path="/images/upload";//WEB路径
				path = request.getServletContext().getRealPath(path);
				System.out.println(path); 
				//创建upload文件夹
				File dir = new File(path);
				dir.mkdir();
				//MultipartFile 多个文件
				for(MultipartFile image : images){
					File file = new File(dir,image.getOriginalFilename());
					System.out.println("save:"+file);
					//将上载文件保存到文件中
					image.transferTo(file);
				}
				
				ResponseResult<Void> rr=new ResponseResult<Void>();
				rr.setState(ResponseResult.STATE_OK);
				rr.setMessage("上载成功");
				return rr;
	}


}
