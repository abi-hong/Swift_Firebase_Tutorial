//
//  NotificationVC.swift
//  FirebaseLogin
//
//  Created by 홍희수 on 2022/03/23.
//

import UIKit
import UserNotifications

class NotificationVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 1. 유저에게 알림허락 받기
        // requestAuthorization -> 권한을 요청하는 함수
        // completionHandler의 원형 : completionHandler: (Bool, Error?) -> Void
        // completionHandler에는 유저가 이 권한을 허락했는지 안 했는지 상황을 나눠줄 수 있다!
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
            print(didAllow)
        })
    }
    
    // MARK: - 2. 어떨때 알림을 받고 싶은지 설정
    @IBAction func buttonPress(_ sender: Any) {

            // MARK: - 3. push알림 메세지를 설정
            // iOS에는 이 컨텐츠를 지정할 수 있도록 도와주는 클래스가 있다! -> UNMutableNotificationContent
            let content = UNMutableNotificationContent()
            
            content.title = "This is title : Heesoo"
            content.subtitle = "This is subtitle : UserNotifications tutorial"
            content.body = "This is Body: 블로그 글쓰기"
            content.badge = 1 // 앱 아이콘 오른쪽 상단에 알림 표시가 되게 만드는 것!
            
            // MARK: - 4. 알람 트리거 지정
            // 알람 트리거란 언제 push알림을 작동할건지?
            // Trigger Method2 : Use UNCalendarNotificationTrigger
            //let date = Date(timeIntervalSinceNow: 70)
            //let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            //let calendartrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
             
            // Trigger Method1 : Use TimeIntervalNotificationTrigger
            let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            
            // MARK: - 5. 알림 요청을 하자!
            // 알림요청은 UNNotificationRequest 클래스를 이용!
            // 이 클래스는 위에서 만든 content와 trigger를 넘겨준다.
            // 이때, 알림의 고유 identifier(식별자)도 함께 넘겨줘야한다!!
            // identifier가 다 달라야만 Notification Grouping이 된다!
            let request = UNNotificationRequest(identifier: "test", content: content, trigger: TimeIntervalTrigger)
            
            // MARK: - 6. 5번에서 했던 요청을 알림센터에 추가!
            // UNNotificationRequest는 UNUserNotificationCenter를 사용하여 "예약" 가능!
            // UNUserNotificationCenter는 들어온 알림요청들을 처리해줌!
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
