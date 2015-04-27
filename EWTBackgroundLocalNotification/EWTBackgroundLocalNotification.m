//
//  EWTBackgroundLocalNotification.m
//  EWTBackgroundLocalNotificationDemo
//
//  Created by EwyynTomato on 4/27/15.
//  Copyright (c) 2015 ewyyntomato. All rights reserved.
//

#import "EWTBackgroundLocalNotification.h"

@interface EWTBackgroundLocalNotification ()

@end

@implementation EWTBackgroundLocalNotification

+ (EWTBackgroundLocalNotification *)sharedManager {
    static EWTBackgroundLocalNotification *sharedManager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [EWTBackgroundLocalNotification new];
    });
    return sharedManager;
}

+ (void)queueLocalNotification:(UILocalNotification *)notification {
    [[EWTBackgroundLocalNotification sharedManager].queue addObject:notification];
}

+ (void)clearQueue {
    [[EWTBackgroundLocalNotification sharedManager].queue removeAllObjects];
}

#pragma mark -
- (id)init {
    self = [super init];
    if (self) {
        //- Create empty queue
        self.queue = [NSMutableArray new];
        
        //- Get notified when app enters background
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    //- Remove any observer that was registered here.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didEnterBackground {
    [self setFireTime];
    
    //- Fire all notification queued
    [[UIApplication sharedApplication] setScheduledLocalNotifications:[self.queue copy]];
    
    //- Then remove all notification queued
    [self.queue removeAllObjects];
}

- (void)setFireTime {
    for (UILocalNotification *notification in self.queue) {
        [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
}

@end
