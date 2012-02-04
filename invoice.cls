% Invoice for small business.
% 2012-02-03 Tuomo Sipola (tuomo.sipola@iki.fi)

% 2012-02-03 Initial version.

% Identification.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{invoice}[2012/02/03 Invoice for small business.]

% Bases on article class.
\LoadClass{article}

% Input UTF-8 text, Finnish language.
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[finnish,english]{babel}

% Declare options.
\DeclareOption{finnish}{
    \newcommand{\invoicename}{Lasku}
    \newcommand{\businessidname}{Y-tunnus}
    \newcommand{\phonename}{Puh}
    \newcommand{\faxname}{Fax}
    \newcommand{\billto}{Vastaanottaja}
    \newcommand{\datename}{Laskun päiväys}
    \newcommand{\invoiceidname}{Laskun tunniste}
    \newcommand{\customeridname}{Asiakkaan tunniste}
    \newcommand{\termofpaymentname}{Maksuehto}
    \newcommand{\duedatename}{Eräpäivä}
    \newcommand{\productname}{Tuote}
    \newcommand{\netpricename}{Nettohinta}
    \newcommand{\vatname}{Alv}
    \newcommand{\totalpricename}{Yhteensä}
    \newcommand{\thankyouname}{Thank you for your business!}
    \selectlanguage{finnish}
}
\DeclareOption{english}{
    %TODO
}
\ProcessOptions

% Another font.
\usepackage{tgheros}
\renewcommand*\familydefault{\sfdefault}

% Graphics inclusion for logo.
\usepackage[pdftex]{graphicx}
\usepackage{wrapfig}

% Geometry for paper size declaration.
\usepackage{geometry}
\geometry{a4paper, left=15mm, right=15mm, top=15mm, bottom=15mm}

% Company info definitions.
\newcommand{\name}[1]{\newcommand{\thename}{#1}}
\newcommand{\address}[1]{\newcommand{\theaddress}{#1}}
\newcommand{\postcode}[1]{\newcommand{\thepostcode}{#1}}
\newcommand{\postoffice}[1]{\newcommand{\thepostoffice}{#1}}
\newcommand{\phone}[1]{\newcommand{\thephone}{#1}}
\newcommand{\fax}[1]{\newcommand{\thefax}{#1}}
\newcommand{\businessid}[1]{\newcommand{\thebusinessid}{#1}}
\newcommand{\bank}[1]{\newcommand{\thebank}{#1}}
\newcommand{\iban}[1]{\newcommand{\theiban}{#1}}
\newcommand{\bic}[1]{\newcommand{\thebic}{#1}}
\newcommand{\logo}[1]{\newcommand{\thelogo}{#1}}

% Recipient info definitions.
\newcommand{\billtoname}[1]{\newcommand{\thebilltoname}{#1}}
\newcommand{\billtoaddress}[1]{\newcommand{\thebilltoaddress}{#1}}
\newcommand{\billtopostcode}[1]{\newcommand{\thebilltopostcode}{#1}}
\newcommand{\billtopostoffice}[1]{\newcommand{\thebilltopostoffice}{#1}}

% For PDF metadata.
\usepackage{hyperxmp}
\usepackage[
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    linktoc=all,
    bookmarks=true,
    pdflang={fi}
]{hyperref}

\AtBeginDocument{

% PDF meta information.
\hypersetup{
    pdftitle=Invoice
}

\pagestyle{empty}

% Show basic information and logo.
\begin{wrapfigure}{l}{2.5cm}
    \includegraphics[width=2.5cm]{\thelogo}
\end{wrapfigure}
\noindent\thename \hfill \MakeUppercase{\invoicename}\\
\theaddress\\
\thepostcode\ \MakeUppercase{\thepostoffice}\\
\ifdefined\thephone
    \phonename: \thephone\\
\fi
\ifdefined\thefax
    \faxname: \thefax\\
\fi
\businessidname: \thebusinessid\\

\noindent\MakeUppercase{\billto}\\
\thebilltoname\\
\thebilltoaddress\\
\thebilltopostcode\ \thebilltopostoffice\\

\noindent\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} l l l l}
    \textbf{\productname} & \textbf{\netpricename} & \textbf{\vatname} & \textbf{\totalpricename} \\
    & & & \\
    \input{descr.tex}
\end{tabular*}

} % end AtBeginDocument

\AtEndDocument{

\begin{center}
    \thankyouname
\end{center}

} % end AtEndDocument

