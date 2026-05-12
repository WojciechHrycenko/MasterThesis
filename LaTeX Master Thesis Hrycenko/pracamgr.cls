% Klasa dokumentow do skladu prac magisterskich i~licencjackich
% na wydziale Matematyki, Mechaniki i~Informatyki UW.
%
% Copyright (c) 2001 by Wydzial Matematyki, Informatyki i Mechaniki.
%
% Zmiany 05.05.2006 by Seweryn Karlowicz
%
% Zmiany 03.01.2017 by Kuba Pochrybniak
%
% Zmiany 10.06.2020 by Paweł Goldstein

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pracamgr}[2017/01/03 v0.7.0 Praca magisterska]
\newif\ifmyclass@en
\DeclareOption{en}{\myclass@entrue}
\DeclareOption{pl}{\myclass@enfalse}
\ExecuteOptions{pl}
\ProcessOptions\relax

\ifmyclass@en
	\RequirePackage[english]{babel}
	\RequirePackage[T1]{fontenc}
\else
	\RequirePackage[polish]{babel}
	\RequirePackage[T1]{fontenc}
\fi
\RequirePackage[utf8]{inputenc}

\def\@baseclass{article}
\def\@rodzajpracy{\ifmyclass@en Master's\else magisterska\fi}
\def\@stopien{\ifmyclass@en Master\else magister\fi}
\DeclareOption{licencjacka}{
	\def\@stopien{\ifmyclass@en Bachelor\else licencjat\fi}
	\def\@rodzajpracy{\ifmyclass@en Bachelor's\else licencjacka\fi}
}
%\DeclareOption{licencjacka}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}}
\PassOptionsToClass{a4paper,oneside,12pt}{\@baseclass}
\ProcessOptions

\LoadClass{\@baseclass}

\RequirePackage[margin=2.5cm]{geometry}
\RequirePackage{mathptmx}

\newcounter{liczbaAutorow}
\setcounter{liczbaAutorow}{0}
\def\autor#1#2{\def\@imienazwisko{#1}\def\@album{#2}\stepcounter{liczbaAutorow}}
\def\autori#1#2{\def\@imienazwiskoi{#1}\def\@albumi{#2}\stepcounter{liczbaAutorow}}
\def\autorii#1#2{\def\@imienazwiskoii{#1}\def\@albumii{#2}\stepcounter{liczbaAutorow}}
\def\autoriii#1#2{\def\@imienazwiskoiii{#1}\def\@albumiii{#2}\stepcounter{liczbaAutorow}}
\def\autoriv#1#2{\def\@imienazwiskoiv{#1}\def\@albumiv{#2}\stepcounter{liczbaAutorow}}
\def\autorv#1#2{\def\@imienazwiskov{#1}\def\@albumv{#2}\stepcounter{liczbaAutorow}}

\autor{}{}
\autori{}{}
\autorii{}{}
\autoriii{}{}
\autoriv{}{}
\autorv{}{}
\setcounter{liczbaAutorow}{0}


\newcommand{\autorZAlbumem}[2]{\begin{minipage}{0.45\textwidth}\centering{\Large\bfseries #1}\\[2mm]\ifmyclass@en Student no.\else Nr albumu:\fi\ #2\end{minipage}\ }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wersja angielska
\ifmyclass@en
	\renewcommand\maketitle{%
  \begin{titlepage}
    \begin{center}
      {\Large University of Warsaw \\ Faculty of Economic Sciences \par}
      \vspace{2cm}
      {\Large \@imienazwisko \par}
      {\large Album N\textsuperscript{o}: \@album \par}
      \vspace{1cm}
      {\fontsize{20}{24}\selectfont \textbf{\@title} \par}
      \vspace{1cm}
      {\large \@rodzajpracy\ degree thesis \par}
      {\large Field of the study: \@kierunek \par}
      \vspace{2cm}
      \begin{flushright}
        \large \@opiekun \\
      \end{flushright}
      \vfill
      {\large Warsaw, \@date \par}
    \end{center}
  \end{titlepage}
		\begin{titlepage}
			\setcounter{page}{1}
			\thispagestyle{plain}
			\noindent \textit{Declaration of the supervisor} \\[0.5cm]
			I declare that the following thesis was written under my supervision and I state that it meets all criteria to be submitted for the procedure of academic degree award. \\[0.3cm]
			*I declare that my participation in the scientific article, which is a part of this thesis is \dots\dots\%, while the supplement to the thesis was written independently by the graduate(s). \\[0.3cm]
			{\small * cross out if not applicable} \\[0.8cm]
			\begin{tabular}{p{5cm} p{8cm}}
			Date & \dotfill \\
			     & \centering \small Signature of the Supervisor
			\end{tabular}

			\vspace{2cm}

			\noindent \textit{Declaration of the author of the thesis} \\[0.5cm]
			Aware of the legal responsibility, I declare that I am the sole author of the following thesis and that the thesis is free from any content that constitutes copyright infringement or has been acquired contrary to applicable laws and regulations. \\[0.3cm]
			I also declare that the thesis has never been a subject of degree-awarding procedures in any higher education institution. \\[0.3cm]
			Moreover I declare that the attached version of the thesis is identical with the enclosed electronic version. \\[0.3cm]
			*I declare that my participation in the scientific article, which is part of this thesis is \dots\dots\% (not less than 60\%), while the supplement to the thesis was written by me. \\[0.3cm]
			{\small * cross out if not applicable} \\[0.8cm]
			\begin{tabular}{p{5cm} p{8cm}}
			Date & \dotfill \\
			     & \centering \small Signature of the Author
			\end{tabular}
			\vfill
		\end{titlepage}
	  \setcounter{footnote}{0}%
	  \global\let\thanks\relax
	  \global\let\maketitle\relax
	  \global\let\@thanks\@empty
	  \global\let\@author\@empty
	  \global\let\@date\@empty
	  \global\let\@title\@empty
	  \global\let\title\relax
	  \global\let\author\relax
	  \global\let\date\relax
	  \global\let\and\relax
	}
	\def\nralbumu#1{\gdef\@nralbumu{#1}}
	\def\@nralbumu{???\ClassError{pracamgr}{Brak numeru albumu}\@ehc}
	\def\kierunek#1{\gdef\@kierunek{#1}}
	\def\@kierunek{???\ClassError{pracamgr}{Nie podano kierunku studiow}\@ehc}
	%----zakres nie konieczny-----
	\def\zakres#1{\gdef\@zakres{w zakresie \MakeUppercase{#1}}}
	\def\@zakres{}
	\def\opiekun#1{\gdef\@opiekun{#1}}
	\def\@opiekun{???\ClassError{pracamgr}{Brak danych opiekuna pracy}\@ehc}
	\def\keywords#1{\gdef\@keywords{#1}}
	\def\@keywords{???\ClassError{pracamgr}{Brak slow kluczowych}\@ehc}
	\def\dziedzina#1{\gdef\@dziedzina{#1}}
	\def\@dziedzina{???\ClassError{pracamgr}{Brak dziedziny Socrates-Erasmus}\@ehc}
	\def\klasyfikacja#1{\gdef\@klasyfikacja{#1}}
	\def\@klasyfikacja{???\ClassError{pracamgr}{Brak klasyfikacji tematycznej}\@ehc}
	%-------------------nowe------------
	\def\tytulang#1{\gdef\@tytulang{#1}}
	\def\@tytulang{???\ClassError{pracamgr}{Brak tytulu po angielsku}\@ehc}
	\def\titlepl#1{\gdef\@titlepl{#1}}
	\def\@titlepl{???\ClassError{pracamgr}{Brak tytulu po polsku}\@ehc}


	\renewenvironment{abstract}{%
	  \clearpage
	  \null\nobreak\vfil
	  \@beginparpenalty\@lowpenalty
	  \begin{center}%
		\bfseries\large Summary
		\@endparpenalty\@M
	  \end{center}}%
	{\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Keywords
		\@endparpenalty\@M
	  \end{center}
	  \@keywords\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Field of the thesis (codes according to the Erasmus program)
		\@endparpenalty\@M
	  \end{center}
	   \@dziedzina\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Thematic classification
		\@endparpenalty\@M
	  \end{center}
	  \@klasyfikacja\par
	  \vspace*{26pt}%
	  \begin{center}%
		\begingroup
		\bfseries\large The title of the thesis in Polish
		\@endparpenalty\@M
		\endgroup

		\medskip
		\@titlepl\par
	  \end{center}
	  \vspace*{26pt}%
	%-------------------nowosc----------------
	  \nobreak\vfil\null\cleardoublepage}


\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\mdseries
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wersja polska
\else

	\renewcommand\maketitle{%
	  \begin{titlepage}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
		\begin{center}%
		  {\LARGE\textbf{Uniwersytet Warszawski}\\
			Wydzia\l{} Matematyki, Informatyki i Mechaniki\par}
		  \vspace{1cm plus .5fill}
		{
			\setlength{\parindent}{0em}
			%\setlength{\baselineskip}{60pt}
			\centering

				\ifx\@imienazwisko\empty\else\autorZAlbumem{\@imienazwisko}{\@album}\fi
				\ifx\@imienazwiskoi\empty\else\autorZAlbumem{\@imienazwiskoi}{\@albumi}\fi
				\ifx\@imienazwiskoii\empty\else\autorZAlbumem{\@imienazwiskoii}{\@albumii}\fi
				\ifx\@imienazwiskoiii\empty\else\autorZAlbumem{\@imienazwiskoiii}{\@albumiii}\fi
				\ifx\@imienazwiskoiv\empty\else\autorZAlbumem{\@imienazwiskoiv}{\@albumiv}\fi
				\ifx\@imienazwiskov\empty\else\autorZAlbumem{\@imienazwiskov}{\@albumv}\fi

		}

		  \vspace{8mm plus .5fill}
		  {\Huge\textbf{\@title}\par}
		  \vspace{8mm plus .1fill}
		  {\large\bf Praca \@rodzajpracy\\[3pt]
			na kierunku \MakeUppercase{\@kierunek} \\
	%----zakres---
			\@zakres \par}
		  \vspace{2cm plus 1.5fill}
		  \begin{flushright}\large
			\begin{tabular}{l}
			  Praca wykonana pod kierunkiem\\
			  \bfseries \@opiekun
			\end{tabular}
		  \end{flushright}
		  \vspace{1cm plus 1fill}
		  {\large Warszawa, \@date\par}
		\end{center}
		\@thanks
	  \end{titlepage}%
	   \begin{titlepage}
	  \c@page=2
	\vfill \mbox{}
	  \end{titlepage}

	  \setcounter{footnote}{0}%
	  \global\let\thanks\relax
	  \global\let\maketitle\relax
	  \global\let\@thanks\@empty
	  \global\let\@author\@empty
	  \global\let\@date\@empty
	  \global\let\@title\@empty
	  \global\let\title\relax
	  \global\let\author\relax
	  \global\let\date\relax
	  \global\let\and\relax
	}
	\def\nralbumu#1{\gdef\@nralbumu{#1}}
	\def\@nralbumu{???\ClassError{pracamgr}{Brak numeru albumu}\@ehc}
	\def\kierunek#1{\gdef\@kierunek{#1}}
	\def\@kierunek{???\ClassError{pracamgr}{Nie podano kierunku studiow}\@ehc}
	%----zakres nie konieczny-----
	\def\zakres#1{\gdef\@zakres{w zakresie \MakeUppercase{#1}}}
	\def\@zakres{}
	\def\opiekun#1{\gdef\@opiekun{#1}}
	\def\@opiekun{???\ClassError{pracamgr}{Brak danych opiekuna pracy}\@ehc}
	\def\keywords#1{\gdef\@keywords{#1}}
	\def\@keywords{???\ClassError{pracamgr}{Brak slow kluczowych}\@ehc}
	\def\dziedzina#1{\gdef\@dziedzina{#1}}
	\def\@dziedzina{???\ClassError{pracamgr}{Brak dziedziny Socrates-Erasmus}\@ehc}
	\def\klasyfikacja#1{\gdef\@klasyfikacja{#1}}
	\def\@klasyfikacja{???\ClassError{pracamgr}{Brak klasyfikacji tematycznej}\@ehc}
	%-------------------nowe------------
	\def\tytulang#1{\gdef\@tytulang{#1}}
	\def\@tytulang{???\ClassError{pracamgr}{Brak tytulu po angielsku}\@ehc}


	\renewenvironment{abstract}{%
	  \titlepage
	  \null\nobreak\vfil
	  \@beginparpenalty\@lowpenalty
	  \begin{center}%
		\bfseries\large \abstractname
		\@endparpenalty\@M
	  \end{center}}%
	{\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Słowa kluczowe
		\@endparpenalty\@M
	  \end{center}
	  \@keywords\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Dziedzina pracy (kody wg programu Socrates-Erasmus)
		\@endparpenalty\@M
	  \end{center}
	   \@dziedzina\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Klasyfikacja tematyczna
		\@endparpenalty\@M
	  \end{center}
	  \@klasyfikacja\par
	  \vspace*{26pt}%
	%-------------------nowosc----------------
	  \begin{center}%
		\bfseries\large Tytuł pracy w języku angielskim
		\@endparpenalty\@M
	  \end{center}
	  \@tytulang\par
	  \nobreak\vfil\null\endtitlepage\cleardoublepage}

	\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
		\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

	\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
	\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
	\renewcommand*\l@section[2]{%
	  \ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
		  \parindent \z@ \rightskip \@pnumwidth
		  \parfillskip -\@pnumwidth
		  \leavevmode \bfseries
		  \advance\leftskip\@tempdima
		  \hskip -\leftskip
		  #1\nobreak\mdseries
		  \leaders\hbox{$\m@th
			\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
			mu$}\hfill
		  \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		  \penalty\@highpenalty
		\endgroup
	  \fi}

\fi


\endinput
