//
//  AppDelegate+Share.m
//  ZPUMengShare

//  联系开发者:QQ1397819210

//  Created by 郑鹏 on 15/6/29.
//  Copyright (c) 2015年 zhengpeng. All rights reserved.
//

#import "UMSocial.h"
#import "UMSocialSinaHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "AppDelegate+Share.h"

//友盟appkey
#define UMApp_Key       @""
//腾讯id
#define Tecent_Id       @""
//腾讯key
#define Tecent_Key      @""
//微信key
#define WeiXin_Key      @""
//微信密钥
#define WeiXin_Secret   @""

@implementation AppDelegate (Share)

- (void)registerShareAction
{
    //打开调试log的开关
    [UMSocialData openLog:NO];
    
    [UMSocialData setAppKey:UMApp_Key];
    
    //设置微信AppId，设置分享url，默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:WeiXin_Key appSecret:WeiXin_Secret url:@"http://www.baidu.com"];
    
    //打开新浪微博的SSO开关
    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //设置分享到QQ空间的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:Tecent_Id appKey:Tecent_Key url:@"http://www.umeng.com/social"];
    //设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];
    
}



/**
 这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
}

/**
 这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UMSocialSnsService  applicationDidBecomeActive];
}

@end
