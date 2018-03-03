CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `disabled` int(11) DEFAULT '0',
  `created_user` varchar(16) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `modified_user` varchar(16) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

CREATE TABLE `t_goods` (
  `id` varchar(200) NOT NULL COMMENT '商品id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `item_type` varchar(100) DEFAULT NULL COMMENT '商品系列',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `sell_point` varchar(150) DEFAULT NULL COMMENT '商品卖点',
  `price` bigint(20) DEFAULT NULL COMMENT '商品单价',
  `num` int(10) DEFAULT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '条形码',
  `image` varchar(500) DEFAULT NULL COMMENT '图片路径',
  `status` int(1) DEFAULT '1' COMMENT '商品状态  1：上架   2：下架   3：删除',
  `priority` int(10) DEFAULT NULL COMMENT '显示优先级',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `created_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified_user` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_goods_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类id',
  `name` varchar(150) DEFAULT NULL COMMENT '名称',
  `status` int(1) DEFAULT '1' COMMENT '状态   1：正常   2：删除',
  `sort_order` int(4) DEFAULT NULL COMMENT '排序号',
  `is_parent` int(1) DEFAULT NULL COMMENT '是否是父分类   1：是  0：否',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `created_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified_user` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8;


CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `recv_person` varchar(16) DEFAULT NULL COMMENT '收货人姓名',
  `recv_phone` varchar(50) DEFAULT NULL COMMENT '收货人手机号',
  `recv_district` varchar(50) DEFAULT NULL COMMENT '收货人省市区',
  `recv_addr` varchar(50) DEFAULT NULL COMMENT '收货人详细地址',
  `recv_addr_code` char(6) DEFAULT NULL COMMENT '收货人邮编',
  `price` int(11) DEFAULT NULL COMMENT '订单中的商品总价',
  `status` int(11) DEFAULT NULL COMMENT '订单状态',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `goods_count` int(11) DEFAULT NULL COMMENT '商品总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_title` varchar(100) DEFAULT NULL COMMENT '商品名称/标题',
  `goods_image` varchar(500) DEFAULT NULL COMMENT '商品的图片',
  `goods_price` int(20) DEFAULT NULL COMMENT '商品单价',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_title` varchar(100) DEFAULT NULL COMMENT '商品名称/标题',
  `goods_image` varchar(500) DEFAULT NULL COMMENT '商品的图片',
  `goods_price` int(20) DEFAULT NULL COMMENT '商品单价',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `t_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `recv_person` varchar(16) DEFAULT NULL,
  `recv_province` varchar(6) DEFAULT NULL,
  `recv_city` varchar(6) DEFAULT NULL,
  `recv_area` varchar(6) DEFAULT NULL,
  `recv_district` varchar(50) DEFAULT NULL,
  `recv_addr` varchar(100) DEFAULT NULL,
  `recv_phone` varchar(16) DEFAULT NULL,
  `recv_tel` varchar(16) DEFAULT NULL,
  `recv_addr_code` varchar(6) DEFAULT NULL,
  `recv_name` varchar(16) DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `t_dict_provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_code` varchar(6) DEFAULT NULL,
  `province_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

CREATE TABLE `t_dict_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_code` varchar(6) DEFAULT NULL,
  `city_code` varchar(6) DEFAULT NULL,
  `city_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;

CREATE TABLE `t_dict_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(6) DEFAULT NULL,
  `area_code` varchar(6) DEFAULT NULL,
  `area_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8;