//
//  ImageTextView.swift
//  CustomViewTest
//
//  Created by Jason on 2016. 10. 6..
//  Copyright © 2016년 genoplan. All rights reserved.
//

import UIKit
class ImageTextView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var view : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    
    func xibSetup() {
        
        view = loadViewFromNib()
        view.frame = bounds
        
        addSubview(view)
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ImageTextView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        
        return view
    }
    
    func setViewWithData(data: String) {
        label.text = data
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0;
        label.sizeToFit()
    }
    
    func setViewWithImageData(data : UIImage) {
        imageView.image = data
    }
    
    func dummyImageData() -> UIImage {
        return UIImage(named: "001.ppg")!
    }
    
    func dummyData() -> String {
        return  "【서울=뉴시스】 강진아 기자 = 한국전력공사(한전)가 42년간 시행해온 주택용 전기요금 누진제는 유효하다는 법원의 첫 판결이 나왔다.\n 지난 2014년 8월 소송이 제기된 지 2년2개월만이다. 이번 판결은 전국에 흩어져 있는 9건의 누진제 재판에도 영향을 미칠 것으로 예상된다. \n 서울중앙지법 민사98단독 정우석 판사는 6일 정모씨 등 17명이 한전을 상대로 낸 전기요금 부당이득 반환 청구 소송에서 원고 패소 판결했다.약관규제법상 무효 아냐..효율적 자원 배분 위해 누진요금 가능 요금정책, 사회상황 반영해 다양 시민들 상급심 판단 받겠다"
    }
    
    func returnSize() -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height + imageView.frame.height + label.frame.height)
    }
    
}
