//
//  TempViewController.h
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController <UITextFieldDelegate>
{
    // The view objects.
    IBOutlet UILabel *resultField;
    IBOutlet UITextField *userInputTextField;
    IBOutlet UIActivityIndicatorView *activityIndicator;
}
- (IBAction)showButton:(id)sender;

- (IBAction)hideButton:(id)sender;

- (IBAction)showResult:(id)sender;

@end
