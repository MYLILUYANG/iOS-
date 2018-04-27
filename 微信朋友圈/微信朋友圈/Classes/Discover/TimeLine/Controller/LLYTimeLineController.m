//
//  LLYTimeLineController.m
//  微信朋友圈
//
//  Created by liluyang on 2018/3/21.
//  Copyright © 2018年 liluyang. All rights reserved.
//

#import "LLYTimeLineController.h"
#import "LLYTimeLineCell.h"
#import "LLYTimeLineModel.h"
#import "LLYTimeLineFrameModel.h"
static NSString *cellId = @"cellId";
@interface LLYTimeLineController ()
@property (nonatomic, strong) NSMutableArray *allDataArray;
@end

@implementation LLYTimeLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.title = @"朋友圈";
    [self.tableView registerClass:[LLYTimeLineCell class] forCellReuseIdentifier:cellId];
    [self loadData];
}

-(void)loadData
{
    
    _allDataArray = [NSMutableArray array];
    NSString *img = @"http://www.qqzhi.com/uploadpic/2015-01-15/055123530.jpg";
    NSArray *timeArray = @[@"1523200076",
                           @"1523669739",
                           @"1523669139",
                           @"1523669239",
                           @"1522805139",
                           @"1523467539",
                           @"1523492739",
                           @"1523477139",
                           @"1523497139",
                           @"1523427139",
                           @"1523490139"];
    
    
    
    NSArray *contentArray = @[@"人生若只如初见，何事秋风悲画扇。",
                              @"人有悲欢离合，月有阴晴圆缺，此事古难全。\n但愿人长久，千里共婵娟。",
                              @"一片春愁待酒浇，江上舟摇，楼上帘招。\n秋娘渡与泰娘桥，风去飘飘，雨又潇潇。\n何日归家洗客袍？银字笙调，心字香烧。\n流光容易把人抛，红了樱桃，绿了芭蕉。",
                              @"呦呦鹿鸣，食野之苹",
                              @"崧高维岳，骏极于天。\n维岳降神，生甫及申。\n维申及甫，维周之翰。\n四国于蕃。四方于宣。",
                              @"春阴垂野草青青，时有幽花一树明 ",
                              @"燕燕飞来，问春何在，唯有池塘自碧 ",
                              @"雪后轻桡入翠微，花溪寒气上春衣。 过桥南岸寻春去，踏遍梅花带月归。",
                              @"姹紫嫣红耻效颦，独从末路见精神。 溪山深处苍崖下，数点开来不借春。",
                              @"探梅冒雨兴还生，石迳铿然杖有声。\n云影花光乍吞吐，松涛岩溜互喧争。\n韵宜禅榻闲中领，幽爱园扉破处行。\n望去茫茫香雪海，吾家山畔好题名。",
                              @"仲夏苦夜短，开轩纳微凉 ",
                              @"绿阴生昼静，孤花表春余 ",
                              @"那一天，我闭目在经殿的香雾中，蓦然听见你颂经中的真言；\n那一月，我摇动所有的经筒，不为超度，只为触摸你的指尖；\n那一年，磕长头匍匐在山路，不为觐见，只为贴着你的温暖；\n那一世，转山转水转佛塔，不为修来世，只为途中与你相见。\n那一夜，我听了一宿梵唱，不为参悟，只为寻你的一丝气息。\n那一刻， 我升起风马，不为乞福，只为守候你的到来；\n那一瞬，我飞升成仙，不为长生，只为佑你平安喜乐。\n只是，就在那一夜，我忘却了所有， 抛却了信仰，舍弃了轮回， 只为，那曾在佛前哭泣的玫瑰，早已失去旧日的光泽。",
                              @"十年生死两茫茫，不思量，自难忘，千里孤坟，无处话凄凉。",
                              @"一年老一年，一日没一日，一秋又一秋，一辈催一辈",
                              @"一点浮萍去何方？浅浅来，悠悠浪飘飘梦结，沉沉自彷徨。 \n搜索看它丝根清流上，冷冷游，默默淌。 \n鸾镜青鸟红酒旁，奄奄飞，渐渐忘素素纤指，不知怎思量。\n 莫问落花将何方，落也伤，留也凉。"];
    NSArray *nickNameArray = @[@"刘德华",
                           @"张学友",
                           @"周杰伦",
                           @"林冲",
                           @"鲁智深",
                           @"黄蓉",
                           @"郭靖",
                           @"鲁大师",
                           @"弼马温",
                           @"佛系青年",
                           @"沙悟净"];
    
    
    NSArray *images = @[@"http://pic2.ooopic.com/12/42/25/02bOOOPIC95_1024.jpg",
                        @"http://imgsrc.baidu.com/image/c0%3Dpixel_huitu%2C0%2C0%2C294%2C40/sign=aa22fdf148166d222c7a1dd42f5b6c9b/5ab5c9ea15ce36d32ae0f90a31f33a87e950b120.jpg",
                        @"http://img3.3lian.com/2013/c2/78/d/38.jpg",
                        @"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=9b867a04b299a9012f38537575fc600e/4d086e061d950a7b86bee8d400d162d9f2d3c913.jpg",
                        @"http://img3.3lian.com/2013/c2/78/d/36.jpg",
                        @"http://pic34.photophoto.cn/20150127/0006019093196381_b.jpg",
                        @"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=16f6ff0030292df583cea456d4583615/e1fe9925bc315c60b6b051c087b1cb13495477f3.jpg",
                        @"http://www.taopic.com/uploads/allimg/140816/235034-140Q60K05695.jpg",
                        @"http://pic14.photophoto.cn/20100309/0034034471909409_b.jpg",
                        @"http://s1.sinaimg.cn/mw690/0027Q0dLzy7fxVcHZXG70&690",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698402685&di=20395c2f10ea334781b8eaff46dd9bbc&imgtype=0&src=http%3A%2F%2Fmat1.gtimg.com%2Ffashion%2Fruliu%2F749%2F2.jpg",
                        @"http://img.mp.itc.cn/upload/20160916/4e7aabf4238a4936a07b937aac605662_th.jpeg",
                        @"http://img.mp.itc.cn/upload/20160916/f6800f9c193241c0be6c86f5df09310a_th.jpeg",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698597519&di=84b4e3d887bcfddaf6b1f18f09d578cc&imgtype=0&src=http%3A%2F%2Fimg2.zol.com.cn%2Fproduct%2F138%2F481%2FceEBSJcqlc5mc.jpg",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698597519&di=81aaf6e941375e80eeccd29ef2b1ba6b&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Dd094cd5df1f2b211f0238d0da2e90f4d%2F9213b07eca806538cc7b0f3d9ddda144ad34820f.jpg",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698597518&di=c5d03e5b1071bc1c9f1570637e16baad&imgtype=0&src=http%3A%2F%2Fwww.fansimg.com%2Fuploads2016%2F01%2Fuserid332813time20160104064536at94.jpg",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698629702&di=199e04703fcaeee0ce88c57320158e0d&imgtype=0&src=http%3A%2F%2Fimages.china.cn%2Fattachement%2Fjpg%2Fsite1000%2F20141006%2F0019b91ed631159c394343.jpg",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698629702&di=8dbd6459b8f8ac5c273f480f7c9a8efe&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Db06a757333dbb6fd3156ed65614dc16d%2F5366d0160924ab18769b20bf3ffae6cd7a890bad.jpg",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698629700&di=9b0bf9324d52410a7b43d9862cb0d0c9&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dpixel_huitu%252C0%252C0%252C294%252C40%2Fsign%3De1e195bd41ed2e73e8e48e6cee79c4e7%2F908fa0ec08fa513df10c16e7366d55fbb2fbd961.jpg",
                        @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523698629700&di=8369f9614b1dfc8d21e062c2a0af6b18&imgtype=0&src=http%3A%2F%2Fpicture.youth.cn%2Fqtdb%2F201410%2FW020141003253982551747.jpg",];
//    NSMutableArray *imgArray = [NSMutableArray array];
  
    dispatch_queue_t queue = dispatch_queue_create("asyncQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i <= 20; i ++) {
            LLYTimeLineModel *model = [[LLYTimeLineModel alloc] init];
            model.imagesArray = [NSMutableArray array];
            model.isOpening = NO;
            model.userHeader = img;
            model.nickName = nickNameArray[arc4random() % 11];
            model.content = contentArray[arc4random() % 11];
            
            int count = arc4random() % 9;
            for (int j = 0; j < count; j++) {
                [model.imagesArray addObject: images[arc4random() % 20]];
            }
            
            model.publishTime = timeArray[arc4random() % 11];
            LLYTimeLineFrameModel * frameModel = [[LLYTimeLineFrameModel alloc] init];
            frameModel.timeLineModel = model;
            [_allDataArray addObject:frameModel];
        }
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _allDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLYTimeLineCell *cell = [LLYTimeLineCell initCellWithTableView:tableView identifier:cellId];
    cell.indexPath = indexPath;

    if (!cell.moreTextBtnClicked) {
        
        cell.moreTextBtnClicked = ^(NSIndexPath *indexPath) {
            
            LLYTimeLineFrameModel *model = self.allDataArray[indexPath.row];
            model.timeLineModel.isOpening = !model.timeLineModel.isOpening;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
        };
    }

    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    [cell setModel:_allDataArray[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",touches);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    [[NSNotificationCenter defaultCenter] postNotificationName:K_OptionMenuViewNotification object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s",__func__);
    
}

@end
