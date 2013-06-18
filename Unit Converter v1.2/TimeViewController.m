//
//  TimeViewController.m
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//


#import "TimeViewController.h"
#import <QuartzCore/QuartzCore.h>
#pragma mark -
#pragma mark PickerView DataSource

@implementation TimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Get a pointer to the application bundle object
    // self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"TimeViewController" bundle:appBundle];
    
    if (self)
    {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Time"];
        
        // Put the image on the tab bar item
        [tbi setFinishedSelectedImage:[UIImage imageNamed:@"time_opt.jpg"]withFinishedUnselectedImage:[UIImage imageNamed:@"time_opt.jpg"]];
    }
    return self;
}

// Call the needed methods if needed [showTime]
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[[self view] setBackgroundColor:[UIColor redColor]];
    
    // Clear the textField, the X button
    userInputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // Set background image.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image460x320.jpg"]];
    
    // The UIPicker data initialization
    units = [[NSArray alloc] initWithObjects:@"ns",
             @"micros",
             @"ms",
             @"s",
             @"min",
             @"Hour",
             @"Day",
             @"Week",
             @"Month",
             @"Year",
             @"Decade",
             @"Century",
             nil];
}

- (void)displayResult:(float)input
{
    // Conversion from Pm to all other units
    if([picker selectedRowInComponent:0] == 0)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 1E-3;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 1E-6;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 1E-9;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 1.6667E-11;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 2.7778E-13;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 1.1574E-14;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 1.6534E-15;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 3.8027E-16;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 3.1689E-17;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 3.1689E-18;
        else
            conversionFactor = 3.1689E-19;
    }
    
    // Conversion from Tm to all other units
    else if([picker selectedRowInComponent:0] == 1)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 1E3;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 1E-3;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 1E-6;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 1.6667E-8;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 2.7778E-10;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 1.1574E-11;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 1.6534E-12;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 3.8027E-13;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 3.1689E-14;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 3.1689E-15;
        else
            conversionFactor = 3.1689E-16;
    }
    
    // Conversion from Gm to all other units
    else if([picker selectedRowInComponent:0] == 2)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 1E6;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 1E3;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 1E-3;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 1.6667E-5;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 2.7778E-7;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 1.1574E-8;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 1.6534E-9;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 3.8027E-10;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 3.1689E-11;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 3.1689E-12;
        else
            conversionFactor = 3.1689E-13;
    }
    
    // Conversion from Mm to all other units
    if([picker selectedRowInComponent:0] == 3)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 1E9;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 1E6;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 1E3;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 1.6667E-2;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 2.7778E-4;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 1.1574E-5;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 1.6534E-6;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 3.8027E-7;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 3.1689E-8;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 3.1689E-9;
        else
            conversionFactor = 3.1689E-10;
    }
    
    // Conversion from km to all other units
    else if([picker selectedRowInComponent:0] == 4)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 6E10;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 6E7;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 6E4;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 6E1;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 1.6667E-2;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 6.944E-4;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 9.9206E-5;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 2.2816E-5;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 1.9013E-6;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 1.9013E-7;
        else
            conversionFactor = 1.9013E-8;
    }
    
    
    // Conversion from hm to all other units
    if([picker selectedRowInComponent:0] == 5)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 3.6E12;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 3.6E9;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 3.6E6;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 3.6E3;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 6E1;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 4.1667E-2;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 5.9524E-3;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 1.36895E-3;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 1.1408E-4;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 1.1408E-5;
        else
            conversionFactor = 1.1408E-6;
    }
    
    // Conversion from dam to all other units
    else if([picker selectedRowInComponent:0] == 6)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 8.64E13;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 8.64E10;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 8.64E7;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 8.64E4;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 1.44E3;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 2.4E1;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 1.42857E-1;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 3.2855E-2;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 2.73791E-3;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 2.73791E-4;
        else
            conversionFactor = 2.7379E-5;
    }
    
    // Conversion from m to all other units
    if([picker selectedRowInComponent:0] == 7)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 6.048E14;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 6.048E11;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 6.048E8;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 6.048E5;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 1.0080E4;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 1.68E2;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 7E0;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 2.29984E-1;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 1.91654E-2;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 1.91654E-3;
        else
            conversionFactor = 1.91654E-4;
    }
    
    // Conversion from dm to all other units
    if([picker selectedRowInComponent:0] == 8)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 2.63E15;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 2.63E12;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 2.63E9;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 2.63E6;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 4.38291E4;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 7.30484E2;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 3.04368E1;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 4.34812E0;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 8.333E-2;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 8.333E-3;
        else
            conversionFactor = 8.333E-4;
    }
    
    // Conversion from cm to all other units
    else if([picker selectedRowInComponent:0] == 9)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 3.156E16;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 3.156E13;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 3.156E10;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 3.156E7;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 5.25949E5;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 8.76581E3;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 3.65242E2;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 5.21775E2;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 1.2E1;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 1E0;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 1E-1;
        else
            conversionFactor = 1E-2;
    }
    
    // Conversion from mm to all other units
    else if([picker selectedRowInComponent:0] == 10)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 3.156E17;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 3.156E14;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 3.156E11;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 3.156E8;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 5.259E6;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 8.76581E4;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 3.65242E3;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 5.21775E2;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 1.2E2;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 1E1;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 1E0;
        else
            conversionFactor = 1E-1;
    }
    
    // Conversion from microm to all other units
    else if([picker selectedRowInComponent:0] == 11)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = 3.156E18;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = 3.156E15;
        else if([picker selectedRowInComponent:1] == 2)
            conversionFactor = 3.156E12;
        else if([picker selectedRowInComponent:1] == 3)
            conversionFactor = 3.156E9;
        else if([picker selectedRowInComponent:1] == 4)
            conversionFactor = 5.259E7;
        else if([picker selectedRowInComponent:1] == 5)
            conversionFactor = 8.76581E5;
        else if([picker selectedRowInComponent:1] == 6)
            conversionFactor = 3.65242E4;
        else if([picker selectedRowInComponent:1] == 7)
            conversionFactor = 5.21775E3;
        else if([picker selectedRowInComponent:1] == 8)
            conversionFactor = 1.2E3;
        else if([picker selectedRowInComponent:1] == 9)
            conversionFactor = 1E2;
        else if([picker selectedRowInComponent:1] == 10)
            conversionFactor = 1E1;
        else
            conversionFactor = 1E0;
    }
    
    // Set border and background color around resultField, import QuartzCore Framework
    resultField.layer.backgroundColor = [UIColor whiteColor].CGColor;
    resultField.layer.borderColor = [UIColor blueColor].CGColor;
    resultField.layer.borderWidth = 3.0;
    
    [resultField setText:[NSString stringWithFormat:@"%.3f %@ = %.3e %@!", input, [units objectAtIndex:[picker selectedRowInComponent:0]] ,input * conversionFactor, [units objectAtIndex:[picker selectedRowInComponent:1]]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

// Set variables to nil if needed
- (void)viewDidUnload
{
    [super viewDidUnload];
    units = nil;
}

// Only allow numbers in the text field.
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Limit the user input to only 9 characters
    NSUInteger newLength = [userInputTextField.text length] + [string length] - range.length;
    return (newLength > 9) ? NO : YES;
}

// The UIPickerView method implementation
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 90;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [units count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [units objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"row: %d component: %d", row, component);
    inputValue = [userInputTextField.text floatValue];
    resultUnit = [units objectAtIndex:row];
}

- (IBAction)showResult:(id)sender
{
    [resultField setFont:[UIFont systemFontOfSize:18]];
    
    if([picker selectedRowInComponent:0] == 0)
    {
        inputValue = [userInputTextField.text floatValue];
        resultUnit = [units objectAtIndex:0];
    }
    
    // Display the result.
    [self displayResult:inputValue];
    
    // Activity indicator stop animation.
    [activityIndicator stopAnimating];
}

// Remove the keyboard after entering the input.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

// Customize the behavior of the userInputTextField.
// The method is called just before the text field becomes active
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    [textField setKeyboardType:UIKeyboardTypeDecimalPad];
    // Change the background color of the text field indicating active text field.
    [textField setBackgroundColor:[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f]];
    return YES;
}

// The method is called after the text field becomes active.
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    NSLog(@"textFieldShouldBeginEditing");
}

// The method is called just before the text field becomes inactive
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldEndEditing");
    
    // Change the background color of the text field indicating inactive textField.
    [textField setBackgroundColor:[UIColor whiteColor]];
    return YES;
}

// The method is called after the text field becomes inactive.
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    NSLog(@"textFieldShouldEndEditing");
}

// The method is called when the user presses the clear button inside the text field.
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"textFieldShouldClear:");
    return YES;
}

// The method is called when the user presses the return key on the keyboard.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn");
    [textField resignFirstResponder];
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    
	//Clear the first responder
	[userInputTextField resignFirstResponder];
}

// Hide/Show tabBarController method implementations

- (IBAction)showButton:(id)sender
{
    [self showTabBar:self.tabBarController];
}

- (IBAction)hideButton:(id)sender
{
    [self hideTabBar:self.tabBarController];
}

- (void)hideTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
        }
    }
    
    [UIView commitAnimations];
}

- (void)showTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        NSLog(@"%@", view);
        
        if([view isKindOfClass:[UITabBar class]])
            [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
        }
    }
    
    [UIView commitAnimations];
}

// Set the device for autorotation - right-side up, landscape left, and landscape right
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    // Return YES if incoming orientation is Portrait or either of the landscapes
    // otherwise, return NO
    return (orientation == UIInterfaceOrientationPortrait)
    || UIDeviceOrientationIsLandscape(orientation);
}

@end
