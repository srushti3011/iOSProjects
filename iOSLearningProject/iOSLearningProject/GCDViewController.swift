//
//  GCDViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 22/05/25.
//

import UIKit
import Dispatch

class GCDViewController: UIViewController {
    
    let dict: [String:String] = [
        "A" : "a"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSyncFunction(_ sender: Any) {
        DispatchQueue.global().sync {
            for i in 1...4 {
                print("Sync function \(i)")
            }
        }
        print("After the sync task")
    }
    
    @IBAction func btnAsyncFunction(_ sender: Any) {
        asyncWithConcurrentExecution()
    }
    
    func asyncWithConcurrentExecution() {
        let concurrentQueue = DispatchQueue(label: "queue1", attributes: .concurrent)

        concurrentQueue.async {
            for index in 0..<5 {
                print("White", index)
            }
        }
        concurrentQueue.async {
            for index in 0..<5 {
                print("Blue", index)
            }
        }
        print("GameOver")
    }
    
    @IBAction func btnFireMultipleAPICallsTogether(_ sender: Any) {
        let dispatchGroup = DispatchGroup()
        
        let wOne = DispatchWorkItem(flags: [.assignCurrentContext, .barrier]) {
            print("Hello")
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            AlamofireAPIService.shared.callEndpointWithoutBody(
                endPoint: EndPoint.getSingleUser(userId: 1)
            ) { (response: UserDetail?, state, error) in
                switch state {
                case .Loading:
                    print("loading user detail")
                case .Error(let message):
                    print("error \(message)")
                case .Success:
                    if let response {
                        print(response)
                    }
                    dispatchGroup.leave()
                case .Cancelled:
                    print("Cancelled")
                }
            }
        }
        
        dispatchGroup.enter()
        DispatchQueue.global().async {
            AlamofireAPIService.shared.callEndpointWithoutBody(
                endPoint: EndPoint.getSingleUser(userId: 2)
            ) { (response: UserDetail?, state, error) in
                switch state {
                case .Loading:
                    print("loading user detail")
                case .Error(let message):
                    print("error \(message)")
                case .Success:
                    print("got response but sleeping")
                    sleep(2)
                    if let response {
                        print(response)
                    }
                    dispatchGroup.leave()
                case .Cancelled:
                    print("Cancelled")
                }
            }
        }
        dispatchGroup.notify(queue: .global()) {
            print("Both the api calls are done")
        }
        print("After dispatching work done")
    }
    
    @IBAction func btnWorkItemPractice(_ sender: Any) {
        let workItemOne = DispatchWorkItem {
            print("This is workItemOne running")
            sleep(2)
        }
        let workItemTwo = DispatchWorkItem {
            print("This is workItemTwo running")
        }
        workItemOne.perform()
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: workItemOne)
        workItemOne.notify(queue: DispatchQueue.global(), execute: workItemTwo)
    }
    
    @IBAction func btnOperationQueuePractice(_ sender: Any) {
        let operationQueue = OperationQueue()
//        operationQueue.maxConcurrentOperationCount = 2
        operationQueue.addOperation {
            print("Operation One")
            sleep(3)
            print("Completing operation one")
        }
        operationQueue.addOperation {
            print("Operation Two")
            sleep(2)
            print("Completing operation two")
        }
        operationQueue.addOperation {
            print("Operation Three")
            print("Completing operation three")
        }
        
        let opFour = BlockOperation {
            print("op Four")
        }
        let opFive = BlockOperation {
            print("op Five")
        }
        operationQueue.addOperation(opFour)
        opFive.addDependency(opFour)
        operationQueue.addOperation(opFive)
    }
    
    @IBAction func btnThreadSafedictionary(_ sender: Any) {
        let dispatchQueue = DispatchQueue(label: "DictionaryOperationSubmission", attributes: .concurrent)
        let dictionary = ThreadSafeDictionary<Int, String>()
        
        let addFirstValue = DispatchWorkItem {
            dictionary.set("d", for: 4)
        }
        let addSecondValue = DispatchWorkItem {
            dictionary.set("e", for: 5)
        }
        let getKeys = DispatchWorkItem {
            print(dictionary.keys)
        }
        dispatchQueue.async(execute: addFirstValue)
        dispatchQueue.async(execute: addSecondValue)
        dispatchQueue.async(execute: getKeys)
    }
}
