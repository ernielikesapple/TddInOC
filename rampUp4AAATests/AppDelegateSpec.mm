#import <Cedar/Cedar.h>
#import "AppDelegate.h"
#import "RecipesViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegateSpec", ^{
    __block AppDelegate *delegate;
    beforeEach(^{
        delegate = [[AppDelegate alloc] init];
    });
    
    context(@"when the app is finished loading", ^{ // encompass a scenario to set up for the tests to run under 
        beforeEach(^{
            [delegate application:nil didFinishLaunchingWithOptions:nil];  // call the delegate's method as if it was called during a normal app launch
        });
        
        it(@"should display a view", ^{ // where the assertions belong
            delegate.window.rootViewController should be_instance_of([RecipesViewController class]); // be_instance_of is a cedar matcher for asserting if an object is an instance of a particular class
        });
        
    });
});

SPEC_END
