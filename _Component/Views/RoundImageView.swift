//
//  RoundImageView.swift
//  SwiftProject
//
//  Created by 王云鹏 on 16/3/7.
//  Copyright © 2016年 王涛. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addCover()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addCover()
    }
    
    init (){
        super.init(frame:CGRectZero)
        addCover()
    }
    
    func addCover(){
        let imageView = UIImageView()
        //FIXME:图片有点不合适咯
        imageView.image = UIImage(named: "roundCoverer")
        self.addSubview(imageView)
        imageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
}
