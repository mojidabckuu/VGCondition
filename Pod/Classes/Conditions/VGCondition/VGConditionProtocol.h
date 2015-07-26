//
//  VGConditionProtocol.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VGConditionProtocol <NSObject>

@required

@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) NSString *localizedDescription;

- (BOOL)checkValue:(id)value;

+ (instancetype)condition;
+ (instancetype)conditionWithDescription:(NSString *)description;

- (instancetype)initWithDescription:(NSString *)description;

@end
