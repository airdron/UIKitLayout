//
//  ViewController.swift
//  UIKitLayout
//
//  Created by Andrey Oparin on 26.03.2021.
//

import UIKit

class RootView: UIView {
    
    private let childOfRootView = ChildOfRootView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        addSubview(childOfRootView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        childOfRootView.frame = bounds
        print(#function + " " + String(describing: self) + "\n")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ChildOfRootView: UIView {
    
    private let childOfChildOfRootView = ChildOfChildOfRootView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(childOfChildOfRootView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        childOfChildOfRootView.frame = bounds
        print(#function + " " + String(describing: self) + "\n")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ChildOfChildOfRootView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function + " " + String(describing: self) + "\n")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    override func loadView() {
        view = RootView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function + "\n")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function + "\n")
    }
}

