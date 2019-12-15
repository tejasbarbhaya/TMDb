//  Created by Tejash on 12/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>



@interface Result : NSObject

@property (nonatomic, assign) BOOL adult;
@property (nonatomic, strong) NSString * backdropPath;
@property (nonatomic, strong) NSArray * genreIds;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * originalLanguage;
@property (nonatomic, strong) NSString * originalTitle;
@property (nonatomic, strong) NSString * overview;
@property (nonatomic, assign) CGFloat popularity;
@property (nonatomic, strong) NSString * posterPath;
@property (nonatomic, strong) NSString * releaseDate;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, assign) CGFloat voteAverage;
@property (nonatomic, assign) NSInteger voteCount;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
