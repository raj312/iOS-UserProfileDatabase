//
//  SurfTheWebViewController.swift
//  RajPatel_Assignment1
//
//  Created by Raj on 2018-02-12.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class SurfTheWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webpage: UIWebView!
    @IBOutlet var activity: UIActivityIndicatorView!
    
    //functions to show/hide activity indicator
    func webViewDidStartLoad(_ webView: UIWebView) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let urlAddress = URL(string: "https://www.google.ca")
        let url = URLRequest(url: urlAddress!)
        
        webpage.loadRequest(url as URLRequest)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
