/* =================================
   CLINICAL-LABORATORY DATA ANALYSIS
   === SAS code ===
   ================================= */

/* ==============================
   MASTER SCRIPT 
   (obligatory, always run first)
   ============================== */

/* --- Define paths --- */
%let ROOT      = /home/u64285960;
%let DATADIR   = &ROOT.;
%let OUTPUTDIR = &ROOT./outputs;

/* --- Check file existence --- */
data _null_;
  if fileexist("&DATADIR./CarmelMC_LungCancer.xlsx") then
    put "NOTE: File found ✔";
  else
    put "ERROR: Excel file not found ✘";
run;

/* --- Import Excel into WORK --- */
proc import datafile="&DATADIR./CarmelMC_LungCancer.xlsx"
  out=work.lc_raw
  dbms=xlsx replace;
  sheet="Sheet1";
  getnames=yes;
  guessingrows=max;
run;

/* --- Define formats --- */
proc format;
  value mutf    0='No mutation' 1='Mutation detected' .= 'Not tested/NA';
  value pdl1f   0='Weak (TPS 1–49%)' 1='Strong (TPS ≥ 50%)';
  value msif    0='MSS' 1='MSI-L' 2='MSI-H';
  value dxf     0='ACA, NOS' 1='Mucinous ACA'
                 2='SCC' 3='Carcinoid (typical/atypical)'
                 4='High-grade NEN';
  value sexf    0='Male' 1='Female';
  value ethnicf 0='Jewish' 1='Arab (NOS)' 2='Arab (Druze)' 3='Arab (Bedouin)';
  value distf   0='Haifa District' 1='Northern District';
  value smokef  0='Never or quit >10y' 1='Current or quit ≤10y';
run;

/* --- Clean up dataset --- */
data work.lc;
  set work.lc_raw;
  format
    sex sexf.
    ethnic ethnicf.
    district distf.
    smoking smokef.
    dx dxf.
    pdl1 pdl1f.
    msi msif.
    egfr kras braf met erbb2 alk ros1 ntrk ret mutf.
    bx_date date9.;
run;

/* ==================
   FACULTATIVE BLOCKS 
   (run as needed)
   ================== */

/* Kernel Density Estimation (KDE) of lung cancer cases */
/* Each patient has locality coordinates (lat, lon)          */
/* KDE will highlight spatial clustering (“hot spots”)       */

proc kde data=work.lc out=lc_kde;
   bivar longitude latitude / plots=contour gridl=60 gridu=60;
run;

/* Visualize contour map of density */
proc gcontour data=lc_kde;
   plot latitude*longitude=density;
run;
