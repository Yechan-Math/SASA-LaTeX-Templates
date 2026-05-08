# 수학 학습지 양식

SASA 수학 수업에서 사용하는 학습지 LaTeX 양식 모음입니다.

---

## 제공하는 학습지

| 파일 | 내용 |
|------|------|
| `SASA_Koch_Snow_workbook.tex` | 코흐 눈송이 헤드룰 학습지 |

---

## SASA_Koch_Snow_workbook

머리글 구분선을 코흐 눈송이 곡선으로 장식한 학습지 양식입니다.  
페이지가 넘어갈수록 눈송이 곡선이 한 단계씩 세밀해지며, 5페이지부터는 동일한 모양으로 유지됩니다.

### 사용 방법

파일 상단의 두 줄만 수정하면 됩니다.

```latex
\newcommand{\mytitle}{학습지 제목}   % 학습지 제목
\author{저자 이름}                   % 작성자
```

머리글에는 제목, 학번 입력란, 이름 입력란이 자동으로 배치됩니다.

### 컴파일

```bash
xelatex SASA_Koch_Snow_workbook.tex
```

### 사용 환경

- **컴파일러**: XeLaTeX
- **필요 패키지**: oblivoir, mathtools, fapapersize, fancyhdr, tikz (`decorations.fractals` 라이브러리)
- **용지**: B5 (dbl4x6), 좌우 여백 1인치
