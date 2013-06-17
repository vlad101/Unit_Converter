//
//  TempViewController.h
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController
<UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource>
{
    // The view objects.
    __weak IBOutlet UILabel *resultField;
    __weak IBOutlet UITextField *userInputTextField;
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    
    // The UIPickerView
    NSArray *units;
    NSArray *conversionFactors;
    __weak IBOutlet UIPickerView *picker;
    float conversionFactor;
    float inputValue;
    NSString *resultUnit;
}
- (IBAction)showButton:(id)sender;
- (IBAction)hideButton:(id)sender;
- (IBAction)showResult:(id)sender;

@end
