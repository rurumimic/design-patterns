# Strategy pattern
aka **policy pattern**

[Wikipedia: Strategy pattern](https://en.wikipedia.org/wiki/Strategy_pattern)

스트래티지 패턴은 행위 패턴(Behavioral pattern)이다. 
런타임 때 알고리즘을 선택할 수 있다.

[strategy](https://upload.wikimedia.org/wikipedia/commons/4/45/W3sDesign_Strategy_Design_Pattern_UML.jpg)!

Context 클래스는 직접 알고리즘을 구현하지 않는다. 대신 Strategy 인터페이스를 참조해서 알고리즘을 실행한다. Context와 독립적으로 알고리즘이 구현할 수 있다.
