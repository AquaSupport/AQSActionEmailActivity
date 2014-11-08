//
//  AQSEmailActivityTitle.m
//  AQSActionEmailActivity
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSEmailActivityTitle.h"

@implementation AQSEmailActivityTitle

+ (instancetype)titleWithTitle:(NSString *)title {
    AQSEmailActivityTitle *instance = [[self alloc] init];
    instance.title = title;
    return instance;
}

@end
