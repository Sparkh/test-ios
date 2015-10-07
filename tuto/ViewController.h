//
//  ViewController.h
//  tuto
//
//  Created by Jean-Antoine Dupont on 05/10/2015.
//  Copyright © 2015 Jean-Antoine Dupont. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "APIRequest.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)connectBtn:(id)sender;

@property (nonatomic, readwrite) APIRequest *api;

@end

