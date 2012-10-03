//
//  ViewController.m
//  DeviceSpecs
//
//  Created by Brian Salinas on 10/3/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import "ViewController.h"
#import "SpecsView.h"
#import "UIDevice+Hardware.h"

@implementation ViewController
{
    SpecsView *specsView_;
    UIDevice *specs_;
}

#pragma mark - Toolbar
#define TOOLBAR_HEIGHT 44.0

// this will not work right if loaded in viewDidLoad, use viewWillAppear
- (void)buildToolbar
{
    CGRect rect = self.view.bounds;
    rect.size = CGSizeMake(rect.size.width, TOOLBAR_HEIGHT);
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:rect];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                                    0.0,
                                                                    toolbar.bounds.size.width,
                                                                    TOOLBAR_HEIGHT)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"Device Specs";
    titleLabel.textColor = [UIColor orangeColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:24.0];
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:nil
                                                                               action:nil];
    NSArray *items = @[flexSpace, titleItem, flexSpace];
    [toolbar setItems:items animated:NO];
    [self.view addSubview:toolbar];
}

- (void)updateSpecsView
{
    specsView_.name = specs_.name;
    specsView_.systemName = specs_.systemName;
    specsView_.version = specs_.systemVersion;
    specsView_.model = specs_.model;
    specsView_.batteryLevel = [NSString stringWithFormat:@"%.2f", specs_.batteryLevel];
    specsView_.totalMemory = [NSString stringWithFormat:@"%ld MB", specs_.totalMemory];
    specsView_.userMemory = [NSString stringWithFormat:@"%ld MB", specs_.userMemory];
    specsView_.multitasking = specs_.multitaskingSupported;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BOOL barHidden = [UIApplication sharedApplication].isStatusBarHidden;
    CGFloat barHeight = barHidden ? 0.0 : [UIApplication sharedApplication].statusBarFrame.size.height;
    CGRect rect = [[UIScreen mainScreen] bounds];
    rect.size.height -= (TOOLBAR_HEIGHT + barHeight);
    rect.origin.y = TOOLBAR_HEIGHT ;
    
    specs_ = [UIDevice new];
    specsView_ = [[SpecsView alloc] initWithFrame:rect];
    specsView_.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:specsView_];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self buildToolbar];
    [self updateSpecsView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
