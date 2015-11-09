//
//  P2EmailVerifier.m
//

#import "P2EmailVerifier.h"

#define url_base @"http://api.verify-email.org/api.php?"
#define username @"your_verify-email.org_username_here"
#define password @"your_verify-email.org_password_here"

@implementation P2EmailVerifier

- (instancetype)initWithDelegate:(id<P2EmailVerifierDelegate>)delegate
{
	if (![self init]) return nil;
	_verifierDelegate = delegate;
	return self;
}

+ (BOOL)validatePatternForEmailAddress:(NSString*)emailAddress
{
	NSString *emailRegEx =
	@"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegEx];

	return [emailTest evaluateWithObject:emailAddress];
}

- (void)verifyEmailAddress:(NSString*)emailAddress
{

	if (![P2EmailVerifier validatePatternForEmailAddress:emailAddress]) {
		[_verifierDelegate emailVerificationResult:P2InvalidPattern];
		return;
	}

	NSURL* verifyURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@usr=%@&pwd=%@&check=%@", url_base, username, password, emailAddress]];
	NSURLRequest* urlRequest = [NSURLRequest requestWithURL:verifyURL];

	[NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse* response, NSData* data, NSError* error) {
		if (error) {
			[_verifierDelegate emailVerificationResult:P2NSURLRequestError];
			return;
		}

		NSDictionary* verifyResult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

		NSLog(@"verifyResult: %@", [verifyResult description]);

		BOOL verify_status = [[verifyResult objectForKey:@"verify_status"] boolValue];
		if (verify_status) {
			[_verifierDelegate emailVerificationResult:P2ValidEmail];
			return;
		}

		NSString* verify_status_desc = [verifyResult objectForKey:@"verify_status_desc"];
		NSString* checkString;

		checkString = [NSString stringWithFormat:@"MX record about '%@' does not exist.", [[emailAddress componentsSeparatedByString:@"@"] objectAtIndex:1]];
		if ([verify_status_desc rangeOfString:checkString].location != NSNotFound) {
			[_verifierDelegate emailVerificationResult:P2BadDomainName];
			return;
		}

		checkString = @"The email account that you tried to reach does not exist.";
		if ([verify_status_desc rangeOfString:checkString].location != NSNotFound) {
			[_verifierDelegate emailVerificationResult:P2BadUserName];
			return;
		}

		[_verifierDelegate emailVerificationResult:P2UnknownEmailError];
	}];
}

@end
