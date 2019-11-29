//
//  ViewController.m
//  TMDb
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import "ViewController.h"
#import "MovieCell.h"
#import <TMDbLib/TMDbLib.h>
#import "Constant.h"

@interface ViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *serchBar;
@property(weak,nonatomic) NSString *apiKey;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.serchBar.delegate = self;
    _apiKey = @"79f2c5824c3f077112e26bb0dd4694a3";

}

#pragma mark - Table View Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieCell *cell = (MovieCell *) [self.tblView dequeueReusableCellWithIdentifier:@"cellid"];
    	
    cell.lblMovieName.text = [[NSString alloc] initWithFormat:@"Please check log for output, since demo is not fully completed."];

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UISearchBar Delegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [self getMovie:searchBar.text];
}

#pragma mark - Network Call

-(void) getMovie:(NSString *) searchText {
    NSString *finalsearchText = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (finalsearchText.length <= 0) {
        return;
    }else{
        finalsearchText = [finalsearchText stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLHostAllowedCharacterSet];
    }
    
    NSString *url = [NSString stringWithFormat:@"%@api_key=%@&query=%@",BaseUrl,_apiKey,finalsearchText];
   
    
    NetworkManager *obj = NetworkManager.getObject;
    [obj doNetworkCall:url complition:^(NSDictionary *dict, NSError *error) {
        if (error != nil) {
            NSLog(@"\n in VC Error:%@",[error description]);
            
        }else{
            NSLog(@"\n in VC response : %@",dict);
        }
    }];
}

@end

