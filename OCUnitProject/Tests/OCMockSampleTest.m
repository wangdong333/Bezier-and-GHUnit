//
//  OCMockSampleTest.m
//  OCUnitProject
//
//  Created by fenda-fly on 14-3-6.
//  Copyright (c) 2014年 com.fenda.wdg. All rights reserved.
//

#import "OCMockSampleTest.h"
#import "OCMock.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"

@implementation OCMockSampleTest

- (void)testOCMockPass
{
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    GHAssertEqualObjects(@"mocktest", returnValue,
                         @"Should have returned the expected string.");
}

- (void)testOCMockFail
{
    id mock = [OCMockObject mockForClass:NSString.class];
    [[[mock stub] andReturn:@"mocktest"] lowercaseString];
    
    NSString *returnValue = [mock lowercaseString];
    GHAssertEqualObjects(@"thisIsTheWrongValueToCheck",
                         returnValue, @"Should have returned the expected string.");
}


@end
