//
//  NBPickerModal.m
//  Scriptive
//
//  Created by Josh Justice on 3/1/14.
//  Copyright (c) 2014 Scriptive. All rights reserved.
//

#import "NBPickerModal.h"
#import "UIView+PartialRoundedCorner.h"

@interface NBPickerModal ()

@property (nonatomic,retain) NSArray *pickerOptions;
@property (nonatomic,retain) UIPickerView *picker;

@end

@implementation NBPickerModal

- (id)initWithTitle:(NSString *)title
              value:(id)selectedValue
            options:(NSArray *)pickerOptions
{
    float titleHeight = 44.0;
    float buttonHeight = 44.0;
    float pickerHeight = 162.0; // seems to be unalterable
    float viewWidth = 200.0;
    float viewHeight = titleHeight + pickerHeight + buttonHeight;
    
    self = [super initWithFrame:CGRectMake(0.0, 0.0, viewWidth, viewHeight)];
    if (self) {
        self.layer.cornerRadius = 2.0;
        
        self.pickerOptions = pickerOptions;
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, titleHeight, viewWidth, pickerHeight)];
        _picker.showsSelectionIndicator = YES;
        _picker.dataSource = self;
        _picker.delegate = self;
        [self addSubview:_picker];
        
        NSDictionary *optionConfig;
        id optionValue;
        for( int i = 0; i < _pickerOptions.count; i++ ) {
            optionConfig = [_pickerOptions objectAtIndex:i];
            optionValue = [optionConfig objectForKey:@"value"];
            if( [optionValue isEqual:selectedValue] ) {
                [_picker selectRow:i inComponent:0 animated:NO];
            }
        }
        
        // other controls
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, viewWidth, titleHeight)];
        _titleLabel.text = title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        titleLabel.textColor = [ThemeConfig colorForComponent:@"modalText"];
        [self addSubview:_titleLabel];
        
        
        self.okButton = [[NBHighlightButton alloc] initWithFrame:CGRectMake(0.0, viewHeight - buttonHeight, viewWidth, buttonHeight)];
        [_okButton setCornerRadius:2.0 direction:UIViewPartialRoundedCornerDirectionBottom];
        _okButton.backgroundColor = [UIColor lightGrayColor];
        
        [_okButton setTitle:@"OK" forState:UIControlStateNormal];
        [_okButton addTarget:self
                     action:@selector(tappedOk)
           forControlEvents:UIControlEventTouchDown]; // UpInside doesn't seem to work on iOS 5
        [self addSubview:_okButton];
        
    }
    return self;
}

- (void)tappedOk
{
    NSUInteger row = [_picker selectedRowInComponent:0];
//    NSLog(@"selected row %d", (int)row);
    NSDictionary *optionConfig = [_pickerOptions objectAtIndex:row];
    _value = [optionConfig objectForKey:@"value"];
    [self.delegate completedMiniModal:self];
}

#pragma mark - picker data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerOptions.count;
}

#pragma mark - picker delegate

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    NSDictionary *optionConfig = [_pickerOptions objectAtIndex:row];
    return [optionConfig objectForKey:@"label"];
}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view
{
    UILabel *label = (UILabel*)view;
    if (!label){
        label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.bounds.size.width, 40.0)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
    }
    
    NSDictionary *optionConfig = [_pickerOptions objectAtIndex:row];
    label.text = [optionConfig objectForKey:@"label"];
    return label;
}

@end
