//
//  MenuViewController.swift
//  Kasteleken
//
//  Created by Syvert Andreas Eidjord on 27/09/2019.
//  Copyright © 2019 Eidjord Marketing. All rights reserved.
//

import UIKit
import StoreKit

class MenuViewController: UIViewController, SKPaymentTransactionObserver {

    let productID = "com.eidjord.Kasteleken.KleinQuestions"
    var gameMode : Int?
    
    @IBOutlet weak var kleinButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SKPaymentQueue.default().add(self)
        
        if UserDefaults.standard.bool(forKey: productID){
            kleinButton.backgroundColor = #colorLiteral(red: 1, green: 0.5859075189, blue: 0, alpha: 1)
        }
        else
        {
            kleinButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
    }
    
    
    func buyKleinContent(){
        if SKPaymentQueue.canMakePayments(){
            
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
            
        }
        else {
            print("Can't make purchases")
        }
    }
    
    
    func openKlein(){
        kleinButton.backgroundColor = #colorLiteral(red: 1, green: 0.5859075189, blue: 0, alpha: 1)
    }
    
    
    @IBAction func kleinController(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: productID){
            gameMode = 2
            performSegue(withIdentifier: "OptionsSender", sender: self)
        }
        else {
            buyKleinContent()
        }
    }
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                openKlein()
                UserDefaults.standard.set(true, forKey: productID)
                createAlert(title: "Success", message: NSLocalizedString("Kjøpet er fullført", comment: ""), actionTitle: "Ok")
                SKPaymentQueue.default().finishTransaction(transaction)
            }
            else if transaction.transactionState == .failed {
                createAlert(title: "Failed", message: NSLocalizedString("Kjøpet ble ikke fulført", comment: ""), actionTitle: "Ok")
                SKPaymentQueue.default().finishTransaction(transaction)
            }
            else if transaction.transactionState == .restored {
                openKlein()
                UserDefaults.standard.set(true, forKey: productID)
                createAlert(title: "Restored", message: "Purchase restored", actionTitle: "OK")
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let optionsMode = segue.destination as! SecondViewController
        optionsMode.gameModeNumber = gameMode!
        
    }
    
    
    @IBAction func restoreButtonPressed(_ sender: Any) {
        print("restorePressed")
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        createAlert(title: "Restored", message: "Restored", actionTitle: "Ok")
    }
    
    
    
    @IBAction func ButtonSend(_ sender: UIButton) {
        
        gameMode = sender.tag
        performSegue(withIdentifier: "OptionsSender", sender: self)
        
    }
    
    func createAlert(title : String, message : String, actionTitle : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: actionTitle, style: .default) { (UIAlertAction) in
            
        }
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
    

}
