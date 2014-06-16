//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Alex Cevallos on 3/9/14.


#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

-(IBAction)addReminder:(id)sender
{
    //When this is called, it takes the connected datepicker's date property
    NSDate *date = self.datePicker.date;
    
    //Logs out to the console
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view.");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //everytime the view appears, set the connected datepicker's minimum time set property
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
    
    
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self){
        //get the tab bar item
        UITabBarItem *tbi = self.tabBarItem;
        
        //give it a label
        tbi.title = @"Reminder";
        
        //Give it an image
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
        
    }
    
    return self;
}

@end
