// For iOS
#import <GHUnitIOS/GHUnit.h>
// For Mac OS X
//#import <GHUnit/GHUnit.h>
#import "MathEngine.h"
#import "Problem.h"
#import "cocos2d.h"

@interface TestMathEngine : GHTestCase { 
    
}
@property(nonatomic, retain) MathEngine* mathEngine;
@end

@implementation TestMathEngine

@synthesize mathEngine;

- (BOOL)shouldRunOnMainThread {
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
    return NO;
}

- (void)setUpClass {
    // Run at start of all tests in the class
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
    // Run before each test method
    mathEngine = [[MathEngine alloc] initWithLevelNumber: 0];
}

- (void)tearDown {
    // Run after each test method
} 

-(void) printOperator:(int) opr {
    switch (opr) {
        case 1:
             GHTestLog(@"+");
            break;
        case 2:
             GHTestLog(@"-");
            break;
        case 3:
            GHTestLog(@"*");
            break;
        case 4:
             GHTestLog(@"/");            
            break;
            
        default:
            
            break;
    }
}

- (void)testMathEngine {
 
    GHTestLog(@"Entering testMathEngine");
    
    Problem* problem = [[mathEngine problemGenerator] retain];
    
    [self printAnswers:problem];
    
    //  Add Level
    
    [mathEngine proceedToNextLevel:1];
    
    problem = [[mathEngine problemGenerator] retain];
    
   
    [self printAnswers:problem];
    
    [mathEngine proceedToNextLevel:1];
    
    problem = [[mathEngine problemGenerator] retain];
    
    
    [self printAnswers:problem];
    
    
    
   
    
}

-(void) printAnswers:(Problem*) problem {
    // Print Operands
    NSNumber* val;
    NSNumber* val1;
    
    CCARRAY_FOREACH([problem operands], val) {
        GHTestLog(@" %i", val.intValue);
        CCARRAY_FOREACH([problem operatorChar], val1) {
            [self printOperator:val1.intValue];
        }
    }
       
    GHTestLog(@"Answers:");
   
    for(NSNumber *aKey in [problem answers]){
   
        GHTestLog(@"%@ Answer %i",[[problem answers] objectForKey:aKey],  aKey.intValue);
        
    }
}


@end