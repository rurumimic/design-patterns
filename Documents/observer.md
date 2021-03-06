# Observer pattern

- [Wikipedia: Observer pattern](https://en.wikipedia.org/wiki/Observer_pattern)
- [Pseudocode](https://refactoring.guru/design-patterns/observer#pseudocode)

## 쓰임

- 어떤 객체의 상태와 함께 다른 객체들의 상태도 변경해야 할 때
- 관리해야 할 객체 목록을 미리 알 수 없을 때, 객체 목록을 동적으로 관리하고 있을 때
- 잠시동안이나 특정한 상황에서 다른 객체를 관찰해야 할 때
  - 구독자 목록을 동적으로 관리할 수 있기 때문이다.
- GUI 설계를 할 때 자주 사용한다. MVC 아키텍처 패턴에서도 중요한 부분이다.
- 주로 분산 이벤트 핸들링 시스템에 사용한다.

## 장점

- Open-Closed Principle. Publisher의 코드를 고치지 않고 새로운 Subscriber를 추가할 수 있다.
- 런타임 때 객체들의 관계가 수립된다.

## 단점

- Subscriber에게 전달되는 알림은 순서를 알 수 없다.

## 주의

- 클래스 다이어그램 그대로 구현할 필요가 없다.
- 통보 체인: 연속적으로 발행-구독이 이어질 때, Mediator 패턴을 사용한다.
- 메모리 누수: Publisher는 객체 참조를 제때 삭제해야 한다. 약한 참조를 사용해서 방지할 수 있다.
- 나중에 언제라도 리팩토링할 수 있으니, 크기가 작을 땐 하드 코딩을 해도 된다.

## 기능 설계

### Publisher

- Subscriber 목록을 관리한다.
  - subscriber 추가와 삭제
  - 목록의 종류도 나눌 수 있다: `{ 주제종류: 구독자목록[] }`
- Subscriber 목록을 보고 알림을 보낸다.
  - 주제 종류에 따른 구독자 목록을 보고 알림을 보낸다.
- 상태 관리 방법
  - Publisher가 상태를 가진다: Client가 상태를 주입/변경한다.
    - 특정한 조건에 따라 상태 변경 알림을 보내도록 할 수도 있다.
  - Publisher가 상태를 가지지 않는다: Client가 Publisher의 알림 전달 기능을 직접 이용한다.
- 상태 전달 방법
  - Push: 알림과 함께 구독자에게 상태를 전달한다.
  - Pull: 알림을 받은 구독자는 발행자의 상태를 얻는다.
    - 예: Java의 Observable
- 구독 로직을 Composition으로 다른 객체로 분리할 수 있다. 여러 가지 Publisher 종류를 만들 수 있다.

### Subscriber

- 알림을 받았을 때 새로운 상태를 처리한다.
  - Push: 알림과 함께 전달받은 새로운 상태를 처리한다.
  - Pull: 상태가 변경되었다는 알림을 받은 후 발행자에게서 상태를 얻는다.
    - 예: Java의 Observable

### Client

- 새로운 구독자를 생성하면 발행자의 구독자 목록에 추가한다.
- 발행자의 상태를 변경하거나 발행자에게 알림 전달을 요청한다.
