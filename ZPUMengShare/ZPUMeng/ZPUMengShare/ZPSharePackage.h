//
//  ZPSharePackage.h
//  ZPUMengShare
//
//  Created by 郑鹏 on 15/6/29.
//  Copyright (c) 2015年 zhengpeng. All rights reserved.
//

#import "WXApi.h"
#import "UMSocial.h"
#import "UMSocialControllerService.h"
#import <Foundation/Foundation.h>


@interface ZPSharePackage : NSObject

/**
 *  分享到各个平台
 *
 *  @param PlatformName   平台名称,在试图控制器里配置,具体哪些平台参考UMSocialSnsPlatformManager.h
 *  @param text           要分享的文本信息
 *  @param image          分享的图片信息(可以传NSData或UImage)
 *  @param url            要分享的网址
 *  @param viewController 从哪个视图控制器传过来的(一般直接写self)
 */
+ (void)shareToSocialPlatform:(id)PlatformName WithTitle:(NSString *)text andImage:(id)image andUrl:(NSString *)url showOn:(UIViewController *)viewController;

@end





