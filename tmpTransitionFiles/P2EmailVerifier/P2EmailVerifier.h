//
//  P2EmailVerifier.h
//

@protocol P2EmailVerifierDelegate;

typedef enum {
	P2ValidEmail,
	P2InvalidPattern,
	P2BadDomainName,
	P2BadUserName,
	P2UnknownEmailError,
	P2NSURLRequestError
} P2EmailVerificationResult;

@interface P2EmailVerifier : NSObject

@property (assign, nonatomic) id<P2EmailVerifierDelegate> verifierDelegate;

- (instancetype)initWithDelegate:(id<P2EmailVerifierDelegate>)delegate;
+ (BOOL)validatePatternForEmailAddress:(NSString*)emailAddress;
- (void)verifyEmailAddress:(NSString*)emailAddress;

@end

@protocol P2EmailVerifierDelegate <NSObject>

- (void)emailVerificationResult:(P2EmailVerificationResult)result;

@end
