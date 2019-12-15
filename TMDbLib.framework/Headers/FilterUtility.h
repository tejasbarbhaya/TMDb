//
//  FilterUtility.h
//  TMDb
//
//  Created by Tejas Bharbaya on 14/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootClass.h"


@interface FilterUtility : NSObject

+ (id)sharedManager; // returns static object of this class
-(void) doFilter:(NSDictionary *) dict complition:(void(^)(RootClass *result)) callback; //It does filter / sort based on specified set of dictionary

@end


