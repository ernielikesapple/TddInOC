#import <Cedar/Cedar.h>
#import "RecipesViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RecipesViewControllerSpec)

describe(@"RecipesViewControllerSpec", ^{
    __block RecipesViewController *vc;
    __block NSArray *recipes;
    beforeEach(^{
        vc = [[RecipesViewController alloc] init];
        vc.view should_not be_nil; // we need to write this because UIViewControllers don't actually create their views until the first time view is called
        recipes = @[@"un oignon", @"l'eau", @"l'alcool", @"l'oeuf", @"je bois l'alcool"];
        vc.recipes = recipes;
    });
    describe(@"-tableView:numberOfSectionsInTableView:", ^{
        it(@"should return 1", ^{
            [vc numberOfSectionsInTableView: vc.tableView] should equal(1);
        });
    });
    
    describe(@"-tableView:numberOfRowsInSection", ^{
        it(@"should return the number of rows for the table view", ^{
            [vc tableView:vc.tableView numberOfRowsInSection:0] should equal(5);
        });
    });
    
    describe(@"-tableView:cellForRowAtIndexPath", ^{
        it(@"should return a table view cell with the right label", ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *cell = [vc tableView:vc.tableView cellForRowAtIndexPath:indexPath];
            
            cell.textLabel.text should equal(@"un oignon");
        });
    });
    
});

SPEC_END
