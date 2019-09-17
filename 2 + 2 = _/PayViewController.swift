//
//  PayViewController.swift
//  2 + 2 = ?
//


//Hello! \ N \ nI want your child to learn how to count with the application as soon as possible with the application \ n \ "2 + 2 = \" \ nIn the full version you can use for training any numbers, and all simple mathematical actions (not only addition but also subtraction , multiplication and division). The purchase is made once and is always available. \ n \ n Terms of Use \ nhttps: //goo.gl/XYYGdX \ n Privacy Policy \ nhttps: //goo.gl/ffY7iB "

//Здравствуйте!\n\nЖелаю вашему ребенку как можно быстрее научиться считать с приложением \n    \"2 + 2 = \" \nВ полной версии вы сможете использовать для обучения любые числа, и все простые математические действия (не только сложение, но и вычитание, умножение и деление).  Покупка совершается один раз и доступна всегда.    \n\n Условия использования \nhttps://goo.gl/XYYGdX \n Политика конфиденциальности \nhttps://goo.gl/ffY7iB"


//  Created by Mac on 16.09.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//  Mathematic_purchase         mathematicPurchase_fokinmc

import UIKit
import StoreKit


class PayViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    
    
    @IBOutlet weak var textAboutBuy: UITextView!
    
    @IBOutlet weak var buyBtnLabel: UIButton!
    @IBOutlet weak var restoreBtnLabel: UIButton!
    @IBOutlet weak var сongratulationsBtnLabel: UIButton!
    @IBOutlet weak var backLabel: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carencyLabel: UILabel!
    
//    @IBOutlet weak var startLabel: UIButton!
    
    var listOfProducts = [SKProduct]()
    var productToPurchase = SKProduct()

    
    func addAccess() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "addAccess")
        userDefaults.synchronize()
//        backLabel.isHidden = true
//        startLabel.isHidden = false
        
//        //                func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.9, delay: 1, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//            self.сongratulationsBtnLabel.transform = CGAffineTransform(translationX: 0, y: 0)
//        }, completion: nil)    //}
        
    }
    
    func goToBack() {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(viewController, animated: true, completion: nil)
    }
    
    
    //---------начало инструмента позволяющего просмотр текста не с середины а сверху
    override func viewWillAppear(_ animated: Bool) {                            //
        textAboutBuy.isScrollEnabled = false                                        //
    }                                                                           //
    //
    override func viewDidAppear(_ animated: Bool) {                             //
        textAboutBuy.isScrollEnabled = true                                         //
    }                                                                           //
    //---------конец инструмента позволяющего просмотр текста не с середины а сверху
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textAboutBuy.text = NSLocalizedString( "     Hello!\n\nI wish for your child to learn how to count, as soon as possible, with the help of this app \n    \"2 + 2 = \" \nIn full version you can use any numbers, and all mathematical calculations (you will be able to add, subtract, multiply and divide numbers) You will need to purchase the full version only once and it will be always available for you    \n\n Terms of Use \nhttps://goo.gl/XYYGdX \n Privacy Policy \nhttps://goo.gl/ffY7iB", comment: "")
        canBuy()
        
        buyBtnLabel.isHidden = true
        buyBtnLabel.isEnabled = false
        restoreBtnLabel.isHidden = true
        restoreBtnLabel.isEnabled = false
//        startLabel.isHidden = true

    }
    
    func canBuy() {
        if SKPaymentQueue.canMakePayments() { //проверка возможности покупок аккаунтом
            print("Покупки доступны")
            
            let productID: Set<String> = ["mathematicPurchase_fokinmc"] //создали id продукта
            let request = SKProductsRequest(productIdentifiers: productID) //создали запрос в App Store
            request.delegate = self
            request.start()
        } else {
            print("Покупки не доступны")
        }
    }
    
    func buyProduct() {
        print("Покупаем " + productToPurchase.productIdentifier) // видим id продукта для покупки
        
        let pay = SKPayment(product: productToPurchase) // создаем платеж, как только создан платеж приложение должно добавить "наблюдателя" в очередь платежей, если к очереди нет прикрепленного Наблюдателя то очередь оплаты не синхронизируется со списком незавершенных сделок в App Store + если приложение завершает работу во время обработки сделки то она не теряется, и в следующий раз при закгрузку приложения очередь возобновится.
        SKPaymentQueue.default().add(self) // - наблюдатель
        SKPaymentQueue.default().add(pay) // добавили платеж в очередь
        

    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("product request phase")
        
        let myProducts = response.products // продукт создаются из ответа (который является экземляром класса response и представляет собой массив. Response имеет некоторые свойста в тч products - это продукты которые есть у нас в App Srore
        // дальше нужно перебрать массив продуктов
        for product in myProducts {
            print("Товар добавлен")
            print("Идентификатор продукта \(product.productIdentifier)")
            print("\(product.localizedTitle)")
            print("\(product.localizedDescription)")


            buyBtnLabel.isHidden = false
            buyBtnLabel.isEnabled = true
            restoreBtnLabel.isHidden = false
            restoreBtnLabel.isEnabled = true
            priceLabel.text = "\(product.price)"
            textAboutBuy.text = NSLocalizedString( "     Hello!\n\nI wish for your child to learn how to count, as soon as possible, with the help of this app \n    \"2 + 2 = \" \nIn full version you can use any numbers, and all mathematical calculations (you will be able to add, subtract, multiply and divide numbers) You will need to purchase the full version only once and it will be always available for you  \n\n Full version without ads  \n\n Terms of Use \nhttps://goo.gl/XYYGdX \n Privacy Policy \nhttps://goo.gl/ffY7iB", comment: "")
            if priceLabel.text == "29" {
                carencyLabel.text = "р."
            }
            listOfProducts.append(product)
        }
    }


    
    //добавляем наблюдателя
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            print("ошибка: \(transaction.error)")
            
            switch transaction.transactionState {
            case .purchased:
                print("Оптата прошла успешно")
                print("Продукт: " + productToPurchase.productIdentifier)
                
                let prodID = productToPurchase.productIdentifier
                
                switch prodID {
                case "mathematicPurchase_fokinmc":
                    print ("Покупаем полный доступ")
                    // тут запускаем функцию которая говорит что покупка совершена
                    
                    addAccess()

                default:
                    print("выполнился Default при SKPaymentQueue")
                    break
                }
                queue.finishTransaction(transaction)
                
                alertController(acTitle: NSLocalizedString("Thank you!", comment: ""), acMassage: NSLocalizedString("Now you can use any numbers, and any calculation", comment: ""), nameOkButton: NSLocalizedString("Ok", comment: ""))
                
                break
                
                //            case .restored: // удалили тк restored перенесли в отдельную фунукцию
                //                print("Восстановление покупки")
                
            case .failed:
                print("ошибка транзакции")
                queue.finishTransaction(transaction) //чтоб при ошибке не пыталсь выполнится транзакция
                alertController(acTitle: NSLocalizedString("Filed", comment: ""), acMassage: NSLocalizedString("App store declined your purchase", comment: ""), nameOkButton: NSLocalizedString("Ok", comment: ""))
            default:
                print("Выполняется дефолтный case")
                break
            }
        }
    }
    
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        for transaction in queue.transactions {
            let prodID = transaction.payment.productIdentifier as String
            
            switch prodID {
            case "mathematicPurchase_fokinmc":
                print ("Покупаем полный доступ")
                // тут запуcкаем функцию которая говорит что покупка совершена
                addAccess()
            default:
                break
            }
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("Удаляем транзакцию из очереди")
        
        
    }
    
    
    @IBAction func buyBtnPressed(_ sender: UIButton) {
        //если покупка одна в приложении то перебирать массив не нужно... тут перебираем (видимо нет)
        for product in listOfProducts {
            let productID = product.productIdentifier
            if productID == "mathematicPurchase_fokinmc" {
                productToPurchase = product
                
                buyProduct() // запускаем функцию покупки
                break
            }
        }
    }
    @IBAction func restoreBtnPressed(_ sender: UIButton) {
        SKPaymentQueue.default().add(self)  // - наблюдатель
        SKPaymentQueue.default().restoreCompletedTransactions()
        alertController(acTitle: NSLocalizedString("Restore", comment: ""), acMassage: NSLocalizedString("if you bought full version - it is restored for you.", comment: ""), nameOkButton: NSLocalizedString("Ok", comment: ""))
    }
    
    
    func alertController(acTitle: String, acMassage: String, nameOkButton: String) {
        let ac = UIAlertController(title: acTitle, message: acMassage, preferredStyle: .alert)
//        let back = UIAlertAction(title: "Back to the menu", style: .default, handler: { (action) in
//            self.menuView.isHidden = false
//        })
        let ok = UIAlertAction(title: nameOkButton, style: .cancel, handler: { (action) in
            self.goToBack()
        })
//        ac.addAction(back)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
}
