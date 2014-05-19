//
//  ViewController.h
//  Destinationglobal
//
//  Created by Mac-i7 on 19/05/14.
//  Copyright (c) 2014 openxcell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    __weak IBOutlet UIView *viewLogin;
    
    __weak IBOutlet UIButton *btnLogin;
    IBOutletCollection(UITextField) NSArray *txt_password;
    IBOutletCollection(UITextField) NSArray *txt_userid;
}
- (IBAction)actLoginBtnclicked:(id)sender;

@end
