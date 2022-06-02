//
//  TableViewController.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/19.
//

import UIKit
import Tabman
import Pageboy

class TabManViewController: TabmanViewController {

    @IBOutlet weak var tabView: UIView!
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabMan()
    }
    private func setupTabMan(){
        let firstVC = UIStoryboard.init(name: "TableView", bundle: nil).instantiateViewController(withIdentifier: "HomeTabVHomeTabViewController") as! HomeTabVHomeTabViewController
        let secondVC = SecondTabViewController()
        let thirdVC = ThirdTabViewController()
        let fourthVC = FourthTabViewController()

        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        viewControllers.append(thirdVC)
        viewControllers.append(fourthVC)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        
        //탭바 레이아웃 설정
        bar.layout.transitionStyle = .snap
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .intrinsic
        //        .fit : indicator가 버튼크기로 설정됨
        bar.layout.interButtonSpacing = view.bounds.width / 8
        
        //배경색
        bar.backgroundView.style = .clear
        bar.backgroundColor = .twitter_black
        
        //간격설정
        bar.layout.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10)
        
        //버튼 글시 커스텀
        bar.buttons.customize{ (button) in
            button.tintColor = .twitter_gray50
            button.selectedTintColor = .twitter_white
            button.font = UIFont.font(.robotoBold, ofSize: 14)
            button.selectedFont = UIFont.font(.robotoBold, ofSize: 14)
        }
        //indicator
        bar.indicator.weight = .custom(value: 3)
        bar.indicator.overscrollBehavior = .bounce
        bar.indicator.tintColor = .twitter_blue1
        
        addBar(bar, dataSource: self, at:.top)
    }
}
extension TabManViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "트윗")
        case 1:
            return TMBarItem(title: "트윗 및 답글")
        case 2:
            return TMBarItem(title: "미디어")
        case 3:
            return TMBarItem(title: "마음에 들어요")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
        }
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
