\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{third-rep}[2001/04/03 UMCSD Third year report style]

\DeclareOption{draftgraphics}{\PassOptionsToPackage{draft}{graphicx}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% PROCESS OPTIONS
\ProcessOptions

\LoadClass{report}
\usepackage[margin=2.5cm]{geometry}
\usepackage{graphicx}
\usepackage{verbatim}
\usepackage{enumitem}

\newif\ifthanks@
\thanks@false
\def\thanksfile#1{\gdef\@thanksfile{#1}\thanks@true}

\def\supervisor#1{\gdef\@supervisor{#1}}
\def\reportyear#1{\gdef\@reportyear{#1}}
\def\abstractfile#1{\gdef\@abstractfile{#1}}
\def\studentid#1{\gdef\@studentid{#1}}
\def\@title{}
\def\@author{}
\def\@studentid{}
\def\@supervisor{}
\def\@thesis{project report}
\def\@dept{Department of Computer Science}
\def\@faculty{Science and Engineering}
\def\@degreetitle{Bachelors of Science}
\reportyear{2001}
\abstractfile{null}

\def\titlep{%
    \thispagestyle{empty}%
    \null\vskip1in%
    \begin{center}
        \Huge\uppercase\expandafter{\@title}
    \end{center}
    \vfill
    \begin{center}
        \textsc{A \expandafter{\@thesis} submitted to The University of Manchester\\
        for the degree of \@degreetitle\\
        in the Faculty of \@faculty}
    \end{center}
    \vfill
    \begin{center}
        \@reportyear
    \end{center}
    \vfill
    \begin{center}
        \normalfont
        \@author\\
        \@studentid\\
        Supervisor: \@supervisor\\
    \end{center}
    \vfill
    \begin{center}
        \expandafter{\@dept}
    \end{center}\vskip.5in
    {\pagestyle{empty}\cleardoublepage}%
}

\def\declpage{%
  \thispagestyle{empty}
  \chapter*{Declaration}

  \parindent=0pt
  No portion of the work referred to in this \expandafter{\@thesis} has been
  submitted in support of an application for another degree or
  qualification of this or any other university or other
  institute of learning.
  \par%
}


\def\copyright{
  \thispagestyle{empty}
  \chapter*{Copyright}
  \thispagestyle{empty}
  \begin{enumerate}[label=\roman*.]
    \setlength{\itemsep}{-2pt}%
    \item The author of this \expandafter{\@thesis} (including any appendices and/or
      schedules to this thesis) owns certain copyright or related rights
      in it (the ``Copyright'') and they have given The University of
      Manchester certain rights to use such Copyright, including for
      administrative purposes.
    \item Copies of this thesis, either in full or in extracts and
      whether in hard or electronic copy, may be made \textbf{only} in
      accordance with the Copyright, Designs and Patents Act 1988 (as
      amended) and regulations issued under it or, where appropriate, in
      accordance with licensing agreements which the University has from
      time to time. This page must form part of any such copies made.
    \item The ownership of certain Copyright, patents, designs,
      trade marks and other intellectual property (the ``Intellectual
      Property'') and any reproductions of copyright works in the thesis,
      for example graphs and tables (``Reproductions''), which may be
      described in this thesis, may not be owned by the author and may be
      owned by third parties. Such Intellectual Property and Reproductions
      cannot and must not be made available for use without the prior
      written permission of the owner(s) of the relevant Intellectual
      Property and/or Reproductions.
    \item Further information on the conditions under which
      disclosure, publication and commercialisation of this thesis, the
      Copyright and any Intellectual Property and/or Reproductions
      described in it may take place is available in the University IP
      Policy (see
      \url{http://documents.manchester.ac.uk/DocuInfo.aspx?DocID=24420}), in
        any relevant Thesis restriction declarations deposited in the
        University Library, The University Library's regulations (see
        \url{http://www.library.manchester.ac.uk/about/regulations/}) and
        in The University's policy on presentation of Theses 
  \end{enumerate} 
}

\def\abstract{%
    \clearpage  
    \chapter*{Abstract}
    \textbf{\large \@title}
    \par\vspace{0.3cm}
    \noindent\textit{\@author, Supervisor: \@supervisor}
    \par\vspace{0.6cm}
    \normalsize
    \parindent=0pt
    \thispagestyle{empty}
    \par
    \input \@abstractfile \relax
    \par%
}

\def\dotitleandabstract{%
    \titlep
    \declpage
    \copyright
    \abstract
    \ifthanks@{
        \clearpage
        \chapter*{Acknowledgements}
        \thispagestyle{empty}
        \input{\@thanksfile}
    }
    \fi%
}
