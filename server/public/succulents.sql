#设置客户端连接服务器的编码为utf-8
set names utf8;

#丢弃数据库
drop database if exists succulents;

#创建新的数据库
create database succulents CHARSET=utf8;
#进入数据库
use succulents;
#创建保存数据表用户登录注册的信息表 user
create table user(
    uid int primary key auto_increment,
    uphone varchar(11),
    upwd varchar(16)
);
#插入数据
insert into user values(null,'13586593356','12534ffg');
insert into user values(null,'13586693356','12588ffg');
insert into user values(null,'13588693356','12504ffg');
insert into user values(null,'13586542356','12564ffg');
insert into user values(null,'13533542356','125648ff');

#创建保存数据表产品表 首页 succulent 
create table succulent(
    fid int primary key auto_increment,#产品编号
    img varchar(200),#产品图片
    title VARCHAR(100),#标题
    s_title varchar(200),#小标题
    price DECIMAL(8,2) #价格
);
insert into succulent values(null,"img/md/a.jpg","多肉 超大号12厘米原始花月夜 ","花月夜", 78.00);
insert into succulent values(null,"img/md/b.jpg","【萌兜兜】进口多肉植物种子碧光环属MONILARIA pisiformis小兔子 ","萌兜兜",3.80);
insert into succulent values(null,"img/md/c.jpg","盆栽德国KK多肉植物种子","德国KK",10.00);
insert into succulent values(null,"img/md/d.jpg","Dmgarden 大姬星美人 多肉 韩国进口多肉盆栽植物 群生粉色","大姬星美人",12.80);
insert into succulent values(null,"img/md/e.jpg","多肉植物--滇石莲 2cm","滇石莲",21.00);
insert into succulent values(null,"img/md/f.jpg","观音莲 盆栽 多肉植物 防辐射 办公室内小肉肉盆景 花卉盆栽","观音莲",3.00);
insert into succulent values(null,"img/md/g.jpg","秒杀玉露净化空气防辐射仙人多肉植物花卉办公桌面小盆栽载好发货","玉露",12.60 );
insert into succulent values(null,"img/md/h.jpg","纯种生石花 C36A 白花黄紫勋","生石花",10.00);
insert into succulent values(null,"img/md/i.jpg","多肉植物 熊童子 可爱萌爆小爪子 小熊掌","熊童子",2.00);
insert into succulent values(null,"img/md/j.jpg","肉植物 酥皮鸭多头小群4cm左右","酥皮鸭",12.67);
insert into succulent values(null,"img/md/k.jpg","清蒸庄园 多肉植物 景天属 虹之玉 耳坠草 玉米粒","虹之玉",2.00);
insert into succulent values(null,"img/md/l.jpg","【多肉植物】碰碰香","碰碰香",35.00);
insert into succulent values(null,"img/md/m.jpg","Dmgarden 鲁氏石莲","鲁氏石莲",99.00);
insert into succulent values(null,"img/md/n.jpg","子持莲华Echeveria agavoides 'Sirius' 冬云 思锐 天狼星 20粒","天狼星",16.00);
insert into succulent values(null,"img/md/o.jpg","【多肉植物】 子持莲华","子持莲华",8.50);

#创建保存数据表产品图片 succulent_img 大 中 小 图 
create table succulent_img(
    iid int primary key auto_increment,#编号
    p_id int,#产品编号
    sm VARCHAR(128),#小图片路径
    md VARCHAR(128),#中图片路径
    lg VARCHAR(128), #大图片路径
    foreign key (p_id) references succulent(fid)
);
insert into succulent_img values(null,1,"img/sm/a.jpg","img/md/a.jpg","img/lg/a.jpg");
insert into succulent_img values(null,1,"img/sm/aa.jpg","img/md/aa.jpg","img/lg/aa.jpg");
insert into succulent_img values(null,2,"img/sm/b.jpg","img/md/b.jpg","img/lg/b.jpg");
insert into succulent_img values(null,2,"img/sm/bb.jpg","img/md/bb.jpg","img/lg/bb.jpg");
insert into succulent_img values(null,3,"img/sm/c.jpg","img/md/c.jpg","img/lg/c.jpg");
insert into succulent_img values(null,3,"img/sm/cc.jpg","img/md/cc.jpg","img/lg/cc.jpg");
insert into succulent_img values(null,4,"img/sm/d.jpg","img/md/d.jpg","img/lg/d.jpg");
insert into succulent_img values(null,5,"img/sm/e.jpg","img/md/e.jpg","img/lg/e.jpg");
insert into succulent_img values(null,6,"img/sm/f.jpg","img/md/f.jpg","img/lg/f.jpg");
insert into succulent_img values(null,6,"img/sm/ff.jpg","img/md/ff.jpg","img/lg/ff.jpg");
insert into succulent_img values(null,7,"img/sm/g.jpg","img/md/g.jpg","img/lg/g.jpg");
insert into succulent_img values(null,8,"img/sm/h.jpg","img/md/h.jpg","img/lg/h.jpg");
insert into succulent_img values(null,9,"img/sm/i.jpg","img/md/i.jpg","img/lg/i.jpg");
insert into succulent_img values(null,9,"img/sm/ii.jpg","img/md/ii.jpg","img/lg/ii.jpg");
insert into succulent_img values(null,10,"img/sm/j.jpg","img/md/j.jpg","img/lg/j.jpg");
insert into succulent_img values(null,10,"img/sm/jj.jpg","img/md/jj.jpg","img/lg/jj.jpg");
insert into succulent_img values(null,10,"img/sm/jjj.jpg","img/md/jjj.jpg","img/lg/jjj.jpg");
insert into succulent_img values(null,11,"img/sm/k.jpg","img/md/k.jpg","img/lg/k.jpg");
insert into succulent_img values(null,11,"img/sm/kk.jpg","img/md/kk.jpg","img/lg/kk.jpg");
insert into succulent_img values(null,12,"img/sm/l.jpg","img/md/l.jpg","img/lg/l.jpg");
insert into succulent_img values(null,13,"img/sm/m.jpg","img/md/m.jpg","img/lg/m.jpg");
insert into succulent_img values(null,14,"img/sm/n.jpg","img/md/n.jpg","img/lg/n.jpg");
insert into succulent_img values(null,15,"img/sm/o.jpg","img/md/o.jpg","img/lg/o.jpg");
insert into succulent_img values(null,15,"img/sm/oo.jpg","img/md/oo.jpg","img/lg/oo.jpg");
insert into succulent_img values(null,15,"img/sm/ooo.jpg","img/md/ooo.jpg","img/lg/ooo.jpg");
#购物车shopping_car
create table shopping_car(
    sid int primary key auto_increment,#编号
    s_uid int,#用户编号
    s_pid int,#产品的编号
    s_img varchar(200),#产品图片
    s_title varchar(200),#小标题
    s_price DECIMAL(8,2), #价格
    s_count int #加入购物车的产品的数量
);
insert into shopping_car values(null,1,1,"img/sm/a.jpg","花月夜", 78.00,5);
insert into shopping_car values(null,1,2,"img/sm/b.jpg","萌兜兜", 3.80,3);
insert into shopping_car values(null,1,3,"img/sm/c.jpg","德国KK",10.00,1);
insert into shopping_car values(null,1,4,"img/sm/d.jpg", "大姬星美人",12.88,3);
insert into shopping_car values(null,1,5,"img/sm/e.jpg","滇石莲",21.00,2);
insert into shopping_car values(null,4,5,"img/sm/e.jpg","滇石莲",21.00,1);
insert into shopping_car values(null,4,4,"img/d.jpg", "大姬星美人",12.88,1);
insert into shopping_car values(null,4,1,"img/sm/a.jpg","花月夜", 78.00,5);
#多肉养护方法列表list
create table list(
    lid int primary key auto_increment,#编号
    title varchar(10),#标题
    synopsis varchar(150),#简介
    img varchar(200)#图片
    
);
insert into list values(1,"虹之玉","虹之玉是一种多肉植物，平时大家也是比较常见的，它一般被人们称为葡萄掌。","img/list/a.jpg");
insert into list values(2,"玉露","服盆的玉露：夏天在服盆期的玉露，如果拿去晒太阳，只要三天，你的玉露所有叶片就会变成灰色，超过5天基本上就会全黑了","img/list/aa.jpg");

#多肉养护方法文章list-item
create table list_item(
    li_id int primary key auto_increment,#编号
    l_id int,#列表id
    title varchar(10),#标题
    content1 varchar(500),#方法内容
    img1 varchar(200),#图片
    content2 varchar(1000),#方法内容
    img2 varchar(200),#图片
    content3 varchar(1000),#方法内容
    img3 varchar(200),#图片
    content4 varchar(1000),#方法内容
    img4 varchar(200),#图片
    foreign key (l_id) references list(lid)
);
insert into list_item values(1,1,"虹之玉",
"虹之玉是一种多肉植物，平时大家也是比较常见的，它一般被人们称为葡萄掌。
它是比较好养活的一种多肉，它比较喜欢温暖的环境。抗旱性比较强，适应能力也不错，
它的土壤的要求也不高，所以说它是比较适合懒人养活的。",
"img/content/a.jpg",
"作为一种多肉植物，所以它的叶片都是肉质的，是椭圆形状的，比较长。
他也是会开花的，它的花是黄色的心形非常好看，不过在冬天和秋天，它的叶片有的会变成鲜红色，
非常神奇。因为虹之玉对温度的适应能力比较强，所以它是比较容易制动指导。
不过咱这儿的过程中最好多给它降温，因为给它降温的话，它的观赏性会更好，花朵和叶子都会生长得很好。虹之玉的病害也比较少。
可能会因为它所在的环境通风不好，会引起叶斑病。但是只要及时处理就可以了，所以。虹之玉要放在通风良好的地方。",
"img/content/aa.jpg",
"虹之玉它的生长速度是非常快的。所以虽然一般多少植物是不用经常修剪的，但是虹之玉是不一样的， 
它需要及时给它修剪。大家可能很少给多肉植物修剪过，所以不是该如何修剪。因为虹之玉它主要是茎生长比较快，
所以一般它的茎会比较高一些，叶子也会比较密集。
这样的话叶子就会掉落了，为了让他保持好的形态，一定要及时的修剪。修剪主要是对它的枝叉修剪，然后留下它的主干让它继续生长。",
"img/content/aaa.jpg",
"其实一般小型的虹之玉是不会出现这种状况的。主要是有一些比较大的盆栽，这样就更容易生长较快，就必须及时修剪。其实给它修剪并不难，
只需要在它生长的过快时修剪或者植株超过一定的高度对它进行拦腰修剪。虹之玉虽然它的茎生长的比较快，但其实它的整体生长速度是比较慢的，
所以平时我们在养护过程中浇水和施肥都不能太过于频繁,因为虹之玉它是耐干旱的，所以只需要在土壤看起来比较干的状态下给它浇水就可以了，
不过浇水时要一次性浇透，冬天就更要减少浇水的次数和量了。",
"img/content/aaaa.jpg");
insert into list_item values(2,2,"玉露",
"养玉露的方法有很多，每个人都有自己不同的方法，但是，很多肉友的养护方法是从其他花卉的经验中总结而来的，这些方法并不适合养玉露，
反而抑制了玉露的生长，更有些极端的方法能直接扼杀你家的玉露。",
"img/content/b.jpg",
"服盆的玉露：夏天在服盆期的玉露，如果拿去晒太阳，只要三天，你的玉露所有叶片就会变成灰色，超过5天基本上就会全黑了。服盆期的玉露不能晒太阳，
不晒太阳能更有利于生根。同时服盆期的玉露，不管什么季节，
在浇水的时候，如果水量过大，都会危急你家的玉露，服盆期只需要保证土壤湿润便可，无需大量浇水。",
"img/content/bb.jpg",
"玉露盆：种多肉的盆有很多种，但并不是每种都适合用来种玉露，种玉露的盆需要高度达到10-15厘米，如果用景天的盆，深度不够，
就会导致玉露的根系无法发育生长。因为玉露的根系是非常粗壮的，所以，足够深度的多肉盆是让它们茁壮成长的基础保证。",
"img/content/bbb.jpg",
"多肉土：泥巴种多肉这种事并非没有发生，泥巴是不能养多肉的，更何况是养玉露，玉露对土壤的需求是与其他花卉不同的，
它要求的土壤必须是疏松透气徘水性好的，不满足这些条件，你家的玉露基本上养不好，所以，土壤中必须加入大量的颗粒土，
如：麦饭石、植金石、日向石、珍珠岩等颗粒，颗粒大小选择2-6毫米之间的最适合，这些颗粒混合在泥炭土中，颗粒和泥炭土的比例各占50%，
这样的配方基本上能满足全国不同地区。",
"img/content/bbbb.jpg"
);

