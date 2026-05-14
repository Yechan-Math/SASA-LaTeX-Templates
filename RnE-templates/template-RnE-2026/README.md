# SASA R&E 보고서 양식 (2026)

세종과학예술영재학교 R&E 보고서 LaTeX 양식입니다.

> **현재 양식 적용 범위**: 국문 보고서 · 공동연구(저자 2인) 기준

---

## 두 가지 양식

이 템플릿에는 **로컬용 전체 양식**과 **Overleaf용 간소화 양식** 두 가지가 있습니다.

| | 로컬용 전체 양식 | Overleaf용 간소화 양식 |
|---|---|---|
| 진입점 | `main.tex` | `main_body.tex` |
| 스타일 | `rne-style.tex` | `rne-body-style.tex` |
| 포함 내용 | 요약표 + 본문 + 별첨 | 본문(제목~참고문헌)만 |
| 권장 환경 | 로컬 TeX (latexmk) | Overleaf 무료 플랜 |

> **권장 워크플로**: Overleaf에서 `main_body.tex`로 본문을 작성하고, 최종 제출 직전에 로컬에서 `main.tex`으로 전체 양식을 완성합니다.

---

## 파일 구성

### 학생이 편집하는 파일

| 파일 | 역할 | 전체 양식 | 간소화 양식 |
|------|------|:---------:|:-----------:|
| `00_info.tex` | 논문 제목·저자·날짜 등 기본 정보 | ✓ | ✓ |
| `01_abstract.tex` | 국문 초록 | ✓ | ✓ |
| `02_body.tex` | 본문 | ✓ | ✓ |
| `03_summaries.tex` | 1·2페이지 요약문 표 내용 | ✓ | — |
| `refs.bib` | 참고문헌 데이터베이스 | ✓ | ✓ |

### 수정하지 않는 파일

| 파일 | 역할 |
|------|------|
| `main.tex` | 전체 양식 골격 |
| `main_body.tex` | 간소화 양식 골격 (Overleaf용) |
| `rne-style.tex` | 전체 양식 패키지·레이아웃 설정 |
| `rne-body-style.tex` | 간소화 양식 패키지 설정 |
| `biblatex-setting.tex` | 참고문헌 형식 설정 |
| `04_appendices.tex` | 연구윤리·지도 체크리스트 (전체 양식 전용) |

---

## 문서 구성 (전체 양식 기준)

| 페이지 | 내용 | 편집 위치 |
|--------|------|-----------|
| 1 | 연구결과 요약문 표 | `03_summaries.tex` |
| 2 | 과제 수행 과정 표 | `03_summaries.tex` |
| 3 | 논문 제목·저자 | `00_info.tex` |
| 4~ | 국문 초록·본문·참고문헌 | `01_abstract.tex`, `02_body.tex`, `refs.bib` |
| 별첨 | 연구윤리·지도 체크리스트 | `00_info.tex` (날짜·이름 자동 반영) |

---

## 시작하는 방법

**1단계** — `00_info.tex`에서 논문 정보를 입력합니다.

```latex
\def\mytitleko{우리말 제목}
\def\mytitle{English Title}
\def\myauthorfirstko{홍길동1}
\def\myauthorsecondko{홍길동2}
\def\mydate{2026년\quad 11월\quad OO일}
\def\myadvisor{지도교사 이름}
% ...
```

**2단계** — `02_body.tex`에 본문을 작성하고, `refs.bib`에 참고문헌을 추가합니다.

**3단계** (전체 양식만) — `03_summaries.tex`에서 요약문 표 내용을 채웁니다.

```latex
\newcommand{\summaryGoal}{
  % 여기에 연구 필요성 및 목적을 씁니다
}
```

---

## 컴파일 방법

**XeLaTeX + Biber** 가 필요합니다.

```bash
# latexmk로 자동 처리 (권장)
latexmk -xelatex main.tex        # 전체 양식
latexmk -xelatex main_body.tex   # 간소화 양식

# 수동 컴파일
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

**Overleaf** 사용 시: 설정 → 컴파일러를 **XeLaTeX**, 참고문헌을 **Biber**, Main document를 **main_body.tex**로 지정하세요.

---

## TikZ 사용

기본 설정에서는 TikZ를 로드하지 않습니다. TikZ 그림이 필요한 경우 진입점 파일(`main.tex` 또는 `main_body.tex`)에서 주석을 해제하세요.

```latex
% \usepackage{tikz}  ← 이 줄의 주석을 해제
```

---

## 향후 추가 예정

- **단독 저자 양식**: 저자가 1인일 때 사용할 수 있는 버전
- **영문 보고서 양식**: 영어로 작성하는 보고서를 위한 버전

---

## 라이선스

[MIT License](../../LICENSE)
