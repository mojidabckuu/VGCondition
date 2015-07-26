//
//  VGValidator.h
//  VGCondition
//
//  Created by vlad gorbenko on 7/8/15.
//  Copyright (c) 2015 vladgorbenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSArray *(^VGValidatorCondtionsBlock)(void);

@interface VGValidator : NSObject

@property (nonatomic, strong) NSArray *conditions;

- (instancetype)initWithConditions:(NSArray *)conditions;

+ (BOOL)validateValue:(id)value conditions:(VGValidatorCondtionsBlock)block error:(NSError **)error;

@end
