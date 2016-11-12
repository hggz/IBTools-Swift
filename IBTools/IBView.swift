//
//  IBView.swift
//  IBTools
//
//  Created by hugogonzalez on 11/12/16.
//  Copyright © 2016 Cat Bakery. All rights reserved.
//

import UIKit

@objc public protocol IBViewListener : NSObjectProtocol {

    
    @objc @available(iOS 2.0, *)
    optional func ibViewTouchesBegan(_ view: IBView!, touches: Set<UITouch>!, with event: UIEvent!)

    @objc @available(iOS 2.0, *)
    optional func ibViewTouchesMoved(_ view: IBView!, touches: Set<UITouch>!, with event: UIEvent!)

    @objc @available(iOS 2.0, *)
    optional func ibViewTouchesEnded(_ view: IBView!, touches: Set<UITouch>!, with event: UIEvent!)
}

@IBDesignable
open class IBView : UIView {

    open var isInterfaceBuilder = false

    open var viewListenerDelegate: IBViewListener?
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        sharedInitialization()
    }
    
    required public init? (coder: NSCoder) {
        super.init(coder: coder)
        sharedInitialization()
    }
    
    private func sharedInitialization() {
        let view = Bundle(for: type(of: self)).loadNibNamed("\(type(of: self))", owner: self, options: nil)?.first as! UIView
        self.addSubview(view)
        view.frame = bounds
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard viewListenerDelegate != nil && viewListenerDelegate!.responds(to: #selector(IBViewListener.ibViewTouchesBegan(_:touches:with:))) else {
            return
        }
        
        viewListenerDelegate!.ibViewTouchesBegan!(self, touches: touches, with: event)
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard viewListenerDelegate != nil && viewListenerDelegate!.responds(to: #selector(IBViewListener.ibViewTouchesMoved(_:touches:with:))) else {
            return
        }
        
        viewListenerDelegate!.ibViewTouchesMoved!(self, touches: touches, with: event)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard viewListenerDelegate != nil && viewListenerDelegate!.responds(to: #selector(IBViewListener.ibViewTouchesEnded(_:touches:with:))) else {
            return
        }
        
        viewListenerDelegate!.ibViewTouchesEnded!(self, touches: touches, with: event)
    }
}
