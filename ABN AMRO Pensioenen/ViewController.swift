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
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBAction func onBack(_ sender: UIBarButtonItem) {
        toolbar.isHidden=true
        myWebView.goBack()
    }
    @IBAction func print(_ sender: UIBarButtonItem) {
   
        var pInfo:UIPrintInfo = UIPrintInfo.printInfo()
//        pInfo.outputType = UIPrintInfoOutputType.General
        pInfo.jobName = (myWebView.url?.absoluteString)!
//        pInfo.orientation = UIPrintInfoO
        
        var printController = UIPrintInteractionController.shared
        printController.printInfo = pInfo
//        printController.showsPageRange = true
        printController.printFormatter = myWebView.viewPrintFormatter()
        printController.present(animated: true, completionHandler: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        toolbar.isHidden=true
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
//        print(navigationAction.request.url?.absoluteString)
        if (navigationAction.request.url?.absoluteString.range(of:".pdf") != nil  ){
            //          decisionHandler(.allow)
            UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil)
            //
            //              return
        }
        if(navigationAction.request.url?.absoluteString.range(of:"blob") != nil){
            toolbar.isHidden=false
        }
        //   }
        
        decisionHandler(.allow)
    }
    //   func webView(_ webView: WKWebView,  did navigation: WKNavigation!) {
    //       print("Finished navigating to url \//(webView.url)")
    //  }
}


