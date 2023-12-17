//
//  SettingsVC.swift
//  TipCalculatorApp2
//
//  Created by Heeba Khan on 17/12/23.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func passData(tip: String?, people: String?)
}

class SettingsVC: UITableViewController {

    @IBOutlet weak var maxTipPercent: UILabel!
    @IBOutlet weak var stepMaxTipPercent: UIStepper!
    @IBOutlet weak var maxPeopleSplit: UIStepper!
    @IBOutlet weak var maxPeople: UILabel!
    @IBOutlet var tView: UITableView!
    
    var delegate: SettingsViewControllerDelegate?
    var maxTipPercentage: String?
    var maxPeopleCount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        tView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegate?.passData(tip: maxTipPercent.text, people: maxPeople.text)
    }
    
    @IBAction func changeMaxTipPercent(_ sender: UIStepper) {
        maxTipPercent.text = String(format: "%.0f", stepMaxTipPercent.value)
    }
    
    @IBAction func maxPeopleSplit(_ sender: UIStepper) {
        maxPeople.text = String(format: "%.0f", maxPeopleSplit.value)
    }
}

extension SettingsVC {
    func config() {
        self.navigationItem.title = "Settings"
        maxTipPercent.text = maxTipPercentage
        stepMaxTipPercent.value = Double(maxTipPercentage!)!
        maxPeople.text = maxPeopleCount
       maxPeopleSplit.value = Double(maxPeopleCount!)!
    }
}
