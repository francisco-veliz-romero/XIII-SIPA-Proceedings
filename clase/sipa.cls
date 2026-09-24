\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sipa}[2026/09/24 SIPA Cover Class]

\LoadClass[twoside,a4paper,12pt,openany]{book}

% ============================================================
% Packages
% ============================================================

\RequirePackage[english]{babel}
\RequirePackage{lmodern}
\RequirePackage{helvet}
\RequirePackage{sansmath}

\RequirePackage{expl3}
\RequirePackage{xpatch}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{xstring}

\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{gensymb}
\RequirePackage{academicons}
\RequirePackage{worldflags}
\RequirePackage{wrapstuff}
\RequirePackage{graphicx}
\RequirePackage{adjustbox}

\RequirePackage[showframe=false]{geometry}
\RequirePackage{layout}
\RequirePackage{setspace}

\RequirePackage{tikz}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{enumitem}

\RequirePackage{caption}
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

\RequirePackage{hyperref}

\RequirePackage[style=apa, dashed=true, isbn=true, sorting=editor-year-title, refsection=section]{biblatex}
\addbibresource{referencias_sipa_xiii.bib}

\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	citecolor=blue,
	urlcolor=blue,
	linktocpage
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
	\edef\eventnumber{\uppercase\expandafter{\romannumeral #1}}%
}

% Event's title
\newcommand{\eventtitle}

\newcommand{\titulo}[1]{%
	\renewcommand{\eventtitle}{#1}%
}

% Event's date
\newcommand{\eventdate}

\newcommand{\fecha}[1]{%
	\renewcommand{\eventdate}{#1}%
}

% Functions to add images and text side by side
% Image to the right side and text on the left side
\newcommand{\rightimage}[6]{%
	\begin{tikzpicture}
	\node[anchor=west, inner sep=0pt] at (0,0) {%
		\begin{minipage}{1\textwidth}
			\noindent
			\centering
			\hspace{-1.5cm}
			\begin{minipage}[c]{#1 \textwidth}
				\noindent
				\begin{center}
					\includegraphics[height = #3 cm, width=#4 \linewidth]{#2}
				\end{center}
			\end{minipage}%
			\hspace{0.05cm}%
			\begin{minipage}[c]{#5 \textwidth}
				\begin{center}
				#6
				\end{center}
			\end{minipage}%
		\end{minipage}
	};
	\end{tikzpicture}%
}

% Image to the left  side and text on the right side
\newcommand{\leftimage}[6]{%
	\begin{tikzpicture}
	\node[anchor=west, inner sep=0pt] at (0,0) {%
		\begin{minipage}[c]{1\textwidth}
			\noindent
			\centering
			\hspace{-1.5cm}
			\begin{minipage}[c]{#5 \textwidth}
				\begin{center}
				#6
				\end{center}
			\end{minipage}%
			\hspace{0.05cm}%
			\begin{minipage}[c]{#1 \textwidth}
				\noindent
				\begin{center}
					\includegraphics[height = #3 cm, width=#4 \linewidth]{#2}
				\end{center}
			\end{minipage}%
		\end{minipage}
	};
	\end{tikzpicture}%
}

% Two images
\newcommand{\images}[8]{%
	\begin{tikzpicture}
	\node[anchor=west, inner sep=0pt] at (0,0) {%
		\begin{minipage}[c]{1\textwidth}
			\noindent
			\centering
			\hspace{-1.5cm}
			\begin{minipage}[c]{#1 \textwidth}
				\noindent
				\begin{center}
					\includegraphics[height = #3 cm, width=#4 \linewidth]{#2}
				\end{center}
			\end{minipage}%
			\hfil%
			\begin{minipage}[c]{#5 \textwidth}
				\noindent
				\begin{center}
					\includegraphics[height = #7 cm, width=#8 \linewidth]{#6}
				\end{center}
			\end{minipage}%
		\end{minipage}
	};
	\end{tikzpicture}%
}

% Big image
\newcommand{\bigimage}[3]{%
	\begin{tikzpicture}
	\node[anchor=west, inner sep=0pt] at (0,0) {%
		\begin{minipage}[c]{1\textwidth}
			\noindent
			\centering
			\hspace{-1.5cm}
			\begin{minipage}[c]{1\textwidth}
				\noindent
				\begin{center}
					\includegraphics[height = #2 cm, width=#3 \linewidth]{#1}
				\end{center}
			\end{minipage}
		\end{minipage}
	};
	\end{tikzpicture}%
}

% Specific code to omit the bibliography title in TOC
\defbibheading{misubseccion}[\bibname]{%
	\subsection*{#1}%
}

% Function to force scientific names in title (Opuntia ficus-indica)
\newcommand{\scientificname}[1]{%
	\emph{\textit{\MakeSentenceCase{#1}}}%
}

% ============================================================
% Proceedings general dimensions
% ============================================================

\newcommand{\bookbodygeometry}{%
	\newgeometry{
		textwidth=185mm,
		top=0in,
		bottom=2in,
		footskip=19pt
	}%
	\setlength{\oddsidemargin}{0pt}%
	\setlength{\evensidemargin}{0pt}%
	\setlength{\hoffset}{-0.5in}%
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

%%%%%%%%%% Format of tables and images
\DeclareCaptionLabelFormat{figlabel}{Fig.~#2}
\captionsetup[figure]{
	name		   = Figure,
	labelformat  = figlabel,
	labelsep     = period,
	font         = normalsize,
	justification= raggedright,
	position     = below,
	skip         = 6pt
}
\captionsetup[table]{
	name         = Table,
	labelsep     = period,
	font         = normalsize,
	justification= raggedright,
	position     = above,
	skip         = 6pt
}

%%%%%%%%%%%%% Cuerpo inicial resumenes y documentos
% Function to reset the figures and images counter
\newcommand{\cero}{
	\setcounter{figure}{0}
	\setcounter{table}{0}
}

% Function to remove indentation in lists
\setlist[enumerate]{leftmargin=*}
\setlist[itemize]{leftmargin=*}

% Function to force Shortauthor instead of author's when possible in text
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

\endinput
