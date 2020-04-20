//
//  ViewController.swift
//  SelectCar
//
//  Created by 이성근 on 12/02/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let carCompany = ["Tesla", "Lambo", "Porsche"]
    var carModel : [String] = []
    var carModelImage : [String] = []

    let tesla = ["Model S", "Model X"]
    let lambo = ["aventador", "veneno", "huracan"]
    let porsche = ["911","boxter"]

    let teslaImgName = ["tesla-model-s","tesla-model-x"]
    let lamboImgNmae = ["lamborghini-aventador","lamborghini-huracan","lamborghini-veneno"]
    let porscheImgName = ["porsche-911","porsche-boxter"]

    @IBOutlet weak var carImgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        carModel = tesla
        carModelImage = teslaImgName
        carImgView.image = UIImage(named: teslaImgName[0])

        carImgView.layer.cornerRadius = 50.0
        carImgView.layer.masksToBounds = true
    }
}

extension ViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 컴포넌트는 첫번째칸 두번째칸 그걸 의미한다.
        switch component {
        case 0:
            return carCompany[row]
        case 1:
            return carModel[row]
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch component {
        case 0:
            pickerView.selectRow(0, inComponent: 1, animated: true)
            switch row {
            case 0:
                carModel = tesla
                carModelImage = teslaImgName
            case 1:
                carModel = lambo
                carModelImage = lamboImgNmae
            case 2:
                carModel = porsche
                carModelImage = porscheImgName
            default:
            print("")
            }
        default:
            print("")
        }

        pickerView.reloadAllComponents()
        // 선택한 로우 값
        let myRow = pickerView.selectedRow(inComponent: 1)
        print(myRow)
        guard myRow >= 0 else {
            print("err")
            return
        }

        carImgView.image = UIImage(named: carModelImage[pickerView.selectedRow(inComponent: 1)])
        }
}

extension ViewController : UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return carCompany.count
        case 1:
            return carModel.count
        default:
            return 0
        }
    }
}
