%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[T1]{fontenc}
\usepackage[parfill]{parskip}         % Do not indent pragraphs
\usepackage{array}                    % required for boldface tabular columns
\usepackage{ifthen}

\nofiles                            % .aux files are not needed for resumes
\pagestyle{empty}                   % resumes do not need page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}}        % \name command can be used to set name
\def \@name {}                      % Set \@name to empty by default

% \def \addresssep {\ \textemdash \ }         % Set default address seperator
% \def \addresssep {\ \ \ \ \ }         % Set default address seperator
\def \addresssep {\ \textemdash \ }         % Set default address seperator

% One, two or three address lines can be specified
\let \@addressone   \relax
\let \@addresstwo   \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address
% (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \def \addressone {#1}
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addresssep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil \textbf{\textsc{\namesize \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document                     % Begin document
  \printname                        % Print the name specified with \name
  \@ifundefined{@addressone}{}{     % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{     % Print the second address if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Used to create large resume section
\newenvironment{rSection}[1]{
  \sectionskip
  \large\textsc{#1}
  \sectionlineskip
  \hrule
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
  }
  \item[]
}{
  \end{list}
  \vspace{-0.1em}
}

\newenvironment{rMinisection}[0]{
  \begin{list}{}{\leftmargin=0.0em}
  \itemsep -0.5em \vspace{-0.0em}
}{
  \end{list}
  \vspace{-0.1em}
}


\newenvironment{rProjectSection}[0]{
  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    Project (bold)                        URL (emphasis)   %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \vspace{0.5em}
  \begin{list}{$\cdot$}{\leftmargin=1.0em}
  \itemsep -0.5em \vspace{-0.5em}
  }{
  \end{list}
  \vspace{-0.1em}
}

\newenvironment{rBlurbSection}[0]{
  \begin{list}{}{\leftmargin=0.0em}
  \itemsep -0.5em \vspace{-0.0em}
  }{
  \end{list}
  \vspace{-0.1em}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{
  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    Employer (bold)                     Dates (regular)    %%
  %%    Title (emphasis)                Location (emphasis)    %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  {\bf #1}                 \hfill                  {    #2}
  \ifthenelse{\equal{#3}{}}{}{
  \\
  {\em #3}                 \hfill                  {\em #4}
  }\smallskip
  % \cdot used for bullets, items indented
  \begin{list}{$\cdot$}{\leftmargin=1.0em}
  \itemsep -0.5em \vspace{-0.7em}
}{
  \end{list}
  \vspace{-0.1em}
}

\newenvironment{rDualWorkSection}[8]{
  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    Employer (bold)                 Location (emphasis)    %%
  %%    Title (emphasis)                    Dates (regular)    %%
  %%    Title (emphasis)                    Dates (regular)    %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  {\bf #1}                 \hfill                  {\em #2}
  \\
  {\em #3}                 \hfill                  { #4}
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=1.0em}
  \itemsep -0.5em \vspace{-0.5em}
  {#5}
  \end{list}
  {\em #6}                 \hfill                  { #7}
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=1.0em}
  \itemsep -0.5em \vspace{-0.5em}
  {#8}
  \end{list}
  \vspace{-0.1em}
}

\newenvironment{rEducationSection}[3]{
  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    School name (bold)                  Dates (regular)    %%
  %%    Title (emphasis)                      GPA (regular)    %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  {\bf #1}                 \hfill                  {#2} \\
  {\em #3}
  \smallskip
  \vspace{-0.1em}
}

\newenvironment{rWorkSection}[5]{
  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    Employer (bold)                 Location (emphasis)    %%
  %%    Title (emphasis)                    Dates (regular)    %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  {\bf #1}                 \hfill                  {\em #2}
  \ifthenelse{\equal{#3}{}}{}{
  \\
  {\em #3}                 \hfill                  { #4}
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=1.0em}
  \itemsep -0.5em \vspace{-0.5em}
  {#5}
  \end{list}
  \vspace{-0.1em}
}

\def\namesize{\LARGE}
\def\nameskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\sectionskip{\smallskip}
\def\addressskip{\medskip}
