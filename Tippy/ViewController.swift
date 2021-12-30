//x
//  ViewController.swift
//  Tippy
//
//  Created by Qasym Dar on 12/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    // - MARK: IBOutlets
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // - MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        amountField.attributedPlaceholder = NSAttributedString(
            string: "$0.00",
            attributes: [NSAttributedString.Key.foregroundColor:
                            UIColor(white: 0.0, alpha: 0.2)
                        ]
        )
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(recognizer)
    }
    
    // - MARK: Methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // - MARK: IBActions
    
    @IBAction func calcButton(_ sender: Any) {
        let resultVc = storyboard!.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        let segmentNumber = segmentedControl.selectedSegmentIndex // Int
        let dollarAmount = Double(amountField.text!)! // Double
        
        var tipPercent = 0.0
        
        if segmentNumber == 0 {
            tipPercent = 0.1
        }
        if segmentNumber == 1 {
            tipPercent = 0.15
        }
        if segmentNumber == 2 {
            tipPercent = 0.2
        }
        if segmentNumber == 3 {
            tipPercent = 0.25
        }
        if segmentNumber == 4 {
            tipPercent = 0.30
        }
        
        resultVc.tipAmount = dollarAmount * tipPercent // big baller
        resultVc.totalCash = dollarAmount + resultVc.tipAmount!
        
        // modal segue (bottom to top)
        // present(resultVc, animated: true, completion: nil)
        
        // push segue (right to left)
        navigationController!.pushViewController(resultVc, animated: true)
    }
    
}

