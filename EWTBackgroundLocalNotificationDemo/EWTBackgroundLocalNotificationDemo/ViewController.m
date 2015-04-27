//
//  ViewController.m
//  EWTBackgroundLocalNotificationDemo
//
//  Created by EwyynTomato on 4/27/15.
//  Copyright (c) 2015 ewyyntomato. All rights reserved.
//

#import "ViewController.h"
#import "EWTBackgroundLocalNotification.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton  *addNotifyButton;
@property (nonatomic, assign) NSInteger  count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Demo"];
    
    //- Request user permission for notification on iOS 8
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                             categories:nil]];
    }
    
    //- Add button: 'Add Local Notification'
    self.addNotifyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addNotifyButton setTitle:@"Add Local Notification" forState:UIControlStateNormal];
    [self.addNotifyButton addTarget:self action:@selector(addLocalNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addNotifyButton];
    [self.addNotifyButton setFrame:CGRectMake(0, 0, 200, 40)];
    [self.addNotifyButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [self.addNotifyButton setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin |
     UIViewAutoresizingFlexibleLeftMargin  |
     UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleTopMargin   |
     UIViewAutoresizingFlexibleWidth       |
     UIViewAutoresizingFlexibleHeight];
}

- (void)addLocalNotification {
    NSString *message = [NSString stringWithFormat:@"local notification #%li", ++self.count];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    [notification setAlertBody:message];
    [notification setTimeZone:[NSTimeZone defaultTimeZone]];
    [notification setUserInfo:@{@"info":message}];
    
    [EWTBackgroundLocalNotification queueLocalNotification:notification];
}

@end
