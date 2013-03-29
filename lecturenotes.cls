\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2013/03/28 General layout and font definitions for lecture notes]

\newif\iftwoside\twosidefalse

\DeclareOption{twoside}{\twosidetrue\PassOptionsToClass{twoside}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

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
\newfontface\textinitial[]{Linux Libertine Initials O}
\newfontface\textdisplay[
  Mapping=tex-text, 
  Numbers={OldStyle, Proportional}, 
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
\RequirePackage[top=2.0cm, bottom=2.0cm, left=3.25cm, right=2.25cm]{geometry}
\else
\RequirePackage[top=2.0cm, bottom=2.0cm, left=2.75cm, right=2.75cm]{geometry}
\fi

% Miscellaneous.
\RequirePackage[iso, english]{isodate} 
\RequirePackage[stable]{footmisc}
\usepackage{verse}

\makeatletter
\define@key{lecture}{date}{\def\lectureDate{#1}}
\define@boolkey{lecture}{official}[false]{
\ifKV@lecture@official
\def\lectureOfficial{\\* There are official notes for the material covered in this lecture.}
\else
\def\lectureOfficial{\\* The material covered in this lecture is not part of the official notes.}
\fi}
\makeatother
\newcounter{Lecture}
\newenvironment{lecture}[1][]{
\refstepcounter{Lecture}
\setkeys{lecture}{official, #1}

\begin{flushright}
\textsc{Lecture} \theLecture, \printdate{\lectureDate}.\emph{\lectureOfficial}
\end{flushright}

}{}
\newenvironment{supplemental}{
\begin{flushright}
\textsc{Supplemental}
\end{flushright}}{}

% For comments in align environments
\newcommand\commentbox[1]{\parbox{7cm}{#1}}

\usepackage{lettrine}
\newcommand{\up}[1]{{\addfontfeature{VerticalPosition=Superior}#1}}
\newcommand{\textdn}[1]{{\addfontfeature{VerticalPosition=ScientificInferior}#1}}
