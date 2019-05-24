SET NAMES UTF8;
DROP DATABASE IF EXISTS play;
CREATE DATABASE play CHARSET=UTF8;
USE play;
#创建用户登录表
#1:play_login id name pwd
CREATE TABLE play_user(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  pwd  VARCHAR(32),
  phone VARCHAR(11),
  email VARCHAR(25),
  realName VARCHAR(8),
  photo VARCHAR(255)
);
INSERT INTO play_user VALUES(null,'tom',md5('wxm123456'),15869568948,"12454@qq.com","王小明",null);
INSERT INTO play_user VALUES(null,'lili',md5('zm562389'),17806432251,"174534@qq.com","张梅",null);
CREATE TABLE play_icon(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title VARCHAR(255),
  src VARCHAR(255)
);
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/mudidi1.png","目的地",'/destination');
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/gonglue.png","游记攻略",'/destination');
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/shopping.png","商城",'/destination');
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/hotel.png","酒店",'/destination');
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/doubel.png","结伴",'/destination');
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/plan.png","机票",'/destination');
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/play.png","会玩",'/destination');
INSERT INTO play_icon VALUES(null,"http://127.0.0.1:3000/img/index/icon/vedio.png","旅行精品视频",'/destination');

-- 创建首页更新表
CREATE TABLE index_new_update(
  id INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(255),
  title VARCHAR(128),
  price DECIMAL(10,2),
  src VARCHAR(128)
);
INSERT INTO index_new_update VALUES(null,'http://127.0.0.1:3000/img/index/Australia.jpg','郑州飞往澳大利亚+悉尼歌剧院6日往返游',1290,"/login");
INSERT INTO index_new_update VALUES(null,'http://127.0.0.1:3000/img/index/Moscow.jpg','上海直飞莫斯科红场7日游',1590,"/login");
INSERT INTO index_new_update VALUES(null,'http://127.0.0.1:3000/img/index/Paris.jpg','巴黎铁塔+普罗旺斯5日游',1890,"/login");
INSERT INTO index_new_update VALUES(null,'http://127.0.0.1:3000/img/index/HongKong.jpg','【五一惊喜价】香港+澳门3日游',499,"/login");
CREATE TABLE index_travels_card(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  pic VARCHAR(255),
  user_pic VARCHAR(255),
  userName VARCHAR(16),
  praiseNum INT 
);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Japan.jpg','http://127.0.0.1:3000/img/index/card/t1.jpg',"jxjs",23);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Bali.jpg','http://127.0.0.1:3000/img/index/card/t3.jpg',"jxjs",11);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Canada.jpg','http://127.0.0.1:3000/img/index/card/t5.jpg',"jxjs",23);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/England.jpg','http://127.0.0.1:3000/img/index/card/t3.jpg',"jxjs",245);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/France.jpg','http://127.0.0.1:3000/img/index/card/t2.jpg',"jxjs",134);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/HohXil.jpg','http://127.0.0.1:3000/img/index/card/t3.jpg',"jxjs",56);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Italy.jpg','http://127.0.0.1:3000/img/index/card/t2.jpg',"jxjs",78);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Korea.jpg','http://127.0.0.1:3000/img/index/card/t4.jpg',"jxjs",102);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Mexico.jpg','http://127.0.0.1:3000/img/index/card/t1.jpg',"jxjs",23);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/NewZealand.jpg','http://127.0.0.1:3000/img/index/card/t5.jpg',"jxjs",23);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Japan.jpg','http://127.0.0.1:3000/img/index/card/t1.jpg',"jxjs",114);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Philippines.jpg','http://127.0.0.1:3000/img/index/card/t3.jpg',"jxjs",445);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Russia.jpg','http://127.0.0.1:3000/img/index/card/t1.jpg',"jxjs",456);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/England.jpg','http://127.0.0.1:3000/img/index/card/t2.jpg',"jxjs",35);
INSERT INTO index_travels_card VALUES(null,'永远的下一站，开启关西秋冬限定之旅（京都，大阪，神户，伊势，志摩，鸟羽）','http://127.0.0.1:3000/img/index/card/Italy.jpg','http://127.0.0.1:3000/img/index/card/t4.jpg',"jxjs",337);
-- 创建搜索列表
CREATE TABLE play_search(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  Etitle VARCHAR(255),
  subtitle VARCHAR(255)
);
-- 插入数据
INSERT INTO play_search VALUES(null,'北京9号','BeiJing No.9','拉斯维加斯');
INSERT INTO play_search VALUES(null,'北京9号','BeiJing No.9','拉斯维加斯');
INSERT INTO play_search VALUES(null,'北京9号','BeiJing No.9','拉斯维加斯');
INSERT INTO play_search VALUES(null,'北京9号','BeiJing No.9','拉斯维加斯');
INSERT INTO play_search VALUES(null,'北京9号','BeiJing No.9','拉斯维加斯');
INSERT INTO play_search VALUES(null,'北京9号','BeiJing No.9','拉斯维加斯');
INSERT INTO play_search VALUES(null,'北京9号','BeiJing No.9','拉斯维加斯');
INSERT INTO play_search VALUES(null,'北京颐和园','BeiJing No.9','故宫');
INSERT INTO play_search VALUES(null,'北京颐和园','BeiJing No.9','故宫');
INSERT INTO play_search VALUES(null,'北京颐和园','BeiJing No.9','故宫');
INSERT INTO play_search VALUES(null,'北京颐和园','BeiJing No.9','故宫');
INSERT INTO play_search VALUES(null,'北京颐和园','BeiJing No.9','故宫');
INSERT INTO play_search VALUES(null,'北京颐和园','BeiJing No.9','故宫');
INSERT INTO play_search VALUES(null,'北京颐和园','BeiJing No.9','故宫');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'南京夫子庙','Confucius temple in nanjing','夫子庙');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津之眼','The Tientsin Eye ','美食');
INSERT INTO play_search VALUES(null,'天津五大道','the five major road district of Tianjin ','成都道');
INSERT INTO play_search VALUES(null,'天津五大道','the five major road district of Tianjin ','成都道');
INSERT INTO play_search VALUES(null,'天津五大道','the five major road district of Tianjin ','成都道');
INSERT INTO play_search VALUES(null,'天津五大道','the five major road district of Tianjin ','成都道');
INSERT INTO play_search VALUES(null,'天津五大道','the five major road district of Tianjin ','成都道');
INSERT INTO play_search VALUES(null,'天津五大道','the five major road district of Tianjin ','成都道');
INSERT INTO play_search VALUES(null,'天津五大道','the five major road district of Tianjin ','成都道');
INSERT INTO play_search VALUES(null,'天津意大利风情街','Tianjin Italian style street','意大利');
INSERT INTO play_search VALUES(null,'江苏苏州园林','Gardens in suzhou, jiangsu','苏州园林');
INSERT INTO play_search VALUES(null,'江苏苏州园林','Gardens in suzhou, jiangsu','苏州园林');
INSERT INTO play_search VALUES(null,'江苏苏州园林','Gardens in suzhou, jiangsu','苏州园林');
INSERT INTO play_search VALUES(null,'江苏苏州园林','Gardens in suzhou, jiangsu','苏州园林');
INSERT INTO play_search VALUES(null,'江苏苏州园林','Gardens in suzhou, jiangsu','苏州园林');
-- 创建图片表格
CREATE TABLE play_pic(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  img_url VARCHAR(255)
);
INSERT INTO play_pic VALUES(null,"法国·巴黎","http://127.0.0.1:3000/img/destination/Paris.jpg");
INSERT INTO play_pic VALUES(null,"日本·富士山","http://127.0.0.1:3000/img/destination/Japan.jpg");
INSERT INTO play_pic VALUES(null,"荷兰","http://127.0.0.1:3000/img/destination/Holland.jpg");
INSERT INTO play_pic VALUES(null,"新加坡","http://127.0.0.1:3000/img/destination/Singapore.jpg");
INSERT INTO play_pic VALUES(null,"美国·塞班","http://127.0.0.1:3000/img/destination/Saipan.jpg");
INSERT INTO play_pic VALUES(null,"法国·巴
黎","http://127.0.0.1:3000/img/destination/Paris.jpg");
INSERT INTO play_pic VALUES(null,"日本·富士山","http://127.0.0.1:3000/img/destination/Japan.jpg");
INSERT INTO play_pic VALUES(null,"斐济","http://127.0.0.1:3000/img/destination/Fiji.jpg");
INSERT INTO play_pic VALUES(null,"西班牙","http://127.0.0.1:3000/img/destination/Spain.jpg");
INSERT INTO play_pic VALUES(null,"台湾·垦丁","http://127.0.0.1:3000/img/destination/Kenting.jpg");
INSERT INTO play_pic VALUES(null,"荷兰","http://127.0.0.1:3000/img/destination/Holland.jpg");
INSERT INTO play_pic VALUES(null,"爱尔兰","http://127.0.0.1:3000/img/destination/Ireland.jpg");
INSERT INTO play_pic VALUES(null,"意大利","http://127.0.0.1:3000/img/destination/Italy.jpg");
INSERT INTO play_pic VALUES(null,"伊朗","http://127.0.0.1:3000/img/destination/Iran.jpg");
INSERT INTO play_pic VALUES(null,"瑞典","http://127.0.0.1:3000/img/destination/Sweden.jpg");
INSERT INTO play_pic VALUES(null,"韩国·济州岛","http://127.0.0.1:3000/img/destination/Jeju.jpg");
INSERT INTO play_pic VALUES(null,"法国·巴黎","http://127.0.0.1:3000/img/destination/Paris.jpg");
INSERT INTO play_pic VALUES(null,"伊朗·卡尚","http://127.0.0.1:3000/img/destination/Iran.jpg");
INSERT INTO play_pic VALUES(null,"荷兰","http://127.0.0.1:3000/img/destination/Holland.jpg");
INSERT INTO play_pic VALUES(null,"希腊","http://127.0.0.1:3000/img/destination/Greece.jpg");
INSERT INTO play_pic VALUES(null,"捷克","http://127.0.0.1:3000/img/destination/Czech.jpg");
INSERT INTO play_pic VALUES(null,"法国·巴黎","http://127.0.0.1:3000/img/destination/Paris.jpg");
INSERT INTO play_pic VALUES(null,"古巴","http://127.0.0.1:3000/img/destination/Cuba.jpg");
INSERT INTO play_pic VALUES(null,"俄罗斯·贝加尔湖","http://127.0.0.1:3000/img/destination/Baikal.jpg");
INSERT INTO play_pic VALUES(null,"日本·富士山","http://127.0.0.1:3000/img/destination/Japan.jpg");
INSERT INTO play_pic VALUES(null,"阿根廷","http://127.0.0.1:3000/img/destination/Argentina.jpg");
INSERT INTO play_pic VALUES(null,"希腊","http://127.0.0.1:3000/img/destination/Greece.jpg");
INSERT INTO play_pic VALUES(null,"法国·巴黎","http://127.0.0.1:3000/img/destination/Paris.jpg");
INSERT INTO play_pic VALUES(null,"日本·富士山","http://127.0.0.1:3000/img/destination/Japan.jpg");
INSERT INTO play_pic VALUES(null,"瑞士","http://127.0.0.1:3000/img/destination/Switzerland.jpg");
INSERT INTO play_pic VALUES(null,"韩国·济州岛","http://127.0.0.1:3000/img/destination/Jeju.jpg");
INSERT INTO play_pic VALUES(null,"伊朗","http://127.0.0.1:3000/img/destination/Iran.jpg");
INSERT INTO play_pic VALUES(null,"西班牙","http://127.0.0.1:3000/img/destination/Spain.jpg");
INSERT INTO play_pic VALUES(null,"新加坡","http://127.0.0.1:3000/img/destination/Singapore.jpg");
INSERT INTO play_pic VALUES(null,"挪威","http://127.0.0.1:3000/img/destination/Norway.jpg");
INSERT INTO play_pic VALUES(null,"摩洛哥","http://127.0.0.1:3000/img/destination/Morocco.jpg");
INSERT INTO play_pic VALUES(null,"意大利","http://127.0.0.1:3000/img/destination/Italy.jpg");
INSERT INTO play_pic VALUES(null,"瑞典","http://127.0.0.1:3000/img/destination/Sweden.jpg");
INSERT INTO play_pic VALUES(null,"爱尔兰","http://127.0.0.1:3000/img/destination/Ireland.jpg");
INSERT INTO play_pic VALUES(null,"伊朗","http://127.0.0.1:3000/img/destination/Iran.jpg");
INSERT INTO play_pic VALUES(null,"印度","http://127.0.0.1:3000/img/destination/India.jpg");
INSERT INTO play_pic VALUES(null,"斐济","http://127.0.0.1:3000/img/destination/Fiji.jpg");
INSERT INTO play_pic VALUES(null,"日本·富士山","http://127.0.0.1:3000/img/destination/Japan.jpg");
INSERT INTO play_pic VALUES(null,"美国·塞班","http://127.0.0.1:3000/img/destination/Saipan.jpg");
INSERT INTO play_pic VALUES(null,"阿根廷","http://127.0.0.1:3000/img/destination/Argentina.jpg");
INSERT INTO play_pic VALUES(null,"伊朗·卡尚","http://127.0.0.1:3000/img/destination/Iran.jpg");
INSERT INTO play_pic VALUES(null,"法国·巴黎","http://127.0.0.1:3000/img/destination/Paris.jpg");
INSERT INTO play_pic VALUES(null,"台湾·垦丁","http://127.0.0.1:3000/img/destination/Kenting.jpg");
INSERT INTO play_pic VALUES(null,"西班牙","http://127.0.0.1:3000/img/destination/Spain.jpg");
INSERT INTO play_pic VALUES(null,"荷兰","http://127.0.0.1:3000/img/destination/Holland.jpg");
INSERT INTO play_pic VALUES(null,"新加坡","http://127.0.0.1:3000/img/destination/Singapore.jpg");
INSERT INTO play_pic VALUES(null,"俄罗斯·贝加尔湖","http://127.0.0.1:3000/img/destination/Baikal.jpg");
INSERT INTO play_pic VALUES(null,"希腊","http://127.0.0.1:3000/img/destination/Greece.jpg");
INSERT INTO play_pic VALUES(null,"挪威","http://127.0.0.1:3000/img/destination/Norway.jpg");
INSERT INTO play_pic VALUES(null,"摩洛哥","http://127.0.0.1:3000/img/destination/Morocco.jpg");
INSERT INTO play_pic VALUES(null,"意大利","http://127.0.0.1:3000/img/destination/Italy.jpg");
INSERT INTO play_pic VALUES(null,"瑞典","http://127.0.0.1:3000/img/destination/Sweden.jpg");
INSERT INTO play_pic VALUES(null,"爱尔兰","http://127.0.0.1:3000/img/destination/Ireland.jpg");
INSERT INTO play_pic VALUES(null,"伊朗","http://127.0.0.1:3000/img/destination/Iran.jpg");
INSERT INTO play_pic VALUES(null,"新加坡","http://127.0.0.1:3000/img/destination/Singapore.jpg");
INSERT INTO play_pic VALUES(null,"印度","http://127.0.0.1:3000/img/destination/India.jpg");
-- 创建主题数据表
CREATE TABLE play_theme(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  img_url VARCHAR(255)
);
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"印度","http://127.0.0.1:3000/img/destination/India.jpg");
INSERT INTO play_theme VALUES(null,"瑞典","http://127.0.0.1:3000/img/destination/Sweden.jpg");
INSERT INTO play_theme VALUES(null,"意大利","http://127.0.0.1:3000/img/destination/Italy.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"希腊","http://127.0.0.1:3000/img/destination/Greece.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"摩洛哥","http://127.0.0.1:3000/img/destination/Morocco.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"荷兰","http://127.0.0.1:3000/img/destination/Holland.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"斐济","http://127.0.0.1:3000/img/destination/Fiji.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"印度","http://127.0.0.1:3000/img/destination/India.jpg");
INSERT INTO play_theme VALUES(null,"瑞典","http://127.0.0.1:3000/img/destination/Sweden.jpg");
INSERT INTO play_theme VALUES(null,"意大利","http://127.0.0.1:3000/img/destination/Italy.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"希腊","http://127.0.0.1:3000/img/destination/Greece.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"摩洛哥","http://127.0.0.1:3000/img/destination/Morocco.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"荷兰","http://127.0.0.1:3000/img/destination/Holland.jpg");
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,'帕伦克','http://127.0.0.1:3000/img/destination/Palenque.jpg');
INSERT INTO play_theme VALUES(null,"斐济","http://127.0.0.1:3000/img/destination/Fiji.jpg");
-- 创建视频列表
CREATE TABLE play_video(
  id INT PRIMARY KEY AUTO_INCREMENT,
  video_img VARCHAR(255),
  video_title VARCHAR(100),
  video_len VARCHAR(45),
  video_classify VARCHAR(255)
);
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/food_list1.jpg','唯有美食与爱不可辜负','02:30','美食');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/food_list2.jpg','好好吃饭用心生活，比什么都幸福','05:20','美食');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/food_list3.jpg','江湖传闻蔡康永开了家川菜馆环境口味俱佳，今天就去实测一下!','11:25','美食');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/food_list4.jpg','这家店几乎没有年轻人光顾，但吃完后我却久久不愿离开','23:12','美食');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/travel_list1.jpg','任何时间，任何地点，只要你想，即刻出发。','05:55','旅行');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/travel_list2.jpg','想与您一起同行，留一段美好回忆。','21:43','旅行');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/travel_list3.jpg','再不旅游（再不走出去），我们就老了！','17:25','旅行');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/travel_list4.jpg','时代依旧负重前行，而你我已凌波微步。','04:53','旅行');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/world_list1.jpg','因为有梦，所以勇敢出发，选择出发，便只顾风雨兼程。','03:03','世界');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/world_list2.jpg','旅游不在乎终点，而是在意途中的人和事还有那些美好的记忆和景色。','15:23','世界');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/world_list3.jpg','如果你不出去走走，你就会以为这就是世界。','08:03','世界');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/world_list4.jpg','背着背包的路上，看过许多人，听过许多故事，见过旅行风景，就这样，慢慢学会了长大。','12:23','世界');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/qiyu_list1.jpg','梦想，并不奢侈，只要勇敢地迈出第一步。','07:33','奇遇');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/qiyu_list2.jpg','总有一天，我会丢下我所有的疲倦和理想，带着我的相机和单车，远离繁华，走向空旷。','04:14','奇遇');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/qiyu_list3.jpg','要么读书要么旅行，灵魂和身体，务必有一个在路上。','05:13','奇遇');
INSERT INTO play_video VALUES(null,'http://127.0.0.1:3000/img/video/qiyu_list4.jpg','一个人旅行，不理会繁杂的琐事，自由自在地，去体验一个城市，一段故事，留下一片欢笑。','02:43','奇遇');

-- 创建视频详情表
CREATE TABLE play_video_details(
  vid INT PRIMARY KEY AUTO_INCREMENT,
  video VARCHAR(255),
  video_subtitle VARCHAR(255),
  video_bg VARCHAR(255),
  video_icon VARCHAR(255),
  video_icon_title VARCHAR(255),
  video_icon_subtitle VARCHAR(255),
  video_id INT
);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'江湖传闻蔡康永开了家川菜馆环境口味俱佳，今天就去实测一下!','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/food_icon.jpg','【美食篇】','打开美食次元的新世界',1);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",' 每个城市都有不一样的街景，不一样的美食，不过，没有你的身影，似乎都一样。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/food_icon.jpg','【美食篇】','打开美食次元的新世界',2);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'西瓜全身都是宝，西瓜皮炒着当菜吃，瓜瓤可以解渴，清火，瓜籽也可以炒了在休闲的时候吃，西瓜全身不全是宝。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/food_icon.jpg','【美食篇】','打开美食次元的新世界',3);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'三角黑森林性价比较高，甜而不腻;塔拉米苏是放在一个小小的杯子里，虽然量少了一点，但是味道比较不错;绿茶蛋糕清新甜美，唇齿留香;肉松面包松软可口，肉松比较多。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/food_icon.jpg','生活旅行','打开美食次元的新世界',4);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'在我的憧憬中，有这样一个人，陪你说走就走，才有了旅行最美的内涵。会让你有不被现实的烦恼、他人的不解羁绊的勇气，做一个真正心灵自由的人，一路前行，宛若心灵的朝圣。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/travel_icon.jpg','生活旅行','拥抱世界上的千百种生活',5);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'如果，真有这样的一个人，或者是一群人，愿意和你一起旅行，在我看来，便是去看一个人与一个人去看最美的结合，虽是不同的个体，却拥有彼此交融的灵魂，一起走，恍如一人独行。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/travel_icon.jpg','生活旅行','拥抱世界上的千百种生活',6);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'旅行去的地方不需要有动人的风景，不需要游人如织的证明，哪怕是从小到大看过无数遍的东西，比如我住了十年出租屋的天台，也同样可以是旅行的地点，十年过去，仍旧喜欢头顶的燕子，远处的夕阳。游玩在外，旅行在心。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/travel_icon.jpg','生活旅行','拥抱世界上的千百种生活',7);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'如果有人问，这不只有两种吗，还有和朋友基友一起出去呢？我想说的是，旅行和游玩不一样，旅行是去走、去听、去看、去品味，游玩是去玩、去赏、去开心。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/travel_icon.jpg','生活旅行','拥抱世界上的千百种生活',8);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'再去回味时，得到的或许是快乐，或许是遗憾，也或许是平静，无论何种，都收获了一种心情，一份心境，因为一个只有你知道的故事，一笔你的财富。将来的某一天，你可以把它分享给任何一个人，不为了炫耀，就只是简单的分享。会在将来，感谢曾经走过一次的自己，让自己的心，多了一些一辈子的东西。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/bag_icon.jpg','走遍全世界','陪你来一场不俗气的旅行',9);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'如此，说走就走，还是只适合一个人去看。在闲暇之余，安排好一切，去看看想去的地方，去看看一路上的人、一路上的风景，会想一些事但更多的时候会什么都不想。双眼所见的一切已经占据了全部的脑海，要用很久的时间去回味，去挑选，将最触动人心的画面珍藏。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/bag_icon.jpg','走遍全世界','陪你来一场不俗气的旅行',10);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'我的眼中，旅行分两种，去看一个人，以及一个人去看。前者的说走就走固然会给对方带去惊喜，但有责任意识的人，或者说会多想一些事的人免不了会多思考一些，这次意料之外的行动会不会给对方带来更多的麻烦、对方惊喜的面庞之下有没有潜藏着更深层次的厌烦、不耐。与其在那么多担心中疲惫，不如给对方足够的时间去准备。这是一种束缚，也是一种尊重。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/bag_icon.jpg','走遍全世界','陪你来一场不俗气的旅行',11);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'看过很多人说，要来一场说走就走的旅行，但是，旅行，哪有那么简单。从产生去一个地方的念头开始，到真正付诸行动，中间有太多的事、太多的细节需要去考虑，世界不是你想像的模样，没那么多激情、浪漫，更多的是日复一日的单调循环，当你想冲破这种规律，就要做好头破血流的心理预期，否则接踵而至、难以预估的麻烦足以抵消刹那间闪现的渴望。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/bag_icon.jpg','走遍全世界','陪你来一场不俗气的旅行',12);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'我梦想过去旅行，因为美丽的山川河水，大海草原，总是让我情牵梦萦。我的梦想很简单，携一个最爱的人，挎一个单反相机，或徒步，或驾车，不要目标，不要方向，更不要风景名胜，只要一分恬静，一份平淡，用相机，用美文，记录下走过的足迹。其实，平淡之中的风光，才是最旖旎的，最真实的。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/encounter_icon.jpg','奇遇','探索城市，遇见最美好的事',13);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'或许是命中注定了，漂泊是我人生的音符。幼年历经了艰辛的漂泊。我曾经以为，自己已经厌倦了漂泊，会落地生根，茗一口茶，读几卷书，安安静静地过完一生。只到突然有那么一天，不甘淡泊的命运让我的人生再次燥动。我知道，自己该再次踏上征程了。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/encounter_icon.jpg','奇遇','探索城市，遇见最美好的事',14);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'于是，一包行囊装载了我的人生和历史，一个人，茫然地走向远方，去看这个世界，到底有多精彩，到底有多无奈。白云苍狗，沧海桑田，两年多的踽踽独行，从草长走到了花凋，从山涧越过了平川；走丢了几轮日月，走老了我的容颜。我不知道这样的旅行还有多久，也不知道终点会在哪里。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/encounter_icon.jpg','奇遇','探索城市，遇见最美好的事',15);
INSERT INTO play_video_details VALUES(null,"http://127.0.0.1:3000/img/video/x.mp4",'我的旅行无关文学，也无关爱情，但我的生命却总少不了笔尖的灵感，离不了爱恋的情绪。一个人的旅行，算是圆梦？却又似乎少了什么，我知道，那是少了一份曾经心里的祈盼。现在的旅行，也许更多是一种逃避。感情的失败，没有谁对谁错，只有缘起缘尽。放下眼前的羁绊，一个人，且行且吟，去续一个遥远的放在心底深层的梦。','http://127.0.0.1:3000/img/video/ad.png','http://127.0.0.1:3000/img/video/encounter_icon.jpg','奇遇','探索城市，遇见最美好的事',16);
-- 创建评论表
CREATE TABLE play_comment(
  did INT PRIMARY KEY AUTO_INCREMENT,
  userName VARCHAR(25),
  usePhotos VARCHAR(255),
  comment VARCHAR(500),
  commentTime VARCHAR(255),
  videoDetail_id INT,
);

-- 创建结伴分享数据
CREATE TABLE play_together(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title VARCHAR(255),
  userPic VARCHAR(255),
  lookcount INT,
  commentcount INT
);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","旅行，只需要一颗安静的心和不停的脚步，不停地遇见，不停地思考，不停地流逝自己的思想，不停地更新自己的记忆。","http://127.0.0.1:3000/img/user/user_pic4.png",34,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","有时候，太执迷于这样的舒适想象，沉醉于窗外美丽的花花草草、泥土、房屋、每一条街道，每一片精彩的景象。傻乎乎地乘坐着车子，一次又一次旅行着，畅想着，怀念着……","http://127.0.0.1:3000/img/user/user_pic5.png",225,23);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","会不会每个人都怀揣着这样一个梦，有一天，背上行囊，去旅行，去看尽世间的美景。","http://127.0.0.1:3000/img/user/user_pic7.png",150,56);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","在这个快节奏的时代里，有一天你会觉得疲惫，有一天你也会感到想要放松，有一天突然不想工作了，给自己放一次长假去旅行。","http://127.0.0.1:3000/img/user/user_pic4.png",56,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","用自己努力赚来的钱，去一个很遥远的地方，最好可以有一个朋友陪伴；背着行囊看风景、或沉吟或欢笑，或与陌生人侃侃而谈，或打个电话发个微博倾诉一下沿途的心情。","http://127.0.0.1:3000/img/user/user_pic2.png",0,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","在旅行中总是会更容易与他人相处，和不相干的人聊些不相干的事，甚至心底一直以来隐藏的小秘密说说也无所谓，反正下一刻便天各一方了。","http://127.0.0.1:3000/img/user/user_pic7.png",34,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","每个人对旅行的想法都有不同，有些人把旅行当做释放压力，在旅行中可以放肆的、懒散地做个小孩，任凭谁也不会说你幼稚。","http://127.0.0.1:3000/img/user/user_pic9.png",2,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","有些人是把旅行当做一种学习，在路上，遇到任何人都可以主动交流、随心所欲的汲取他人的智慧，为自己成长助益。","http://127.0.0.1:3000/img/user/user_pic1.png",56,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","离开熟悉的环境去探索陌生的风景，体验一种从未有过的生活，甚至不知道明天会遇到谁又有怎样的对白，旅途的一切都是未知数——这也是旅行的最大诱惑所在。","http://127.0.0.1:3000/img/user/user_pic8.png",123,3);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","其实，“人生就是一场旅行，就是在体味着不同的生活”。","http://127.0.0.1:3000/img/user/user_pic1.png",34,52);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","离开熟悉的环境，去一个我们不曾到过的地方。","http://127.0.0.1:3000/img/user/user_pic6.png",2,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","用我们自己欢快的步伐留下一个个美好的印记、用一张张门票回忆着点点滴滴。","http://127.0.0.1:3000/img/user/user_pic1.png",15,2);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","去旅行吧，安静的，坐在那个你最想要去的地方，看风景来去，也是一种美丽。","http://127.0.0.1:3000/img/user/user_pic3.png",1,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","不管你之前经历了什么，在路上先把他们都忘记，享受眼前的美景，这才是旅行。","http://127.0.0.1:3000/img/user/user_pic1.png",34,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","在路上，不为旅行，不因某人，只为在未知的途中遇见未知的自己。","http://127.0.0.1:3000/img/user/user_pic6.png",89,32);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","有的事情现在不做，就一辈子也不会做了。每次都是想到这个，提着包就走了。","http://127.0.0.1:3000/img/user/user_pic2.png",69,35);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","人生至少要有两次冲动，一为奋不顾身的爱情，一为说走就走的旅行。","http://127.0.0.1:3000/img/user/user_pic1.png",34,0);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","世界上没有任何东西可以永恒。如果它流动，它就流走;如果它存著，它就干涸;如果它生长，它就慢慢凋零。","http://127.0.0.1:3000/img/user/user_pic9.png",23,15);
INSERT INTO play_together VALUES(null,"http://127.0.0.1:3000/img/getway/get.jpg","旅游和旅行的最大区别在于：旅游仅仅是用双脚与眼晴，而旅行还要带上灵魂和梦想。","http://127.0.0.1:3000/img/user/user_pic5.png",78,26);