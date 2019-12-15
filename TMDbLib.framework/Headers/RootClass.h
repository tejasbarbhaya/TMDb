//  Created by Tejash on 12/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.

#import <Foundation/Foundation.h>
#import "Result.h"

@interface RootClass : NSObject

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSArray * results;
@property (nonatomic, assign) NSInteger totalPages;
@property (nonatomic, assign) NSInteger totalResults;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
