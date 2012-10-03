//
//  StatsView.h
//  DeviceStats
//
//  Created by Brian Salinas on 10/1/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecsView : UIView

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *systemName;
@property (strong, nonatomic) NSString *version;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *batteryLevel;
@property (strong, nonatomic) NSString *totalMemory;
@property (strong, nonatomic) NSString *userMemory;
@property (nonatomic) BOOL multitasking;

@end
