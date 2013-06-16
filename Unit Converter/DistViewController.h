//
//  DistViewController.h
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DistViewController : UIViewController
{
    // The view objects.
    IBOutlet UILabel *resultField;
    IBOutlet UITextField *userInputTextField;
    IBOutlet UIActivityIndicatorView *activityIndicator;
}

- (IBAction)showResult:(id)sender;

@end