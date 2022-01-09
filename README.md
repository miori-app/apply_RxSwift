# apply_RxSwift

#RxSwift

1. Observable
    - swift 에서 제공하는 sequence와 비슷
    - sequence : 개개의 요소를 하나씩 순회할수 있는 타입
    - life cycle
    
    ```swift
    enum Event<Element> {
    	case next(Element)
    	case error(Swift.Error)
    	case completed
    }
    ```
    
    - Observer : 관찰자 (Observalbe 수신 가능)
2. Operator
    - Observable 이벤트 입력받아서, 결과로 출력해내는 연산자
    - 
    - 
3. Scheduler
    - dispatch queue라고 생각
    - 
    -
