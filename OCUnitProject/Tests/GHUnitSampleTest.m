//
//  GHUnitSampleTest.m
//  OCUnitProject
//
//  Created by fenda-fly on 14-3-6.
//  Copyright (c) 2014年 com.fenda.wdg. All rights reserved.
//

#import "GHUnitSampleTest.h"
#import <GHUnitIOS/GHTestMacros.h>
@implementation GHUnitSampleTest

- (void)testStrings
{
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
    //GHAssertNotNULL(string1, nil);
    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}

- (void)testSimpleFail
{
    GHAssertTrue(NO, nil);
}

@end
