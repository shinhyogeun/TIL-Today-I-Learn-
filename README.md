# TIL-Today-I-Learn-
This repository is made in order to store and review what I learned from book CleanCode.

<br>this book is writen by java but i think this book has so many truth that we have to keep in mind.</br>
<br>So i will write feelings and things i wanna write down for good programming.</br>


## 1. 의미 있는 이름

<p>의미 있는 이름을 만들어야 한다는 규칙은 프로그래밍을 배우는 시작부터 항상 듣는 이야기이다. 하지만 우리는 정작 그 중요성을 체감하지 못한다. 이번 우테코 프리코스를 하면서 좋은 코드를 짜야한다는 큰 부담감과 함께 이게 얼마나 중요한 일인지를 느껴서 cleancode를 정독하며 챕터별 정리를 하려고 한다. 의미있는 이름을 알아보자.</p>

- 의도를 분명하게 밝혀라.<br/>
  - 의도를 밝히지 않는 코드는 이해하기가 어렵다. 다음의 예시를 보자.<br/>
  <pre><code>
  {
  public List<int[]> getThem() {
    List<int[]> list1 = new ArrayList<int[]>();
    for (int[] x : theList)
      if (x[0] == 4)
        list1.add(x);
    return list1;
  }
  }</code></pre>
  여기서 이 함수가 무엇을 하는 지 이해하기 쉽지않다. 어떤 행동으 하는지는 이해할 수 있지만 왜 그런일을 하는 지 무엇을 의미! 하는지르 알 수 없다. 하지만 다음의 코드를 보자 이 코드는 지뢰찾기게임을 만드는 과정이고 게임판에서 각 칸은 단순 배열이라느 것을 생각하자.
    <pre><code>
  {
  public List<int[]> getFlaggedCells() {
    List<int[]> flaggedCells = new ArrayList<int[]>();
    for (int[] x : gameBoard)
      if (cell[STATUS_VALUE] == FLAGGED)
        flaggedCells.add(x);
    return flaggedCells;
  }
  }</code></pre>
  
3. 그릇된 정보를 피해라
4. 의미있게 구분하라
5. 인코딩을 피해라.
</p>
