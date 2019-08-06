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
insert into list values(3,"桃之卵","桃之卵又名桃蛋，为景天科风车草属多肉植物，夏季休眠或半休眠，为冬型种。","img/list/b.jpg");
insert into list values(4,"生石花","生石花形态奇特，花色艳丽，使得许多爱好者专门收集栽培，具有很高的观赏价值。","img/list/c.jpg");
insert into list values(5,"吉娃娃","吉娃莲俗称吉娃娃、杨贵妃,形态优美有着很高的观赏价值，寓意吉祥","img/list/d.jpg");
insert into list values(6,"宝石花","宝石花是观叶花卉中形态最美的植物之一，姿态秀丽，形似池中莲花，且叶片晶莹剔透，故称“石莲花”，被誉为“永不凋谢的花朵”","img/list/e.jpg");
insert into list values(7,"熊童子","该种叶形叶色较美，花朵玲珑小巧，叶片形似小熊的脚掌，形态奇特，十分可爱，观赏价值很高。","img/list/f.jpg");
insert into list values(8,"蓝松","多肉植物，有着特别的天蓝色叶片，在受到强光照射时，会变成绚丽的紫色。","img/list/g.jpg");
insert into list values(9,"小红衣","吉娃莲俗称吉娃娃、杨贵妃,形态优美有着很高的观赏价值，寓意吉祥","img/list/h.jpg");
insert into list values(10,"黑法师","吉娃莲俗称吉娃娃、杨贵妃,形态优美有着很高的观赏价值，寓意吉祥","img/list/i.jpg");
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
insert into list_item values(3,3,"桃之卵",
"桃之卵喜温暖、干燥和阳光充足的环境。",
"img/content/b1.jpg",
"桃之卵的浇水遵循干透浇透，不干不浇的原则。当植株出现掉叶片的情况时，多数是是因为土壤水分太充足或换季时给水太多所致。
当碰触桃蛋的叶片就轻易掉落时，可少浇水或循序渐进式给水，就可以尽量避免掉叶片。掉下的叶片只要叶身饱满，都可以进行叶插，非常容易成活。",
"img/content/b11.jpg",
"桃之卵春秋季生长期每2周浇水1次，可大水浇灌，保证土壤透水、透气。老桩不耐水湿，浇水时注意盆土不要积水。
夏季高温短暂休眠，建议不断水，适当遮阴，以免叶片晒伤。冬季搬进室内向阳处，室温维持在8℃以上最好。",
"img/content/b12.jpg",
"桃之卵多采用叶插法繁殖，春秋季进行。叶插时将健康、完整、饱满的叶片放在微湿、疏松的土壤表面，不要暴晒，
几周之后它们就会自然萌发根系和小叶片。当新发的根系长达2~3cm时，可将根系覆盖上一层薄薄的细沙，不久即可长成独立的小植株。",
"img/content/b13.jpg"
);
insert into list_item values(4,4,"生石花",
"养殖生石花需要透气性好疏松的沙壤土，并且保持湿润的环境即可，
最适合的生长温度是15-25℃，在春秋季节可以让它接受阳光照射；可以采用播种繁殖和扦插繁殖，另外还要注意叶斑病和叶腐病的发生。。",
"img/content/c.jpg",
"1、土壤：生石花喜欢透气性好疏松的沙壤土，最好是选择中性土壤。

2、浇水：它不需要太多的水分，浇水量不要过多，不然会长出青苔，会耽误它的正常生长。

3、温度：最合适的温度为15-25℃，冬季温度最好是在10℃左右，最低不要低于5℃，不然会冻伤它还可能会死亡。

4、光照：春秋季节可以让阳光直射，在夏季温度过高时就要做好遮荫措施，冬季最好放在光照明亮的地方。",
"img/content/c1.png",
"1、播种繁殖：采用室内盆播的方式，一般在4-5月份，温度大概为15-25℃，播种后不要直接浇水，也不用盖泥土，不然会影响发芽。

2、扦插繁殖：准备好适合的基质，将茎秆或叶片剪掉晾干后插进基质，然后用水微微喷湿即可，不久就会长出根系了，一般气温比较高的时候最好不要进行扦插繁殖。",
"img/content/c2.png",
"最常见的就是叶腐病和叶斑病，出现这种危害后可以用药剂喷洒；虫害一般是根结线虫，可以换土来减少它的侵害，其次就是蚂蚁，可以用套盆隔水养护，这样蚂蚁就爬不到球状叶上了。",
"img/content/c3.jpg"
);
insert into list_item values(5,5,"吉娃娃",
"吉娃莲俗称吉娃娃、杨贵妃。是一种外形类似莲花的多肉植物。春秋两季是它的生长旺盛期。吉娃莲喜爱在温暖干燥，
阳光充足的生殖环境下生存。最适宜的生长温度在17~25℃之间。它不耐寒，耐干旱半阴，所以适宜的生长环境在阳台等阳光充足的环境。",
"img/content/d.jpg",
"将种子移植进花盆时，进行第一次浇水应当浇透，使土壤充分的受到水分的浸润。随后种子发芽在生长期时，
应保持在每两周浇一次水。不要多浇，以免吉娃莲出现烂根、腐烂的情况。然后根据季节，春秋两季时每两周浇一次水，冬季时根据土壤情况选择浇1~2次水。",
"img/content/d1.jpg",
"吉娃莲在生长期，是很需要肥料中的营养支持的，在栽种时应加入含有氮、磷、钾营养元素的肥料作为基底。
然后在春秋季节时每月施肥一次，注意应当施加比较稀薄的肥料，虽然吉娃莲很需要肥料中的营养，
但是浇灌浓肥可能会导致吉娃莲的营养过剩，反而对于吉娃莲的生长不利。",
"img/content/d2.jpg",
"在家庭中养殖时，容易受到锈病与黑象甲的侵扰，延缓吉娃莲的生长发育，严重时会导致吉娃莲叶片出现虫洞，
黑斑等现象的出现。在这两种情况的发生后可以使用，70%左右的百菌清可湿性粉剂兑水进行喷洒防治。
在这两种情况未发生时，可注意养殖环境不要太过潮湿阴暗等即可。",
"img/content/d3.jpg"
);
insert into list_item values(6,6,"宝石花",
"（1）干燥通风，光照充足的环境是适宜养宝石花的。宝石花喜欢阳光，还喜欢含有腐殖质的泥土，也能适应比较贫瘠的泥土

（2）宝石花非常耐旱，就算我们十天半个月不给它浇水，它也能生长的很好，因为它的每一瓣叶片就像是一个小水库一般，水分全部都储存在里面，以备干旱的时候用

（3）它也耐寒耐阴，就算是在室内空气比较闷热的环境，它也能适应，冬天温度不能10度，长期放在阴凉的地方它的植株就会徒长叶片也会长的比较稀疏，在长江以南等地区还可以露地栽培呢。",
"img/content/e.jpg",
"2、土壤选择

宝石花需要土质疏松的，排水透气好的，肥沃的土壤，我们可以用蛭石，粗砂，草炭灰，腐叶土各一半，再加入一点少量的骨粉材料，搅拌均匀之后使用。",
"img/content/e1.jpg",
"3、温度调节

夏天高温跟冬天低温的时候宝石花都会处在一个休眠的状态，主要生长的时间是在比较凉爽的春天根秋天，生长期要求要有足够的光照，
光照不足就会导致它植株的株型长得比较松散不紧凑，影响美观，
相反，如果光照充足的话，它的植株就会长得比较紧凑，叶片也会肥厚而饱满，叶片的颜色也会更加艳丽有光泽。",
"img/content/e2.jpg",
"4、适当浇水

（1）宝石花不能处于长期积水的状态，很容易就会出现烂根的情况，不过也不能让它的土壤过于干旱，否则它的植株虽然不会死亡，但是会出现生长缓慢的情况，叶色比较暗淡无光泽，缺乏生机

（2）夏天高温时季节，水分的蒸腾量比较大，需要给它浇更多的水，如果缺水就比较容易使它的叶片出现萎蔫，
所以必要的时候还要给它的叶片上面喷一些水，同时还要保持它的环境湿润，但是必须要避免盆里面出现积水，否则就会出现根部腐烂。",
"img/content/e3.jpg"
);
insert into list_item values(7,7,"宝石花",
"（熊童子算是个子比较高的多肉了，适合用细高一点的花盆，以陶瓷、黏土盆为主，底部一定要带有出水孔。",
"img/content/f.jpg",
"花市里自带的土没什么营养，而且量太少不够固定栽种的。回家上盆的时候再配一点土（园土：营养土：石粒=1:1:1）。
上盆的时候，原来自带的土不要扒掉，带着一起栽到新土里。为了防止熊童子歪倒，在盆面铺一层小石子，不要铺太厚，稍微撒一点，
以防新栽的熊童子撅起来。栽好浇透水，然后放在屋里散光的位置，过年就能尽情观赏啦。",
"img/content/f1.jpg",
"天气太冷或者太热，熊童子都会掉叶子，这是植物自我保护的本能哦，
为了保存营养进入了半休眠状态。温度大概是8度以下，28度以上，
每家的小环境不同，大家要留心一点。如果一个低温来袭，熊童子开始掉叶子，就不要浇水了，
白天有太阳的时候搬到阳光处多晒晒，太阳落山就搬到室内比较温暖的地方，不要见冷风，也要少浇水（甚至不浇）。",
"img/content/f2.jpg",
"熊童子很喜欢晒太阳，一晒红爪子就出来了，所以说在家里养的可能比多肉大棚里的状态都要好。每天保持2个小时以上的光照就好，夏天32度以上遮阳。",
"img/content/f3.jpg"
);
insert into list_item values(8,8,"蓝松",
"蓝松喜光照、耐干旱，最低可耐-7~-4℃的低温。喜透气、排水良好、pH6.6~7.5的土壤。
它是夏型种，夏季也会生长，所以除冬季低温适当控水防冻伤外，其他季节均可正常浇水，遵循见干见湿的原则。",
"img/content/g.jpg",
"从外形上很难想象其隶属于菊科，许多人认为它属于景天科植物，不过从后期生长特点来看，的确拥有菊科的特点。

它的根系非常粗壮，并且很发达，可以选择较深较大的花盆栽培，根系生长健壮后，新的分枝会从根部生长出来。叶片全年为蓝色，不过缺少日照后会变为绿色，比较喜欢日照，一定要给足日照时间。

夏季高温时有短暂休眠，需要适当遮阴，注意减少浇水，防止腐烂，其他季节可以大量给水并保证充足光照。每月浇水4~5次，冬季低于5℃要减少浇水，春秋季各施缓释肥一次。它生长也非常迅速，很快就会长到一大丛。",
"img/content/g1.jpg",
"蓝松可以通过枝插、分株和播种进行繁殖。",
"img/content/g2.jpg",
"蓝松是一种不错的组合栽培材料，适合于各种迷你组合、庭院搭配等。植株形态呈向上生长趋势，虽然群生速度很快，不过也不会占用太多地方，适合作为组合栽培中的层次划分。
单独栽培也很不错，我曾在花友家见到过满满一大盆的蓝松，自身的蓝色调非常抢眼，看起来很美。",
"img/content/g3.jpg"
);
insert into list_item values(9,9,"小红衣",
"质土壤是最好的选择，沙土能够较好排水，而且比较透气，一方面有利于积水排出，
另一方面也有利于根部生长。沙土中适当添加一些腐叶土，可以让土壤养分更充足。
也可以在土中添加上珍珠岩或者兰石等物质。每隔一两年的春天换一次盆，换盆的同时把长势不好的老根减掉。",
"img/content/h.jpg",
"小红衣喜光照，光照条件越好、昼夜温差越大，叶子长势越好、越密，叶子的色彩也会更加艳丽。
相反如果光照不足，则会不利于叶子的光合作用，使叶子颜色变浅，变稀疏。
所以一般温度适宜的情况下，建议将小红衣放置在阳光充足的地方。但是夏天是它的休眠期，要注意遮阳。",
"img/content/h1.jpg",
"等到花盆干透的时候再进行浇水，浇水的时候也要把水浇透。
浇的时候注意浇到土壤上，不要浇在叶片上，影响美观，而且不要浇到花芯上，
容易使花芯腐烂。夏季的时候，尽量不要浇水。梅雨时节天气潮湿水分大，可以暂停浇水。",
"img/content/h2.jpg",
"介壳虫是小红衣的头号虫害杀手，一般在根部和叶片中心这些地方比较多见。
一旦发现介壳虫，应该果断把长虫的部分清理掉。为了更好的预防这种虫害，可以在栽植的时候往土里混进少量的土虫丹。等到炎热的夏季，通风条件变差加上高温高湿，小红衣的植株尤其是根部很容易腐烂变黑。
一旦出现变黑腐烂的情况，应当立即将病变的部分和其他健康的植株进行分离，以防止传染。
如果症状较轻可以把腐烂的地方除去，在伤口处涂抹百菌灵等杀菌药物，伤口处晾干后继续插进土里可以生新根。",
"img/content/h3.jpg"
);
insert into list_item values(10,10,"黑法师",
"黑法师是很娇贵的多肉植物，不耐寒也不耐热，冬季温度低于5度时，
它的叶片就会开始变软，停止生长，甚至会有落叶现象。夏季由于温度高，黑法师会一直休眠，
到了秋天才会进入生长期。因此，在冬天和夏天一定要将它移至室内养殖。",
"img/content/i.jpg",
"黑法师适合比较肥沃的土壤，而且要保持疏松、排水性良好。泥炭土、菜园土等都是黑法师的优选土壤。
在春天和秋天，黑法师的生长阶段，需要相对多一点的水分需求，冬季一定要控制水分，能少浇就少浇一点，越干越容易安全过冬。",
"img/content/i1.jpg",
"因为黑法师开花后就会死去，所以一定要学会它的繁殖方法，来延续它的养殖，
剪掉上面的圆盘状，它的茎就会发出很多新芽芽，而且黑法师的叶片插在土里或放置土上也会轻轻松松长出新植株的哦。
黑法师属于喜阳的植物，一定不要放在阴暗处养殖。窗台和庭院都是不错的养殖场所，如果光照不足，叶片就会猥琐，失去美的观赏价值。注意夏季阳光太强，中午要进行适当的遮阳处理哦。",
"img/content/i2.jpg",
"养殖黑法师要做到薄肥多施，如果养分过剩，它就会徒长，春秋生长期间，二十天施肥一次，冬季啊就要三十天施肥一次。注意在开花之前要追肥一次，这样才能开出更漂亮的花朵。",
"img/content/i3.jpg"
);