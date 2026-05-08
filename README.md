# SASA-MoTeXDong

세종과학예술영재학교(SASA)의 각종 문서 양식을 LaTeX으로 구현한 양식 모음입니다.  
모텍동(MoTeXDong)은 SASA의 LaTeX 활용을 목표로 하는 학생 동아리입니다.

---

## 제공하는 양식

| 양식 | 위치 | 상태 |
|------|------|------|
| 졸업논문 | `thesis/thesisSASA/` | ✅ 사용 가능 |
| R&E 보고서 | `templates/template-RnE-2024/` | 🔧 정비 중 |

---

## 졸업논문 양식 사용법

### 사전 준비

- **컴파일러**: XeLaTeX (필수)
- **참고문헌 처리**: Biber
- **필요 패키지**: kotex, tabularray, biblatex-apa, geometry, setspace, titlesec, tocloft, caption, graphicx 등
- **권장 환경**: [Overleaf](https://www.overleaf.com) (유료) 또는 로컬 TeX Live / MiKTeX

> Overleaf 무료 플랜은 컴파일 시간 제한이 있습니다.  
> 프로젝트 설정에서 컴파일러를 **XeLaTeX**, 참고문헌 처리를 **Biber**로 지정해야 합니다.

### 파일 구성

```
thesis/thesisSASA/
├── thesis-SJ.cls          클래스 파일 (양식 핵심)
├── biblatex-setting.tex   참고문헌 설정 (APA 7판, 국문/영문 분리)
├── main.tex               진입점 — 여기서 논문 정보를 입력합니다
├── body.tex               본문 내용
├── thanksto.tex           감사의 글
└── thesisbib.bib          참고문헌 데이터베이스
```

### 사용 방법

1. `thesis/thesisSASA/` 폴더 전체를 다운로드하거나 Overleaf에 업로드합니다.
2. **`main.tex`** 상단의 논문 정보 블록(`%TODO` 표시 부분)을 수정합니다.

   ```latex
   \title[English Title]{국문 논문 제목}
   \authorA[漢字]{국문이름}{Eng Name}
   \studentAnumber{학번}
   ...
   \date{2026년 O월 OO일}{Month DD, 2026}
   \graduationyear{2027}
   ```

3. **`body.tex`** 에 논문 본문을 작성합니다.
4. **`thesisbib.bib`** 에 참고문헌을 추가합니다.
5. **`thanksto.tex`** 에 감사의 글을 작성합니다.
6. 기여도 페이지는 `main.tex` 하단의 `\giyeopage{...}{...}` 안에 직접 입력합니다.

### 컴파일 순서

```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

또는 `latexmk` 사용:

```bash
latexmk -xelatex main.tex
```

### 주요 명령어

| 명령어 | 용도 |
|--------|------|
| `\parencite{key}` | 괄호 인용 — (저자, 연도) |
| `\textcite{key}` | 본문 인용 — 저자(연도) |
| `\KoreanKeywords{...}` | 국문 주요어 |
| `\EnglishKeywords{...}` | 영문 Keywords |

정리류 환경: `theorem` (정리), `lemma` (보조정리), `corollary` (따름정리),  
`definition` (정의), `example` (보기), `remark` (참고)

---

## 라이선스

이 저장소의 양식 파일은 자유롭게 사용·수정·배포할 수 있습니다.

---

## 문의 및 기여

오류 제보나 개선 제안은 [Issues](../../issues) 탭을 이용해 주세요.
