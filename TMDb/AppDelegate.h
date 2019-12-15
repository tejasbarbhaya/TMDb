//
//  AppDelegate.h
//  TMDb
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "NSString+AESCrypt.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSString *) getAPIKey;
-(void) setAPIKey:(NSString *) apiKey;

@end

