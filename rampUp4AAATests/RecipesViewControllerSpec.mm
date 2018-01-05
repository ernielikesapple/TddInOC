#import <Cedar/Cedar.h>
#import "RecipesViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RecipesViewControllerSpec)

describe(@"RecipesViewControllerSpec", ^{
    __block RecipesViewController *vc;
    
    describe(@"-numberOfSectionsInTableView:", ^{
        it(@"should return 1", ^{
            vc = [[RecipesViewController alloc] init];
            vc.view should_not be_nil; // we need to write this because UIViewControllers don't actually create their views until the first time view is called
            [vc numberOfSectionsInTableView: vc.tableView] should equal(1);
        });
    });
    
});

SPEC_END
