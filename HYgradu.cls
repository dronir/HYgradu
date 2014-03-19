%%
%% This is file `HYgradu.cls'
%%
%% Based heavily on tktltiki v1.1, and the thesis LaTeX files of
%% the Uni Helsinki Dept. of Physics and former Dept. of Astronomy.
%%
%%% This work may be distributed and/or modified under the
  % conditions of the LaTeX Project Public License, either version 1.3
  % of this license or (at your option) any later version.
  % The latest version of this license is in
  %   http://www.latex-project.org/lppl.txt
  % and version 1.3 or later is part of all distributions of LaTeX
  % version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{HYgradu}
  [2010/10/01 v1.1 Dokumenttiluokka gradua varten TktlTiKi v1.1:n pohjalta]
\newif\if@finnish
\newif\if@swedish
\newif\if@english
\newif\if@emptyfirstpagenumber

\DeclareOption{finnish}{\@finnishtrue}
\DeclareOption{swedish}{\@swedishtrue}
\DeclareOption{english}{\@englishtrue}
\DeclareOption{emptyfirstpagenumber}{\@emptyfirstpagenumbertrue}
\newif\if@defaulttypesize
\@defaulttypesizetrue
\newif\if@defaultpaper
\@defaultpapertrue
\newif\if@defaulttitlepage
\@defaulttitlepagetrue

\DeclareOption{10pt}{
  \@defaulttypesizefalse
  \PassOptionsToClass{10pt}{report}}
\DeclareOption{11pt}{
  \@defaulttypesizefalse
  \PassOptionsToClass{11pt}{report}}

\DeclareOption{a5paper}{
  \@defaultpaperfalse
  \PassOptionsToClass{a5paper}{report}}
\DeclareOption{b5paper}{
  \@defaultpaperfalse
  \PassOptionsToClass{b5paper}{report}}
\DeclareOption{letterpaper}{
  \@defaultpaperfalse
  \PassOptionsToClass{letterpaper}{report}}
\DeclareOption{legalpaper}{
  \@defaultpaperfalse
  \PassOptionsToClass{legalpaper}{report}}
\DeclareOption{executivepaper}{
  \@defaultpaperfalse
  \PassOptionsToClass{executivepaper}{report}}

\DeclareOption{notitlepage}{
  \@defaulttitlepagefalse
  \PassOptionsToClass{notitlepage}{report}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\if@defaulttypesize
  \PassOptionsToClass{12pt}{report}
\fi
\if@defaultpaper
  \PassOptionsToClass{a4paper}{report}
\fi
\if@defaulttitlepage
  \PassOptionsToClass{titlepage}{report}
\fi
\ProcessOptions\relax
\LoadClass{report}[2000/05/19]
\RequirePackage{latexsym}[1998/08/17 v2.2e Standard LaTeX package (lasy symbols)]
%\RequirePackage[latin9]{inputenc}[2000/07/01 v0.996 Input encoding file ]
\RequirePackage[T1]{fontenc}[2000/08/30 v1.91 Standard LaTeX package]
\if@finnish
  \RequirePackage[finnish]{babel}[2001/03/01 v3.7h The Babel package]
\else
  \if@english
    \RequirePackage[english]{babel}[2001/03/01 v3.7h The Babel package]
  \else
    \if@swedish
      \RequirePackage[swedish]{babel}[2001/03/01 v3.7h The Babel package]
    \else
      \RequirePackage[finnish]{babel}[2001/03/01 v3.7h The Babel package]
    \fi
  \fi
\fi
\RequirePackage{geometry}[1999/10/07 v2.2 Page Geometry]
\newcommand{\defaultsettings}{%
  \if@twoside
    \geometry{top=2.5cm, left=3.5cm, right=2.5cm,
              textwidth=15cm, textheight=23cm,
              headheight=0.5cm, headsep=0.5cm}%
  \else
    \geometry{top=3.0cm, left=4.3cm, right=1.7cm,
              textwidth=15cm, textheight=23cm,
              headheight=0.5cm, headsep=0.5cm}%
  \fi
}
\defaultsettings
\setlength{\parindent}{1cm}
\setlength{\parskip}{0pt}
\pagestyle{myheadings}
\markright{}
\pagenumbering{roman}
\newcommand{\onehalfspacing}{%
  \ifcase\@ptsize\relax % 10pt
    \renewcommand{\baselinestretch}{1.25}%
  \or % 11pt
    \renewcommand{\baselinestretch}{1.213}%
  \or % 12pt
    \renewcommand{\baselinestretch}{1.241}%
  \fi
  \normalsize
}
\newcommand{\doublespacing}{
  \ifcase\@ptsize\relax % 10pt
    \renewcommand{\baselinestretch}{1.667}
  \or % 11pt
    \renewcommand{\baselinestretch}{1.618}
  \or % 12pt
    \renewcommand{\baselinestretch}{1.655}
  \fi
  \normalsize
}
\newcommand{\singlespacing}{%
  \renewcommand{\baselinestretch}{1.0}%
  \normalsize
}
\newcommand{\mytableofcontents}{%
\pagestyle{empty}
\tableofcontents
\cleardoublepage
\pagenumbering{arabic}
\pagestyle{fancy}    
\fancyhf{} % delete current header and footer 
\fancyhead[LE,RO]{\bfseries\thepage} 
\fancyhead[LO]{\bfseries\rightmark} 
\fancyhead[RE]{\bfseries\leftmark}
}
\newcounter{appendix}
\newcommand{\appendices}{%
  \setcounter{appendix}{1}%
  \newpage
  %\pagestyle{empty}
  \pagestyle{myheadings}
  \markright{}
  \appendix
  \addtocontents{toc}{\protect \contentsline {section}{\enclname}{}}
  \setcounter{page}{0}
}
\newcommand{\internalappendix}[2]{%
  \addtocounter{appendixpage}{\value{page}}%
  \newpage
  \setcounter{page}{1}%
  \section*{\appendixname\ #1. #2}
  \addtocontents{toc}{
    \protect \contentsline {section}{\hspace{0.5cm}#1 #2}{}}
  \addtocounter{appendix}{+1}%
}
\newcommand{\externalappendix}[2]{%
  \addtocontents{toc}{
    \protect \contentsline {section}{\hspace{0.5cm}#1 #2}{}}
  \addtocounter{appendix}{+1}%
}
\newcounter{appendixpage}
\newcommand{\numberofappendixpages}[1][0]{%
  \addtocounter{appendixpage}{#1}%
  \ref{@lastappendixpage}%
}

\AtEndDocument{%
  \addtocounter{appendixpage}{\value{page}}%
  \immediate\write\@auxout{\string
    \newlabel{@lastappendixpage}{{\theappendixpage}{\thepage}}}%
}
\newcommand{\lastpage}{%
  \label{lastpage}%
}

\newcommand{\numberofpages}{%
  \@ifundefined{r@lastpage}{0}{\pageref{lastpage}}%
}
\renewcommand{\and}{%
  \\ % Rivinvaihto.
  \hspace{1em}%
}
\RequirePackage{openbib}
\addto\captionsfinnish{\def\refname{L\"ahteet}}
\addto\captionsenglish{\def\enclname{References}}
\addto\captionsswedish{\def\enclname{Bilagor}}
\renewenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\uppercase{\refname}}{\uppercase{\refname}}
        \addcontentsline{toc}{section}{\refname}}%
      \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\makebox[5em]{}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\arabic{enumiv}}}%
        \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.=\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\def\@biblabel#1{#1}
\def\datefinnish{%
  \def\today{\number\day.\number\month.\number\year}}
\newcommand{\level}[1]{\gdef\@level{#1}}
\level{}
\newcommand{\prof}[1]{\gdef\@prof{#1}}
\newcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\censors}[3]{\gdef\@censor{#1\\&#2\\&#3}}
\newcommand{\quoting}[1]{\gdef\@quoting{#1}}



\addto\captionsfinnish{%
  \def\dateofacceptance{hyv\"aksymisp\"aiv\"a}%
  \def\grade{arvosana}%
  \def\instructor{arvostelija}%
  \def\uh{HELSINGIN YLIOPISTO}%
  \def\helsinki{Helsinki}%
  \def\ccs{ACM Computing Classification System (CCS):}%
}
\addto\captionsenglish{%
  \def\dateofacceptance{Date of acceptance}%
  \def\grade{Grade}%
  \def\instructor{Instructor}%
  \def\uh{UNIVERSITY OF HELSINKI}%
  \def\helsinki{Helsinki}%
  \def\ccs{ACM Computing Classification System (CCS):}%
}
\addto\captionsswedish{%
  \def\dateofacceptance{godk.datum}%
  \def\grade{vitsord}%
  \def\instructor{bed\"omare}%
  \def\uh{HELSINGFORS UNIVERSITET}%
  \def\helsinki{Helsingfors}%
  \def\ccs{ACM Computing Classification System (CCS):}%
}

%--------------------------------------------------------------------------
% Set chapter titles
%\makeatletter
\renewcommand{\@makechapterhead}[1]{%
\vspace*{50 pt}%
{\setlength{\parindent}{0pt} \raggedright \normalfont
\bfseries\Huge
\thechapter. #1\par\nobreak\vspace{40 pt}}}
%\makeatother


%--------------------------------------------------------------------------
% GENERATE TITLE PAGE
\renewcommand{\maketitle}{ 
\pagenumbering{alph}
\thispagestyle{empty}
\begin{titlepage}


\begin{center}

\includegraphics[width=4.5cm]{sinetti}

\vspace{1cm}
\begin{large}

\@level

\@subject

\end{large}


\vspace{1.5cm} 
\begin{LARGE}
{\bf \@title}

\end{LARGE}

\vspace{2cm}
\begin{large}
\@author
\end{large}

\vspace{14pt}
\begin{large}
\@date
\end{large}

\vspace{2.0cm}

\begin{large}


\def\reallyempty{}
\begin{tabular}{l l}
Tutor: & \@prof\\
&\\
\ifx\@censor\reallyempty
&\\
\else 
Censors: & \@censor\\
\fi
&\\
\end{tabular}
\end{large}

\vspace{20pt}
%\begin{large}
%\vspace{1cm}

{\rm\sc
\uh

\@department
}

\vspace{0.25cm} 
\@address
%\end{large}

\end{center}
 \end{titlepage}
\doublespacing

% Quotation page
\pagebreak
\pagenumbering{roman}
\thispagestyle{empty}
\parbox{1cm}{}
\vfill
\normalsize
\noindent \@quoting
\newpage

}

%--------------------------------------------------------------------------

\def\division{\char'057}

\newcommand{\faculty}[1]{\gdef\@faculty{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
\newcommand{\depositeplace}[1]{\gdef\@depositeplace{#1}}
\newcommand{\additionalinformation}[1]{\gdef\@additionalinformation{#1}}
\newcommand{\numberofpagesinformation}[1]{\gdef\@numberofpagesinformation{#1}}
\newcommand{\classification}[1]{\gdef\@classification{#1}}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}



%--------------------------------------------------------------------------

\newsavebox{\@abstract}
\newenvironment{@summary}{
  \begin{lrbox}{\@abstract}
    \begin{minipage}[t]{5.95in}
      \setlength{\parskip}{2ex}
}{

      \if \@classification
      \else
        \ccs\ \@classification
      \fi
    \end{minipage}
  \end{lrbox}
  \put(58, 650){\mbox{\usebox{\@abstract}}}
}

\def\abst@small{\fontsize{10}{12}\selectfont}
\def\abst@tiny{\fontsize{6}{7}\selectfont}


%--------------------------------------------------------------------------
% GENERATE ABSTRACT
\renewenvironment{abstract}{
\pagestyle{empty}
\if@twoside
\begin{picture}(580,845)(71,-64)%
\else
\begin{picture}(580,845)(95,-64)%
\fi
\put(58,  784){\makebox(100, 8)[l]{\abst@small\@faculty}}
\put(289, 784){\makebox(100, 8)[l]{\abst@small\@department}}
\put(58,  761){\makebox(100, 8)[l]{\abst@small\@author}}
\put(58,  732){\parbox[l]{450pt}{\renewcommand{\baselinestretch}{.9}\abst@small\@title}}
\put(58,  704){\makebox(100, 8)[l]{\abst@small\@subject}}
\put(58,  681){\makebox(100, 8)[l]{\abst@small\@level}}
\put(212, 681){\makebox(100, 8)[l]{\abst@small\@date}}
\put(366, 681){\makebox(100, 8)[l]{\abst@small\@numberofpagesinformation}}
\put(58,  94) {\makebox(100, 8)[l]{\abst@small\@keywords}}
\put(58,  72) {\makebox(100, 8)[l]{\abst@small\@depositeplace}}
\put(58,  35) {\makebox(100, 8)[l]{\abst@small\@additionalinformation}}
\begin{@summary}\abst@small}
{\end{@summary}
\put(53,30){\framebox(462,786){}}
\put(53,779){\line(1,0){462}}
\put(53,756.24){\line(1,0){462}}
\put(53,722.1){\line(1,0){462}}
\put(53,699.34){\line(1,0){462}}
\put(53,676.58){\line(1,0){462}}
\put(53,67){\line(1,0){462}}
\put(53,89.76){\line(1,0){462}}
\put(53,112.52){\line(1,0){462}}
\put(284,779){\line(0,1){37}}
\put(207,676.58){\line(0,1){22.76}}
\put(361,676.58){\line(0,1){22.76}}
\put(58,809){\makebox(150,6)[l]{
\tiny Tiedekunta --- Fakultet --- Faculty}}
\put(289,809){\makebox(100,6)[l]{\abst@tiny Laitos --- Institution --- Department}}
\put(58,773){\makebox(100,5)[l]{\abst@tiny Tekij\"a --- F\"orfattare --- Author}}
\put(58,750){\makebox(100,5)[l]{\abst@tiny Ty\"on nimi --- Arbetets titel --- Title}}
\put(58,716){\makebox(100,5)[l]{\abst@tiny Oppiaine --- L\"aro\"amne --- Subject}}
\put(58,693){\makebox(100,5)[l]{\abst@tiny Ty\"on laji --- Arbetets art --- Level}}
\put(212,693){\makebox(100,5)[l]{\abst@tiny Aika --- Datum --- Month and year }}
\put(366,693){\makebox(100,5)[l]{\abst@tiny Sivum\"a\"ar\"a --- Sidoantal ---
    Number of pages}}
\put(58,670){\makebox(100,5)[l]{\abst@tiny Tiivistelm\"a --- Referat --- Abstract}}
\put(58,106){\makebox(100,5)[l]{\abst@tiny Avainsanat --- Nyckelord --- Keywords}}
\put(58,83){\makebox(100,5)[l]{\abst@tiny S\"ailytyspaikka --- F\"orvaringsst\"alle
--- Where deposited}}
\put(58,61){\makebox(100,5)[l]{\abst@tiny Muita tietoja --- \"ovriga uppgifter
--- Additional information}}
\put(53,821){\makebox(100,8)[l]{\abst@small HELSINGIN YLIOPISTO --- HELSINGFORS
UNIVERSITET --- UNIVERSITY OF HELSINKI}}
\end{picture}

%\clearpage
}


\endinput
%%
%% End of file
