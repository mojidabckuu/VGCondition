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

@property (nonnull, nonatomic, strong) NSError *error;
@property (nonnull, nonatomic, strong) NSString *localizedDescription;

- (BOOL)checkValue:(nullable id)value;

+ (nonnull instancetype)condition;
+ (nonnull instancetype)conditionWithDescription:(nonnull NSString *)description;

- (nonnull instancetype)initWithDescription:(nonnull NSString *)description;

@end
