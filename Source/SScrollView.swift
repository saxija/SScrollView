//
//  SScrollView.swift

//
//  Created by Sakule Nagy on 01/01/2024.
//

import UIKit

public class SScrollView: UIScrollView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        keyboardDismissMode = .interactive
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
