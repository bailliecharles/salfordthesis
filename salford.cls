% salfordthesis class
% ==================
% A LaTeX class for producing thesis documents conforming to the
% University of Salford, School of Environment & Life Sciences guidelines
% Developed directly from University of Calgary thesis class
% available here: https://github.com/rzach/ucalgmthesis
%
% Charles Baillie
%
% The latest version of the class is available at
% https://github.com/bailliecharles/salfordthesis
%
% Distributed under the terms of the MIT License
% https://opensource.org/licenses/MIT

\ProvidesClass{salford}[04/05/2019 University of Salford]

\NeedsTeXFormat{LaTeX2e}[1994/06/01]

%% Options for spacing (default is 1.5 spacing)

% All pages must be double or one-and-one-half spaced (Note: this
% includes your Abstract, Acknowledgments, Dedications, etc.).  You
% can use single-line spacing if you have a long Table of Contents,
% List of Tables, List of Figures, or for long quotes in the body of
% your thesis). Use \verb|memoir|'s \verb|SingleSpace| environment to
% typeset, e.g., a quotation single spaced.

\DeclareOption{singlespaced}{\AtEndOfClass{\SingleSpacing}}
\DeclareOption{onehalfspaced}{\AtEndOfClass{\OnehalfSpacing}}
\DeclareOption{doublespaced}{\AtEndOfClass{\DoubleSpacing}}

% Options for typefaces
% ONLY sans serif accepted in final submission - tgheros is default
\DeclareOption{tgheros}
              {\AtEndOfClass{\usepackage{tgheros}
		\renewcommand*\familydefault{\sfdefault}
		\usepackage[T1]{fontenc}}}

\DeclareOption{palatino}
              {\AtEndOfClass{\usepackage[T1]{fontenc}
                  \usepackage{amsthm} % load amsthm before newpxmath
                  \usepackage{newpxtext,newpxmath}}}
\DeclareOption{times}
              {\AtEndOfClass{\usepackage[T1]{fontenc}
                  \usepackage{amsthm} % load amsthm before newtxmath
                  \usepackage{newtxtext,newtxmath}}}


              
% options for headings
\DeclareOption{plain}{\AtBeginDocument{\pagestyle{plain}}}
\DeclareOption{headers}{\AtBeginDocument{\pagestyle{salfordruled}}}

% options for the typeblock

% fullpage uses the entire space available: 1 in on all sides, set the
% typeblock to fill to the margins. We do this when the class is loaded
% so it takes into account any changes to the fonts and type
% size made using the class options, but not anything done later
% after the class is called. Since memoir will set the line
% width to \textwidth when it first computes the default type block
% size, we have to reset that after we change the type block.

\DeclareOption{fullpage}{
  \AtEndOfClass{\fullpagethesis}}

% manuscript sets the typeblock to approximately 72 characters by 25
% lines at 12pt and using double line spacing and sets left and right
% margins evenly.
              
\DeclareOption{manuscript}{
  \PassOptionsToClass{12pt}{memoir}
  \ExecuteOptions{doublespaced}
  \AtEndOfClass{\manuscriptthesis}}

% All other options are passed to the base class directly.

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

% By default, typeset with one half spacing, no running heads, 11 pt

\ExecuteOptions{onehalfspaced,plain}

% Tell memoir the document has to be one-sided (i.e., don't switch
% margins, etc.) and don't add empty pages before new chapters

\PassOptionsToClass{openany,oneside,11pt}{memoir}
\ProcessOptions

% now load memoir

\LoadClass{memoir}

% Commands to set up type block and margins based on selected typeface
% and size. These are called after the class loads, but before the
% rest of the preamble.

% fullpagethesis sets the margins to 1in on all sides, so maximum
% allowed space is used.

\newcommand{\fullpagethesis}{%
  \settypeblocksize{9in}{6.5in}{*}%
  \setlrmarginsandblock{1in}{*}{*}%
  \setulmarginsandblock{1in}{*}{*}%
  \checkandfixthelayout}

% \manuscriptthesis sets the typeblock to 25 lines per 72 characters
% (approx.) per line, and vertically centers the page. Left and right
% margins are left to memoir: equal margins for onesided (default),
% wider outside margins for twosided.

\newcommand{\manuscriptthesis}{%
  \setlxvchars
  \settypeblocksize{25\baselineskip}{1.1\lxvchars}{*}%
  \setulmargins{*}{*}{*}%
  \checkandfixthelayout}

% fix a bug in mathdesign

\newcommand*{\fixmdhrulefill}{\def\hrulefill{\leavevmode\leaders \hrule height \rulethickness \hfill\kern\z@}}

% \makethesistitle formats the title page
% author, title, and year set in main.tex

\newcommand{\makethesistitle}{
  \begin{titlingpage*}
    \begin{center}\begin{DoubleSpace}
      \begin{figure}[htbp]\centering
	\includegraphics[scale=0.2]{salford.jpg}
      \end{figure}
      \vfill
      {\textbf{\@title} \par} 
      \vfill        
      \vfill
      {\@author \par}
      {\@monthname \hspace{1mm} \@gradyear \par}
      \vfill 
      Submitted in fulfillment of the requirements for the degree of \par
      Doctor of Philosophy \par
      School of Environment \& Life Sciences \par
      University of Salford, Manchester\\
      \vfill
      \vfill
      %{\copyright\ {\@author}~{\@gradyear} \par} % uncomment if you want to include a copyright statement
    \end{DoubleSpace}\end{center}
  \end{titlingpage*}
}

% Commands for the thesis title page
\def\gradyear#1{\gdef\@gradyear{#1}}
\let\thesisyear\gradyear
\def\monthname #1{\gdef\@monthname{#1}}
\def\thesis#1{\gdef\@thesis{\uppercase{#1}}}
\thesis{Thesis}

% Ruled pagestyle according to rules: folio centered in footer,
% headers with a rule. Chapter number and title flush right.  Also
% works twosided, in which case the verso headers hold the chapter
% title and the recto headers the section title.
% ONLY one-sided accepted in final submission. 

\copypagestyle{salfordruled}{ruled}
\if@twoside
    \makeevenhead{salfordruled}{\leftmark}{}{}
    \makeoddhead{salfordruled}{}{}{\rightmark}
\else
    \makeoddhead{salfordruled}{}{}{\leftmark}
\fi

\makeoddfoot{salfordruled}{}{\thepage}{}
\makeevenfoot{salfordruled}{}{\thepage}{}

% Since the TOC must include everything in the front matter, the
% default TOC style looks odd. We reduce the space between chapter
% entries and add dotted leaders also to chapters.

\setlength{\cftbeforechapterskip}{3pt plus 0pt}
\renewcommand{\cftchapterleader}{\normalfont\cftdotfill{\cftsectiondotsep}}
\renewcommand{\contentsname}{Table of Contents}

% we need toc, lof, lot to begin on a new page

\def\tocheadstart{\clearpage}
\def\lofheadstart{\clearpage}
\def\lotheadstart{\clearpage}
