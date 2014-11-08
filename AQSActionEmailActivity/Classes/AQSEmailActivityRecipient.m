//
//  AQSEmailActivityRecipient.m
//  AQSActionEmailActivity
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSEmailActivityRecipient.h"

@implementation AQSEmailActivityRecipient

+ (instancetype)recipientWithEmailAddress:(NSString *)email {
    return [self recipientWithEmailAddress:email withRecipientType:AQSEmailActivityRecipientTypeTo];
}

+ (instancetype)recipientWithEmailAddress:(NSString *)email withRecipientType:(AQSEmailActivityRecipientType)type {
    AQSEmailActivityRecipient *instance = [[AQSEmailActivityRecipient alloc] init];
    instance.email = email;
    instance.type = type;
    return instance;
}

@end
