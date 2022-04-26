//
//  AppColor.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 26/4/2565 BE.
//

import Foundation
import UIKit

enum AppColor {

    static let gray100 = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
    static let gray300 = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    static let gray350 = UIColor(red: 117.0/255.0, green: 117.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    static let gray400 = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    static let gray450 = UIColor(red: 77.0/255.0, green: 77.0/255.0, blue: 77.0/255.0, alpha: 1.0)
    static let gray600 = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)

    static let gray2C = UIColor.init(hexString: "#2C2C2C")
    static let gray21 = UIColor.init(hexString: "#212121")
    static let gray26 = UIColor.init(hexString: "#262626")

    static let gray33 = UIColor.init(hexString: "#333333")
    static let gray34 = UIColor.init(hexString: "#343434")

    static let gray42 = UIColor.init(hexString: "#424242")
    static let gray4D = UIColor.init(hexString: "#4D5153")
    static let gray51 = UIColor.init(hexString: "#515151")

    static let gray62 = UIColor.init(hexString: "#626262")
    static let gray66 = UIColor.init(hexString: "#666666")

    static let gray70 = UIColor.init(hexString: "#707070")
    static let gray73 = UIColor.init(hexString: "#737373")
    static let gray75 = UIColor.init(hexString: "#757575")

    static let grayD9 = UIColor.init(hexString: "#D9D9D9")
    static let gray9E = UIColor.init(hexString: "#9E9E9E")
    
    static let gray8C = UIColor.init(hexString: "#8C8C8C")
    static let gray99 = UIColor.init(hexString: "#999999")

    static let grayA5 = UIColor.init(hexString: "#A5A5A6")
    
    static let grayBF = UIColor.init(hexString: "#BFBFBF")
    static let grayBD = UIColor.init(hexString: "#BDBDBD")

    static let grayE1 = UIColor.init(hexString: "#E1E1E1")

    static let grayEE = UIColor.init(hexString: "#EEEEEE")
    static let grayE8 = UIColor.init(hexString: "#E8E8E8")
    
    static let grayFF = UIColor.init(hexString: "#FFFFFF")
    static let grayFA = UIColor.init(hexString: "#FAFAFA")
    static let grayF2 = UIColor.init(hexString: "#F2F2F2")
    static let grayF3 = UIColor.init(hexString: "#F3F3F4")
    static let grayF5 = UIColor.init(hexString: "#F5F5F5")

    static let grayCC = UIColor.init(hexString: "#CCCCCC")
    
    static let redF4 = UIColor.init(hexString: "#F44336")
    
    static let purple3D = UIColor.init(hexString: "#3D3260")
    static let purple6B = UIColor.init(hexString: "#6B4170")
    static let purple99 = UIColor.init(hexString: "#995080")
    static let purpleCA = UIColor.init(hexString: "#CA99BD")
    static let purpleE8 = UIColor.init(hexString: "#E8D2E3")
    static let purpleF7 = UIColor.init(hexString: "#F7F0F6")
    static let purpleF7F = UIColor.init(hexString: "#F7F8FC")
    static let purple69 = UIColor.init(hexString: "#693A94")
    static let purple94 = UIColor.init(hexString: "#9442C7")
    static let purpleC1 = UIColor.init(hexString: "#C173F4")
    static let purpleD7 = UIColor.init(hexString: "#D791FF")
    static let purpleFA = UIColor.init(hexString: "#FAF6F9")
    static let gray8C9 = UIColor.init(hexString: "#8C92A7")
    static let grayF7 = UIColor.init(hexString: "#F7F8FC")
    
    static let blue100 = UIColor.init(hexString: "E9F0F4")

    enum Button {
        static let darkGray = AppColor.gray4D
        static let gray = AppColor.gray33
    }
    
    enum CheckList {
        static let gray = AppColor.gray33
    }

    enum Text {
        static let normal = AppColor.gray26
    }

    enum Navigation {

        enum Dark {
            static let normal = AppColor.gray26
        }

        enum Light {

            static let normal = UIColor.white
        }
    }
    
    static let toggleActive: UIColor = {
        return AppColor.gray33
    }()
    
    static let toggleNormal: UIColor = {
        return AppColor.gray70
    }()
}

