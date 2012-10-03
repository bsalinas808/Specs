//
//  UIDevice+Hardware.h
//  DeviceStats
//
//  Created by Brian Salinas on 10/1/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Hardware)

- (NSNumber *)totalDiskSpace;
- (NSNumber *)freeDiskSpace;
- (unsigned long)totalMemory;
- (unsigned long)userMemory;

@end
