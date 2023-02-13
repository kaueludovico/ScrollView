//
//  ViewController.swift
//  PFM-iOS
//
//  Created by Kaue Ludovico on 09/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    private let subView1: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.backgroundColor = UIColor.blue
        return view
    }()
    private let subview2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        view.backgroundColor = UIColor.cyan
        return view
    }()
    private let subview3: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupScrollView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        
        scrollView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
            size: .init(width: view.bounds.size.width, height: view.bounds.size.height))
        
        scrollStackViewContainer.anchor(
            top: scrollView.topAnchor,
            leading: scrollView.leadingAnchor,
            bottom: scrollView.bottomAnchor,
            trailing: scrollView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        configureContainerView()
    }
    
    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(subView1)
        scrollStackViewContainer.addArrangedSubview(subview2)
        scrollStackViewContainer.addArrangedSubview(subview3)
    }
}

import UIKit

extension UIView {
    func sizeItems(size: CGSize = .zero) {
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    func centerAnchor(x: NSLayoutXAxisAnchor?, y: NSLayoutYAxisAnchor?) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if x != nil {
            centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }
        
        if y != nil {
            centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
        
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


