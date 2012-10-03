//
//  UIDevice+Hardware.m
//  DeviceStats
//
//  Created by Brian Salinas on 10/1/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import "UIDevice+Hardware.h"
#include <sys/sysctl.h>

@implementation UIDevice (Hardware)

- (NSNumber *)totalDiskSpace
{
    NSDictionary *fAtts = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fAtts objectForKey:NSFileSystemSize];
}

- (NSNumber *)freeDiskSpace
{
    NSDictionary *fAtts = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fAtts objectForKey:NSFileSystemFreeSize];
}

#pragma mark sysctl utils
- (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

#define MB_CONVERSION (1024*1024)

- (unsigned long)totalMemory
{
    return [self getSysInfo:HW_PHYSMEM]/MB_CONVERSION;
}

- (unsigned long)userMemory
{
    return [self getSysInfo:HW_USERMEM]/MB_CONVERSION;
}

- (NSString *)description
{
    NSString *desc;
    desc = [NSString stringWithFormat:@"Name: %@\nSystem name: %@\nVersion: %@\nModel: %@\nMultitasking: %@\nBattery Level: %.2lf\nTotal disk space: %@\nFree disk space: %@\nTotalMem: %ld\nFreeMem: %ld",
            self.name, self.systemName, self.systemVersion, self.localizedModel,
            [NSString stringWithFormat:@"%@", self.multitaskingSupported ? @"Yes" : @"No"],
            self.batteryLevel, self.totalDiskSpace, self.freeDiskSpace, self.totalMemory, self.userMemory];
    
    return desc;
}

@end
