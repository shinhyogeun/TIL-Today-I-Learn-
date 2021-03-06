# TIL-Today-I-Learn-
This repository is made in order to store and review what I learned from book CleanCode. This book is writen by java but i think this book has so many truth that we have to keep in mind. So i will write feelings and things i wanna write down for good programming.<br />


## 1. 의미 있는 이름

<p>의미 있는 이름을 만들어야 한다는 규칙은 프로그래밍을 배우는 시작부터 항상 듣는 이야기이다. 하지만 우리는 정작 그 중요성을 체감하지 못한다. 우리는 매번 전에 자기가 만든 이해 못할 이름의 코드들을 보며 힘들어하지만 매번 새로운 코드를 작성할 때는 이름의 중요성을 또 잊어버린다. 의미있는 이름을 알아보고 앞으로는 반드시 이름을 잘 만들어 프로그래밍하는 습관을 만들어보자.</p>

- **의도를 분명하게 밝혀라.**<br/>
  - 가장 중요한 법칙이다. 의도를 밝히지 않는 코드는 이해하기가 어렵다. 다음의 예시를 보자.<br/>
  <pre><code>
  public List<int[]> getThem() {
    List<int[]> list1 = new ArrayList<int[]>();
    for (int[] x : theList)
      if (x[0] == 4)
        list1.add(x);
    return list1;
  }
  </code></pre>
  여기서 이 함수가 무엇을 하는지 이해하기 쉽지않다. 어떤 행동을 하는지는 이해할 수 있지만 왜 그런일을 하는 지 무엇을 의미하는지를 알 수 없다. 이름이 아무 의미가 없기 때문이다. 하지만 다음의 코드를 보자 이 코드는 지뢰찾기게임을 만드는 과정이고 게임판에서 각 칸은 단순 배열이라는 것을 생각하자.
    <pre><code>
  public List<int[]> getFlaggedCells() {
    List<int[]> flaggedCells = new ArrayList<int[]>();
    for (int[] x : gameBoard)
      if (cell[STATUS_VALUE] == FLAGGED)
        flaggedCells.add(x);
    return flaggedCells;
  }
    </code></pre>
  getThem 함수보다 이해가 훨씬 잘 될거라고 생각한다.
  
- **그릇된 정보를 피해라**
  - 정보를 의미있게 담으려고 노력해야한다. 이름에 type이 들어간다면 그건 잘못 만든 이름일 것이다. accountArray보다 accounts가 더 좋은 이름이다.
  
- **의미있게 구분하라**
    <pre><code>
  getActiveAccount();
  getActiveAcoounts();
  getActiveAccountInfo();
  </code></pre>
  위의 3개의 함수 이름이 어디서 구분이 될까? 너무 알기 어려우므로 좋은 이름이 아니다.
- **인코딩을 피해라.**
    - 현대에서는 필요없어진 type까지 정보로 이름에 담으려고 하지말아라 이제는 필요 없다.
 타입을 강제하는 언어에서는 이름은 오로지 정보를 잘 표현하려는 수단이다. 그것에 집중하자.
- **하나의 개념에는 하나의 단어를 사용해라.**
    - 읽는 사람은 이름이 다르면 다른 클래스이고 의도가 다르다고 생각하고 읽는다. 이름이 다른데 같은 개념이라면 하나의 이름으로 반드시 통일 시켜야한다. 예를 들자면 DeviceManager와 Protocol Controller가 근본적으로 어떻게 다를까? Manager와 Controller가 같은 것을 의도했다면 둘 중에 하나로 통일해라. 코드에 일관성을 만들자.
- **하나의 단어를 두개의 의도로 쓰지말아라.**
    - 여러 클래스에서 add라는 함수가 두가지 인자를 가지고 더해서 하나의 return값을 반환하는 함수로 많이 사용하고 있다고 하자. 갑자기 새로운 class에서 add를 이것과 다른 구조로 사용하려고 절대 하지말아라.
            다른 사람들은 add는 두가지 인자를 가지고 더해서 하나의  return값을 반환하는 것을 알고 사용한다.
- **맥락을 바꾸어 더 명확하게 해라.**
<pre><code>
      private void printGuessStatistics(char candidate, int count) {
      String number;
      String verb;
      String pluralModifier;
      
      if (count==0) {
            number = "no";
            verb = "are";
            pluralModifier = "s";
      } else if (count == 1){
            number = "1";
            verb = "is";
            pluralModifier = "";
      } else {
            number = Integer.toString(count);
            verb = "are";
            pluralModifier = "s";
      }
      
      String guessMessage = String.format (
      "There %s %s %s%s", verb, number, candidate, pluralModifier
      );
}
</code></pre>
위의 코드에서  number와 verb, pluralModifier를 보면 우리는 3가지 변수가 guessMessage에 사용된다는 것을 알 수 있다. 이를 맥락적으로 더 이해하기 쉽게 만들려면 다음처럼 GuessStatisticsMessage class를 별도로 만드는 것이 더 좋다.
<pre><code>
    public class GuessStatisticsMessage {
    private String number;
    private  String verb;
    private String pluralModifier;
    
    public String make(char candidate int count) {
        createPluralDependentMessageParts(count);
        return String.format(
        "There %s %s %s%s",
        verb, number, candidate, pluralModifier );
    }
    
    private void createPluralDependentMessageParts(int count) {
        if (count == 0) {
        thereAreNoLetters();
        } else if (count == 1) {
        thereIsOneLetter();
        } else{
        thereAreManyLetters(count);
        }
    }
    
    private void thereAreManyLetters(int count) {
        number = Integer.toString(count);
        verb = "are";
        pluralModifier = "s";
    }
    
    private void thereIsOneLetter() {
        number = 1;
        verb = "is";
        pluralModifier = "";
    }
    
    private void thereAreNoLetters() {
        number = "no";
        verb = "are";
        pluralModifier = "s";
    }
}
</code></pre>
- **불필요한 맥락은 없애라.**
    - 모든 class 앞에 당신이 만드는 특별한 어플리케이션의 약자를 넣을 필요가 없다. 넣어서 얻는 이점이 무엇인가? 또한 class를 만들 때  상하 맥락도 잘 생각해야한다. AccountAddress와 CustomerAddress라는 class를 만들기 보다 Address class의 인스턴스로 만드는 것이 더 맥락에 적당하다. 
</p>

## 2. 함수를 잘 만들자.
- **작게 만들어라**<br/>
    - 이게 전부다. 함수는 하나의 일만을 해야한다. 이것만 지킨다면 꽤 괜찮은 프로그래머가 될 수 있다. 하지만 대부분의 프로그래머가 이것을 지키지 않는다. 또한 이것은 결국 프로그래밍을 쉽게 만들어주는 중요한 습관이다. 함수는 반드시 하나의 일만을 해야한다. 그렇게 만들기 위해서는 또한 함수는 작게 만들어야한다. **함수는 하나의 일만 하게 하라 그렇지만 그 일을 잘하게 하라** 이것을 명심해라. 함수는 작게 만들고 1개의 일만을 해야한다. 언제나 기억해야할 프로그래밍의 가장 중요한 덕목이다.
    
    - 그렇다면 하나의 일을 한다는 것은 무엇인가? 그것은 추상화의 정도가 한단계로 이루어져야 한다는 것이다. for문으로 이루어진 행동을 당신이 1개의 함수로 만들어서 이름을 부여하면 그것은  추상화가 1단계 진행된 것이다. 물론 추상화는 우리가 함수를 이용하는 이유이다. 함수를 이용해 어떠한 행동을 추상화하지 않는가? 그렇다. 그렇지만 만약 함수안에서 추상화가 2번 진행될 여지가 보인다면 그것은 함수가 여러 일을 하는 것이다. 따라서 함수를 보고 추상화의 관점에서 더 쪼게 질 수 있는 확인해보는 것 이것이 우리가 가져야할 중요한 습관이다.
- **함수의 인수는 가능한 적게 만들어라**<br/>
    - 가장 이상적인 함수의 인수갯수는 0개이다. 가장 이해하기 쉬우니 그렇다. 4개 이상은 특별한 이유가 있더라도 사용하지 말아라. 단항인수를 가지는 함수는 또한 여러 case가 있다. 첫번째로는 질문을 던지는 경우, 두번째로는 변환의 경우이다. 또한 이항인수를 가지는 함수는 좌표를 만드는 함수같은 경우에는 꼭 필요하다. 하지만 필요하지 않을 수 있는 경우를 항상 의심하고 언제나 가장 효율적으로 줄여야 한다.
