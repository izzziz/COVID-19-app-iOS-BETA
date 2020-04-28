//
//  LogoStrapline.swift
//  Sonar
//
//  Copyright © 2020 NHSX. All rights reserved.
//

import UIKit

@IBDesignable
class LogoStrapline: UIView {
    
    @IBOutlet private var titleLabel: UILabel!
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 64.0)
    }
    
    static var nibName: String {
        String(describing: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else {
            return
        }
        
        view.backgroundColor = UIColor(named: "NHS Blue")
        titleLabel.text = "COVID-19"

        addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        let element = UIAccessibilityElement(accessibilityContainer: self)
        element.accessibilityLabel = "NHS Coronavirus tracing"
        element.accessibilityFrameInContainerSpace = frame
        accessibilityElements = [element]
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: LogoStrapline.nibName, bundle: Bundle(for: LogoStrapline.self))
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
