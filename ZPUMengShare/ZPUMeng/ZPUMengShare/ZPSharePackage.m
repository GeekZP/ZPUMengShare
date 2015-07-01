//
//  ZPSharePackage.m
//  ZPUMengShare
//
//  Created by 郑鹏 on 15/6/29.
//  Copyright (c) 2015年 zhengpeng. All rights reserved.
//

#import "ZPSharePackage.h"

@interface ZPSharePackage ()<UMSocialUIDelegate>

@end

@implementation ZPSharePackage

+ (void)shareToSocialPlatform:(id)PlatformName WithTitle:(NSString *)text andImage:(id)image andUrl:(NSString *)url showOn:(UIViewController *)viewController
{
    if ([PlatformName isEqualToString:UMShareToSina]) {
        //        __weak id weakSelf = viewController;
        [[UMSocialControllerService defaultControllerService] setShareText:text shareImage:image socialUIDelegate:(id)viewController];
        [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(viewController,[UMSocialControllerService defaultControllerService],YES);
    }
    else
    {
        [UMSocialData defaultData].extConfig.qqData.url = url;
        [[UMSocialDataService defaultDataService] postSNSWithTypes:@[PlatformName] content:text image:image location:nil urlResource:nil presentedController:viewController completion:^(UMSocialResponseEntity* response) {
            if (response.responseCode == UMSResponseCodeSuccess) {
            }
        }];
    }
}

@end









