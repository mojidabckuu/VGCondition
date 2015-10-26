//
//  VGConditionTests.m
//  VGConditionTests
//
//  Created by vlad gorbenko on 07/26/2015.
//  Copyright (c) 2015 vlad gorbenko. All rights reserved.
//

@import XCTest;

#import "VGViewController.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMaxError {
    // prints: foo bar foo bar
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [formatter setDecimalSeparator:@"."];
    [formatter setGroupingSeparator:@","];
    
    [formatter setMinimumFractionDigits:2];
    [formatter setMaximumFractionDigits:2];
    [formatter setGroupingSize:3];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSLog(@"%@", [formatter stringFromNumber:nil]);
    
    NSError *error = nil;
    BOOL isValid = [VGValidator validateValue:@11 conditions:^NSArray *{
        return @[[VGConditonRange conditionWithMin:@3 max:@10 strict:NO formatter:formatter description:NSLocalizedString(@"Enter maximum %2$@ amount and min %1$@", nil)]];
    } error:nil];
    if(!isValid) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }
}

- (void)testRegexCondition {
    NSString *regex = @"[0-9]{5}";
    NSError *error = nil;
    BOOL isValid = [VGValidator validateValue:@"12322" conditions:^NSArray *{
        return @[[VGStringRegexCondition conditionWithRegex:regex description:@"Is not pass"]];
    } error:&error];
    if(!isValid) {
        NSLog(@"Erorr: %@", [error localizedDescription]);
    }
}

- (void)testEmailPass {
    NSString *email = @"vlad@email.com";
    NSError *error = nil;
    BOOL isValid = [VGValidator validateValue:email conditions:^NSArray *{
        return @[[VGEmailCondition conditionWithDescription:@"Email is not valid"]];
    } error:&error];
    if(!isValid) {
        NSLog(@"ERORR : %@", [error localizedDescription]);
    } else {
        NSLog(@"Email is valid");
    }
}

@end

