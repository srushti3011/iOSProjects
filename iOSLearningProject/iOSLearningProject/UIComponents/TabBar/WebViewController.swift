//
//  WebViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 06/03/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.navigationDelegate = self
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
//        let timer = Timer(timeInterval: TimeInterval(1), repeats: true) {
//            (timer) in
//            print(self.webView.estimatedProgress)
//        }
//        print(webView.title)
        
    }
}

extension WebViewController: WKNavigationDelegate {
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
//        if let host = navigationAction.request.url?.host {
//            if host == "www.google.com" {
//                
//            }
//        }
//    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping @MainActor @Sendable (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if host == "www.google.com" {
                decisionHandler(.allow)
            }
        } else {
            decisionHandler(.cancel)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // start loading
        loader.isHidden = false
        loader.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // stop loading
        loader.stopAnimating()
        loader.isHidden = true
    }
}
