//
//  ViewController.swift
//  ChatApp
//
//  Created by 정명곤 on 2022/03/16.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.delegate = self
            chatTableView.dataSource = self
            
            //  구분선 삭제
            chatTableView.separatorStyle = .none
        }
    }
    
    var chatDatas = [String]()
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }
    
    
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //  사용하려는 셀을 등록해야 사용할 수 있다.
        chatTableView.register(UINib(nibName: "MyCellTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        chatTableView.register(UINib(nibName: "YourCellTableViewCell", bundle: nil), forCellReuseIdentifier: "yourCell")
        
        //  키보드 관련 옵저버 설정을 해야 함 - 상태를 알려주는 것
        //  키보드 올라올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //  키보드 내려올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        
        //  키보드 관련 정보 가져오기 -> 기본적으로 딕셔너리 타입
        let notiInfo = noti.userInfo!
        //  기본적으로 정해져있는 키값으로 정보 가져오기
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        //  정해진 키보드의 높이를 가져옴
        let height = keyboardFrame.size.height
        //  키보드 애니메이션 duration 가져오기
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        inputViewBottomMargin.constant = height - self.view.safeAreaInsets.bottom
        
        
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        
        let notiInfo = noti.userInfo!
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            
            //  갱신 코드 반드시 필요
            self.view.layoutIfNeeded()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCellTableViewCell
            
            myCell.myTextView.text = chatDatas[indexPath.row]
            myCell.selectionStyle = .none
            
            return myCell
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as! YourCellTableViewCell
            
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            yourCell.selectionStyle = .none
            
            return yourCell
        }
        
    }
    
    
    
    @IBAction func sendString(_ sender: Any) {
        
        chatDatas.append(inputTextView.text)
        
        inputTextView.text = ""
        //  3개의 데이터가 있는 array일 경우
        //  array.count = 3
        //  array row -> count - 1
        
        let lastIndexPath = IndexPath(row: chatDatas.count - 1, section: 0)
        
        //  갱신 코드 필요
        //        chatTableView.reloadData() -> 뷰 튀는 문제 발생함
        //  추가할 row만 리로드
        chatTableView.insertRows(at: [lastIndexPath], with: .automatic)
        
        inputTextViewHeight.constant = 35
        
        //  원하는 index위치로 가는 코드
        chatTableView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.contentSize.height <= 35 {
            inputTextViewHeight.constant = 35
        } else if textView.contentSize.height >= 100 {
            inputTextViewHeight.constant = 100
        } else {
            inputTextViewHeight.constant = textView.contentSize.height
        }
        
    }


}

