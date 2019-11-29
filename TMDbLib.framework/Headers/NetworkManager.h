//
//  NetworkManager.h
//  TMDbLib
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+(NetworkManager *) getObject;
-(void) doNetworkCall:(NSString *) url complition:(void(^)(NSDictionary* dict,NSError *error)) callback;

@end

