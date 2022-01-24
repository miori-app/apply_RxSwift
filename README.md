# apply_RxSwift

#RxSwift

1. Observable
    - swift 에서 제공하는 sequence와 비슷 (그냥 sequence 의 정의)
        - sequence : 개개의 요소를 하나씩 순회할수 있는 타입
    - subscribe 되기전엔 아무 이벤트도 emit 안함
    - **asynchronous (비동기적)**
    - life cycle
    
    ```swift
    enum Event<Element> {
    	case next(Element) 
    	case error(Swift.Error)
    	case completed
    }
    ```
    
    - 
    - Observer : 관찰자 (Observalbe 수신 가능)
    - 일정 기간동안 계속 이벤트를 생성 (emit)
    
    ### Subscribe
    
    - operate upon the emissions and notifications from an Observable
    - 즉. observable에서 emit이나, error나 completed알림을 받기위해서 구독 필수
    
    ### Dispose
    
    - 구독 취소 느낌
    - dispose를 하지않았을 때, memory leak이 일어날 수 있음
    - disposeBag
        - disposables를 가지고 있음
        - disposables는 disposebag이  할당해제를 하려고할때마다, dispose를 호출함
2. Operator
    - Observable 이벤트 입력받아서, 결과로 출력해내는 연산자

    ### map vs flatMap
    - map : 이벤트를 변경
    - flatMap : 새로운 Observable을 생성하여 변경

3. Scheduler
    - dispatch queue라고 생각
