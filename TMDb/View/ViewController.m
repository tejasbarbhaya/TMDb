//
//  ViewController.m
//  TMDb
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import "ViewController.h"



@interface ViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *serchBar;
@property(weak,nonatomic) NSString *apiKey;
@property(nonatomic,retain) RootClass *objResult;
@property(nonatomic,retain) AppDelegate *delegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.serchBar.delegate = self;
    _delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
}

#pragma mark - Table View Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.objResult.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieCell *cell = (MovieCell *) [self.tblView dequeueReusableCellWithIdentifier:@"cellid"];
    Result *objResult = (Result *) [self.objResult.results objectAtIndex:indexPath.row];
    cell.lblMovieName.text = objResult.title;
    cell.lblReleaseDate.text = objResult.releaseDate;
    cell.lblRating.text = [NSString stringWithFormat:@"%.1f",objResult.voteAverage];
    
    

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
    /*if (finalsearchText.length <= 0) {
        return;
    }else{
        finalsearchText = [finalsearchText stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLHostAllowedCharacterSet];
    }*/
    
    NSString *url = [NSString stringWithFormat:@"%@api_key=%@&query=%@",BaseUrl,_delegate.getAPIKey,finalsearchText];
   
    [NetworkManager.sharedManager doNetworkCall:url complition:^(RootClass *dict, NSError *error) {
        if (error != nil) {
            NSLog(@"\n in VC Error:%@",[error description]);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.objResult = dict;
                [self.tblView reloadData];
                 [self showErrorAlert];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                if (dict == nil) {
                    [self showErrorAlert];
                }
                NSLog(@"\n Response :%@",dict);
                self.objResult = dict;
                [self.tblView reloadData];
            });
            
        }
    }];
}

-(void) showErrorAlert {
    UIAlertController * alert = [UIAlertController
                     alertControllerWithTitle:@"Error"
                                      message:@"No Network Connection OR API Key is incorrect"
                               preferredStyle:UIAlertControllerStyleAlert];



     UIAlertAction* yesButton = [UIAlertAction
                         actionWithTitle:@"Ok"
                                   style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     //Handle your yes please button action here
                                 }];

    

     [alert addAction:yesButton];
     [self presentViewController:alert animated:YES completion:nil];
}
@end

