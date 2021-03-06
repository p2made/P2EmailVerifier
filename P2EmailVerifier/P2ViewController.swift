//
//  P2ViewController.swift
//  P2EmailVerifier
//
//  Created by Pedro Plowman on 2015-10-17.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Pedro Plowman
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class P2ViewController: UIViewController {
	@IBOutlet weak var emailField : UITextField!
	@IBOutlet weak var patternResult : UILabel!
	@IBOutlet weak var enumResult : UILabel!
	@IBOutlet weak var boolResult : UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func tappedValidatePatternButton(sender: AnyObject) {

	}

	@IBAction func tappedVerifyAddressButton(sender: AnyObject) {

	}
	


}

/*

//
//  P2ViewController.m
//

#import "P2ViewController.h"

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

default:	//	P2NSURLRequestError
resultString = @"NSURLRequest returned an error.";
break;
}

[_enumResult setText:resultString];

// If you only want a boolean result do this...

if (P2ValidEmail == result)
[_boolResult setText:@"Email is good :)"];
else
[_boolResult setText:@"Email is bad :("];
}

@end

*/

