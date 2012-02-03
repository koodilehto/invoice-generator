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
\usepackage[finnish]{babel}

% Another font.
\usepackage{mathpazo}

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

} % end AtBeginDocument

