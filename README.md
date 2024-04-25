# ㆔ IO3
3가지 IO 프로젝트를 수행하고 자신감을 얻으세요.

## ☯︎ What is IO3?
IO3는 Standard I/O, File I/O, Network I/O를 기반으로 한 세 가지 프로그램을 완성하여, 새로운 언어에 빠르게 적응하고 자신감을 얻을 수 있도록 고안된 구현 문제집입니다.

## ☯︎ Problems
### ⼀ Hello Porro ❀
Standard I/O를 이용한 기본적인 입출력을 연습합니다.

**요구사항**
- 프로그램이 시작되면 "이름을 입력하세요: " 를 출력하고 Standard Input으로 입력을 받습니다.
- 이름을 다음 형식으로 출력합니다. "Hello <이름>"

**입력**
```bash
이름을 입력하세요: Porro
```

**출력**
```bash
Hello Porro
```
---
### ⼆ Hello JSON ❀❀
JSON 형식의 파일을 읽어와 연산을 수행하고, JSON 형식으로 파일에 출력합니다.

**요구사항**
- 다음 형태의 JSON 파일(`in.json`)이 주어집니다.
```JSON
[
  {
    "name": "Pedro Porro",
    "age": 24,
    "position": "RWB"
  },
  {
    "name": "Destiny Udogie",
    "age": 21,
    "position": "LWB"
  }
]
```
- 프로그램이 시작되면 이 파일을 읽어와 정보를 저장합니다.
- 프로그램은 `column operator data` 형식의 쿼리를 인자로 받아 결과를 `out.json`에 출력합니다.
  - `column`은 JSON 오브젝트의 각 컬럼명을 의미합니다.
  - `opeartor`는 `=`, `>`, `<` 세 가지가 있습니다.
  - `data`는 각 컬럼에 해당하는 데이터입니다.
  - 예: `age < 22`, `name = "Pedro Porro"`

---
### ㆔ Hello HTTP ❀❀❀
Server/Client간 HTTP 통신을 구현합니다.

**요구사항**
- 서버는 `localhost:333`에 연결되어 클라이언트의 요청을 받습니다.
- 클라이언트와 서버는 HTTP 프로토콜에 따라 통신합니다.
- 서버는 다음 URI에 대한 API 요청을 처리할 수 있어야 합니다.

|Method|URI|Description|
|------|------|--------|
|GET|/player|모든 플레이어 이름을 가져옵니다.|
|POST|/player|새 플레이어를 등록합니다.|
|GET|/player/{id}|{id}에 해당하는 플레이어 이름을 가져옵니다.|
|PUT|/player/{id}|{id}에 해당하는 플레이어 이름을 바꿉니다.|
|DELETE|/player/{id}|{id}에 해당하는 플레이어를 지웁니다.|

- 클라이언트는 `method uri data` 형식의 인자를 받습니다.
  - `method`는 서버로 보낼 요청 메소드로, `get`, `post`, `put`, `delete`가 있습니다.
  - `uri`는 요청의 URI입니다.
  - `data`는 요청의 페이로드에 담길 데이터입니다.
  - 예: `get /player`, `put /player/1 "Pedro Porro"`
- 클라이언트가 서버로부터 받은 응답코드에 따라 알맞은 작업을 수행합니다.
  - `2xx`: 결과를 Standard Out에 출력합니다.
  - `3xx`: 응답 헤더에 담긴 내용에 맞게 서버로 다시 요청을 보냅니다.
  - `4xx`: 결과를 Standard Error에 출력합니다.

---
