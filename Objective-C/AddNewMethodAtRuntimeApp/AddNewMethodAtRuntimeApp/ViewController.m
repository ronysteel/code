#import "ViewController.h"
#import "MyObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    id obj = [MyObject new];
    
    [obj performSelector:@selector(aSimpleDynamicMethod)];
    [obj performSelector:@selector(aSimpleDynamicMethod)];
    [obj performSelector:@selector(aSimpleDynamicMethod)];
    [obj performSelector:@selector(aSimpleDynamicMethod)];
    [obj performSelector:@selector(aSimpleDynamicMethod)];    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
