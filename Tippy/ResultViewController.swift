//
//  ResultViewController.swift
//  Tippy
//
//  Created by Qasym Dar on 12/15/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    // - MARK: IBOutlets
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    // - MARK: Properties
    
    var tipAmount: Double?
    var totalCash: Double?
    
    // - MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tipLabel.text = String(tipAmount!)
        totalLabel.text = String(totalCash!)
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale.current
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: totalCash!))
        
        
        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tipAmount!))
        
    }
    
    
}
