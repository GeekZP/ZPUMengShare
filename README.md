# ZPUMengShare

#1.使用说明
*1.ZPActionsheet 这个文件夹对应的是分享弹出UI界面

*2.ZPUMeng里包含ShareLib(分享SDK)和ZPUMengShare(分享类)

*3.AppDelegate+Share配置各种平台的分享appkey等

*4.使用时拷贝ZPActionsheet和ZPUMeng和AppDelegate+Share所有到自己工程

*5.添加必备的framework

*6.添加各平台的schemes到工程

*7.具体使用见下面


#2.主要方法

#自定义界面

ActionSheetView *shareView = [[ActionSheetView alloc] initWithShareHeadOprationWith:shareArray[0][@"titleArr"] andImageArry:shareArray[1][@"imageArr"] andProTitle:@"分享至" and:ShowTypeIsShareStyle];

__weak id weakSelf = self;

[shareView setBtnClick:^(NSInteger btnTag) {

[weakSelf shareWithTitle:btnTag];

}];

[[UIApplication sharedApplication].keyWindow addSubview:shareView];


#点击界面后执行分享的方法
 *  分享到各个平台
 *  @param PlatformName   平台名称,在试图控制器里配置,具体哪些平台参考UMSocialSnsPlatformManager.h
 *  @param text           要分享的文本信息
 *  @param image          分享的图片信息(可以传NSData或UImage)
 *  @param url            要分享的网址
 *  @param viewController 从哪个视图控制器传过来的(一般直接写self)
 
 * + (void)shareToSocialPlatform:(id)PlatformName WithTitle:(NSString *)text andImage:(id)image andUrl:(NSString *)url showOn:(UIViewController *)viewController;
