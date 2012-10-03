//
//  StatsView.m
//  DeviceStats
//
//  Created by Brian Salinas on 10/1/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import "SpecsView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SpecsView
{
    UILabel *nameLabel_;
    UILabel *systemNameLabel_;
    UILabel *versionLabel_;
    UILabel *modelLabel_;
    UILabel *multitaskingLabel_;
    UILabel *batteryLabel_;
    UILabel *totalMemoryLabel_;
    UILabel *userMemoryLabel_;
}

- (void)setName:(NSString *)name
{
    nameLabel_.text = [@"Name: " stringByAppendingString:name];
}

- (void)setSystemName:(NSString *)systemName
{
    systemNameLabel_.text = [@"OS: " stringByAppendingString:systemName];
}

- (void)setVersion:(NSString *)version
{
    versionLabel_.text = [@"Version: " stringByAppendingString:version];
}

- (void)setModel:(NSString *)model
{
    modelLabel_.text = [@"Model: " stringByAppendingString:model];
}

- (void)setMultitasking:(BOOL)multitasking
{
    NSString *str = [NSString stringWithFormat:@"%@", multitasking ? @"Yes" : @"No"];
    multitaskingLabel_.text = [@"Multitasking: " stringByAppendingString:str];
}

- (void)setBatteryLevel:(NSString *)batteryLevel
{
    batteryLabel_.text = [@"Battery: " stringByAppendingString:batteryLevel];
}

- (void)setTotalMemory:(NSString *)totalMemory
{
    totalMemoryLabel_.text = [@"Total Memory: " stringByAppendingString:totalMemory];
}

- (void)setUserMemory:(NSString *)userMemory
{
    userMemoryLabel_.text = [@"User Memory: " stringByAppendingString:userMemory];
}

- (void)buildView
{
    nameLabel_ = [UILabel new];
    systemNameLabel_ = [UILabel new];
    versionLabel_ = [UILabel new];
    modelLabel_ = [UILabel new];
    multitaskingLabel_ = [UILabel new];
    batteryLabel_ = [UILabel new];
    totalMemoryLabel_ = [UILabel new];
    userMemoryLabel_ = [UILabel new];

#define LABEL_COUNT 8
    UILabel *labels[LABEL_COUNT] = { nameLabel_, modelLabel_, systemNameLabel_, versionLabel_, 
                                    multitaskingLabel_, batteryLabel_, totalMemoryLabel_, userMemoryLabel_ };
    CGFloat yValue = 0;
    CGFloat height = 30.0;
    CGFloat padding = 60.0;
    for (int ndx = 0; ndx < LABEL_COUNT; ndx++){
        labels[ndx].frame = CGRectMake(padding,
                                       yValue += height,
                                       self.bounds.size.width - padding,
                                       height);
        labels[ndx].backgroundColor = [UIColor clearColor];
        labels[ndx].textColor = [UIColor whiteColor];
        labels[ndx].textAlignment = NSTextAlignmentLeft;
        labels[ndx].font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:18.0];
        [self addSubview:labels[ndx]];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self buildView];

        self.layer.edgeAntialiasingMask = YES;
        self.layer.cornerRadius = 12.0;
        CGFloat borderWidth = 8.0;
        [self setBounds:CGRectMake(borderWidth,
                                   borderWidth,
                                   self.bounds.size.width - borderWidth,
                                   self.bounds.size.height - borderWidth)];
    }
    return self;
}

@end
