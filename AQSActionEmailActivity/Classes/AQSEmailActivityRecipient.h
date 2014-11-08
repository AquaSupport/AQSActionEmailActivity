//
//  AQSEmailActivityRecipient.h
//  AQSActionEmailActivity
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AQSEmailActivityRecipientType) {
    AQSEmailActivityRecipientTypeTo,
    AQSEmailActivityRecipientTypeCC,
    AQSEmailActivityRecipientTypeBCC
};

/**
 *  This class represents recipient for `AQSActionEmailActivity`.
 *  Including this object in `activityItems`, `AQSActionEmailAcitivty` automatically detects and set the recipients.
 *  You can include as many as you want.
 */
@interface AQSEmailActivityRecipient : NSObject

+ (instancetype)recipientWithEmailAddress:(NSString *)email;
+ (instancetype)recipientWithEmailAddress:(NSString *)email withRecipientType:(AQSEmailActivityRecipientType)type;

@property (nonatomic, copy) NSString* email;
@property (nonatomic, assign) AQSEmailActivityRecipientType type;

@end
