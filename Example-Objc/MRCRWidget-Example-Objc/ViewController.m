//
//  ViewController.m
//  MRCRWidget-Example-Objc
//
//  Created by Roman Mogutnov on 08.02.2022.
//

#import "ViewController.h"

@import MRCRWidget;


@interface ViewController () <MRCRWidgetUIDelegate>

@property (nonatomic, weak) UIViewController *widgetViewController;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self showWidget];
}

- (void)showWidget {
    MRCRWidgetError *configurationError;
    
    MRCRWidgetConfiguration *configuration = [[MRCRWidgetConfiguration alloc]
                                              initWithWidgetId:@""
                                              environment:MRCRWidgetEnvironmentProduction
                                              customURL:NULL
                                              params:NULL
                                              error:&configurationError];
    if (configurationError) {
        [NSException raise:@"FATAL ERROR" format:@"%@", configurationError.localizedDescription];
        return;
    }
    
    MRCRWidgetAssembly *assembly = [[MRCRWidgetAssembly alloc] initWithConfiguration:configuration
                                                                          uiDelegate:self];
    UIViewController *vc = [assembly build];
    
    [self presentViewController:vc
                       animated:YES
                     completion:NULL];
    
    self.widgetViewController = vc;
}

- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Access Denied"
                                                                             message:@"Please grant access to your photo library"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:NULL];
    [alertController addAction:action];
    
    [self.widgetViewController presentViewController:alertController
                                            animated:YES
                                          completion:NULL];
}

#pragma mark - MRCRWidgetUIDelegate

- (void)mrcrWidgetDidReceiveError:(MRCRWidgetError * _Nonnull)error {
    switch (error.errorCode) {
        case MRCRWidgetErrorCodePhotoLibraryAuthorizationFailed:
            [self showAlert];
            break;
            
        default:
            break;
    }
}

@end
