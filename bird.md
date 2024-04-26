## `bird`
난이도: 🔥🔥🔥

Server-Client HTTP 통신을 구현합니다.

### 💡사전지식
- HTTP
- RESTful API

### ❗️요구사항
이 프로젝트에서는 데몬 프로세스인 `bird_server`와 CLI `bird_client`를 각각 구현해야 합니다.

**`bird_server`**
- 서버는 `localhost:333`에 연결되어 지속적으로 클라이언트의 요청을 받습니다.
- 클라이언트로부터 HTTP 요청을 받아 처리 후 응답을 보냅니다. 
- 만약 잘못된 요청을 받거나 요청 처리 과정에서 오류가 발생하면  `4xx` 또는 `5xx` 응답코드와 함께 알맞은 에러 메세지를 보내야 합니다. 
- 서버는 다음 API 요청을 처리할 수 있어야 합니다.

|Method|URI|Description|Response|
|------|------|--------|--------|
|GET|/bird|모든 새 이름을 가져옵니다.|
|POST|/bird|새 이름을 등록합니다.|`/bird/{id}`로 리다이렉트|
|GET|/bird/{id}|{id}에 해당하는 새 이름을 가져옵니다.|
|PUT|/bird/{id}|{id}에 해당하는 새 이름을 바꿉니다.|`/bird/{id}`로 리다이렉트|
|DELETE|/bird/{id}|{id}에 해당하는 새를 지웁니다.|`/bird`로 리다이렉트|

**`bird_client`**
- 클라이언트는 `<method> <uri> <data>` 형식의 인자를 받습니다.
  - `<method>`는 서버로 보낼 요청 메소드로, `get`, `post`, `put`, `delete`가 있습니다.
  - `<uri>`는 요청의 URI입니다.
  - `<data>`는 요청의 페이로드에 담길 데이터입니다.
  - 예: `get /player`, `put /player/1 "Blue Bird"`
- 입력받은 파라미터를 바탕으로 서버에 요청을 보냅니다. 그리고 서버로부터 받은 응답코드에 따라 알맞은 작업을 수행합니다.
  - `2xx`: 결과를 Standard Out에 출력합니다.
  - `3xx`: 응답 헤더에 담긴 내용에 맞게 서버로 다시 요청을 보냅니다.
  - `4xx`, `5xx`: 결과를 Standard Error에 출력합니다.

---

### 📝예시
```bash
$ bird_server &                         # run as daemon
$
$ bird_client post /bird penguin
1 - penguin
$
$ bird_client post /bird "blue bird"
2 - blue bird
$
$ bird_client get /bird
penguin, blue bird
$
$ bird_client put /bird/1 chicka
1 - chicka
$
$ bird_client get /bird
chicka, blue bird
```
