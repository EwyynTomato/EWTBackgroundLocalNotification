//
//  EWTBackgroundLocalNotification.h
//  EWTBackgroundLocalNotificationDemo
//
//  Created by EwyynTomato on 4/27/15.
//  Copyright (c) 2015 ewyyntomato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EWTBackgroundLocalNotification : NSObject

@property (nonatomic, strong) NSMutableArray *queue;

+ (EWTBackgroundLocalNotification *)sharedManager;

+ (void)queueLocalNotification:(UILocalNotification *)notification;
+ (void)clearQueue;

@end
