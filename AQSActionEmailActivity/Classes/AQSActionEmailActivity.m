//
//  AQSActionEmailActivity.m
//  AQSActionEmailActivity
//
//  Created by kaiinui on 2014/11/08.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSActionEmailActivity.h"

#import <MessageUI/MessageUI.h>

@interface AQSActionEmailActivity () <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSArray *activityItems;
@property (nonatomic, strong) MFMailComposeViewController *viewController;

@end

@implementation AQSActionEmailActivity

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    [super prepareWithActivityItems:activityItems];
    
    self.activityItems = activityItems;
}

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryAction;
}

- (NSString *)activityType {
    return @"org.openaquamarine.email.action";
}

- (NSString *)activityTitle {
    return @"Mail";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:NSStringFromClass([self class])];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return [self isAvailableForEmail];
}

- (UIViewController *)activityViewController {
    _viewController = [[MFMailComposeViewController alloc] init];
    _viewController.mailComposeDelegate = self;
    return _viewController;
}

# pragma mark - Helper (Array)

- (NSString *)nilOrFirstStringFromArray:(NSArray *)array {
    for (id item in array) {
        if ([item isKindOfClass:[NSString class]]) {
            return item;
        }
    }
    return nil;
}

- (UIImage *)nilOrFirstImageFromArray:(NSArray *)array {
    for (id item in array) {
        if ([item isKindOfClass:[UIImage class]]) {
            return item;
        }
    }
    return nil;
}

- (NSURL *)nilOrFirstURLFromArray:(NSArray *)array {
    for (id item in array) {
        if ([item isKindOfClass:[NSURL class]]) {
            return item;
        }
    }
    return nil;
}

# pragma mark - Helper (Email)

- (BOOL)isAvailableForEmail {
    return [MFMailComposeViewController canSendMail];
}

# pragma mark - Helper (MFMailComposeViewController)

- (UIViewController *)viewControllerWithConposeViewComtroller:(MFMailComposeViewController *)viewController {
    NSString *text= [self nilOrFirstStringFromArray:_activityItems];
    NSURL *URL = [self nilOrFirstURLFromArray:_activityItems];
    UIImage *image = [self nilOrFirstImageFromArray:_activityItems];
    
    if (!!image) {
        [viewController addAttachmentData:UIImagePNGRepresentation(image) mimeType:@"image/png" fileName:@"image.png"];
    }
    
    if (!!text && !!URL) {
        [viewController setMessageBody:[NSString stringWithFormat:@"%@ %@", text, URL] isHTML:NO];
    } else if (!!URL) {
        [viewController setMessageBody:URL.absoluteString isHTML:NO];
    } else if (!!text) {
        [viewController setMessageBody:text isHTML:NO];
    }
    
    return viewController;
}

# pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error{
    [self activityDidFinish:result == MFMailComposeResultSent];
    [self.viewController.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
