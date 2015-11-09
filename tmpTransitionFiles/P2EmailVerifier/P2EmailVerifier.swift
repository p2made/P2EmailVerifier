//
//  P2EmailVerifier.swift
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

import Foundation

class P2EmailVerifier {

}


/*

//
//  P2EmailVerifier.h
//

    var P2EmailVerificationResult: enum{P2ValidEmail,P2InvalidPattern,P2BadDomainName,P2BadUserName,P2UnknownEmailError,P2NSURLRequestError}


class P2EmailVerifier: NSObject {
    weak var verifierDelegate: P2EmailVerifierDelegate?

    init(delegate: P2EmailVerifierDelegate) {
    }

    class func validatePatternForEmailAddress(emailAddress: String) -> Bool {
    }

    func verifyEmailAddress(emailAddress: String) {
    }
}

protocol P2EmailVerifierDelegate: NSObject {
    func emailVerificationResult(result: P2EmailVerificationResult)
}


//
//  P2EmailVerifier.m
//

class P2EmailVerifier {
    init(delegate: P2EmailVerifierDelegate) {
        if !self() {
            return nil
        }
        _verifierDelegate = delegate
        return self
    }

    class func validatePatternForEmailAddress(emailAddress: String) -> Bool {
        var emailRegEx: String = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        var emailTest: NSPredicate = NSPredicate.predicateWithFormat("SELF MATCHES[c] %@"emailRegEx)
        return emailTest.evaluateWithObject(emailAddress)
    }

    func verifyEmailAddress(emailAddress: String) {
        if !P2EmailVerifier.validatePatternForEmailAddress(emailAddress) {
            _verifierDelegate.emailVerificationResult(P2InvalidPattern)
            return
        }
        var verifyURL: NSURL = NSURL.URLWithString("\(url_base)=\(username)&pwd=\(password)&check=\(emailAddress)")
        var urlRequest: NSURLRequest = NSURLRequest.requestWithURL(verifyURL)
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse, data: NSData, error: NSErrorPointer) in            if error {
                _verifierDelegate.emailVerificationResult(P2NSURLRequestError)
                return
            }
            var verifyResult: [NSObject : AnyObject] = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingMutableContainers, error: nil)
            NSLog("verifyResult: %@", verifyResult.description())
            var verify_status: Bool = verifyResult["verify_status"].boolValue()
            if verify_status {
                _verifierDelegate.emailVerificationResult(P2ValidEmail)
                return
            }
            var verify_status_desc: String = verifyResult["verify_status_desc"]
            var checkString: String
            checkString = "MX record about '\(emailAddress.componentsSeparatedByString("@").objectAtIndex(1))' does not exist."
            if verify_status_desc.rangeOfString(checkString).location != NSNotFound {
                _verifierDelegate.emailVerificationResult(P2BadDomainName)
                return
            }
            checkString = "The email account that you tried to reach does not exist."
            if verify_status_desc.rangeOfString(checkString).location != NSNotFound {
                _verifierDelegate.emailVerificationResult(P2BadUserName)
                return
            }
            _verifierDelegate.emailVerificationResult(P2UnknownEmailError)

        })
    }
}

*/
