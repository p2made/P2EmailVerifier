//
//  P2ViewController.h
//

#import <UIKit/UIKit.h>

#import "P2EmailVerifier.h"

@interface P2ViewController : UIViewController <P2EmailVerifierDelegate>

- (IBAction)tappedValidatePatternButton:(id)sender;
- (IBAction)tappedVerifyAddressButton:(id)sender;

@end
