\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmut-report}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[utf8]{vntex,inputenc}
\RequirePackage{anyfontsize,amsmath,amssymb}
\RequirePackage[T5]{fontenc}

\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{booktabs}
\RequirePackage[center]{caption}

\RequirePackage{fancyhdr,hyperref}
\RequirePackage[super,square,sort]{natbib}
\RequirePackage[nameinlink]{cleveref} % use \Cref{} instead of \ref{}

% Change to '[english,vietnamese]' to use Vietnamese labels
\RequirePackage[english]{babel}

% Draft watermark
% https://github.com/callegar/LaTeX-draftwatermark

% Custom commands
\newcommand{\Month}{
    \ifcase \the\month
    \or January
    \or February
    \or March
    \or April
    \or May
    \or June
    \or July
    \or August
    \or September
    \or October
    \or November
    \or December
    \fi
}

\newcommand{\@upperuniname}{Politecnico di Milano}
\newcommand{\@uniname}{Corso di Laurea in Ingegneria Informatica }

\newcommand{\@deptname}{Scuola di Ingegneria Industriale e dell'Informazione}
\newcommand{\deptname}[1]{\renewcommand{\@deptname}{#1}}

\newcommand{\@coursename}{Course name}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}

\newcommand{\@reporttype}{Assignment Report}
\newcommand{\reporttype}[1]{\renewcommand{\@reporttype}{#1}}

\renewcommand{\@title}{Report title}

\newcommand{\@advisor}{Prof.}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}}

\newcommand{\@reportplace}{Milano}
\newcommand{\reportplace}[1]{\renewcommand{\@reportplace}{#1}}

\renewcommand{\@author}{Autore:}

\newcommand{\@studentPersonalCode}{Codice Persona: }
\newcommand{\studentPersonalCode}[1]{\renewcommand{\@studentPersonalCode}{#1}}

\newcommand{\@studentMatricola}{Matricola: }
\newcommand{\studentMatricola}[1]{\renewcommand{\@studentMatricola}{#1}}

\newcommand{\@reporttime}{\Month \the\year}
\newcommand{\reporttime}[1]{\renewcommand{\@reporttime}{#1}}

% Configurations
%\graphicspath{{subdir1/}{subdir2/}{subdir3/}...{subdirn/}}

\geometry{
    paper=a4paper,
    left=3cm,
    right=2cm,
    vmargin=2cm,
    includeheadfoot=true,
    headheight=30pt
}

\onehalfspacing
\raggedbottom

% Allow page breaks inside align* environment
%\allowdisplaybreaks{}

% Makes a lot of things blue, avoid at all costs
%\everymath{\color{blue}}

% Numbering format
% {equation}{section} means <section number>.<equation number>
% {equation}{subsection} means <section number>.<subsection number>.<equation number>
%\numberwithin{equation}{section}

% Set depth of numbering for sections and table of contents
%\setcounter{secnumdepth}{3}
%\setcounter{tocdepth}{3}

\AtBeginDocument{\renewcommand*\bibname{References}}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=red,
    urlcolor=blue
}

\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0pt}

\pagestyle{fancy}
\fancyhf{}

%\renewcommand{\subsectionmark}[1]{\markright{\thesubsection.\ #1}}

\if@twoside
\fancyhead[EL]{
    \bfseries
    \begin{tabular}{cl}
        \begin{picture}(100,20)(0,0)
            \put(0,0){\includegraphics[width=100]{graphics/polimi.png}}
        \end{picture}
        \begin{tabular}{cl}
            \@author\\
            \@reporttype
        \end{tabular}
    \end{tabular}
}
\fancyhead[OR]{
    \bfseries
    \begin{tabular}{rl}
        \begin{tabular}{r}
            \ttfamily\@uniname \\
            \ttfamily\@deptname \\
        \end{tabular}
        \begin{picture}(25,15)(0,0)
            \put(0,-8){\includegraphics[width=8mm]{graphics/hcmut.png}}
        \end{picture}
    \end{tabular}
}
\else
\fancyhead[R]{
    \bfseries
    \begin{tabular}{rl}
        \begin{tabular}{r}
            \ttfamily\@uniname \\
            \ttfamily\@deptname \\
        \end{tabular}
        \begin{picture}(25,15)(0,0)
            \put(0,-8){\includegraphics[width=8mm]{graphics/hcmut.png}}
        \end{picture}
    \end{tabular}
}
\fi

\fancyfoot[C]{\thepage}

% Custom pages and sections
\newcommand{\coverpage}{
    \pagestyle{empty}

    \vspace*{-3\baselineskip}
    \begin{center}
        \MakeUppercase{\@upperuniname}

        \@uniname

        \@deptname
        \vfill
        \includegraphics[scale=0.4]{graphics/polimi2.png}
        \vfill
        \bfseries
        \begin{tabular}{c}
            \Large\@coursename                                 \\
            {}                                                 \\
            \midrule                                           \\
            {}                                                 \\
            \Large\@reporttype                                 \\
            {}                                                 \\
            \Huge\parbox[c]{0.8\linewidth}{\centering \@title} \\
            {}                                                 \\
            \bottomrule
        \end{tabular}
        \vfill
        \mdseries
        \begin{tabular}{rll}
            Autore: & \@author \\
            Matricola: &\@studentMatricola\\
            Codice Persona: &\@studentPersonalCode\\

            Prof.: & \@advisor & \\
        \end{tabular}
        \vfill
        \@reportplace, \@reporttime

    \end{center}

    \cleardoublepage
    \pagestyle{fancy}
}
