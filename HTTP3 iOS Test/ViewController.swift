//
//  ViewController.swift
//  HTTP3 iOS Test
//
//  Created by Michael Antonius on 06/06/23.
//

import UIKit
import os.log

class ViewController: UIViewController, URLSessionDataDelegate {
    @IBOutlet weak var protocolTxt: UILabel!
    
    var session: URLSession!
    var task: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a URLSession with a delegate
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    }
    
    @IBAction func refreshBtnAction(_ sender: Any) {
        let url = URL(string: "https://quic.tech:8443/")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        request.assumesHTTP3Capable = true
        os_log("task will start, url: \(url.absoluteString)")
        self.session.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError? {
                os_log("task transport error \(error.domain) / \(error.code)")
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                os_log("task response is invalid")
                return
            }


            guard 200 ..< 300 ~= response.statusCode else {
                print("task response status code is invalid; received \(response.statusCode), but expected 2xx")
                return
            }
            os_log("task finished with status \(response.statusCode), bytes \(data.count)")
        }.resume()
    }
    
    // URLSessionDelegate method to capture task metrics
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        let protocols = metrics.transactionMetrics.map { $0.networkProtocolName ?? "-" }.joined(separator:",")
        
        if metrics.transactionMetrics.first != nil {
            if(protocols.contains("h3")){
                DispatchQueue.main.async {
                    self.protocolTxt.backgroundColor = UIColor(hex: 0x00FF00)
                    self.protocolTxt.textColor = UIColor(hex: 0x00000)
                    self.protocolTxt.text = "\(protocols)"
                }
            } else {
                DispatchQueue.main.async {
                    self.protocolTxt.backgroundColor = UIColor(hex: 0xFF0000)
                    self.protocolTxt.textColor = UIColor(hex: 0xFFFFFF)
                    self.protocolTxt.text = "\(protocols)"
                }
            }
            
        }
    }
}
