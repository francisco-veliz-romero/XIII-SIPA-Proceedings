\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sipa}[2026/10/05 XIII SIPA Class]

\LoadClass[twoside,a4paper,12pt,openany]{book}

% ============================================================
% Packages
% ============================================================

\RequirePackage[spanish]{babel}
\RequirePackage{lmodern}
\RequirePackage{helvet}
\RequirePackage{sansmath}
\RequirePackage{twemojis}

\RequirePackage{expl3}
\RequirePackage{xpatch}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{xstring}

\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{gensymb}
\RequirePackage{eurosym}
\RequirePackage{academicons}
\RequirePackage{fontawesome}
\RequirePackage{worldflags}
\RequirePackage{wrapstuff}
\RequirePackage{graphicx}
\RequirePackage{adjustbox}

\RequirePackage[showframe=false]{geometry}
\RequirePackage{layout}
\RequirePackage{setspace}

\RequirePackage{array}
\RequirePackage[normalem]{ulem}
\RequirePackage{tikz}
\RequirePackage{float}
\RequirePackage{newfloat}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{enumitem}

\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{titlesec}
\RequirePackage{tocloft}

%\RequirePackage{imakeidx}

\RequirePackage{ragged2e}

\RequirePackage{csquotes}

\RequirePackage{orcidlink}
\RequirePackage{pdfpages}
\RequirePackage{comment}
\RequirePackage{blindtext}
\RequirePackage{textcomp}
\RequirePackage{fancyhdr}

\RequirePackage{xurl}
\RequirePackage{hyperref}
\RequirePackage{bookmark}

\RequirePackage[style=apa, dashed=true, isbn=true, sorting=editor-year-title, refsection=section]{biblatex}
\addbibresource{referencias_sipa_xiii.bib}

\DefineBibliographyExtras{spanish}{%
	\protected\def\bibrangedash{\textendash}%
}

\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	citecolor=blue,
	urlcolor=blue,
	linktocpage,
}

%========================
% .sty files
%========================

\RequirePackage{clase/sipa-authors}
\RequirePackage{clase/sipa-cover-general}
\RequirePackage{clase/sipa-cover-sub}
\RequirePackage{clase/sipa-headers}
\RequirePackage{clase/sipa-footers}
\RequirePackage{clase/sipa-page-formats}
\RequirePackage{clase/sipa-speakers}
\RequirePackage{clase/sipa-toc}
\RequirePackage{clase/sipa-documents}
\RequirePackage{clase/sipa-references}
\RequirePackage{clase/sipa-captions}

% ============================================================
% Proceedings cover dimensions
% ============================================================

\geometry{
	paperwidth=210mm,
	paperheight=297mm,
	left=0mm,
	right=0mm,
	top=0mm,
	bottom=0mm,
	headheight=0mm,
	headsep=0mm,
	footskip=0mm
}

% Environment to hide objects from the document
% In TexStudio, parts, chapters and sections are still visible in
% the application viewer,  but hidden in the document
\newif\ifshow
\ifshow
	\includecomment{wrap}
\else
	\excludecomment{wrap}
\fi

\pagestyle{empty}
% Change text font to Sans
\renewcommand{\familydefault}{\sfdefault}

% Definition of colors for the document style
\definecolor{covergreen}{RGB}{54,88,35}
\definecolor{lightgreen}{RGB}{159,192,150}
\definecolor{midgreen}{RGB}{78,120,75}
\definecolor{darkgreen}{RGB}{60,82,58}

% Function to force a change of font in all document
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12pt}{15pt}%
}

%====================================================
% Custon functions
%====================================================

% Event's number
\newcommand{\eventnumber}{}

\newcommand{\numero}[1]{%
	\edef\eventnumber{\romannumeral #1}%
	\expandafter\uppercase\expandafter{\expandafter\def\expandafter\eventnumber\expandafter{\eventnumber}}%
}

% Event's title
\newcommand{\eventtitle}{}

\newcommand{\titulo}[1]{%
	\renewcommand{\eventtitle}{#1}%
}

\newcommand{\eventshorttitle}{}

\newcommand{\titulocorto}[1]{%
	\renewcommand{\eventshorttitle}{#1}%
}

\newcommand{\eventsubtitle}{}

% Event's subtitle
\newcommand{\titulodos}[1]{%
	\renewcommand{\eventsubtitle}{#1}%
}

% Event's date
\newcommand{\eventdate}

\newcommand{\fecha}[1]{%
	\renewcommand{\eventdate}{#1}%
}

% Functions to add images and text side by side
% Image to the right side and text on the left side
\newcommand{\rightimage}[6]{%
	\noindent
	\hbox to \textwidth{%
	\hfill
%	\fbox{%
%		\fbox{%
		\begin{minipage}[c]{#1 \textwidth}
			\centering
			\includegraphics[height = #3 cm, width=#4 \linewidth]{#2}
		\end{minipage}%
%		}%
%		\fbox{%
		\begin{minipage}[c]{#5 \textwidth}
			\centering
			#6
		\end{minipage}%
%		}%
%		}%
	\hfill
	}
}

% Image to the left  side and text on the right side
\newcommand{\leftimage}[6]{%
	\noindent
	\hbox to \textwidth{%
	\hfill
%	\fbox{%
%		\fbox{%
		\begin{minipage}[c]{#1 \textwidth}%
			\centering
			#6
		\end{minipage}%
%		}%
%		\fbox{%
		\begin{minipage}[c]{#1 \textwidth}%
			\centering
			\includegraphics[height = #3 cm, width=#4 \linewidth]{#2}
		\end{minipage}%
%		}%
%		}%
	\hfill
	}
}

%pelicula alan - Un milagro para lorenzo

% Two images
\newcommand{\images}[8]{%
	\noindent
	\hbox to \textwidth{%
	\hfill
%	\fbox{%
%		\fbox{%
		\begin{minipage}[c]{#1 \textwidth}%
			\centering
			\includegraphics[height = #3 cm, width=#4 \linewidth]{#2}
		\end{minipage}%
%		}%
%		\fbox{%
		\begin{minipage}[c]{#5 \textwidth}%
			\centering
			\includegraphics[height = #7 cm, width=#8 \linewidth]{#6}
		\end{minipage}%
%		}%
%		}%
	\hfill
	}
}

% Big image
\newcommand{\bigimage}[3]{%
	\begin{center}
		\begin{tikzpicture}[baseline=(current bounding box.north)]
		\node[anchor=center, inner sep=0pt] at (0,0) {%
			\includegraphics[height = #2 cm, width=#3 \linewidth]{#1}%
		};
		\end{tikzpicture}%
	\end{center}
}

% Specific code to omit the bibliography title in TOC
\defbibheading{misubseccion}[\bibname]{%
	\subsection*{#1}%
}

% ============================================================
% Proceedings general dimensions
% ============================================================

\newcommand{\bookbodygeometry}{%
	\newgeometry{
		textwidth=170mm,
		inner = 20mm,
		outer = 20mm,
		top=0in,
		bottom=2in,
		footskip=19pt,
		hcentering
	}%
	\setlength{\oddsidemargin}{0pt}%
	\setlength{\evensidemargin}{0pt}%
	\setlength{\hoffset}{-0.2in}%
	\setlength{\headheight}{65pt}%
	\setlength{\headsep}{10pt}%
	\setlength{\textheight}{720pt}%
	\setlength{\vsize}{720pt}%
}

% Paste cover and subcover at the beginning of the document
% Set the new geometry and text font for the rest of the document
\AtBeginDocument{%
	\noindent%
	\makecover%
	\noindent%
	\subcover
	\newpage
	\bookbodygeometry
	\sansmath
}

% ============================================================
% Other custom functions
% ============================================================

% Function to force scientific names in title (Opuntia ficus-indica)
\newcommand{\scientificname}[1]{%
	\emph{\textit{\MakeSentenceCase{#1}}}%
}

% Command to write the registeded circle in the title
\newcommand{\registered}{%
	\textsuperscript{\tiny{\circledR}}%
}

% Allows scientific names and specific symbols appear in the bookmarks
% Some of the options can be removed, as they dont really have an effect in the bookmarks text
\pdfstringdefDisableCommands{%
	\def\textit#1{#1}%
	\def\textbf#1{#1}%
	\def\emph#1{#1}%
	%\def\MakeUppercase#1{#1}%
	\def\MakeLowercase#1{#1}%
	\def\ensuremath#1{#1}%
	\def\textsuperscript#1{#1}%
	\def\textsubscript#1{#1}%
	\def\scientificname#1{\NoCaseChange{#1}}%
	\def\registered{®}%
}

% Function to reset the figures and images counter
\newcommand{\cero}{
	\setcounter{figure}{0}
	\setcounter{table}{0}
}

% Remotion of indentation in lists
\setlist[enumerate]{leftmargin=*}
\setlist[itemize]{leftmargin=*}

% Force Shortauthor instead of author's name when possible in citations
\AtEveryCitekey{\ifnameundef{shortauthor}{}{\def\cbx@apa@ifnamesaved{\@firstoftwo}}}

% Change in the bibliography's title
% The function stops the bibliography title from appearing in TOC
\renewenvironment{thebibliography}[1]
	{\section*{\refname}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
		{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\usecounter{enumiv}}%
	\sloppy}
	{\endlist}

% Code to make Sections be labeled as Subsections only in the document viewer's TOC and internet Browers (Chrome, Edge, Firefox, etc.)
% Save the original Section
\let\browserSubsections@oldsection\section

% Define a new Section used only inside the environment
\newcommand{\browserSubsections@section}{%
	\bookmarksetupnext{level=2}%
	\browserSubsections@oldsection
}

% Environment to make sections appear as subsections in Browers and viewer-TOC
\newenvironment{browserSubsections}{%
	\let\browserSubsections@oldsection\section
	\let\section\browserSubsections@section
}{%
	\let\section\browserSubsections@oldsection
}

\endinput
