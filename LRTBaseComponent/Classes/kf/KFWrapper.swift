//
//  KFWrapper.swift
//  kf_demo
//
//  Created by 李荣潭 on 2021/11/3.
//

import UIKit

public struct KFWrapper<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol KFCompatible: AnyObject { }

public extension KFCompatible {
    var kf: KFWrapper<Self> {
        get { KFWrapper.init(self) }
        set { }
    }
}

extension UIButton: KFCompatible {
    
}
