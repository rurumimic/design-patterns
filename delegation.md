# Delegation pattern

[Wikipedia: Delegation pattern](https://en.wikipedia.org/wiki/Delegation_pattern)

델리게이션 패턴은 객체 컴포지션([Object composition](https://en.wikipedia.org/wiki/Object_composition): 객체나 데이터 타입들을 조합하는 방법.)을 사용해서 상속을 통해 코드를 재사용한다.

객체는 the delegate라는 두번째 객체를 위임받아 요청을 처리한다. 델리게이트는 helper object다.

한 클래스에서 필요한 기능을 delegate의 함수에 위임하여 구현할 수 있다.

구현 클래스는 프로토콜에 따라 메소드를 구현한다.
