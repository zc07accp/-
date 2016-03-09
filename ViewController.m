//
//  ViewController.m
//  本地通知
//
//  Created by tarena on 16/2/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)registerBtnClick:(id)sender;
- (IBAction)cancelBtnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerBtnClick:(id)sender {
    UILocalNotification *localNoti =
        [UILocalNotification new];
    localNoti.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNoti.alertBody = @"学习本地通知";
    localNoti.alertTitle = @"本地通知";
    localNoti.alertAction = @"想想";
    localNoti.soundName = @"voiceb.wav";
    localNoti.applicationIconBadgeNumber = 321;
    NSMutableDictionary *userInfo  = [NSMutableDictionary dictionary];
    userInfo[@"username"] = @"zhangxiang";
    userInfo[@"userweight"] = @(110);
    localNoti.userInfo = userInfo;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNoti];
}
/** 取消 */
- (IBAction)cancelBtnClick:(id)sender {
    /** 取得没有触发的通知 */
    NSArray *notis = [[UIApplication sharedApplication] scheduledLocalNotifications];
    NSLog(@"%ld",notis.count);
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    NSArray *notis2 = [[UIApplication sharedApplication] scheduledLocalNotifications];
    NSLog(@"%ld",notis2.count);
}
@end








