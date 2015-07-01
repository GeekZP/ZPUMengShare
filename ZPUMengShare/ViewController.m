//
//  ViewController.m
//  ZPUMengShare

//  联系开发者:QQ1397819210

//  Created by 郑鹏 on 15/6/29.
//  Copyright (c) 2015年 zhengpeng. All rights reserved.
//

#import "ZPSharePackage.h"
#import "ViewController.h"

@interface ViewController ()
{
    NSArray *shareArray;
}
@end

#warning 使用说明
//1.ZPActionsheet 这个文件夹对应的是分享弹出UI界面
//2.ZPUMeng里包含ShareLib(分享SDK)和ZPUMengShare(分享类)
//3.AppDelegate+Share配置各种平台的分享appkey等
//4.使用时拷贝ZPActionsheet和ZPUMeng和AppDelegate+Share所有到自己工程
//5.添加必备的framework
//6.添加各平台的schemes到工程
//7.具体使用见下面
#warning 使用说明

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  UI展示数据
     *  titleArr(各平台名称数组)
     *  imageArr(各平台对应的图片)
     *  platformArr(对应各平台,具体哪些平台参考UMSocialSnsPlatformManager.h)
     */
    shareArray = @[
  @{@"titleArr":@[@"微信朋友圈",@"微信好友",@"QQ好友",@"QQ空间",@"新浪微博",@"腾讯微博"]},
  @{@"imageArr":@[@"wechatquan",@"wechat",@"tcentQQ",@"tcentkongjian",@"sinaweibo",@"tcentWeibo"]},
  @{@"platformArr":@[UMShareToWechatTimeline,UMShareToWechatSession,UMShareToQQ,UMShareToQzone,UMShareToSina,UMShareToTencent]}
  ];
}

- (IBAction)shareAction:(id)sender
{
    ActionSheetView *shareView = [[ActionSheetView alloc] initWithShareHeadOprationWith:shareArray[0][@"titleArr"] andImageArry:shareArray[1][@"imageArr"] andProTitle:@"分享至" and:ShowTypeIsShareStyle];
    __weak id weakSelf = self;
    [shareView setBtnClick:^(NSInteger btnTag) {
        [weakSelf shareWithTitle:btnTag];
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:shareView];
}


- (void)shareWithTitle:(NSInteger)btnTag
{
    [ZPSharePackage shareToSocialPlatform:shareArray[2][@"platformArr"][btnTag] WithTitle:@"测试分享" andImage:[UIImage imageNamed:shareArray[1][@"imageArr"][btnTag]] andUrl:@"www.baidu.com" showOn:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end








