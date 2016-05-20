(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



MakeCouplingLists:=Block[{i,j,k,temp,pos},
For[i=1,i<=Length[ITypes],
ISec=Intersection[ITypes[[i]]];
For[j=1,j<=Length[ISec],
For[k=1,k<=Length[ISec],
partI[ITypes[[i,1]]][ISec[[j]]][ISec[[k]]]=Table[{},{Length[PART[ISec[[j]]]]}];
k++;];
j++;];
i++;];

For[i=1,i<=Length[VertexListNonCC],
For[j=1,j<=Length[VertexListNonCC[[i,1,1]]],
p1=VertexListNonCC[[i,1,1,j]];
pos=Position[PART[getType[p1]],getBlank[p1]][[1,1]];
For[k=1,k<=Length[VertexListNonCC[[i,1,1]]],
If[k!=j,
p2=VertexListNonCC[[i,1,1,k]];
temp = partI[VertexListNonCC[[i,2]]][getType[p1]][getType[p2]];
temp[[pos]]=Join[temp[[pos]],{getBlank[p2]}];
partI[VertexListNonCC[[i,2]]][getType[p1]][getType[p2]] = temp;
];
k++;];
j++;];
i++;];

For[i=1,i<=Length[ITypes],
ISec=Intersection[ITypes[[i]]];
For[j=1,j<=Length[ISec],
For[k=1,k<=Length[ISec],
partListInv[ITypes[[i,1]],ISec[[j]],ISec[[k]]]=Intersection/@partI[ITypes[[i,1]]][ISec[[j]]][ISec[[k]]];
k++;];
j++;];
i++;];

For[i=1,i<=Length[ITypes],
If[Length[SA`VertexList[ITypes[[i,1]]]]>0,
VerticesInv[ITypes[[i,1]]]=Apply[C,Transpose[SA`VertexList[ITypes[[i,1]]]][[1]] /. (A_[{a__}]:> A /;A=!=List),1];
VerticesOrg[ITypes[[i,1]]]=Transpose[SA`VertexList[ITypes[[i,1]]]][[1]];
VerticesVal[ITypes[[i,1]]]=ExtractVertexValues[SA`VertexList[ITypes[[i,1]]],ITypes[[i,1]]];(* Transpose[SA`VertexList[ITypes[[i,1]]]][[2]]; *)
If[FreeQ[ITypes[[i]],F],
If[ITypes[[i,1]]=!=VVVV,
VerticesValSUM[ITypes[[i,1]]]=Transpose[SA`VertexList[sum][ITypes[[i,1]]]][[2]];,
VerticesValSUM[ITypes[[i,1]]]=Transpose[Delete[Transpose[SA`VertexList[sum][ITypes[[i,1]]]],1]];
];,
VerticesValSUM[ITypes[[i,1]]]=Transpose[Delete[Transpose[SA`VertexList[sum][ITypes[[i,1]]]],1]];
];,
VerticesInv[ITypes[[i,1]]] = {};
VerticesOrg[ITypes[[i,1]]] = {};
VerticesVal[ITypes[[i,1]]] = {};
VerticesValSUM[ITypes[[i,1]]]={};
];
i++;];

VerticesInv[All]=Flatten[{VerticesInv[FFS],VerticesInv[FFV],VerticesInv[SSS],VerticesInv[SSSS],VerticesInv[SSVV],
VerticesInv[SVV],VerticesInv[SSV],VerticesInv[GGV],VerticesInv[GGS],VerticesInv[VVV],VerticesInv[VVVV]}];
VerticesVal[All]=Flatten[{VerticesVal[FFS],VerticesVal[FFV],VerticesVal[SSS],VerticesVal[SSSS],VerticesVal[SSVV],
VerticesVal[SVV],VerticesVal[SSV],VerticesVal[GGV],VerticesVal[GGS],VerticesVal[VVV],VerticesVal[VVVV]},1];
VerticesOrg[All]=Flatten[{VerticesOrg[FFS],VerticesOrg[FFV],VerticesOrg[SSS],VerticesOrg[SSSS],VerticesOrg[SSVV],
VerticesOrg[SVV],VerticesOrg[SSV],VerticesOrg[GGV],VerticesOrg[GGS],VerticesOrg[VVV],VerticesOrg[VVVV]},1];

InitDiagramGeneration;
];

ExtractVertexValues[list_,Type_]:= Block[{i,j,temp={}},
Switch[Type,
FFS | FFV,
For[i=1,i<=Length[list],
If[list[[i,2,1]]===0,
temp=Join[temp,{{list[[i,3]]}}];,
temp=Join[temp,{{list[[i,2]]}}];
];
i++;];
Return[temp];,
_,
Return[Transpose[list][[2]]];
];
];



AddUnrotatedVertex[coup_,matrix_]:=Block[{pos,vertex,parts},
If[coup[[1]]=!=SSSS && coup[[1]] =!=SSVV  && coup[[1]] =!=VVVV,
pos=Position[VerticesInv[coup[[1]]],C[coup[[2]],coup[[3]],coup[[4]]]][[1,1]];
vertex=Extract[VerticesValSUM[coup[[1]]],pos];
parts=Extract[VerticesOrg[coup[[1]]],pos];

pos2 = Position[parts /.  A_[{a__}]-> A,coup[[2]]][[1,1]];

GT = generation /. subGC[pos2] /.subIndFinal[pos2,pos2];
If[Length[matrix]==0,
vertex = vertex /. {matrix[GT,a_]-> Delta[GT,a]}  /. sumExp->sum;,
vertex = vertex /. {matrix[[1]][GT,a_]-> Delta[GT,a],matrix[[2]][GT,a_]-> Delta[GT,a]} /. sumExp->sum;
];

If[getGen[coup[[2]]]>1,
SubParticle = {getBlank[coup[[2]]][{GT,a___}]->ToExpression["U"<>ToString[getBlank[coup[[2]]]]][{GT,a}]};,
SubParticle = {};
];

If[Length[Dimensions[vertex]]==2,
Return[{parts /. SubParticle,vertex[[1]],vertex[[2]]}];,
Return[{parts /. SubParticle,vertex}];
];,

pos=Position[VerticesInv[coup[[1]]],C[coup[[2]],conj[coup[[2]]],coup[[3]],coup[[4]]]][[1,1]];
vertex=Extract[VerticesValSUM[coup[[1]]],pos];
parts=Extract[VerticesOrg[coup[[1]]],pos];

If[Head[coup[[2]]]===conj || Head[coup[[2]]]===bar,
pos2 = Position[parts /.  A_[{a__}]-> A,coup[[2]]][[1,1]];
pos3 = Select[Position[parts /.  A_[{a__}]-> A,conj[coup[[2]]]],(Length[#]===1)&];,
pos3 = Position[parts /.  A_[{a__}]-> A,conj[coup[[2]]]];
pos2 = Select[Position[parts /.  A_[{a__}]-> A,coup[[2]]],(Length[#]===1)&][[1,1]];
];

If[conj[coup[[2]]]===coup[[2]],
pos3=pos3[[2,1]];,
pos3=pos3[[1,1]];
];


GT1 = generation /. subGC[pos2] /.subIndFinal[pos2,pos2];
GT2 = generation /. subGC[pos3] /.subIndFinal[pos3,pos3];
vertex = vertex /. {matrix[GT1,a_]-> Delta[GT1,a],matrix[GT2,a_]-> Delta[GT2,a]}/. sumExp->sum;

If[getGen[coup[[2]]]>1,
SubParticle = {getBlank[coup[[2]]][{GT1,a___}]->ToExpression["U"<>ToString[getBlank[coup[[2]]]]][{GT1,a}],getBlank[coup[[2]]][{GT2,a___}]->ToExpression["U"<>ToString[getBlank[coup[[2]]]]][{GT2,a}]};,
SubParticle = {};
];
Return[{parts /. SubParticle,vertex}];
];
];


AddVertex[coup_]:=Block[{pos,vertex,parts},
If[coup[[1]]=!=SSSS && coup[[1]] =!=SSVV && coup[[1]] =!=VVVV,
pos=Position[VerticesInv[coup[[1]]],C[coup[[2]],coup[[3]],coup[[4]]]][[1,1]];
vertex=Extract[VerticesValSUM[coup[[1]]],pos]  /. sumExp->sum;
parts=Extract[VerticesOrg[coup[[1]]],pos];
If[Length[Dimensions[vertex]]==2,
Return[{parts,vertex[[1]],vertex[[2]]}];,
Return[{parts,vertex}];
];,
pos=Position[VerticesInv[coup[[1]]],C[coup[[2]],conj[coup[[2]]],coup[[3]],coup[[4]]]][[1,1]];
vertex=Extract[VerticesValSUM[coup[[1]]],pos] /. sumExp->sum;
parts=Extract[VerticesOrg[coup[[1]]],pos];
If[Length[vertex]==2,
Return[{parts,vertex}];,
Return[{parts,vertex[[1]],vertex[[2]],vertex[[3]]}];
];
];
];

SetAttributes[C,Orderless];
SetAttributes[VType,Orderless];
VType[a__]:=ToExpression[StringReplace[ToString[{a}],{"{"->"","}"->"",","->""," "->""}]] 
getVertexType[x_]:=VType@@getType/@x;

ThreeParticleVertex[x_]:=Block[{i,temp,temp2},
temp=InsFields[{{C[AntiField[x],AntiField[FieldToInsert[1]],FieldToInsert[2]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],External[1]->AntiField[x]}}];
Return[Select[Table[{AntiField[Internal[1]/.temp[[i,2]]],Internal[2]/.temp[[i,2]],Cp[External[1]/.temp[[i,2]],AntiField[Internal[1]/.temp[[i,2]]],Internal[2]/.temp[[i,2]]]},{i,1,Length[temp]}],(FreeQ[getType/@#1,G])&]];
]; 


ThreeParticleVertex2[x_]:=Block[{i,temp,temp2,symm,temp3},
temp=InsFields[{{C[AntiField[x],AntiField[FieldToInsert[1]],FieldToInsert[2]],C[x,AntiField[FieldToInsert[2]],FieldToInsert[1]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],External[1]->AntiField[x],Index[1]->gO1,Index[2]->gI1,Index[3]->gI2}}];

(* temp2=Select[Table[{AntiField[Internal[1]/.temp[[i,2]]],Internal[2]/.temp[[i,2]],Cp[External[1][{Index[1]}],AntiField[Internal[1][{Index[2]}]],Internal[2][{Index[3]}]]/.temp[[i,2]],VType[getType[Internal[1]/.temp[[i,2]]],getType[Internal[2]/.temp[[i,2]]],getType[External[1]/.temp[[i,2]]]],CalculateColorFactor[getBlank[External[1]/.temp[[i,2]]],Internal[1]/.temp[[i,2]],Internal[2]/.temp[[i,2]]],CalculateSymmetryFactor[Internal[1]/.temp[[i,2]],Internal[2]/.temp[[i,2]]]},{i,1,Length[temp]}],(FreeQ[#1,GGS]&&FreeQ[#1,GGV])&]; *)
temp2=Table[{AntiField[Internal[1]/.temp[[i,2]]],Internal[2]/.temp[[i,2]],Cp[External[1][{Index[1]}],AntiField[Internal[1][{Index[2]}]],Internal[2][{Index[3]}]]/.temp[[i,2]],VType[getType[Internal[1]/.temp[[i,2]]],getType[Internal[2]/.temp[[i,2]]],getType[External[1]/.temp[[i,2]]]],CalculateColorFactor[External[1]/.temp[[i,2]],AntiField[Internal[1]/.temp[[i,2]]],Internal[2]/.temp[[i,2]]],CalculateSymmetryFactor[Internal[1]/.temp[[i,2]],Internal[2]/.temp[[i,2]]]},{i,1,Length[temp]}];
temp3={};
For[i=1,i<=Length[temp2],
If[FreeQ[temp3 /. a_[{b__Symbol}]->a /. Cp->C,(AntiField/@temp2[[i,3]])/. a_[{b__Symbol}]->a /. Cp->C],
temp3=Join[temp3,{temp2[[i]]}];];
i++;];
Return[temp3 /. Map[(#1[a_]->#1)&,Transpose[Select[Particles[Current],TrueQ[getGen[#1[[1]]]==1]&]][[1]]]];
];


FourParticleVertex[x_]:=Block[{i,temp,temp2},temp=InsFields[{{C[AntiField[x],AntiField[FieldToInsert[1]],FieldToInsert[2],FieldToInsert[3]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],External[1]->AntiField[x]}}];
Return[Table[{AntiField[Internal[1]/.temp[[i,2]]],Internal[2]/.temp[[i,2]],Internal[3]/.temp[[i,2]],temp[[i,1,1]]/.C->Cp},{i,1,Length[temp]}]];
];

FourParticleVertex2[x_]:=Block[{i,temp,temp2={}},
temp=InsFields[{{C[AntiField[x],x,AntiField[FieldToInsert[1]],FieldToInsert[1]]},{Internal[1]->FieldToInsert[1],External[1]->x,Index[1]->gO1,Index[2]->gI1}}];
For[i=1,i<=Length[temp],
temp2= Join[temp2,{{AntiField[Internal[1]/.temp[[i,2]]],Internal[1]/.temp[[i,2]],Cp[External[1][{Index[1]}],AntiField[External[1][{Index[1]}]],AntiField[Internal[1][{Index[2]}]],Internal[1][{Index[2]}]]/.temp[[i,2]],VType[getType[Internal[1]/.temp[[i,2]]],getType[Internal[1]/.temp[[i,2]]],getType[External[1]/.temp[[i,2]]],getType[External[1]/.temp[[i,2]]]],CalculateColorFactor4[External[1]/.temp[[i,2]],AntiField[External[1]/.temp[[i,2]]],Internal[1]/.temp[[i,2]],AntiField[Internal[1]/.temp[[i,2]]]] ,2 CalculateSymmetryFactor[Internal[1]/.temp[[i,2]],Internal[1]/.temp[[i,2]]]}}];
i++;];
Return[temp2 /. Map[(#1[a_]->#1)&,Transpose[Select[Particles[Current],TrueQ[getGen[#1[[1]]]==1]&]][[1]]]];
];


ThreeBodyDecay[p_]:=Block[{i,res1,res2,listTemp,j,k},
process={};
res1=ThreeParticleVertex[p];

For[i=1,i<=Length[res1],
If[getType[res1[[i,2]]]===F && (getType[res1[[i,1]]]=!=V || FreeQ[massless,res1[[i,1]]]==True) && (FreeQ[SA`SkipFields,RE[res1[[i,1]]]]),
res2=ThreeParticleVertex[res1[[i,1]]];
For[j=1,j<=Length[res2],
If[getType[res2[[j,1]]]===F && getType[res2[[j,2]]] ===F,
process=Join[process,{{Final1-> res1[[i,2]],Propagator->res1[[i,1]],Final2-> res2[[j,1]],Final3-> res2[[j,2]],Couplings->{res1[[i,3]],res2[[j,3]]}}}];
];
j++;];
];

If[getType[res1[[i,1]]]===F && (getType[res1[[i,2]]]=!=V || FreeQ[massless,res1[[i,2]]]==True)  && (FreeQ[SA`SkipFields,RE[res1[[i,2]]]]),
res2=ThreeParticleVertex[res1[[i,2]]];
For[j=1,j<=Length[res2],
If[getType[res2[[j,1]]]===F && getType[res2[[j,2]]] ===F,
process=Join[process,{{Final1-> res1[[i,1]],Propagator-> res1[[i,2]],Final2-> res2[[j,1]],Final3->res2[[j,2]],Couplings-> {res1[[i,3]],res2[[j,3]]}}}];
];
j++;];
];
i++;];

finalstates={};
SortedProcessesTemp={};


For[i=1,i<=Length[process],
If[FreeQ[finalstates,FinalStatesNO[Final1,Final2,Final3] /. process[[i]]]==True,
finalstates = Join[finalstates,{FinalStatesNO[Final1,Final2,Final3] /. process[[i]]}];
SortedProcessesTemp=Join[SortedProcessesTemp,{{FinalStatesNO[Final1,Final2,Final3] /. process[[i]],process[[i]]}}];,
pos=Position[SortedProcessesTemp,FinalStatesNO[Final1,Final2,Final3] /. process[[i]]];
SortedProcessesTemp[[pos[[1,1]]]]=Join[SortedProcessesTemp[[pos[[1,1]]]],{process[[i]]}];
];
i++;];

SortedProcesses=Table[{},{Length[SortedProcessesTemp]}];

For[i=1,i<=Length[SortedProcessesTemp],
listTempSR={};
listTempSC={};
listTempVR={};
listTempVC={};
SortedProcesses[[i]]=SortedProcessesTemp[[i,1]];
For[j=2,j<=Length[SortedProcessesTemp[[i]]],
If[getType[Propagator /. SortedProcessesTemp[[i,j]]]===S,
If[AntiField[Propagator /. SortedProcessesTemp[[i,j]]]===(Propagator /. SortedProcessesTemp[[i,j]]),
listTempSR=Join[listTempSR,{SortedProcessesTemp[[i,j]]}];,
listTempSC=Join[listTempSC,{SortedProcessesTemp[[i,j]]}];
];,
If[AntiField[Propagator /. SortedProcessesTemp[[i,j]]]===(Propagator /. SortedProcessesTemp[[i,j]]),
listTempVR=Join[listTempVR,{SortedProcessesTemp[[i,j]]}];,
listTempVC=Join[listTempVC,{SortedProcessesTemp[[i,j]]}];
];
];
j++;];
 SortedProcesses[[i]]=Join[{SortedProcesses[[i]]},Join[Join[listTempVR,listTempVC],Join[listTempSC,listTempSR]]]; 
i++;];

finalstates={};
For[i=1,i<=Length[SortedProcesses],
SortedProcesses[[i,1]]=FinalStates[Final1,Final2,Final3] /. SortedProcesses[[i,2]];
finalstates=Join[finalstates,{FinalStates[Final1,Final2,Final3] /. SortedProcesses[[i,2]]}];
i++;];

Return[{finalstates,SortedProcesses}];
];


ThreeBodyDecayScalar[p_]:=Block[{i,res1,res2,listTemp,j,k,pos,temp},
SA`CheckSameVertices=False;
process={};
res1=InsFields[{{C[p,FieldToInsert[2],FieldToInsert[1]],C[AntiField[FieldToInsert[2]],FieldToInsert[3],FieldToInsert[4]]},{Propagator->FieldToInsert[2],External[1]->p,External[2]->FieldToInsert[1],External[3]->FieldToInsert[3],External[4]->FieldToInsert[4]}}];
res1save=res1;
temp={};

For[i=1,i<=Length[res1],
If[FreeQ[temp,res1[[i,1]]],
temp=Join[temp,{res1[[i]]}];,
pos=Position[temp,res1[[i,1]]];
If[FreeQ[Table[(Propagator /. temp[[pos[[j,1]],2]]),{j,1,Length[pos]}],(Propagator /. res1[[i,2]]) ],
temp=Join[temp,{res1[[i]]}];
];
];
i++;];
res1=temp;
res2save=res1;
For[i=1,i<=Length[res1],
If[Count[getType/@({External[2],External[3],External[4]} /. res1[[i,2]]),F]==2 &&  Count[getType/@({External[2],External[3],External[4]}/.res1[[i,2]]),S]==1,
If[((Propagator/.res1[[i,2]])=!=VectorP)&&((Propagator/.res1[[i,2]])=!=VectorG),
process=Join[process,{{Final1-> External[2]/.res1[[i,2]],Propagator->(Propagator/.res1[[i,2]]),Final2-> External[3]/.res1[[i,2]],Final3-> External[4]/.res1[[i,2]],Couplings->res1[[i,1]]}}];
];
];
i++;];

finalstates={};
SortedProcessesTemp={};


For[i=1,i<=Length[process],
If[FreeQ[finalstates,FinalStatesNO[Final1,Final2,Final3] /. process[[i]]]==True,
finalstates = Join[finalstates,{FinalStatesNO[Final1,Final2,Final3] /. process[[i]]}];
SortedProcessesTemp=Join[SortedProcessesTemp,{{FinalStatesNO[Final1,Final2,Final3] /. process[[i]],process[[i]]}}];,
pos=Position[SortedProcessesTemp,FinalStatesNO[Final1,Final2,Final3] /. process[[i]]];
SortedProcessesTemp[[pos[[1,1]]]]=Join[SortedProcessesTemp[[pos[[1,1]]]],{process[[i]]}];
];
i++;];

SortedProcesses=Table[{},{Length[SortedProcessesTemp]}];

For[i=1,i<=Length[SortedProcessesTemp],
listTempSR={};
listTempSC={};
listTempVR={};
listTempVC={};
listTempFR={};
listTempFC={};
SortedProcesses[[i]]=SortedProcessesTemp[[i,1]];
For[j=2,j<=Length[SortedProcessesTemp[[i]]],
Switch[getType[Propagator /. SortedProcessesTemp[[i,j]]],
S,
If[AntiField[Propagator /. SortedProcessesTemp[[i,j]]]===(Propagator /. SortedProcessesTemp[[i,j]]),
listTempSR=Join[listTempSR,{SortedProcessesTemp[[i,j]]}];,
listTempSC=Join[listTempSC,{SortedProcessesTemp[[i,j]]}];
];,
V,
If[AntiField[Propagator /. SortedProcessesTemp[[i,j]]]===(Propagator /. SortedProcessesTemp[[i,j]]),
listTempVR=Join[listTempVR,{SortedProcessesTemp[[i,j]]}];,
listTempVC=Join[listTempVC,{SortedProcessesTemp[[i,j]]}];
];,
F,
If[AntiField[Propagator /. SortedProcessesTemp[[i,j]]]===(Propagator /. SortedProcessesTemp[[i,j]]),
listTempFR=Join[listTempFR,{SortedProcessesTemp[[i,j]]}];,
listTempFC=Join[listTempFC,{SortedProcessesTemp[[i,j]]}];
];
];
j++;];
 SortedProcesses[[i]]=Join[{SortedProcesses[[i]]},Join[Join[Join[listTempVR,listTempVC],Join[listTempSC,listTempSR]],Join[listTempFC,listTempFR]]]; 
i++;];

finalstates={};
For[i=1,i<=Length[SortedProcesses],
SortedProcesses[[i,1]]=FinalStates[Final1,Final2,Final3] /. SortedProcesses[[i,2]];
finalstates=Join[finalstates,{FinalStates[Final1,Final2,Final3] /. SortedProcesses[[i,2]]}];
i++;];
SA`CheckSameVertices=True;
Return[{finalstates,SortedProcesses}];
];

SetAttributes[FinalStatesNO,Orderless];

TwoBodyDecay[p_]:=Block[{i,res1,res2,addedP},
process={};
res1=ThreeParticleVertex[p];
addedP={};

For[i=1,i<=Length[res1],
If[(FreeQ[addedP,C[res1[[i,1]],res1[[i,2]]]] && FreeQ[addedP,C[AntiField[res1[[i,1]]],AntiField[res1[[i,2]]]]]) || AntiField[p]=!=p,
If[((FreeQ[massless,getBlank[res1[[i,1]]]]==True || getType[res1[[i,1]]]=!=V) &&  (FreeQ[massless,getBlank[res1[[i,2]]]]==True || getType[res1[[i,1]]]=!=V)) || (FreeQ[AllowDecaysMasslessVectors,RE[p]]==False),
process=Join[process,{{res1[[i,1]],res1[[i,2]],res1[[i,3]],CalculateColorFactorDecay[AntiField[p],res1[[i,1]],res1[[i,2]]],SymmFactor2BodyDecay[p,res1[[i,1]],res1[[i,2]]]}}];
addedP=Join[addedP,{C[res1[[i,1]],res1[[i,2]]]}];
];
];
i++;];
Return[process];
];



SymmFactor2BodyDecay[pD_,p1_,p2_]:=Block[{},
If[getType[getBlank[pD]]===S,
If[getBlank[p1]===getBlank[p2],
If[AntiField[p1]===p1,
Return[1/2];,
Return[1];
];,
Return[1];
];,
If[AntiField[p1]===p1 &&  AntiField[p2]===p2,
Return[1/2];,
Return[1];
];
];
];

CalculateColorFactor[pD_,p1_,p2_]:=ChargeFactor[pD,p1,p2];
(*
CalculateColorFactor4[Ex1_,Ex2_,Int1_,Int2_]:=
If[getType[Int1]===V && getType[Int2]===V,
Return[1];,
Return[getChargeFactor[{{Cp[Ex1,Ex2,Int1,Int2]},{External[1]\[Rule]Ex1,External[2]\[Rule]Ex2,Internal[1]\[Rule]Int1,Internal[2]\[Rule]Int2}},{{{Ex1,ex1}, {Ex2,ex2},{Int1,in1},{Int2,in2}}},Delta[in1,in2] Delta[ex1,ex2]]];
]; *)
CalculateColorFactor4[Ex1_,Ex2_,Int1_,Int2_]:=Block[{ind,diffind,mul},
If[getType[Int1]===V && getType[Int2]===V,
Return[1];,
ind=DeleteCases[DeleteCases[Flatten[getIndizes/@{Ex1,Ex2,Int1,Int2}],lorentz],generation];
diffind=Intersection[ind];
mul=Count[ind,#]&/@diffind;
If[Max[mul]>2,
Return[999];,
Return[getChargeFactor[{{Cp[Ex1,Ex2,Int1,Int2]},{External[1]->Ex1,External[2]->Ex2,Internal[1]->Int1,Internal[2]->Int2}},{{{Ex1,ex1}, {Ex2,ex2},{Int1,in1},{Int2,in2}}}]];
];
];
];
CalculateColorFactorDecay[pD_,p1_,p2_]:=ChargeFactor[pD,p1,p2];

ChargeFactor[Ext_,Int1_,Int2_]:=Block[{pos,temp},
(*Is the external field a gauge boson?*)
pos=Select[{Position[getBlank/@SGauge,getBlank[Ext]]},(#1=!={})&];
If[pos=!={},If[Gauge[[pos[[1,1,1]],2]]=!=U[1],Return[SA`Dynkin[getBlank[Int1],pos[[1,1,1]]]];,Return[1];];];
(*----*)
(*Is an internal field a gauge boson?*)
pos=Select[{Position[getBlank/@SGauge,getBlank[Int1]],Position[getBlank/@SGauge,getBlank[Int2]]},(#1=!={})&];
If[pos=!={},If[Gauge[[pos[[1,1,1]],2]]=!=U[1],Return[SA`Casimir[getBlank[Ext],pos[[1,1,1]]]];,Return[1];];];

If[AddDiracGauginos=!=True,(* if true, then can have different couplings *)
(*Is the external field a gaugino?*)
pos=Select[{Position[getBlank/@Gauginos,getBlank[Ext]]/2},(#1=!={})&];
If[pos=!={},If[Gauge[[pos[[1,1,1]],2]]=!=U[1],Return[SA`Dynkin[getBlank[Int1],pos[[1,1,1]]]];,Return[1];];];
(*----*)
(*Is an internal field a gaugino?*)
pos=Select[{Position[getBlank/@Gauginos,getBlank[Int1]],Position[getBlank/@Gauginos,getBlank[Int2]]},(#1=!={})&];
If[pos=!={},If[Gauge[[pos[[1,1,1]]/2,2]]=!=U[1],Return[SA`Casimir[getBlank[Ext],pos[[1,1,1]]/2]];,Return[1];];];
];
(*-- Otherwise do the calculation the hard way --*)
If[Select[getIndizes[Int1],(FreeQ[getIndizes[Ext],#]==False&&FreeQ[getIndizes[Int2],#]==False&&#=!=generation &&#=!=lorentz)&]=!={},Return[Abs[getChargeFactor[{{Cp[Ext,Int1,Int2],Cp[AntiField[Ext],AntiField[Int1],AntiField[Int2]]},{External[1]->Ext,External[2]->AntiField[Ext],Internal[1]->Int1,Internal[2]->Int2}},{{{Ext,ex1},{Int1,in1},{Int2,in2}},{{AntiField[Ext],ex2},{AntiField[Int1],in1},{AntiField[Int2],in2}}},Delta[ex1,ex2]]]];
Return[999];];
temp=Select[getIndizesWI[Int1],(FreeQ[getIndizesWI[Ext],#1]&&#1[[1]]=!=generation &&#1[[1]]=!=lorentz)&];
If[temp=!={},Return[Times@@Transpose[temp][[2]]];,Return[1];];];


CalculateSymmetryFactor[p1_,p2_]:=Block[{},
fac=1/2;
If[getBlank[p1]=!=getBlank[p2],
If[(AntiField[p1]===p1 && AntiField[p2]===p2),
fac= fac;,
fac=2fac;
];
fac=fac;
];

If[getBlank[p1]===getBlank[p2] && AntiField[p1]===p1,
fac=1/2fac;
];

Return[fac];
];


DeleteInds[x_]:=DeleteCases[DeleteCases[DeleteCases[DeleteCases[x,gt1,2],gt2,2],gt3,2],gt4,2];

getChargeFactor [list_,ind_]:=getChargeFactor [list,ind,1];
getChargeFactor [list_,ind_,constraint_]:=Block[{i,j,k,temp,fac=1,allind,coups={},pos,chargepart={},indrep={},tordered,indreptemp,ccoup,sumvar={},fixvar={}},
allind=DeleteCases[DeleteCases[DeleteCases[Intersection[Flatten[getIndizes/@DeleteInds[Intersection[getBlank/@Intersection[Flatten[(List@@#)&/@list[[1]]]]]]]],generation],lorentz],n];

constr=constraint;
For[i=1,i<=Length[list[[1]]],
pos=Position[VerticesInv[All],list[[1,i]] /. Cp->C];
If[pos==={},
Vertex::DoesNotExist="The Vertex `` does not exit! Please contact the author. ";
Message[Vertex::DoesNotExist,list[[1,i]]];
Abort[];,
pos=pos[[1,1]];
];
tordered=VerticesOrg[All][[pos]] /. A_[{b__}]->A;
coups=Join[coups,{VerticesVal[All][[pos]][[1]]}];
indreptemp={};
For[j=1,j<=Length[ind[[i]]],
pos=DeleteCases[Position[tordered,ind[[i,j,1]]],{a_,b_}][[1,1]];
tordered[[pos]]=XXX;
indreptemp=Join[indreptemp,Reverse/@subIndFinal[pos,pos] /. subIndFinalX[pos,1,ToString[ind[[i,j,2]]]]];
If[StringTake[ToString[ind[[i,j,2]]],2]==="ex" || StringTake[ToString[ind[[i,j,2]]],1]==="a",
fixvar = Join[fixvar,subGC[pos] /. (a_->b_)->b /. subIndFinalX[pos,1,ToString[ind[[i,j,2]]]]];,
sumvar = Join[sumvar,subGC[pos] /. (a_->b_)->b /. subIndFinalX[pos,1,ToString[ind[[i,j,2]]]]];
];
j++;];
indrep=Join[indrep,{indreptemp}];
i++;];

For[i=1,i<=Length[allind],
chargepart= {};
(* constr=constraint/. indrep[[j]]; *)
For[j=1,j<=Length[coups],
res=ExtractStructure[coups[[j]] /. Lam[a__] ->  LamHlf[a]2,allind[[i]]] /. LamHlf[a__]->Lam[a]/2;
chargepart= Join[chargepart,{res[[1,1]] /. indrep[[j]]}];
j++;];

constr=constraint /. {in1->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in11"],
in2->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in21"],
in3->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in31"],in4->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in41"],ex1->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex11"],ex2->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex21"],ex3->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex31"],ex4->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex41"]};
cfac=constr*Times@@chargepart //. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}];

cfac=cfac/. {CG[SU[3],{{0,1},{1,0},{1,1}}][a_,b_,c_]->Lam[c,b,a]/2,
CG[SU[3],{{0,1},{1,1},{1,0}}][a_,b_,c_]->Lam[b,c,a]/2,CG[SU[3],{{1,1},{0,1},{1,0}}][a_,b_,c_]->Lam[a,c,b]/2,
CG[SU[3],{{1,0},{0,1},{1,1}}][a_,b_,c_]->Lam[c,a,b]/2,
CG[SU[3],{{1,0},{1,1},{0,1}}][a_,b_,c_]->Lam[b,a,c]/2,CG[SU[3],{{1,1},{1,0},{0,1}}][a_,b_,c_]->Lam[a,b,c]/2};

norm=1;

fixvar = Intersection[Select[fixvar,(FreeQ[cfac,#]==False)&]];
sumvar = Intersection[Select[sumvar,(FreeQ[cfac,#]==False)&]];


subfixvar={};

cfac = cfac/norm /. subfixvar;
cfacsave=cfac;


sumvarCount=1;
intfields=Select[list[[2]],(FreeQ[#,Internal]==False || FreeQ[#,Propagator]==False) &];
extfields=Select[list[[2]],(FreeQ[#,External]==False)&];
For[k=1,k<=Length[intfields],
cind=getIndizesWI[RE[intfields[[k,2]]]];
pos=Position[cind,allind[[i]]];
If[pos=!={},
cfac = ReleaseHold[Hold[Sum[cfac,{SUMVAR,1,LIMIT}]] /. SUMVAR->sumvar[[sumvarCount]] /. LIMIT->cind[[pos[[1,1]],2]]];
sumvarCount++;
];
k++;];

rangext={};
sumvarCount=1;
For[k=1,k<=Length[extfields],
cind=getIndizesWI[RE[extfields[[k,2]]]];
pos=Position[cind,allind[[i]]];
If[pos=!={},
rangext=Join[rangext,{{fixvar[[sumvarCount]],cind[[pos[[1,1]],2]]}}];
sumvarCount++;
];
k++;];
rangextSave=rangext;
rangext=Table[#[[1]]->i,{i,1,#[[2]]}]&/@rangext;


Switch[Length[rangext],
0,sub={{}};,
2,sub=Flatten[Outer[List,rangext[[1]],rangext[[2]]],1];,
3,sub=Flatten[Outer[List,rangext[[1]],rangext[[2]],rangext[[3]]],2];,
4,sub=Flatten[Outer[List,rangext[[1]],rangext[[2]],rangext[[3]],rangext[[4]]],3];
];

res=0;
k=0;

While[res===0 && k<Length[sub],
k++;
res=cfac/.sub[[k]];
];
(* If[res===0,i=Length[allind]+1;Return[0]]; *)
group=Gauge[[Position[Gauge,allind[[i]]][[1,1]],2]];
If[getType[External[3]/.extfields]===V,
If[SA`DynL[extfields[[3,2]],Position[Gauge,allind[[i]]][[1,1]]]==={0},
norm=1;,
norm=Generator[Gauge[[Position[Gauge,allind[[i]]][[1,1]]]][[2]],SA`DynL[extfields[[2,2]],Position[Gauge,allind[[i]]][[1,1]]]]@@fixvar/.Lam[a_,b_,c_]->Lam[c,a,b]/.A_[SU[n_],b_][a_,b_,c_]->A[SU[n],b][c,a,b] /. sub[[k]];
];,
norm=CG[group,DeleteCases[Table[SA`DynL[extfields[[k,2]],Position[Gauge,allind[[i]]][[1,1]]],{k,1,Length[extfields]}],{0}]]@@fixvar/.sub[[k]] /. {CG[SU[3],{{0,1},{1,0},{1,1}}][a_,b_,c_]->Lam[c,b,a]/2,
CG[SU[3],{{0,1},{1,1},{1,0}}][a_,b_,c_]->Lam[b,c,a]/2,CG[SU[3],{{1,1},{0,1},{1,0}}][a_,b_,c_]->Lam[a,c,b]/2,
CG[SU[3],{{1,0},{0,1},{1,1}}][a_,b_,c_]->Lam[c,a,b]/2,
CG[SU[3],{{1,0},{1,1},{0,1}}][a_,b_,c_]->Lam[b,a,c]/2,CG[SU[3],{{1,1},{1,0},{0,1}}][a_,b_,c_]->Lam[a,b,c]/2,
CG[SU[3],{{1,0},{0,1},{1,0},{0,1}}][a_,b_,c_,d_]->CG[SU[3],{{1,0},{0,1}}][a,b]*CG[SU[3],{{1,0},{0,1}}][c,d],
CG[SU[3],{{1,0},{0,1},{0,1},{1,0}}][a_,b_,c_,d_]->CG[SU[3],{{1,0},{0,1}}][a,b]*CG[SU[3],{{1,0},{0,1}}][c,d],
CG[SU[3],{{1,0},{1,0},{0,1},{0,1}}][a_,b_,c_,d_]->CG[SU[3],{{1,0},{0,1}}][a,c]*CG[SU[3],{{1,0},{0,1}}][b,d]}; 
];
fac = res*fac/norm;
If[norm===0,Print[res];Interrupt[];];
(* If[norm===0,Return[0];]; *)
i++;];

Return[fac];

];





ExtractStructure[vertex_,charge_]:=Block[{i,j,temp={},temp2,res,CS,diffCol,coeff,current,CSsum ,unbrokenInd},
diffCol={fSU3,Delta,Lam, LamHlf,sum,epsTensor,CG,Generator}; (* Possible Headers *)
(* diffColQT=Table[charge /. subGC[i] /. subIndFinal[i,i],{i,1,Length[vertex]}]; *)
diffColQT=Table[charge /. subGC[i] /. subIndFinal[i,i],{i,1,4}]; (* check! *)
CSsum=Select[Cases[vertex,x_sum,6],(FreeQ[#,ct1]==False || FreeQ[#,ct2]==False || FreeQ[#,ct3]==False || FreeQ[#,ct4]==False)&];
CSsum={};
unbrokenInd=Flatten[Table[Transpose[Select[Gauge,#[[5]]==False&&#[[2]]=!=U[1]&]][[3]]/.subGC[i]/.subIndFinal[i,i],{i,1,4}]];
For[i=1,i<=Length[unbrokenInd],
CSsum=Join[CSsum,Select[Cases[vertex,x_sum,6],(FreeQ[#,unbrokenInd[[i]]]==False)&]];
i++;];
CSsum=Intersection[CSsum];
CS = Intersection[Cases[vertex /. sum[a_,b_,c_,d_]:>sum[a,b,c,Random[]],x_?(((FreeQ[diffCol,Head[#]]==False || FreeQ[diffCol,Head[Head[#]]]==False) && Head[#]=!=List && (Intersection[List@@#,diffColQT]=!={} || Head[#]===fSU3))&),10]];

CS=Join[CS,CSsum];
If[CS=={}, (* only color singlets *)
temp = Join[temp,{{1,vertex}}];,
subs=DeleteCases[Reverse[Subsets[CS]],{}]; (* all possible combinations of color structures *)
For[j=1,j<=Length[subs],
current=Times@@subs[[j]]; 
SA`NrD=1;

coeff= ExtractColorCoeff[vertex /. conj[CG[a___][b__]]->CG[a][b],current]; (* get the coefficients *)
(* check, if there is no color structure left in the coefficient *)
If[coeff=!= 0 &&  Intersection[Cases[coeff,x_?((FreeQ[diffCol,Head[#]]==False && Head[#]=!=List && (Intersection[List@@#,diffColQT]=!={}||Head[#]===fSU3))&),10]]=={},
temp=Join[temp,{{current,coeff}}];
];
j++;];
];
Return[temp];
];


getChargeFactorDecay[list_,ind_,constraint_]:=Block[{i,j,k,temp,fac=1,allind,coups={},pos,chargepart={},indrep={},tordered,indreptemp,ccoup,sumvar={},fixvar={},sumvarA,fixvarA},
allind=DeleteCases[DeleteCases[DeleteCases[Intersection[Flatten[getIndizes/@DeleteInds[Intersection[getBlank/@Intersection[Flatten[(List@@#)&/@list[[1]]]]]]]],generation],lorentz],n];

constr=constraint;
For[i=1,i<=Length[list[[1]]],
pos=Position[VerticesInv[All],list[[1,i]] /. Cp->C];
If[pos==={},
Vertex::DoesNotExist="The Vertex `` does not exit! Please contact the author. ";
Message[Vertex::DoesNotExist,list[[1,i]]];
Abort[];,
pos=pos[[1,1]];
];
tordered=VerticesOrg[All][[pos]] /. A_[{b__}]->A;
coups=Join[coups,{VerticesVal[All][[pos]][[1]]}];
indreptemp={};
For[j=1,j<=Length[ind[[i]]],
pos=DeleteCases[Position[tordered,ind[[i,j,1]]],{a_,b_}][[1,1]];
tordered[[pos]]=XXX;
indreptemp=Join[indreptemp,Reverse/@subIndFinal[pos,pos] /. subIndFinalX[pos,1,ToString[ind[[i,j,2]]]]];
If[StringTake[ToString[ind[[i,j,2]]],2]==="ex" || StringTake[ToString[ind[[i,j,2]]],1]==="a",
fixvar = Join[fixvar,subGC[pos] /. (a_->b_)->b /. subIndFinalX[pos,1,ToString[ind[[i,j,2]]]]];,
sumvar = Join[sumvar,subGC[pos] /. (a_->b_)->b /. subIndFinalX[pos,1,ToString[ind[[i,j,2]]]]];
];
j++;];
indrep=Join[indrep,{indreptemp}];
i++;];
fixvarA=fixvar;
sumvarA=sumvar;
For[i=1,i<=Length[allind],
chargepart= {};
(* constr=constraint/. indrep[[j]]; *)
For[j=1,j<=Length[coups],
res=ExtractStructure[coups[[j]] /. Lam[a__] ->  LamHlf[a]2,allind[[i]]] /. LamHlf[a__]->Lam[a]/2;
chargepart= Join[chargepart,{res[[1,1]] /. indrep[[j]]}];
j++;];

constr=constraint /. {in1->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in11"],
in2->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in21"],
in3->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in31"],in4->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in41"],
in5->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in51"],
in6->ToExpression[StringTake[ToString[allind[[i]]],1]<>"in61"],ex1->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex11"],ex2->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex21"],ex3->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex31"],ex4->ToExpression[StringTake[ToString[allind[[i]]],1]<>"ex41"]};
cfac=constr*Times@@chargepart //. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}];

cfac=cfac/. {CG[SU[3],{{0,1},{1,0},{1,1}}][a_,b_,c_]->Lam[c,b,a]/2,
CG[SU[3],{{0,1},{1,1},{1,0}}][a_,b_,c_]->Lam[b,c,a]/2,CG[SU[3],{{1,1},{0,1},{1,0}}][a_,b_,c_]->Lam[a,c,b]/2,
CG[SU[3],{{1,0},{0,1},{1,1}}][a_,b_,c_]->Lam[c,a,b]/2,
CG[SU[3],{{1,0},{1,1},{0,1}}][a_,b_,c_]->Lam[b,a,c]/2,CG[SU[3],{{1,1},{1,0},{0,1}}][a_,b_,c_]->Lam[a,b,c]/2};

norm=1;

fixvar = Intersection[Select[fixvarA,(FreeQ[cfac,#]==False)&]];
sumvar = Intersection[Select[sumvarA,(FreeQ[cfac,#]==False)&]];


subfixvar={};

cfac = cfac/norm /. subfixvar;
cfacsave=cfac;

sumvarCount=1;
intfields=Select[list[[2]],(FreeQ[#,Internal]==False || FreeQ[#,Propagator]==False)&];
extfields=Select[list[[2]],(FreeQ[#,External]==False)&];
For[k=1,k<=Length[intfields],
cind=getIndizesWI[RE[intfields[[k,2]]]];
pos=Position[cind,allind[[i]]];
If[pos=!={},
cfac = ReleaseHold[Hold[Sum[cfac,{SUMVAR,1,LIMIT}]] /. SUMVAR->sumvar[[sumvarCount]] /. LIMIT->cind[[pos[[1,1]],2]]];
sumvarCount++;
];
k++;];
rangext={};
sumvarCount=1;
For[k=1,k<=Length[extfields],
cind=getIndizesWI[RE[extfields[[k,2]]]];
pos=Position[cind,allind[[i]]];
If[pos=!={},
rangext=Join[rangext,{{fixvar[[sumvarCount]],cind[[pos[[1,1]],2]]}}];
sumvarCount++;
];
k++;];
rangextSave=rangext;
rangext=Table[#[[1]]->i,{i,1,#[[2]]}]&/@rangext;

If[rangext=!={},
sub=rangext[[1]];,
sub={};
];

res=cfac/.sub;
fac = res*fac;
(* If[norm===0,Return[0];]; *)
i++;];

Return[fac];

];

(*
CallGetChargeFactorDecay[part_,d1_,d2_,type_]:=Block[{coups,res},
coups=Join[Couplings /. d1,(Couplings/.d2  /.C\[Rule]Cp/. Cp[a__]:> Cp@@(AntiField/@{a}))]; 
Switch[type,
"BOX",
res=getChargeFactorDecay[{coups,{External[1]\[Rule]part,Internal[1]\[Rule]Final1,Internal[2]\[Rule]Final2,Internal[3]\[Rule]Final3,Internal[4]\[Rule]Propagator /. d1,Internal[5]\[Rule]Propagator/.d2}}/. d1,{{{part,ex1},{Propagator,in4},{Final1,in1}}/.d1,
ReleaseHold[Hold[{{AntiField[Propagator],in4},{Final2,in2},{Final3,in3}}]/.d1],
ReleaseHold[Hold[{{AntiField[part],ex1},{AntiField[Propagator],in5},{AntiField[Final1],in1}}]/.d2],ReleaseHold[Hold[{{Propagator,in5},{AntiField[Final2],in2},{AntiField[Final3],in3}}]/.d2]} ,1];,
"BOXCROSS",
res=getChargeFactorDecay[{coups,{External[1]\[Rule]part,Internal[1]\[Rule]Final1,Internal[2]\[Rule]Final2,Internal[3]\[Rule]Final3,Internal[4]\[Rule]Propagator /. d1,Internal[5]\[Rule]Propagator/.d2}}/. d1,{{{part,ex1},{Propagator,in4},{Final1,in1}}/.d1,
ReleaseHold[Hold[{{AntiField[Propagator],in4},{Final2,in2},{Final3,in3}}]/.d1],
ReleaseHold[Hold[{{AntiField[part],ex1},{AntiField[Propagator],in5},{AntiField[Final1],in3}}]/.d2],ReleaseHold[Hold[{{Propagator,in5},{AntiField[Final2],in2},{AntiField[Final3],in1}}]/.d2]} ,1];,
"TRIANGLE",
If[(getType[Final2 /.d2]) ===S,
res=getChargeFactorDecay[{coups,{External[1]\[Rule]part,Internal[1]\[Rule]Final1,Internal[2]\[Rule]Final2,Internal[3]\[Rule]Final3,Internal[4]\[Rule]Propagator/.d1,Internal[5]\[Rule]Propagator/.d2}}/.d1,{{{part,ex1},{Propagator,in4},{Final1,in1}}/.d1,ReleaseHold[Hold[{{AntiField[Propagator],in4},{Final2,in2},{Final3,in3}}]/.d1],ReleaseHold[Hold[{{AntiField[Propagator],in5},{AntiField[part],ex1},{AntiField[Final1],in3}}]/.d2],ReleaseHold[Hold[{{AntiField[Final3],in2},{Propagator,in5},{AntiField[Final2],in1}}]/.d2]},1];,
res=getChargeFactorDecay[{coups,{External[1]\[Rule]part,Internal[1]\[Rule]Final1,Internal[2]\[Rule]Final2,Internal[3]\[Rule]Final3,Internal[4]\[Rule]Propagator /. d1,Internal[5]\[Rule]Propagator/.d2}}/. d1,{{{part,ex1},{Propagator,in4},{Final1,in1}}/.d1,
ReleaseHold[Hold[{{AntiField[Propagator],in4},{Final2,in2},{Final3,in3}}]/.d1],
ReleaseHold[Hold[{{AntiField[Propagator],in5},{AntiField[part],ex1},{AntiField[Final1],in2}}]/.d2],ReleaseHold[Hold[{{AntiField[Final3],in1},{Propagator,in5},{AntiField[Final2],in3}}]/.d2]} ,1];
];
];
(* Print[part,"  ",d1,"   ",d2,"   ",type];
Print[res]; *)
Return[res];
];*)

CallGetChargeFactorDecay[part_,d1_,d2_,type_]:=Block[{coups,res,index1,index2,index3},
coups=Join[Couplings /. d1,(Couplings/.d2  /.C->Cp/. Cp[a__]:> Cp@@(AntiField/@{a}))]; 
If[(((Final1/.d2))===(Final1/.d1))&&(((Final2/.d2))===(Final2/.d1)),index1=in1;
index2=in2;index3=in3;,If[(((Final2/.d2))===(Final1/.d1))&&(((Final1/.d2))===(Final2/.d1)),index1=in2;
index2=in1;index3=in3;,If[(((Final3/.d2))===(Final1/.d1))&&(((Final2/.d2))===(Final2/.d1)),index1=in3;index2=in2;index3=in1;,If[(((Final2/.d2))===(Final1/.d1))&&(((Final3/.d2))===(Final2/.d1)),index1=in3;index2=in1;index3=in2;,If[(((Final3/.d2))===(Final1/.d1))&&(((Final1/.d2))===(Final2/.d1)),index1=in2;index2=in3;index3=in1;,If[(((Final1/.d2))===(Final1/.d1))&&(((Final3/.d2))===(Final2/.d1)),index1=in1;index2=in3;index3=in2;];];];];];];
Switch[type,
"BOX" | "BOXCROSS",
res=getChargeFactorDecay[{coups,{External[1]->part,Internal[1]->Final1,Internal[2]->Final2,Internal[3]->Final3,Internal[4]->Propagator /. d1,Internal[5]->Propagator/.d2}}/. d1,{{{part,ex1},{Propagator,in4},{Final1,in1}}/.d1,
ReleaseHold[Hold[{{AntiField[Propagator],in4},{Final2,in2},{Final3,in3}}]/.d1],
ReleaseHold[Hold[{{AntiField[part],ex1},{AntiField[Propagator],in5},{AntiField[Final1],index1}}]/.d2],ReleaseHold[Hold[{{Propagator,in5},{AntiField[Final2],index2},{AntiField[Final3],index3}}]/.d2]} ,1];,
"TRIANGLE",
res=getChargeFactorDecay[{coups,{External[1]->part,Internal[1]->Final1,Internal[2]->Final2,Internal[3]->Final3,Internal[4]->Propagator/.d1,Internal[5]->Propagator/.d2}}/.d1,{{{part,ex1},{Propagator,in4},{Final1,in1}}/.d1,ReleaseHold[Hold[{{AntiField[Propagator],in4},{Final2,in2},{Final3,in3}}]/.d1],ReleaseHold[Hold[{{AntiField[Propagator],in5},{AntiField[part],ex1},{AntiField[Final1],index1}}]/.d2],ReleaseHold[Hold[{{AntiField[Final3],index3},{Propagator,in5},{AntiField[Final2],index2}}]/.d2]},1];
];
(* Print[part,"  ",d1,"   ",d2,"   ",type];
Print[res];  *)
Return[res];
];
