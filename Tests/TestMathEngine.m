// For iOS
#import <GHUnitIOS/GHUnit.h>
// For Mac OS X
//#import <GHUnit/GHUnit.h>
#import "MathEngine.h"
#import "Problem.h"
#import "cocos2d.h"
//#import "CommonConstants.h"


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
   mathEngine = [[MathEngine alloc] initWithLevelNumber: 1];
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


- (void) printAnswers:(Problem*) problem {


    GHTestLog(@"Problem Statement:");
    
    
    GHTestLog(@"%i %@ %i = ?", [problem.firstOperand intValue], [OperatorSymbols objectAtIndex: problem.problemOperator.symbolIndex], [problem.secondOperand intValue]);

    
    //List of possible answers
    
    GHTestLog(@"\nThe Possible Answers are: ");
    NSEnumerator *enumerator = [[problem answers] objectEnumerator];
    
    NSNumber* value;
    
    while ((value = [enumerator nextObject])) {
        
       GHTestLog(@"%i",[value intValue]);
        
    }    
    
    
    GHTestLog(@"\nThe Correct Answer = %i", [problem.solution intValue]);
    GHTestLog(@"_______________________________");
    
}

- (void) testMathEngine {
 
    
    //GHTestLog(@"Entering testMathEngine");
    
    Problem* problem = nil;
    
    problem = [[mathEngine generateProblem] retain];
    
    [self printAnswers: problem];
    
    
    //Increment Level
    
    [mathEngine proceedToNextLevel:4];
    
    problem = [[mathEngine generateProblem] retain];
    
   
    [self printAnswers:problem];
    
}



@end