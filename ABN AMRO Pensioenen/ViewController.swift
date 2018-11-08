//
//  ViewController.swift
//  ABN AMRO Pensioenen
//
//  Created by Ronald Langerhorst on 08/11/2018.
//  Copyright © 2018 ABN. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string:"https://demo.abnamropensioenen.nl")
        
        myWebView.load(URLRequest(url:url!))
        //     myWebView.navigationDelegate
        myWebView.navigationDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}


extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //  if let host = navigationAction.request.url?.host {
        if (navigationAction.request.url?.absoluteString.range(of:".pdf") != nil){
            //          decisionHandler(.allow)
            UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil)
            //
            //              return
        }
        //   }
        
        decisionHandler(.allow)
    }
    //   func webView(_ webView: WKWebView,  did navigation: WKNavigation!) {
    //       print("Finished navigating to url \//(webView.url)")
    //  }
}


