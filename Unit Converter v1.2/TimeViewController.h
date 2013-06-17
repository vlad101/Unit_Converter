//
//  TimeViewController.h
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
{
    // The view objects.
    __weak IBOutlet UILabel *resultField;
    __weak IBOutlet UITextField *userInputTextField;
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
}
- (IBAction)hideButton:(id)sender;

- (IBAction)showButton:(id)sender;

- (IBAction)showResult:(id)sender;

@end