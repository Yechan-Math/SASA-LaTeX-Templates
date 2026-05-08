%% thesis-SJ.cls  ─  세종과학예술영재학교 졸업논문 양식
%% XeLaTeX 전용
%%
%% 사용법:
%%   \documentclass{thesis-SJ}
%%
%% 메타데이터 명령 (main.tex 에서 \begin{document} 전에 선언):
%%   \title[영문제목]{국문제목}
%%   \authorA[한자]{국문이름}{영문이름}
%%   \authorB[한자]{국문이름}{영문이름}
%%   \studentAnumber{학번}
%%   \studentBnumber{학번}
%%   \advisor{국문}{영문}        ─ 지도교수
%%   \teacher{국문}{영문}        ─ 지도교사
%%   \referee[1]{이름}           ─ 심사위원
%%   \referee[2]{이름}
%%   \date{2026년 7월 7일}{July 7, 2026}   ─ 제출일
%%   \graduationyear{2027}       ─ 졸업 연도 (표지에 표시, 기본: 현재 연도)
%%   \department{수학}           ─ 학과명 (기본: 수학)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis-SJ}[2025/05/05 v2.0 SASA Graduation Thesis Class]

% ══════════════════════════════════════════════════════════════════
%  기반 클래스 및 엔진 확인
% ══════════════════════════════════════════════════════════════════

\LoadClass[10pt,a4paper]{article}

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{thesis-SJ}
    {이 클래스는 XeLaTeX 전용입니다.\MessageBreak
     xelatex 명령으로 컴파일하십시오.}{}
\fi

% ══════════════════════════════════════════════════════════════════
%  한글 지원
% ══════════════════════════════════════════════════════════════════

\RequirePackage{kotex}

% ══════════════════════════════════════════════════════════════════
%  페이지 레이아웃
% ══════════════════════════════════════════════════════════════════

\RequirePackage{geometry}
\geometry{
  paperwidth  = 210mm,  paperheight  = 297mm,
  layoutwidth = 185mm,  layoutheight = 255mm,
  textwidth   = 140mm,  textheight   = 214mm,
  inner  = 22.5mm,  outer  = 22.5mm,
  top    = 20.5mm,  bottom = 20.5mm,
  layoutvoffset = 21mm, layouthoffset = 12.5mm,
}

% ══════════════════════════════════════════════════════════════════
%  폰트 설정 (XeLaTeX 전용)
% ══════════════════════════════════════════════════════════════════

\setmainfont{Times New Roman}[
  BoldFont       = {Times New Roman Bold},
  ItalicFont     = {Times New Roman Italic},
  BoldItalicFont = {Times New Roman Bold Italic},
]
\setsansfont{TeX Gyre Heros}

% 한글 이름 자간 벌리기 (표지·서명란 전용)
\newcommand{\namespacing}{\addhangulfontfeature{InterHangul=1em}}

% ══════════════════════════════════════════════════════════════════
%  수식 패키지  (클래스 내 정리류 환경에 필요한 것만)
% ══════════════════════════════════════════════════════════════════

\RequirePackage{mathtools}   % amsmath 확장 (numberwithin 포함)
\RequirePackage{amssymb, amsthm}

% ══════════════════════════════════════════════════════════════════
%  표 패키지  (클래스 내 페이지 명령에서 tblr 환경을 사용)
% ══════════════════════════════════════════════════════════════════

\RequirePackage{tabularray}  % 모든 내부 표에 사용 (tblr 환경)

% ══════════════════════════════════════════════════════════════════
%  기타 패키지  (클래스 내부 명령에서 직접 사용하는 것만)
% ══════════════════════════════════════════════════════════════════

\RequirePackage{setspace}    % \begin{spacing}, \linespread (페이지 명령)
\RequirePackage{ifthen}      % \referee 명령의 \ifthenelse
\RequirePackage{enumerate}   % \checklistpage 체크리스트
\RequirePackage{titlesec}    % \titleformat (절 제목 서식)
\RequirePackage{tocloft}     % 그림/표 목차 서식
\RequirePackage[margin=10pt, font=small, tableposition=top]{caption}
\RequirePackage[symbol]{footmisc}  % 영문 초록 하단 Declaration 각주용
\let\footnoterule\relax            % 각주 위 가로선 제거

% ══════════════════════════════════════════════════════════════════
%  정리류 환경
% ══════════════════════════════════════════════════════════════════

\newtheorem{theorem}{정리}[section]
\newtheorem{lemma}[theorem]{보조정리}
\newtheorem{corollary}[theorem]{따름정리}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{정의}
\newtheorem{example}[theorem]{보기}
\newtheorem{xca}[theorem]{Exercise}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{참고}

\numberwithin{equation}{section}
\renewcommand*{\proofname}{\bfseries 증명}

% ══════════════════════════════════════════════════════════════════
%  메타데이터 명령
% ══════════════════════════════════════════════════════════════════

% ── 제목 ──────────────────────────────────────────────────────────
\newcommand{\@kortitle}{}
\newcommand{\@engtitle}{}
\renewcommand{\title}[2][\empty]{%
  \ifx#1\empty
    \renewcommand{\@kortitle}{#2}%
  \else
    \renewcommand{\@engtitle}{#1}%
    \renewcommand{\@kortitle}{#2}%
  \fi
}

% ── 저자 ──────────────────────────────────────────────────────────
\newcommand{\@kornameA}{}\newcommand{\@engnameA}{}\newcommand{\@hanjanameA}{}
\newcommand{\@kornameB}{}\newcommand{\@engnameB}{}\newcommand{\@hanjanameB}{}
\newcommand{\@studentAnumber}{}
\newcommand{\@studentBnumber}{}

\newcommand{\authorA}[3][\empty]{%
  \ifx#1\empty
    \renewcommand{\@kornameA}{#2}\renewcommand{\@engnameA}{#3}%
  \else
    \renewcommand{\@hanjanameA}{#1}%
    \renewcommand{\@kornameA}{#2}\renewcommand{\@engnameA}{#3}%
  \fi
}
\newcommand{\authorB}[3][\empty]{%
  \ifx#1\empty
    \renewcommand{\@kornameB}{#2}\renewcommand{\@engnameB}{#3}%
  \else
    \renewcommand{\@hanjanameB}{#1}%
    \renewcommand{\@kornameB}{#2}\renewcommand{\@engnameB}{#3}%
  \fi
}
\newcommand{\studentAnumber}[1]{\renewcommand{\@studentAnumber}{#1}}
\newcommand{\studentBnumber}[1]{\renewcommand{\@studentBnumber}{#1}}

% ── 지도교사·심사위원 ───────────────────────────────────────────────
\newcommand{\advisor}[2]{\def\@AdvisorKor{#1}\def\@AdvisorEng{#2}}
\newcommand{\teacher}[2]{\def\@TeacherKor{#1}\def\@TeacherEng{#2}}
\newcommand{\referee}[2][1]{%
  \ifthenelse{\equal{#1}{1}}{\newcommand{\@refereeChief}{#2}}{}%
  \ifthenelse{\equal{#1}{2}}{\newcommand{\@refereeSecond}{#2}}{}%
}

% ── 날짜 (제출일) ───────────────────────────────────────────────────
\renewcommand{\date}[2]{\def\@kordate{#1}\def\@engdate{#2}}

% ── 졸업 연도 (표지에 표시) ─────────────────────────────────────────
% 기본값: 현재 연도 (\the\year)
\newcommand{\@graduationyear}{\the\year}
\newcommand{\graduationyear}[1]{\renewcommand{\@graduationyear}{#1}}

% ── 학과명 ─────────────────────────────────────────────────────────
% 기본값: 수학
\newcommand{\@department}{수학}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}

% ══════════════════════════════════════════════════════════════════
%  페이지 구성 명령
% ══════════════════════════════════════════════════════════════════

% ── 표지 (1면) ────────────────────────────────────────────────────
\newcommand{\frontpage}{%
  \linespread{1.6}%
  \thispagestyle{empty}%
  \begin{center}
    {\Large 졸업논문}\par
    \vspace{3cm}
    \begin{minipage}[c][30mm][c]{\textwidth}
      \begin{center}
        {\begin{spacing}{1.4}\huge\@kortitle\end{spacing}}
      \end{center}
    \end{minipage}\par
    \begin{minipage}[c][30mm][c]{\textwidth}
      \begin{center}
        {\begin{spacing}{1.2}\fontsize{14pt}{20pt}\selectfont\@engtitle\end{spacing}}
      \end{center}
    \end{minipage}\par
    \vspace{38mm}% 영어 제목 아래 여백 (필요에 따라 조절 가능)
    \vfill
    {\Large\bfseries \@graduationyear 년}\par\vspace{1cm}
    {\Large\bfseries 세종과학예술영재학교}\par\vspace{0.7cm}
    {\Large\bfseries \@department}\par\vspace{0.7cm}
    {\Large\namespacing\@kornameA}\ \Large(\namespacing\@hanjanameA,\quad\@engnameA)\par
    {\Large\@studentAnumber}\par
    {\Large\namespacing\@kornameB}\ \Large(\namespacing\@hanjanameB,\quad\@engnameB)\par
    {\Large\@studentBnumber}\par\vspace{1cm}
  \end{center}
}

% ── 연구윤리 체크리스트 (3면) ─────────────────────────────────────
\newcommand{\checklistpage}{%
  \linespread{1.6}%
  \thispagestyle{empty}%
  \vspace{3cm}
  \begin{center}
    \begin{minipage}[c][30mm][c]{\textwidth}
      \begin{center}
        {\begin{spacing}{1.4}\huge\@kortitle\end{spacing}}
      \end{center}
    \end{minipage}\par
    \begin{minipage}[c][30mm][c]{\textwidth}
      \begin{center}
        {\begin{spacing}{1.2}\fontsize{14pt}{20pt}\selectfont\@engtitle\end{spacing}}
      \end{center}
    \end{minipage}\par
    \vfill
    {\fontsize{13pt}{13pt}\selectfont [논문제출 전 체크리스트]}\par\vspace{10pt}
    {\fontsize{11pt}{14pt}\selectfont
      \begin{enumerate}
        \item 이 논문은 내가 직접 연구하고 작성한 것이다.\hfill □
        \item 인용한 모든 자료(책∙논문∙인터넷자료 등)의 인용표시를 바르게 하였다.\hfill □
        \item 인용한 자료의 표현이나 내용을 왜곡하지 않았다.\hfill □
        \item 정확한 출처제시 없이 다른 사람의 글이나 아이디어를 가져오지 않았다.\hfill □
        \item 논문 작성 중 도표나 데이터를 조작(위조 혹은 변조)하지 않았다.\hfill □
        \item 다른 친구와 같은 내용의 논문을 제출하지 않았다.\hfill □
      \end{enumerate}%
    }%
  \end{center}
}

% ── 제출 서명 (2면) ───────────────────────────────────────────────
\newcommand{\submissionpage}{%
  \thispagestyle{empty}%
  \linespread{1.6}%
  \begin{minipage}[c][30mm][c]{\textwidth}
    \begin{center}
      {\begin{spacing}{1.4}\huge\@kortitle\end{spacing}}
    \end{center}
  \end{minipage}\par
  \begin{minipage}[c][30mm][c]{\textwidth}
    \begin{center}
      {\begin{spacing}{1.2}\fontsize{14pt}{20pt}\selectfont\@engtitle\end{spacing}}
    \end{center}
  \end{minipage}\par
  \begin{center}
    \begin{spacing}{2}
      {\Large 이 논문을 세종과학예술영재학교 졸업논문 심사를 위해 제출함}
    \end{spacing}
  \end{center}
  \vfill
  \begin{center}
    {\Large\bfseries \@kordate}\par\vspace{1cm}
    {\Large\bfseries \@department}\par\vspace{0.5cm}
    {\Large\namespacing\@kornameA}\ \Large(\namespacing\@hanjanameA,\quad\@engnameA)\par
    {\Large\@studentAnumber}\par
    {\Large\namespacing\@kornameB}\ \Large(\namespacing\@hanjanameB,\quad\@engnameB)\par
    {\Large\@studentBnumber}\par\vspace{1cm}
    \begin{minipage}{0.5\textwidth}
      \begin{tblr}{
        width   = \linewidth,
        colspec = {l X[r,m]},
        rows    = {font=\Large},
        rowsep  = 0pt,
      }
        심사위원 & \@refereeChief\enspace(인)  \\
        심사위원 & \@refereeSecond\enspace(인) \\
        지도교사 & \@TeacherKor\enspace(인)
      \end{tblr}
    \end{minipage}
  \end{center}
}

% ── 국문 초록 ─────────────────────────────────────────────────────
\newcommand{\NewAbstract}{%
  \newpage\noindent\pagestyle{plain}%
  \linespread{1.6}%
  \addcontentsline{toc}{section}{초록}%
  \begin{center}
    \large 초\quad 록
  \end{center}
  \vskip 15pt
}

% ── 영문 초록 ─────────────────────────────────────────────────────
\newcommand{\NewEnglishAbstract}{%
  \newpage\noindent\pagestyle{plain}%
  \linespread{1.2}%
  \addcontentsline{toc}{section}{Abstract}%
  \begin{center}
    \large Abstract
  \end{center}
  \footnotetext[1]{%
    A thesis submitted to the Sejong Academy of Science and Arts in partial
    fulfillment of the requirements for the graduation.
    The study was conducted in accordance with Code of Research Ethics.
    Declaration of Ethical Conduct in Research: I, as a graduate student of
    {\bfseries SASA}, hereby declare that I have not committed any acts that
    may damage the credibility of my research. These include, but are not
    limited to: falsification, thesis written by someone else, distortion of
    research findings or plagiarism. I affirm that my thesis contains honest
    conclusions based on my own careful research under the guidance of my
    thesis advisor.%
  }%
  \vskip 15pt
}

% ── 키워드 ────────────────────────────────────────────────────────
\newcommand{\KoreanKeywords}[1]{\noindent\textbf{주요어}\enspace #1}
\newcommand{\EnglishKeywords}[1]{\noindent\textbf{Keywords:} #1}

% ── 감사의 글 ─────────────────────────────────────────────────────
\newcommand{\Acknowledgement}[1]{%
  \newpage\pagestyle{empty}%
  \begin{center}\LARGE\textbf{#1}\end{center}%
  \vspace{30pt}%
}

% ── 논문 작성의 기여도 ────────────────────────────────────────────
%
%  05_contribution.tex 에서 아래 명령으로 행을 추가:
%    \contribA{연번}{논문 위치}{기여 내용}   ← 저자 A 행 추가
%    \contribB{연번}{논문 위치}{기여 내용}   ← 저자 B 행 추가
%
%  main.tex 에서:
%    \input{05_contribution}
%    \giyeopage
%
\newcommand{\@contribArows}{}
\newcommand{\@contribBrows}{}

\newcommand{\contribA}[3]{%
  \g@addto@macro\@contribArows{#1 & #2 & #3 \\}%
}
\newcommand{\contribB}[3]{%
  \g@addto@macro\@contribBrows{#1 & #2 & #3 \\}%
}

\newcommand{\giyeopage}{%
  \newpage
  \linespread{1.6}%
  \thispagestyle{empty}%
  \begin{center}
    {\Large\bfseries 논문 작성의 기여도}\par
    \vspace{0.8cm}
    % 저자 A
    \begin{minipage}[t]{\textwidth}
      $\blacktriangleright$\enspace{\large\@kornameA}\par
      \vspace{4pt}
      \begin{spacing}{1.1}
        \begin{tblr}[expand=\@contribArows]{
          width   = \linewidth,
          hlines,
          vlines,
          rowsep  = 2pt,
          colspec = {X[0.5,c,m] X[2,l,m] X[8,l,t]},
          row{1}  = {font=\footnotesize\bfseries, halign=c},
          rows    = {font=\footnotesize},
        }
          연번 & 위치 & 기여내용 \\
          \@contribArows
        \end{tblr}
      \end{spacing}
    \end{minipage}
    \vskip 20pt
    % 저자 B
    \begin{minipage}[t]{\textwidth}
      $\blacktriangleright$\enspace{\large\@kornameB}\par
      \vspace{4pt}
      \begin{spacing}{1.1}
        \begin{tblr}[expand=\@contribBrows]{
          width   = \linewidth,
          hlines,
          vlines,
          rowsep  = 2pt,
          colspec = {X[0.5,c,m] X[2,l,m] X[8,l,t]},
          row{1}  = {font=\footnotesize\bfseries, halign=c},
          rows    = {font=\footnotesize},
        }
          연번 & 위치 & 기여내용 \\
          \@contribBrows
        \end{tblr}
      \end{spacing}
    \end{minipage}
    \vspace{2cm}
    \hfill
    \begin{minipage}{0.7\textwidth}
      \Large
      \begin{tblr}{
        width   = \linewidth,
        colspec = {X[1,r,m] X[1.5,l,m]},
        rowsep  = 4pt,
      }
        \SetCell[c=2]{l} \@kordate & \\
        & \\
        {\bfseries 지도교사 확인:} & {\bfseries\@TeacherKor\enspace(인)}
      \end{tblr}
    \end{minipage}
  \end{center}
}

% ══════════════════════════════════════════════════════════════════
%  본문 시작 설정
% ══════════════════════════════════════════════════════════════════

\newcommand{\mainpartstart}{\linespread{1.6}}

% ══════════════════════════════════════════════════════════════════
%  유틸리티 명령
% ══════════════════════════════════════════════════════════════════

% 수식 속 쉼표 위치에서 줄바꿈 허용
% 사용법: $\splitatcommas{a_1, a_2, \ldots, a_n}$
\newcommand{\splitatcommas}[1]{%
  \begingroup
  \begingroup\lccode`~=`,\lowercase{\endgroup
    \edef~{\mathchar\the\mathcode`,\penalty0\noexpand\hspace{0pt plus 1em}}}%
  \mathcode`,="8000 #1%
  \endgroup}

% ══════════════════════════════════════════════════════════════════
%  절 제목 서식
% ══════════════════════════════════════════════════════════════════

\titleformat{\section}[hang]
  {\normalfont\fontsize{15}{15}\selectfont\bfseries}
  {\arabic{section}.}{1em}{}
\titleformat{\subsection}[hang]
  {\normalfont\fontsize{13}{13}\selectfont\bfseries}
  {\arabic{section}.\arabic{subsection}.}{1em}{}
\titleformat{\subsubsection}[hang]
  {\normalfont\fontsize{12}{12}\selectfont\bfseries}
  {\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}{1em}{}

% ══════════════════════════════════════════════════════════════════
%  이름 재정의
% ══════════════════════════════════════════════════════════════════

\renewcommand{\contentsname}{목\quad 차}
\renewcommand{\figurename}{그림}
\renewcommand{\tablename}{표}
\renewcommand{\listfigurename}{그\quad 림\quad 목\quad 차}
\renewcommand{\listtablename}{표\quad 목\quad 차}

% ══════════════════════════════════════════════════════════════════
%  캡션 설정
% ══════════════════════════════════════════════════════════════════

\captionsetup[figure]{%
  justification   = centering,
  font            = small,
  labelsep        = quad,
  singlelinecheck = off,
  aboveskip       = 15pt,
  belowskip       = 3pt,
  margin          = 0pt,
}
\captionsetup[table]{%
  justification   = centering,
  font            = small,
  labelsep        = quad,
  singlelinecheck = off,
  aboveskip       = 15pt,
  belowskip       = 3pt,
  margin          = 0pt,
}

% ══════════════════════════════════════════════════════════════════
%  그림/표 목차 서식
% ══════════════════════════════════════════════════════════════════

\newlength{\mylenfig}
\newlength{\mylentab}

\renewcommand{\cftfigpresnum}{\figurename\enspace}
\renewcommand{\cfttabpresnum}{\tablename\enspace}
\settowidth{\mylenfig}{\cftfigpresnum}
\settowidth{\mylentab}{\cfttabpresnum}
\addtolength{\cftfignumwidth}{\mylenfig}
\addtolength{\cfttabnumwidth}{\mylentab}
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}

% ══════════════════════════════════════════════════════════════════
%  문서 시작 시 자동 페이지 삽입 (표지 → 제출서명 → 체크리스트)
% ══════════════════════════════════════════════════════════════════

\AtBeginDocument{%
  \frontpage      \newpage   % 1면: 표지
  \submissionpage \newpage   % 2면: 제출 서명
  \checklistpage             % 3면: 연구윤리 체크리스트
}
