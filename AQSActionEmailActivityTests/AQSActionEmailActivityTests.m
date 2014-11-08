//
//  AQSActionEmailActivityTests.m
//  AQSActionEmailActivityTests
//
//  Created by kaiinui on 2014/11/08.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "AQSActionEmailActivity.h"
#import <MessageUI/MessageUI.h>
#import "AQSEmailActivityTitle.h"
#import "AQSEmailActivityRecipient.h"

@interface AQSActionEmailActivity (Test) <MFMailComposeViewControllerDelegate>

- (BOOL)isAvailableForEmail;
- (UIViewController *)viewControllerWithConposeViewComtroller:(MFMailComposeViewController *)viewController;

@end

@interface AQSActionEmailActivityTests : XCTestCase

@property AQSActionEmailActivity *activity;

@end

@implementation AQSActionEmailActivityTests

- (void)setUp {
    [super setUp];
    
    _activity = [[AQSActionEmailActivity alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItsActivityCategoryIsShare {
    XCTAssertTrue(AQSActionEmailActivity.activityCategory == UIActivityCategoryAction);
}

- (void)testItReturnsItsImage {
    XCTAssertNotNil(_activity.activityImage);
}

- (void)testItReturnsItsType {
    XCTAssertTrue([_activity.activityType isEqualToString:@"org.openaquamarine.email.action"]);
}

- (void)testItReturnsItsTitle {
    XCTAssertTrue([_activity.activityTitle isEqualToString:@"Mail"]);
}

- (void)testItCanPerformActivityWithTextAndURLWhenEmailIsAvailable {
    id activity = [OCMockObject partialMockForObject:_activity];
    OCMStub([activity isAvailableForEmail]).andReturn(YES);
    NSArray *activityItems = @[@"hoge", [NSURL URLWithString:@"http://google.com/"]];
    
    XCTAssertTrue([activity canPerformWithActivityItems:activityItems]);
}

- (void)testItCannotPerformActivityIfEmailIsNotAvailable {
    id activity = [OCMockObject partialMockForObject:_activity];
    OCMStub([activity isAvailableForEmail]).andReturn(NO);
    NSArray *activityItems = @[@"hoge", [NSURL URLWithString:@"http://google.com/"]];
    
    XCTAssertFalse([activity canPerformWithActivityItems:activityItems]);
}

- (void)testItReturnsTextSetComposeViewControllerWithText {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[@"hoge"];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setMessageBody:@"hoge" isHTML:NO];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItReturnsURLSetComposeViewControllerWithURL {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[NSURL URLWithString:@"http://google.com/"]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setMessageBody:@"http://google.com/" isHTML:NO];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItReturnsTextAndURLSetComposeViewControllerWithTextAndURL {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[@"whoa", [NSURL URLWithString:@"http://google.com/"]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setMessageBody:@"whoa http://google.com/" isHTML:NO];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsImageAttachmentSetComposeViewControllerWithImage {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[UIImage imageNamed:@"AQSActionEmailActivity"], @"whoa", [NSURL URLWithString:@"http://google.com/"]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] addAttachmentData:[OCMArg any] mimeType:@"image/png" fileName:@"image.png"];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsImageAttachmentAndTextAndURLSetComposeViewControllerWithImageAndTextAndURL {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[UIImage imageNamed:@"AQSActionEmailActivity"], @"whoa", [NSURL URLWithString:@"http://google.com/"]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] addAttachmentData:[OCMArg any] mimeType:@"image/png" fileName:@"image.png"];
    [[composeViewControllerMock expect] setMessageBody:@"whoa http://google.com/" isHTML:NO];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsTitleWithTitle {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[AQSEmailActivityTitle titleWithTitle:@"title"]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setTitle:@"title"];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsRecipientWithARecipient {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik@gmail.com"]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setToRecipients:@[@"lied.der.optik@gmail.com"]];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsRecipientWithSomeRecipients {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik@gmail.com"], [AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik+1@gmail.com"]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setToRecipients:@[@"lied.der.optik@gmail.com", @"lied.der.optik+1@gmail.com"]];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsRecipientWithACCRecipient {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik@gmail.com" withRecipientType:AQSEmailActivityRecipientTypeCC]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setCcRecipients:@[@"lied.der.optik@gmail.com"]];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsRecipientWithSomeCCRecipients {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik@gmail.com" withRecipientType:AQSEmailActivityRecipientTypeCC], [AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik+1@gmail.com" withRecipientType:AQSEmailActivityRecipientTypeCC]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setCcRecipients:@[@"lied.der.optik@gmail.com", @"lied.der.optik+1@gmail.com"]];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsRecipientWithABCCRecipient {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik@gmail.com" withRecipientType:AQSEmailActivityRecipientTypeBCC]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setBccRecipients:@[@"lied.der.optik@gmail.com"]];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItSetsRecipientWithSomeBCCRecipients {
    id composeViewControllerMock = [OCMockObject niceMockForClass:[MFMailComposeViewController class]];
    NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik@gmail.com" withRecipientType:AQSEmailActivityRecipientTypeBCC], [AQSEmailActivityRecipient recipientWithEmailAddress:@"lied.der.optik+1@gmail.com" withRecipientType:AQSEmailActivityRecipientTypeBCC]];
    [_activity prepareWithActivityItems:activityItems];
    
    [[composeViewControllerMock expect] setBccRecipients:@[@"lied.der.optik@gmail.com", @"lied.der.optik+1@gmail.com"]];
    
    [_activity viewControllerWithConposeViewComtroller:composeViewControllerMock];
    
    [composeViewControllerMock verify];
}

- (void)testItInvokesActivityDidFinishWithYESWhenComposeViewControllerCompletedDelegate {
    id activity = [OCMockObject partialMockForObject:_activity];
    
    [[activity expect] activityDidFinish:YES];
    
    [activity mailComposeController:nil didFinishWithResult:MFMailComposeResultSent error:nil];
    
    [activity verify];
}

- (void)testItInvokesActivityDidFinishWithNOWhenComposeViewControllerFailedDelegate {
    id activity = [OCMockObject partialMockForObject:_activity];
    
    [[activity expect] activityDidFinish:NO];
    
    [activity mailComposeController:nil didFinishWithResult:MFMailComposeResultFailed error:nil];
    
    [activity verify];
}

- (void)testItInvokesActivityDidFinishWithNOWhenComposeViewControllerCanceledDelegate {
    id activity = [OCMockObject partialMockForObject:_activity];
    
    [[activity expect] activityDidFinish:NO];
    
    [activity mailComposeController:nil didFinishWithResult:MFMailComposeResultCancelled error:nil];
    
    [activity verify];
}

- (void)testItInvokesActivityDidFinishWithNOWhenComposeViewControllerSavedDelegate {
    id activity = [OCMockObject partialMockForObject:_activity];
    
    [[activity expect] activityDidFinish:NO];
    
    [activity mailComposeController:nil didFinishWithResult:MFMailComposeResultSaved error:nil];
    
    [activity verify];
}

@end
