//
//  ViewController.swift ÷
//  2 + 2 = ?
//
//  Created by Mac on 10.09.17.
//  Copyright © 2017 FokinMC. All rights reserved.


import UIKit
//import Appodeal


class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var allExample: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var typeLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var pinLabel: UITextField!
    @IBOutlet weak var userPinLabel: UITextField!
    @IBOutlet weak var finishValueLabel: UITextField!
    
    @IBOutlet weak var xMinLabel: UITextField!
    @IBOutlet weak var yMinLabel: UITextField!
    @IBOutlet weak var xMaxLabel: UITextField!
    @IBOutlet weak var yMaxLabel: UITextField!
    
    @IBOutlet weak var plusCheck: UIImageView!
    @IBOutlet weak var minusCheck: UIImageView!
    @IBOutlet weak var multiplyCheck: UIImageView!
    @IBOutlet weak var divideCheck: UIImageView!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var goToBuyLabel: UIButton!
    
    @IBOutlet weak var rateAppLabel: UIButton!
    @IBOutlet weak var reviewLabel: UIButton!
    @IBOutlet weak var arrowLabel: UIImageView!
    
    
    var xMax = Int()
    var yMax = Int()
    var xMin = Int()
    var yMin = Int()
    
    var plusOn = Bool()
    var minusOn = Bool()
    var multiplyOn = Bool()
    var divideOn = Bool()
    
    var signArray = [0,0,0,0]
    var plusValue = Int()
    var minusValue = Int()
    var multiplyValue = Int()
    var divideValue = Int()
    
    var xValue = Int()
    var yValue = Int()
    var zValue = Int()
    var zValueChaild = String()
    var result = Int()
    var randomX = Int()
    var randomY = Int()
    var finishValue = Int()
    var typeOfPassword = String()
    var password = String()
    var userPin = String()
    var pin = String()
    
    var addAccess = Bool()
    var mystake = 0

    
    let urlString = "https://itunes.apple.com/app/id1286063193"
    
    
    //скрыть клавиатуру  нужно еще добавить свайп - жест на сториборде
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithotherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true 
    }         //скрыть клавиатуру
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        addAccess = userDefaults.bool(forKey: "addAccess")
//        if addAccess == false {
//            Appodeal.showAd(AppodealShowStyle.bannerBottom, rootViewController: self)
//        }
        
        
        if #available(iOS 10.3, *) { // отзывы
            RateManager.showRatesController()
        } else {
            // Fallback on earlier versions
        }
        
        
        answerLabel.text = NSLocalizedString("When you score ", comment: "") + "\(finishValue) " + NSLocalizedString("point — I will write you ", comment: "") + "\(typeOfPassword)"
        //        startLabel.makeShadowMain()
        goToBuyLabel.layer.cornerRadius = 10
        goToBuyLabel.clipsToBounds = true
        arrowLabel.isHidden = true
        
        
        //скрыть клавиатуру
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizerDirection.down
        self.mainView.addGestureRecognizer(swipeDown)
        //скрыть клавиатуру
        
//        let userDefaults = UserDefaults.standard
        addAccess = userDefaults.bool(forKey: "addAccess")
        //MARK: free
        //        addAccess = true // добавить чтоб бесплатно
        if addAccess == true {
            goToBuyLabel.isHidden = true
            goToBuyLabel.isEnabled = false
        } else {
//            Appodeal.showAd(AppodealShowStyle.bannerBottom, rootViewController: self)
        }
        
        if let pin = userDefaults.object(forKey: "pin") {
            pinLabel.text = "\(pin)"
        }
        plusOn = userDefaults.bool(forKey: "plusOn")
        minusOn = userDefaults.bool(forKey: "minusOn")
        multiplyOn = userDefaults.bool(forKey: "multiplyOn")
        divideOn = userDefaults.bool(forKey: "divideOn")
        
        
        checkOnOff()
        
        
        if plusOn == false && minusOn == false && multiplyOn == false && divideOn == false {
            plusCheck.image = UIImage(named: "checkOn")
        }
        
        let i_see_rate_manager = userDefaults.bool(forKey: "i_see_rate_manager")
        reviewLabel.isHidden = !i_see_rate_manager
        rateAppLabel.isHidden = !i_see_rate_manager
        
        
        
        newTask()
    }
    
    
    //скрыть клавиатуру
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }         //скрыть клавиатуру
    
    
    
    
    func newTask() {
        if xMin > xMax || yMin > yMax {
            let ac = UIAlertController(title: NSLocalizedString("Min more than Max", comment: ""), message: NSLocalizedString("Please check one more time min and max value. Max must be more than min", comment: ""), preferredStyle: .alert)
            
            let ok = UIAlertAction(title: NSLocalizedString("To fix", comment: ""), style: .cancel, handler: { (action) in
                self.menuView.isHidden = false
            })
            
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
        } else {
            randomX = Int.random(range: xMin..<xMax+1)
            randomY = Int.random(range: yMin..<yMax+1)
        }
        
        xValue = randomX
        yValue = randomY
        
        xLabel.text = "\(xValue)"
        yLabel.text = "\(yValue)"
        
        
        
        
        //        let countArray = signArray.count
        let randomS = Int.random(range: 1..<4+1)
        
        var valueSign = Int()
        
        if plusOn == false && minusOn == false && multiplyOn == false && divideOn == false {
            valueSign = 1
        } else {
            valueSign = signArray[randomS-1]
        }
        
        
        
        
        switch valueSign {
        case 0:
            valueSign = signArray[randomS-1]
            print("был 0")
            newTask()
        case 1:
            zValue = xValue + yValue
            allExample.text = "\(xValue) + \(yValue) ="
        case 2:
            if xValue >= yValue {
                zValue = xValue - yValue
                allExample.text = "\(xValue) - \(yValue) ="
            } else {
                zValue = yValue - xValue
                allExample.text = "\(yValue) - \(xValue) ="
            }
        case 3:
            zValue = xValue * yValue
            allExample.text = "\(xValue) x \(yValue) ="
        case 4:
            if xValue == 0 {
                xValue = 1
            }
            if yValue == 0 {
                yValue = 1
            }
            
            let rValue = xValue * yValue
            
            zValue = rValue / yValue
            
            allExample.text = "\(rValue) ÷ \(yValue) ="
            //        case 5:
            //            //начал делать выражения со скобкам
            //            zValue = xValue - yValue * 2
            //            allExample.text = "\(rValue) ÷ \(yValue) ="
            
            
        default:
            break
        }
        
        zLabel.text = ""
    }
    
    
    @IBAction func menuPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        pin = userDefaults.object(forKey: "pin") as! String
        userPin = userPinLabel.text!
        if userPin == pin {
            menuView.isHidden = false
        } else {
            userPinLabel.text = ""
            let ac = UIAlertController(title: NSLocalizedString("Incorrect Pin", comment: ""), message: NSLocalizedString("To find out the answer, enter the correct pin, or dial ", comment: "") + "\(finishValue)" + NSLocalizedString(" points", comment: ""), preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func goPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        
        self.pin = self.pinLabel.text!
        userDefaults.set(self.pin, forKey: "pin")
        
        
        if xMinLabel.text == "" || xMaxLabel.text == "" || yMinLabel.text == "" || yMaxLabel.text == "" {
            let ac = UIAlertController(title: NSLocalizedString("One of the fields of min or max is empty", comment: ""), message: NSLocalizedString("Fill in the minimum and maximum fields", comment: ""), preferredStyle: .alert)
            
            let ok = UIAlertAction(title: NSLocalizedString("To fix", comment: ""), style: .cancel, handler: { (action) in
                self.menuView.isHidden = false
            })
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
        } else {
            xMin = Int(xMinLabel.text!)!
            xMax = Int(xMaxLabel.text!)!
            yMin = Int(yMinLabel.text!)!
            yMax = Int(yMaxLabel.text!)!
        }
        
        
        menuView.isHidden = true
        userPinLabel.text = ""
        
        if let pinCheck = userDefaults.object(forKey: "pin") {
            pinLabel.text = "\(pin)"
            pin = pinCheck as! String
        }
        
        
        typeOfPassword = typeLabel.text!
        password = passwordLabel.text!
        if finishValueLabel.text == "" {
            finishValue = 10
        } else {
            finishValue = Int(finishValueLabel.text!)!
        }
        
        userDefaults.set(typeOfPassword, forKey: "typeOfPassword")
        userDefaults.set(password, forKey: "password")
        userDefaults.synchronize()
        
        
        //        if plusOn == false && minusOn == false && multiplyOn == false && divideOn == false {
        //            let ac = UIAlertController(title: "You did`t choose +, -, * or ÷ ", message: "Will be used only +", preferredStyle: .alert)
        //
        //            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        //            ac.addAction(ok)
        //            present(ac, animated: true, completion: nil)
        //        }
        
        newTask()
        
        if finishValueLabel.text == "" {
            let ac = UIAlertController(title: NSLocalizedString("Field \"Finish value\" is empty", comment: ""), message: NSLocalizedString("Please set the number of points that the child must gain for successful completion of the task", comment: ""), preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "To fix", style: .cancel, handler: { (action) in
                self.menuView.isHidden = false
            })
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
        }
        
        
        //была самостоятельная контстанта let
        addAccess = userDefaults.bool(forKey: "addAccess")
        //MARK: free more then 10
        //        addAccess = true
        if addAccess == false {// проверка покупки
            if xMax > 10 || yMax > 10 || xMin > 10 || yMin > 10 {
                let ac = UIAlertController(title: NSLocalizedString("You are using a number greater than 10", comment: ""), message: NSLocalizedString("If you want to learn how to count with numbers more than 10, you can buy the full version", comment: ""), preferredStyle: .alert)
                let buy = UIAlertAction(title: NSLocalizedString("More", comment: ""), style: .cancel, handler: { (action) in
                    self.goToPayView()
                })
                let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: { (action) in
                    self.menuView.isHidden = false
                })
                ac.addAction(buy)
                ac.addAction(cancel)
                present(ac, animated: true, completion: nil)
            }
        }
        
        if pin == "" {
            let ac = UIAlertController(title: NSLocalizedString("You did not enter a PIN code", comment: ""), message: NSLocalizedString("If you do not enter the PIN code then the child will be able to see the answer at any time by opening the settings", comment: ""), preferredStyle: .alert)
            let back = UIAlertAction(title: NSLocalizedString("Back to the menu", comment: ""), style: .default, handler: { (action) in
                self.menuView.isHidden = false
            })
            let ok = UIAlertAction(title: NSLocalizedString("Continue without PIN", comment: ""), style: .cancel, handler: { (action) in
                self.pin = self.pinLabel.text!
                userDefaults.set(self.pin, forKey: "pin")
            })
            ac.addAction(back)
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
        }
        //        answerLabel.text = "When you score \(finishValue) point — I will write you \(typeOfPassword)"
        answerLabel.text = NSLocalizedString("When you score ", comment: "") + "\(finishValue) " + NSLocalizedString("point — I will write you ", comment: "") + "\(typeOfPassword)"
        
        zLabel.text = NSLocalizedString("tap here", comment: "")
        
    }
    
    func goToPayView() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PayViewController") as! PayViewController
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func verifyButton(_ sender: UIButton) {
        
        
        
        
        let userDefaults = UserDefaults.standard
        typeOfPassword = userDefaults.object(forKey: "typeOfPassword") as! String
        
        
        zValueChaild = zLabel.text!
        let userDefault = UserDefaults.standard
        
        if zValueChaild == NSLocalizedString("tap here", comment: "") || zValueChaild == "" {
            arrowLabel.isHidden = false
        } else {
            arrowLabel.isHidden = true
            if zValueChaild == "\(zValue)" {
                result += 1
                resultLabel.textColor = #colorLiteral(red: 0.1526146233, green: 0.603728056, blue: 0, alpha: 1)
            } else {
                result -= 1
                resultLabel.textColor = #colorLiteral(red: 0.9883499742, green: 0.2364121974, blue: 0, alpha: 1)
                
                mystake += 1
                print("ошибки \(mystake)")
                if addAccess == false && mystake == 3 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {  // тут реализована задержка AC
//                        Appodeal.showAd(AppodealShowStyle.interstitial, rootViewController: self)
                        self.mystake = 0
                    })
                }
            }
            
            if result == finishValue {
                answerLabel.text = "\(typeOfPassword)  " + password
            } else {
                answerLabel.text = NSLocalizedString("When you score ", comment: "") + "\(finishValue) " + NSLocalizedString("point — I will write you ", comment: "") + "\(typeOfPassword)"
            }
            
            
            userDefault.set(result, forKey: "result")
            resultLabel.text = "\(result)"
            newTask()
        }
        
    }
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        pin = pinLabel.text!
        userDefaults.set(pin, forKey: "pin")
    }
    @IBAction func resetPressed(_ sender: UIButton) {
        let ac = UIAlertController(title: NSLocalizedString("If you choose Reset:", comment: ""), message: NSLocalizedString("You will reset all data, including pin, scores and hidden answer, and go to Setting", comment: ""), preferredStyle: .alert)
        let back = UIAlertAction(title: NSLocalizedString("Reset!", comment: ""), style: .default, handler: { (action) in
            self.pinLabel.text = ""
            self.passwordLabel.text = ""
            self.answerLabel.text = ""
            self.typeLabel.text = ""
            self.menuView.isHidden = false
            self.resultLabel.text = ""
            self.result = 0
        })
        let ok = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        ac.addAction(back)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
        
    }
    
    
    func checkOnOff() {
        
        
        
        if plusOn == true {
            plusCheck.image = UIImage(named: "checkOn")
            plusValue = 1
            signArray[0] = 1
        } else {
            plusCheck.image = UIImage(named: "checkOff")
            plusValue = 0
            signArray[0] = 0
        }
        if minusOn == true {
            minusCheck.image = UIImage(named: "checkOn")
            minusValue = 2
            signArray[1] = 2
        } else {
            minusCheck.image = UIImage(named: "checkOff")
            minusValue = 0
            signArray[1] = 0
        }
        if multiplyOn == true {
            multiplyCheck.image = UIImage(named: "checkOn")
            multiplyValue = 3
            signArray[2] = 3
        } else {
            multiplyCheck.image = UIImage(named: "checkOff")
            multiplyValue = 0
            signArray[2] = 0
        }
        if divideOn == true {
            divideCheck.image = UIImage(named: "checkOn")
            divideValue = 4
            signArray[3] = 4
        } else {
            divideCheck.image = UIImage(named: "checkOff")
            divideValue = 0
            signArray[3] = 0
        }
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        plusOn = userDefaults.bool(forKey: "plusOn")
        plusOn = !plusOn
        userDefaults.set(plusOn, forKey: "plusOn")
        userDefaults.set(plusValue, forKey: "plusValue")
        userDefaults.synchronize()
        checkOnOff()
        
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        minusOn = userDefaults.bool(forKey: "minusOn")
        minusOn = !minusOn
        userDefaults.set(minusOn, forKey: "minusOn")
        userDefaults.set(minusValue, forKey: "minusValue")
        userDefaults.synchronize()
        checkOnOff()
    }
    
    @IBAction func multiplePressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        multiplyOn = userDefaults.bool(forKey: "multiplyOn")
        multiplyOn = !multiplyOn
        userDefaults.set(multiplyOn, forKey: "multiplyOn")
        userDefaults.set(multiplyValue, forKey: "multiplyValue")
        userDefaults.synchronize()
        checkOnOff()
    }
    
    @IBAction func devidePressed(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        divideOn = userDefaults.bool(forKey: "divideOn")
        divideOn = !divideOn
        userDefaults.set(divideOn, forKey: "divideOn")
        userDefaults.set(divideValue, forKey: "divideValue")
        userDefaults.synchronize()
        checkOnOff()
    }
    
    @IBAction func descriptionTypePressed(_ sender: UIButton) {
        let ac = UIAlertController(title: NSLocalizedString("Write here:", comment: ""), message: NSLocalizedString("Which bonus the child will receive when he cope with the task. For example: \"Password for the iPad\", or \"Money for ice cream\".", comment: ""), preferredStyle: .alert)
        let ok = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func descriptionCodePressed(_ sender: UIButton) {
        let ac = UIAlertController(title: NSLocalizedString("Write here:", comment: ""), message: NSLocalizedString("What is the code for ipad. For example: \"879342\", or where did you put the money for ice cream. For example: \"Under a vase of flowers\"", comment: ""), preferredStyle: .alert)
        let ok = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func descriptionFinishValuePressed(_ sender: UIButton) {
        let ac = UIAlertController(title: NSLocalizedString("Write here:", comment: ""), message: NSLocalizedString("How many points should the child score in order to find out the answer. Right answer +1, mistake -1", comment: ""), preferredStyle: .alert)
        let ok = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
    
    @IBAction func goToBuyPressed(_ sender: UIButton) {
        let ac = UIAlertController(title: NSLocalizedString("Use all calculation", comment: ""), message: NSLocalizedString("If you want to learn how to subtract, multiply and divide - buy full version.", comment: ""), preferredStyle: .alert)
        let buy = UIAlertAction(title: NSLocalizedString("More", comment: ""), style: .cancel, handler: { (action) in
            self.goToPayView()
        })
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: { (action) in
            self.menuView.isHidden = false
        })
        ac.addAction(buy)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        menuView.isHidden = false
    }
    
    @IBAction func reviewPressed(_ sender: UIButton) {
        let url = NSURL(string: self.urlString)!
        UIApplication.shared.openURL(url as URL)
    }
    
    @available(iOS 10.3, *)
    @IBAction func rateAppPressed(_ sender: UIButton) {
        RateManager.showRatesControllerNow()
    }
    
    
    
    
    
    
    //_______------------____________
    //_______------------____________
    //_______------------____________
    //_______------------____________
    //_______------------____________
    //_______------------____________
    //_______------------____________
    func chooseRandom () {
        typealias Element = Int
        let arr:[(Element, Double)] = [
            (1, 0.25),
            (2, 0.25),
            (3, 0.25),
            (4, 0.25),
            
            
            //    (1, 0.10),
            //    (2, 0.40),
            //    (3, 0.20),
            //    (4, 0.05),
            //    (5, 0.07),
            //    (6, 0.03),
            //    (7, 0.01),
            //    (8, 0.11),
            //    (9, 0.02),
            //    (10, 0.01),
        ]
        
        var sum = 0.0
        var machineArray = arr.map {
            (item: (Element, Double)) -> (Range<Double>, Element) in
            let range = Double(sum)..<Double(sum) + item.1
            sum += item.1
            return (range, item.0)
        }
        
        func getnum(_ random: Double) -> Element? {
            let random = random * sum
            guard 0...sum ~= random else {
                return nil
            }
            
            return (machineArray.first { $0.0.contains(random) } ?? machineArray.last!).1
        }
        
        for var i in stride(from: 0, through: 1, by: 0.01) {
            print(getnum(i) ?? "nil", i)
        }
        
        func random() -> Double {
            return Double(arc4random()) / Double(UINT32_MAX)
        }
        //        let randomArray = getnum(random())
        //        print(randomArray)
    }
    
    
    
    // эта проще и работает
    func randomInt(min: Int, max:Int) -> Int {
        
        let aaa = min + Int(arc4random_uniform(UInt32(max - min + 1)))
        print(aaa)
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
        
    }        // эта проще и работает
    
    
    
    
    func anyTypeNumbers () { // генерит любые случайные числа
        //        let randomNumber = arc4random() /эта тоже работает
        let flip = arc4random_uniform(5) // 0 or 1
        print(flip)
    }
    
}

extension Int {
    static func random(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.lowerBound < 0   {
            offset = abs(range.lowerBound)
        }
        
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound + offset)
        
        return Int(min + arc4random_uniform(max - min)) - offset
    }
}

extension UIView {
    func makeShadowMain() {
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        //        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowColor = (#colorLiteral(red: 0.1639406979, green: 0.4681569338, blue: 0.6804115176, alpha: 0.5208422517)).cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
    }
}

//let random = Int.random(range: -5...10)



public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}

let modelName = UIDevice.current.modelName
