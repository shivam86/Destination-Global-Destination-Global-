//
//  ViewController.m
//  Destinationglobal
//
//  Created by Mac-i7 on 19/05/14.
//  Copyright (c) 2014 openxcell. All rights reserved.
//

#import "ViewController.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 246;
@interface ViewController ()

@end

@implementation ViewController
CGFloat animatedDistance;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actLoginBtnclicked:(id)sender {
}



#pragma mark - Text fields delegate Method

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    CGRect textVWRect = [self.view.window convertRect:textField.bounds fromView:textField];
	CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
	CGFloat midline = textVWRect.origin.y + 0.5 * textVWRect.size.height;
	CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
	CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
	CGFloat heightFraction = numerator / denominator;
	if (heightFraction < 0.0) {
		heightFraction = 0.0;
	}else if (heightFraction > 1.0) {
		heightFraction = 1.0;
	}
	animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
	
	CGRect viewFrame = self.view.frame;
	viewFrame.origin.y -= animatedDistance;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	[self.view setFrame:viewFrame];
	
	[UIView commitAnimations];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}

@end
