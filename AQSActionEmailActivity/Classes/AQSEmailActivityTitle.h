//
//  AQSEmailActivityTitle.h
//  AQSActionEmailActivity
//
//  Created by kaiinui on 2014/11/09.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  This class represents the title for `AQSActionEmailActivity`.
 *  With including this object in `activityItems`, `AQSActionEmailActivity` automatically detects it and set the email title.
 */
@interface AQSEmailActivityTitle : NSObject

+ (instancetype)titleWithTitle:(NSString *)title;

@property (nonatomic, copy) NSString *title;

@end
