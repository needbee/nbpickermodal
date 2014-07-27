//
//  NBHighlightButton.m
//  Scriptive
//
//  Created by Josh Justice on 3/1/14.
//  Copyright (c) 2014 Scriptive. All rights reserved.
//

#import "NBHighlightButton.h"

@interface NBHighlightButton ()

-(void)updateButtonColor;

@end

@implementation NBHighlightButton

-(void)setButtonColor:(UIColor *)buttonColor {
    _buttonColor = buttonColor;
    [self setHighlighted:NO];
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateButtonColor];
}

-(void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateButtonColor];
}

-(void)updateButtonColor {
    if(!self.enabled) {
        self.backgroundColor = _buttonDisabledColor;
    } else if(self.highlighted) {
        self.backgroundColor = _buttonHighlightColor;
    } else {
        self.backgroundColor = _buttonColor;
    }
    
}

@end
