//
//  ViewController.swift
//  CustomViewTest
//
//  Created by Jason on 2016. 10. 6..
//  Copyright © 2016년 genoplan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("\(scrollView.subviews.count)")
        
        for _ in 0..<1 {
            scrollAddSubView(addSubViewImageAndText())
        }
        //        scrollView.addSubview(addSubViewImageAndText())
    }
    
    func addSubViewImageAndText() -> UIView {
        let imageTextView = ImageTextView()
        imageTextView.setViewWithData(imageTextView.dummyData())
        imageTextView.setViewWithImageData(imageTextView.dummyImageData())
        print(imageTextView.frame.size)
        imageTextView.frame.size = imageTextView.returnSize()
        return imageTextView
    }
    
    func scrollAddSubView(view : UIView) {
        scrollView.addSubview(view)
        reloadScrollViewHeight()
    }
    
    func reloadScrollViewHeight() {
        let subviewCount = self.scrollView.subviews.count
        if(subviewCount > 1) {
            let firstView = self.scrollView.subviews[0]
            firstView.frame.origin.y = 0
            
            for index in 1...subviewCount - 1 {
                let childView1 = self.scrollView.subviews[index - 1]
                let childView2 = self.scrollView.subviews[index]
                
                childView2.frame.origin.y = childView1.frame.origin.y + childView1.frame.height
            }
            let lastView = self.scrollView.subviews[subviewCount - 1]
            self.scrollView.contentSize.height = lastView.frame.origin.y + lastView.frame.size.height
        }else {
            let lastView = self.scrollView.subviews[0]
            self.scrollView.contentSize.height = lastView.frame.origin.y + lastView.frame.size.height
        }
    }
}

