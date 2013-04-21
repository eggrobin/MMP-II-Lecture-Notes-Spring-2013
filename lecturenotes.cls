\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2013/03/28 Adds lecture numbering utilities for lecture notes to the base style]

\newif\iftwoside\twosidefalse

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{basestyle}}
\ProcessOptions
\LoadClass{basestyle}

\fancyhead[RE,LO]{\textsc{Lecture} \theLecture}

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
\marginnote{{\upshape%
\textsc{Lecture} \theLecture, \printdate{\lectureDate}.\emph{\lectureOfficial}%
}}%
\nopagebreak%
}
\NewDocumentEnvironment{lecture}{s o}{
\refstepcounter{Lecture}
\setkeys{lecture}{official, #2}

\IfBooleanTF{#1}{}{\LectureStartsHere\nopagebreak}
}{}
\newenvironment{supplemental}{}{}