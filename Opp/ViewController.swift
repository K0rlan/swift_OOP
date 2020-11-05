//
//  ViewController.swift
//  Opp
//
//  Created by Korlan Omarova on 11/3/20.
//

import UIKit



protocol ProInterface {
    func setBackgroundColor() -> UIColor
    func printCurrentVCName()
}
protocol NewColors {
    func setNewColor(color: UIColor)
}
class ParentClass: UIViewController, ProInterface {
    
    
    
    
    var className: String {
            NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
        }
    func setBackgroundColor() -> UIColor {
        return .cyan
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = self.setBackgroundColor()
        self.printCurrentVCName()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
       
    }

    func printCurrentVCName() {
        print(self.className)
    }
    
}
class FirstVC: ParentClass {}
//class SecondVC: ParentClass {
//    var a: UIColor?
//    func color(color: UIColor) {
//        a = color
//    }
//    override func viewDidLoad() {
//        view.backgroundColor = a ?? setBackgroundColor()
//    }
//}
//
//class ThirdVC: ParentClass {
//    var koko: SecondVC?
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        if self.isMovingFromParent {
//            print("back was tapped")
//            koko?.color(color: .darkGray)
//
//        }
//    }
//
//
//
//}
//let second = SecondVC()
//let third = ThirdVC()
//third.koko = second
class SecondVC: ParentClass, NewColors {
    var color:UIColor!
    func setNewColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            let thirdVC: ThirdVC = segue.destination as! ThirdVC
            thirdVC.newColor = self
        }
    }
}

class ThirdVC: ParentClass {
    var newColor: NewColors?
    
    @IBAction func btn(_ sender: UIButton) {
        newColor?.setNewColor(color: .black)
                
    }
    }

    
    

