//
//  AppDelegate.m
//  本地通知
//
//  Created by tarena on 16/2/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    float iosVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if (iosVersion >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|
            UIUserNotificationTypeAlert
                categories:nil];
        [[UIApplication sharedApplication]registerUserNotificationSettings:settings];
    }
//    NSLog(@"app start %@",launchOptions);
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor redColor];
    label.frame = CGRectMake(0, 130, 300, 150);
    label.font = [UIFont systemFontOfSize:11];
    label.numberOfLines = 0;
    [self.window.rootViewController.view addSubview:label];
    if (launchOptions) {
        label.text = @"进入详细界面";
        // NSLog(@"进入内容详细界面");
    }else{
        // NSLog(@"进入内容主界面");
        label.text = @"进入主界面";
    }
    return YES;
}
/** 如果app 没有关闭 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    application.applicationIconBadgeNumber = 0;
    NSLog(@"接收到本地通知");
    NSLog(@"%@",notification);
    NSLog(@"%@:%@",notification.userInfo[@"username"],notification.userInfo[@"userweight"]);
    /** 判断程序是否在前台运行 app处于激活状态 */
    if (application.applicationState == UIApplicationStateActive) {
        NSLog(@"轻轻的我走了 正如我轻轻来");
        return;
    }else{
        NSLog(@"进入内容详细界面");
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
