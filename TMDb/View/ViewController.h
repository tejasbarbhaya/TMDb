//
//  ViewController.h
//  TMDb
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <TMDbLib/RootClass.h>
#import "AppDelegate.h"
#import "Constant.h"
#import "MovieCell.h"
#import <TMDbLib/NetworkManager.h>


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblView;
-(void) getMovie:(NSString *) searchText;
@end

