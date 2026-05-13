# 졸업논문 양식 — thesisSASA

세종과학예술영재학교(SASA) 졸업논문 LaTeX 양식입니다.  
`thesis-SJ.cls` (v2.0) 커스텀 클래스 기반. XeLaTeX + biblatex(biber) 구성.

> **현재 양식 적용 범위**: 국문 논문 · 공동연구(저자 2인) 기준

---

## 사전 준비

- **컴파일러**: XeLaTeX (필수 — pdflatex/lualatex 불가)
- **참고문헌**: Biber
- **권장 환경**: 로컬 TeX Live / MiKTeX 또는 [Overleaf](https://www.overleaf.com)

> Overleaf 사용 시 프로젝트 설정 → 컴파일러: **XeLaTeX**, 참고문헌: **Biber**

---

## 파일 구성

```
thesisSASA/
├── main.tex               진입점 (수정 불필요)
├── thesis-SJ.cls          클래스 파일 (수정 불필요)
├── biblatex-setting.tex   참고문헌 설정 (수정 불필요)
│
├── 00_info.tex            ✏️ 논문 정보 (제목·저자·날짜 등)
├── 01_abstract.tex        ✏️ 국문 초록 + 영문 초록
├── 02_body.tex            ✏️ 본문
├── 03_thanksto.tex        ✏️ 감사의 글
├── 04_contribution.tex    ✏️ 기여도
├── refs.bib               ✏️ 참고문헌 데이터베이스
└── images/                그림 파일 폴더
```

학생이 편집하는 파일은 `✏️` 표시된 6개뿐입니다.

---

## 사용 방법

### 1. 논문 정보 입력 (`00_info.tex`)

```latex
\title[English Title]{국문 논문 제목}

\authorA[漢字]{국문이름}{Eng Name}
\studentAnumber{학번}
\authorB[漢字]{국문이름}{Eng Name}
\studentBnumber{학번}

\advisor{지도교수 국문}{Advisor Eng Name}
\teacher{지도교사 국문}{Teacher Eng Name}

\referee[1]{심사위원1}
\referee[2]{심사위원2}

\date{2026년 7월 7일}{July 7, 2026}
\graduationyear{2027}   % 표지 연도 (기본값: 현재 연도)
\department{수학}       % 기본값: 수학

\def\mykeywordsko{키워드1, 키워드2}
\def\mykeywords{keyword1, keyword2}
```

### 2. 초록 작성 (`01_abstract.tex`)

```latex
\long\def\AbstractKo{
  국문 초록을 여기에 입력합니다. (200~400자 내외)
}

\long\def\AbstractEn{
  Write the English abstract here. (150~300 words)
}
```

### 3. 본문 작성 (`02_body.tex`)

```latex
\section{서론}
본문 내용을 여기에 작성합니다.

\begin{theorem}\label{thm:main}
  정리 내용
\end{theorem}

\begin{proof}
  증명 내용
\end{proof}
```

사용 가능한 정리류 환경: `theorem` (정리), `lemma` (보조정리), `corollary` (따름정리),  
`definition` (정의), `example` (보기), `remark` (참고)

### 4. 기여도 작성 (`04_contribution.tex`)

```latex
\contribA{1}{2.1. 서론}{연구 배경을 조사하고 서론을 작성하였다.}
\contribA{2}{3. 본론}{핵심 정리의 증명을 담당하였다.}
\contribB{1}{2.2. 이론}{관련 선행 연구를 정리하였다.}
```

`\contribA`는 저자 A, `\contribB`는 저자 B의 기여 항목입니다.  
인수 순서: `{연번}{위치(절 번호)}{기여 내용}`

---

## 컴파일

```bash
# 전체 빌드 (참고문헌 포함)
xelatex main && biber main && xelatex main && xelatex main

# latexmk 자동 처리
latexmk -xelatex main.tex

# 보조 파일 정리
latexmk -xelatex -c
```

---

## 참고문헌 인용

| 명령어 | 출력 형식 |
|--------|-----------|
| `\parencite{key}` | (저자, 연도) |
| `\textcite{key}` | 저자(연도) |

참고문헌 형식: **APA 7판** (국문·영문 자동 분리)

---

## 향후 추가 예정

- **단독 저자 양식**: 저자가 1인일 때 사용할 수 있는 버전
- **영문 논문 양식**: 영어로 작성하는 논문을 위한 버전

---

## 그림·표 삽입

```latex
% 그림
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{images/파일명}
  \caption{그림 설명}
  \label{fig:label}
\end{figure}

% 표 (tblr 환경 권장)
\begin{table}[htbp]
  \centering
  \caption{표 설명}
  \label{tab:label}
  \begin{tblr}{colspec={lcc}, hlines, vlines}
    열1 & 열2 & 열3 \\
    ...
  \end{tblr}
\end{table}
```


---

## 라이선스

[MIT License](../../LICENSE) — 자유롭게 사용·수정·배포할 수 있습니다. 저작권 표시를 유지해 주세요.
