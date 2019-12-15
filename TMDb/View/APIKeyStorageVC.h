//
//  APIKeyStorageVC.h
//  TMDb
//
//  Created by Tejas Bharbaya on 15/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+AESCrypt.h"
#import "AppDelegate.h"

@interface APIKeyStorageVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtAPIKey;
@end
