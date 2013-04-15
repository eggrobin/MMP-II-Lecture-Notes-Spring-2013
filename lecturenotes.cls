\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2013/03/28 General layout and font definitions for lecture notes]

\newif\iftwoside\twosidefalse

\DeclareOption{twoside}{\twosidetrue\PassOptionsToClass{twoside}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
%\raggedbottom

%\makeatletter
%\def\@seccntformat#1{\llap{\csname the#1\endcsname\quad}}
%\makeatother

\RequirePackage{xltxtra}

% Language.

\RequirePackage{polyglossia}
\setdefaultlanguage{english}
\setotherlanguages{greek,german,russian}
\newcommand{\foreign}{\emph}

% Font definitions.

\RequirePackage{fontspec}
\setmainfont[
  Mapping=tex-text, 
  Numbers={OldStyle, Proportional}, 
  Ligatures={TeX, Common, Historical}, 
%  SmallCapsFont={Linux Libertine Capitals O},
  SmallCapsFeatures={Letters=SmallCaps},
  Contextuals=WordFinal,
            ]{Linux Libertine O}
\setmonofont{Linux Libertine Mono O}
\newfontface\textup[
  VerticalPosition=Superior,
  Numbers={OldStyle, Proportional}
]{Linux Libertine O}
\newfontface\textinitial[]{Linux Libertine Initials O}
\newfontface\textdisplay[
  Mapping=tex-text, 
  Numbers={OldStyle, Proportional}, 
  SmallCapsFont={Linux Libertine O},
  SmallCapsFeatures={Letters=SmallCaps},
  Ligatures={TeX, Common, Historical}, 
  Contextuals=WordFinal
                        ]{Linux Libertine Display O}
\newfontface\textsfshadow[
  Mapping=tex-text, 
  Ligatures={TeX, Common},
  Numbers={OldStyle, Proportional},
  Contextuals=WordFinal
            ]{Linux Biolinum Shadow O}
\newfontface\textsfoutline[
  Mapping=tex-text, 
  Ligatures={TeX, Common},
  Numbers={OldStyle, Proportional},
  Contextuals=WordFinal
            ]{Linux Biolinum Outline O}

\setsansfont[
  Mapping=tex-text, 
  Ligatures={TeX, Common},
  Numbers={OldStyle, Proportional},
%  SmallCapsFont={Linux Biolinum Capitals O}, 
  SmallCapsFeatures={Letters=SmallCaps},
  Contextuals=WordFinal
            ]{Linux Biolinum O}

% Layout.

\iftwoside
\RequirePackage[heightrounded,
marginparwidth=5cm, marginparsep=0.5cm, top=2.5cm, bottom=2.5cm, left=2.5cm, right=6.5cm]{geometry}
\else
\RequirePackage[top=2.25cm, bottom=2.25cm, left=3.5cm, right=3.5cm]{geometry}
\fi

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE,LO]{\textsc{Lecture} \theLecture}
\renewcommand{\headrulewidth}{0pt}
\let\makearticletitle\maketitle
\renewcommand{\maketitle}{\makearticletitle\thispagestyle{empty}}

\usepackage[margin=10pt,font=small,labelfont=bf]{caption}

% Miscellaneous.
\RequirePackage[iso, english]{isodate} 
\usepackage{verse}
\renewcommand{\textsuperscript}[1]{{\textup{#1}}}
\RequirePackage[stable]{footmisc}
%\RequirePackage{bigfoot}
\RequirePackage{tikz}
% For some obscure reason, XeTeX does not support
% TikZ patterns. We are not getting rid of unicode
% and font support anytime soon, so just do that by
% hand.
\usetikzlibrary{calc} %, patterns}
\RequirePackage{caption}
\RequirePackage{marginfix}
\newcommand{\marginfig}[2][]{%
\marginpar{%
\begin{center}%
#2%
\ifstrempty{#1}{}{\captionof{figure}{#1}}
\end{center}%
}%
}

%\makeatletter
%\renewcommand*{\@makefnmark}{%
%  \hbox{%
%    \textup{%
%      \thempfn%
%    }%
%  }%  
%}   
%\makeatother

\RequirePackage{marginnote}

\makeatletter
\define@key{lecture}{date}{\def\lectureDate{#1}}
\define@boolkey{lecture}{official}[false]{
\ifKV@lecture@official
\def\lectureOfficial{\\* There are official notes for the material covered in this lecture.}
\else
\def\lectureOfficial{}%\\* The material covered in this lecture is not part of the official notes.}  % Empty, as this has become the standard; such a remark leads to useless clutter.
\fi}
\makeatother
\newcounter{Lecture}
\newcommand{\LectureStartsHere}{
\mbox{}%
\marginnote{%
\textsc{Lecture} \theLecture, \printdate{\lectureDate}.\emph{\lectureOfficial}%
}%
\nopagebreak%
}
\NewDocumentEnvironment{lecture}{s o}{
\refstepcounter{Lecture}
\setkeys{lecture}{official, #2}

\IfBooleanTF{#1}{}{\LectureStartsHere\nopagebreak}
}{}
\newenvironment{supplemental}{}{}
%\begin{flushright}
%\textsc{Supplemental}
%\end{flushright}}{}

% For comments in align environments
\newcommand\commentbox[1]{\parbox{.3\linewidth}{#1}}

\usepackage{lettrine}
\newcommand{\up}[1]{{\addfontfeature{VerticalPosition=Superior}#1}}
\newcommand{\textdn}[1]{{\addfontfeature{VerticalPosition=ScientificInferior}#1}}
