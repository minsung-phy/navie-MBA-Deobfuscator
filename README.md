한양대학교 컴퓨터학부 프로그래밍 시스템 연구실에서 진행한 프로잭트 입니다.

  과제 : 
  
  1. OCaml Dune이 무엇이고, 어떻게 쓰는지 알아오기
     
  2. batteries 라이브러리 설치 방법 + 사용 방법 알아오기
    - [https://ocaml-batteries-team.github.io](https://ocaml-batteries-team.github.io/)
     
  3. OCamlparse ocamllex가 무엇인지 알아보고 src/MBALexer.mll / src/MBALexer.mly 해석해보기
     
  4. Python으로 만들었던 naive MBA Deobfuscator를 OCaml로 만들어보기

      1. 예제 입력:
         
        ./main.native “(a+b)”
        
        위를 cli에 입력하면 “(a+b)”라는 식이 합성이 되게끔 해야한다. (여기서 main.native는 OCaml binary file (실행 파일)이다.)
    
      2. Python으로 만든 navie MBA Deobfuscaor에서는 LIA 도메인으로 하였는데, 이번에는 Bit-Vec 도메인으로 하여야 한다.
         
      3. batteries이라는 외부 라이브러리를 사용하여야 한다. 위의 과제 2번에 따라 설치 방법과 사용 방법을 공부하여야 한다. 이 라이브러리는 Map, List, String, Set 등의 라이브러리를 지원해준다. 이것을 사용하면 OCaml이 많이 좋아지고 편해질 것이다.
        
      4. “a+b”를 파싱해야하는데 OCaml에는 파이썬 ast 라이브러리 같은 것이 없다. 직접 파싱해야한다. OCaml parse OCamllex를 이용하여 파싱해보자.
