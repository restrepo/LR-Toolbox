
ParticleDefinitions[GaugeES] = {
      {SdL,  {  Description -> "Left Down-Squarks"}},
      {SdR,  { Description -> "Right Down-Squarks"}},
      {SuL,  { Description -> "Left Up-Squarks"}}, 
      {SuR,  { Description -> "Right Up-Squarks" }},                
      {SeL,  { Description -> "Left Selectron"}}, 
      {SeR,  { Description -> "Right Selectron"}},                         
      {SvL,  { Description -> "Left Sneutrino"}},                         
      {SHd0, { Description -> "Neutral Down-Higgs"}},                         
      {SHdm, { Description -> "Charged Down-Higgs"}}, 
      {SHu0, { Description -> "Neutral Up-Higgs"}},                         
      {SHup, { Description -> "Charged Up-Higgs"}},                                                   
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}},    
      {Glu,  { Description -> "Gluino"}},
      {Wino, { Description -> "Wino"}},
      {Bino, { Description -> "Bino"}},                                                                                           
      {H0,   { Description -> "Neutral Higgsinos"}},
      {HC,   { Description -> "Charged Higgsinos"}},

  {SHx3,      {    LaTeX -> "\\tilde{X}_M"}},
  {SHxb3,      {    LaTeX -> "\\tilde{\\bar{X}}_M"}}, 
  {SHG,      {    LaTeX -> "\\tilde{G}_M"}},
  {SHB,      {    LaTeX -> "\\tilde{B}_M"}},
  {SHw3,      {    LaTeX -> "\\tilde{W}_M"}},
  
  {SHW0,      {    LaTeX -> "\\tilde{W}^0_M"}},
  {SHWp,      {    LaTeX -> "\\tilde{W}^+_M"}},
  {SHWm,      {    LaTeX -> "\\tilde{W}^-_M"}},
  {SHWpp,      {    LaTeX -> "\\tilde{W}^{++}_M"}},
  {SHXu,      {    LaTeX -> "\\tilde{X}^u_M"}},
  {SHXd,      {    LaTeX -> "\\tilde{X}^d_M"}},
  {SHXub,      {    LaTeX -> "\\tilde{\\bar{X}}^u_M"}},
  {SHXdb,      {    LaTeX -> "\\tilde{\\bar{X}}^d_M"}},


  {FHx3,      {    LaTeX -> "X_M"}},
  {FHxb3,      {    LaTeX -> "\\bar{X}_M"}}, 
  {FHG,      {    LaTeX -> "G_M"}},
  {FHB,      {    LaTeX -> "B_M"}},
  {FHw3,      {    LaTeX -> "W_M"}},

      {Fd1,  { Description -> "Dirac Left Down-Quark"}},
      {Fd2,  { Description -> "Dirac Right Down-Quark"}},
      {Fu1,  { Description -> "Dirac Left Up-Quark"}},
      {Fu2,  { Description -> "Dirac Right Up-Quark"}},
      {Fe1,  { Description -> "Dirac Left Electron"}},
      {Fe2,  { Description -> "Dirac Right Electron"}},
      {Fv,   { Description -> "Neutrinos" }}

      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
      {Sd ,  { Description -> "Down-Squarks"}},
      {Su ,  { Description -> "Up-Squarks"}},   
      {Se ,  { Description -> "Sleptons"}}, 
      {SvRe,  { Description -> "CP-even Sneutrino",
		PDG->{1000012,1000014,1000016},
                PDG.IX ->{201000001,201000002,201000003}}},
      {SvIm ,  {Description -> "CP-odd Sneutrino",
		 PDG->{4000012,4000014,4000016},
                PDG.IX ->{202000001,202000002,202000003}}},    
      {hh ,  { Description -> "Higgs" }}, 
      {Ah ,  { Description -> "Pseudo-Scalar Higgs" }},                       
      {Hpm,  { Description -> "Charged Higgs"}},                                                   
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson" }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson" }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},        
      {gG,   { Description -> "Gluon Ghost" }},     
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }},                                                                     
      {Glu,  { Description -> "Gluino" }},
      {Chi,  { Description -> "Neutralinos" }},
      {Cha,  { Description -> "Charginos" }}                                                                                               
        };    
        
        
        
 WeylFermionAndIndermediate = {
       {FHd0, { Description -> "Neutral Down-Higgsino"}},      
       {FHu0, { Description -> "Neutral Up-Higgsino" }}, 
       {FHdm, { Description -> "Charged Down-Higgsino"}},                                                                                                             
       {FHup, { Description -> "Charged Up-Higgsino"}},
       {L0,   { Description -> "Neutralino Weyl-Spinor"}},
       {Lm,   { Description -> "Negative Chargino Weyl-Spinor"}},
       {Lp,   { Description -> "Positive Chargino Weyl-Spinor"}}, 
       {fG,   { Description ->"Gluino Weyl-Spinor"}},
       {fWB,  { Description ->"Wino Weyl-Spinor"}},
       {fW0,  { Description ->"Neutral Wino" }},
       {fWm,  { Description ->"Negative Wino"}},                 
       {fWp,  { Description ->"Positive Wino"}},                 
       {fB,   { Description ->"Bino Weyl-Spinor"}},    
       {phid, { Description -> "Scalar Down"}},                                                                       
       {phiu, { Description -> "Scalar Up"}}, 
       {sigmad,   { Description -> "Pseudo Scalar Down"}},                                                                                        
       {sigmau,   { Description -> "Pseudo Scalar Up" }},
       {SHd,  { Description -> "Down-Higgs"}},
       {SHu,  { Description -> "Up-Higgs"}},
       {Sl,   { Description -> "Left Slepton" }},
       {Sq,   { Description -> "Left Squark" }},
       {FeL,  { Description -> "Left Electron" }},
       {FeR,  { Description -> "Right Electron" }} ,
       {FdL,  { Description -> "Left Down-Quark" }},
       {FdR,  { Description -> "Right Down-Quark" }},              
       {FuL,  { Description -> "Left Up-Quark" }},
       {FuR,  { Description -> "Right Up-Quark" }},
       {FEL,  { Description -> "Rotated Left Electron" }},
       {FER,  { Description -> "Rotated Right Electron" }} ,
       {FDL,  { Description -> "Rotated Left Up-Quark" }},
       {FDR,  { Description -> "Rotated Right Up-Quark" }},              
       {FUL,  { Description -> "Rotated Left Down-Quark"}},
       {FUR,  { Description -> "Rotated Right Down-Quark" }},                
       {FHd,  { Description -> "Down-Higgsino" }},
       {FHu,  { Description -> "Up-Higgsino" }},
       {Fl,   { Description -> "Left Leptons"}},
       {Fq,   { Description -> "Left Quarks"}},
       {FV,   { Description -> "Left-Neutrino-Masseigenstate"}},                     
       {FvL,  { Description -> "Left Neutrino"}},
       {e,    { Description -> "Right Electron Superfield" }},
       {d,    { Description -> "Right Down-Quark Superfield" }},                 
       {q,    { Description -> "Left Quark Superfield" }},                 
       {u,    { Description -> "Right Up-Quark Superfield" }},                 
       {l,    { Description -> "left Lepton Superfield" }},  
       {Hd,   { Description -> "Down-Higgs Superfield"}},                                         
       {Hu,   { Description -> "Up-Higgs Superfield" }},                 
       {G,    { Description -> "Gluon Superfield" }},                 
       {B,    { Description -> "B Superfield" }},                 
       {WB,   { Description -> "W Superfield" }},                                     
                                                                                    
  {Hx3,      {    LaTeX -> "\\hat{X}_M"}},
  {Hxb3,      {    LaTeX -> "\\hat{\\bar{X}}_M"}}, 
  {Hg3,      {    LaTeX -> "\\hat{G}_M"}},
  {Hb3,      {    LaTeX -> "\\hat{B}_M"}},
  {Hw3,      {    LaTeX -> "\\hat{W}_M"}}        
        };       


