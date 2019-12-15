//
//  NetworkManager.h
//  TMDbLib
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootClass.h"


@interface NetworkManager : NSObject

+ (id)sharedManager; //returns static object of NetworkManager Class
-(void) doNetworkCall:(NSString *) url complition:(void(^)(RootClass* dict,NSError *error)) callback; //accept the url and return with filtered / parsed object

@end

