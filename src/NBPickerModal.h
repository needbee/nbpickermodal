//
//  NBPickerModal.h
//  Scriptive
//
//  Created by Josh Justice on 3/1/14.
//  Copyright (c) 2014 NeedBee, LLC. All rights reserved.
//

#import "NBMiniModal.h"
#import "NBHighlightButton.h"
#import <UIKit/UIKit.h>

@interface NBPickerModal : NBMiniModal
    <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic,retain) id value;
@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) NBHighlightButton *okButton;

- (id)initWithTitle:(NSString *)title
              value:(id)selectedValue
            options:(NSArray *)pickerOptions;

@end
