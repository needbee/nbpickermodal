//
//  NBViewController.m
//  demo
//
//  Created by Josh Justice on 7/27/14.
//  Copyright (c) 2014 NeedBee. All rights reserved.
//

#import "NBViewController.h"
#import "NBPickerModal.h"

@interface NBViewController ()

-(IBAction)tappedShowPickerModal;

@end

@implementation NBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)tappedShowPickerModal
{
    NSArray *options = @[
                         @{@"value":@"S", @"label":@"Small"},
                         @{@"value":@"M", @"label":@"Medium"},
                         @{@"value":@"L", @"label":@"Large"},
                         ];
    NBPickerModal *modal = [[NBPickerModal alloc] initWithTitle:@"Pick Something"
                                                          value:@"M"
                                                        options:options];
    modal.delegate = self;
    [self displayMiniModal:modal];
}

-(void)completedMiniModal:(NBMiniModal *)modal
{
    [self dismissMiniModal];
}

@end
