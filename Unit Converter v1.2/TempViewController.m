//
//  TempViewController.m
//  Unit Converter
//
//  Created by Vladimir Efros on 6/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "TempViewController.h"
#import <QuartzCore/QuartzCore.h>
#pragma mark -
#pragma mark PickerView DataSource

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Get a pointer to the application bundle object
    // self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"TempViewController" bundle:appBundle];
    
    if (self)
    {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Temperature"];
        
        // Put the image on the tab bar item
        [tbi setFinishedSelectedImage:[UIImage imageNamed:@"temp_opt.jpg"]withFinishedUnselectedImage:[UIImage imageNamed:@"temp_opt.jpg"]];
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
    units = [[NSArray alloc] initWithObjects:@"C",
                                            @"F",
                                            @"K",
                                            nil];
}

- (void)displayResult:(float)input
{
    // Set border and background color around resultField, import QuartzCore Framework
    resultField.layer.backgroundColor = [UIColor whiteColor].CGColor;
    resultField.layer.borderColor = [UIColor blueColor].CGColor;
    resultField.layer.borderWidth = 3.0;
    
    // Conversion from Pm to all other units
    if([picker selectedRowInComponent:0] == 0)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = input;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = (input * 9/5) + 32;
        else
            conversionFactor = input + 273.15;
    }
    
    // Conversion from Tm to all other units
    else if([picker selectedRowInComponent:0] == 1)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = (input - 32) * (5.0/9.0);
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = input;
        else
            conversionFactor = ((input - 32) * (5.0/9.0)) + 273.15;
    }
    
    // Conversion from Gm to all other units
    else if([picker selectedRowInComponent:0] == 2)
    {
        if([picker selectedRowInComponent:1] == 0)
            conversionFactor = input - 273.15;
        else if([picker selectedRowInComponent:1] == 1)
            conversionFactor = ((input - 273.15) * 9/5) + 32;
        else
            conversionFactor = input;
    }
        
    [resultField setText:[NSString stringWithFormat:@"%.3f %@ = %.3e %@!", input, [units objectAtIndex:[picker selectedRowInComponent:0]], conversionFactor, [units objectAtIndex:[picker selectedRowInComponent:1]]]];
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
