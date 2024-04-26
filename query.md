## `query`
난이도 🔥🔥

JSON 형식의 파일을 읽어와 쿼리를 수행하고, JSON 형식으로 파일에 출력합니다.

### 💡배경지식
- JSON

### ❗️요구사항
JSON 형식의 데이터베이스 파일에서 조건에 맞는 정보를 찾아 출력하는 `query`를 만듭니다.
- 다음 형태의 JSON 파일(`bird.json`)이 주어집니다.
```JSON
[
  {
    "name": "penguin",
    "age": 4,
    "living_place": "antarctic"
  },
  {
    "name": "blue bird",
    "age": 2,
    "living_place": "yokohama"
  },
  {
    "name": "chicka",
    "age": 1,
    "living_place": "barn"
  }
]
```
- 프로그램이 시작되면 이 파일을 읽어와 정보를 저장합니다.
- 프로그램은 `<column> <operator> <data>` 형식의 쿼리를 인자로 받아 결과를 `out.json`에 출력합니다.
  - `<column>`은 JSON 오브젝트의 각 컬럼명을 의미합니다.
  - `<opeartor>`는 `=`, `>`, `<` 세 가지가 있습니다.
  - `<data>`는 각 컬럼에 해당하는 데이터입니다.
  - 예: `age < 22`, `name = "Pedro Porro"`

### 📝 예시
```bash
$ query name = "blue bird"
```
**out.json**
```json
{
  "count": 1,
  "result": [
    {
      "name": "blue bird",
      "age": 4,
      "living_place": "yokohama"
    }
  ]
}
```
---

