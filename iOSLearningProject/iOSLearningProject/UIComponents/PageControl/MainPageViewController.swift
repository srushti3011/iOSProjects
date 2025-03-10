//
//  MainPageViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 27/02/25.
//

import UIKit

class MainPageViewController: UIPageViewController {

    lazy var orderedViewControllers: [UIViewController] = [viewControllerWith(name: "ViewControllerA"), viewControllerWith(name: "ViewControllerB")]
    var isLoading: Bool = false
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (!isLoading) {
            isLoading = true
            setupControllers()
        }
    }

//    MARK: - FUNCTIONS
    func viewControllerWith(name: String) -> UIViewController {
        return UIStoryboard(name: "PageControl", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func setupControllers() {
        currentIndex = 0
        let firstViewController = orderedViewControllers[currentIndex]
        setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension MainPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllerCount = orderedViewControllers.count
        
        guard orderedViewControllerCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllerCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let firstController = viewControllers?.first, let index = orderedViewControllers.firstIndex(of: firstController) {
            print(index)
        }
    }
    
}
