//
//  AQSActionEmailActivity.h
//  AQSActionEmailActivity
//
//  Created by kaiinui on 2014/11/08.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  This class is an `UIActivity` subclass that appears in Action category in `UIActivityViewController`.
 *
 *  When you want to set a title, include `AQSEmailActivityTitle` objects in `activityItems`.
 *
 *      NSArray *activityItems = @[[AQSEmailActivityTitle titleWithTitle:@"Title!"], @"Body!"];
 *
 *  And to set recipients, include `AQSEmailActivityRecipient` objects in `activityItems`.
 *
 *      NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"some@example.com"]];
 *
 *  To set CC or BCC recipients, just specify recipient's type.
 *
 *      NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"some@example.com" withType:AQSEmailActivityTypeCC]];
 */
@interface AQSActionEmailActivity : UIActivity

@end
