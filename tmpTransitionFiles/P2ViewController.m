//
//  P2ViewController.m
//

#import "P2ViewController.h"

@interface P2ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UILabel *patternResult;
@property (weak, nonatomic) IBOutlet UILabel *enumResult;
@property (weak, nonatomic) IBOutlet UILabel *boolResult;

@end

@implementation P2ViewController

- (IBAction)tappedValidatePatternButton:(id)sender
{
	BOOL result = [P2EmailVerifier validatePatternForEmailAddress:[_email text]];
	[_patternResult setText:(result ? @"Good :)" : @"Bad :(")];
}

- (IBAction)tappedVerifyAddressButton:(id)sender
{
	P2EmailVerifier* verifier = [[P2EmailVerifier alloc] initWithDelegate:self];

	[_enumResult setText:nil];
	[_boolResult setText:nil];
	[_email resignFirstResponder];

	[verifier verifyEmailAddress:[_email text]];
}

- (void)emailVerificationResult:(P2EmailVerificationResult)result
{
	NSString *resultString;

	switch (result) {
		case P2ValidEmail:
			resultString = @"It's all good to go :-)";
			break;

		case P2InvalidPattern:
			resultString = @"The address doesn't fit a valid email address pattern.";
			break;

		case P2BadDomainName:
			resultString = @"There's a problem with the domain name.";
			break;

		case P2BadUserName:
			resultString = @"There's a problem with the email user name.";
			break;

		case P2UnknownEmailError:
			resultString = @"There's a problem but P2EmailVerifier can't tell what it is.";
			break;

		default:
			resultString = @"NSURLRequest returned an error.";
			break;
	}

	[_enumResult setText:resultString];


	if (P2ValidEmail == result)
		[_boolResult setText:@"Email is good :)"];
	else
		[_boolResult setText:@"Email is bad :("];
}

@end
