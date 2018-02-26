
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYnone
#define INHERITANCEflogic
#define TABLINGreactive
#define TABLINGvariant
#define CUSTOMnone

#define FLORA_INCREMENTAL_TABLING 

/************************************************************************
  file: headerinc/flrheader_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader.flh"
#include "flora_porting.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrheader_prog_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader_prog.flh"

/***********************************************************************/

#define FLORA_COMPILATION_ID 1

/************************************************************************
  file: headerinc/flrheader2_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
  It has files that must be included in the header and typically
  contain some Prolog statements. Such files cannot appear
  in flrheader.flh because flrheader.flh is included in various restricted
  contexts where Prolog statements are not allowed.

  NOT included in ADDED files (compiled for addition) -- only in LOADED
  ones and in trailers/patch
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

%% flora_tabling_methods is included here to affect preprocessing of
%% flrtable/flrhilogtable.flh dynamically
#include "flora_tabling_methods.flh"

/* note: inside flrtable.flh there are checks for FLORA_NONTABLED_DATA_MODULE
   that exclude tabling non-signature molecules
*/
#ifndef FLORA_NONTABLED_MODULE
#include "flrtable.flh"
#endif

/* if normal tabled module, then table hilog */
#if !defined(FLORA_NONTABLED_DATA_MODULE) && !defined(FLORA_NONTABLED_MODULE)
#include "flrhilogtable.flh"
#endif

#include "flrtable_always.flh"

#include "flrauxtables.flh"

%% include list of tabled predicates
#mode save
#mode nocomment "%"
#if defined(FLORA_FLT_FILENAME)
#include FLORA_FLT_FILENAME
#endif
#mode restore

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdyna_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

#include "flrdyndeclare.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrindex_P_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrindex_P.flh"

/***********************************************************************/

#mode save
#mode nocomment "%"
#define FLORA_THIS_FILENAME  'testHarness_flora.flr'
#mode restore
/************************************************************************
  file: headerinc/flrdefinition_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrdefinition.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrtrailerregistry_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailerregistry.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrrefreshtable_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrrefreshtable.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdynamic_connectors_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrdynamic_connectors.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrimportedcalls_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

%% Loads the file with all the import statements for predicates
%% that must be known everywhere

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBIMPORTEDCALLS))).

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpatch_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrexportcheck.flh"
#include "flrpatch.flh"
/***********************************************************************/

/************************************************************************
  file: headerinc/flropposes_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flropposes.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrhead_dispatch_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrhead_dispatch.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrcontrol_inc.flh

  Author(s): Michael Kifer
	     Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCONTROL))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrclause_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCLAUSE))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrdynmod_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBDYNMOD))).

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrcolset_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCOLLECTSET))).

/***********************************************************************/

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'testHarness_flora.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(testHarness_flora,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'testHarness_flora.fld'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLD_FILENAME,FLORA_THIS_MODULE_NAME,'fld'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FLD_FILENAME,FLORA_THIS_FLD_STORAGE))).
#endif

 
#if !defined(FLORA_FLS_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS_FILENAME  'testHarness_flora.fls'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS_FILENAME,FLORA_THIS_MODULE_NAME,'fls'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(compare,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_flora''rule_enabled'(4,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobal,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributes,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValues,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,4)))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(compareGlobal,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_flora''rule_enabled'(6,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobalOneAgainstTwo,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobalOneAgainstTwo,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(compareAllPersonAttributes,__iteration,__PersonID,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_flora''rule_enabled'(8,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributesOneAgainstTwo,__iteration,__PersonID,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributesOneAgainstTwo,__iteration,__PersonID,__entityType,__publicName,__attrValue,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(comparePersonAttributesUnderPersonSpecificValues,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_flora''rule_enabled'(10,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValuesOneAgainstTwo,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValuesOneAgainstTwo,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnObjectPublicName,__parentObject,__publicName,__itteration,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_flora''rule_enabled'(12,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodlit('d^mvd',[__parentObject,___attrID,__publicName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),==(___attrID,flapply(attribute,id))),fllibexecute_delayed_calls([___attrID,__itteration,__parentObject,__publicName],[__itteration,__parentObject,__publicName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnGlobalAttributes,__attrVarFour,__publicName,__attrValueOrObjectSeven,__itteration,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_flora''rule_enabled'(14,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodlit('d^mvd',[___obj,___attr,___attrValueOrObjectOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),','(==(___attr,medicaidRulebaseOutputVariable),','(fllibmodlit('d^mvd',[___attrValueOrObjectOne,___attrVarTwo,___attrValueOrObjectTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectTwo,___attrVarThree,___attrValueOrObjectThree,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectThree,__attrVarFour,___attrValueOrObjectFour,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectFour,___attrVarFive,___attrValueOrObjectFive,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,14)),','(==(___attrVarFive,'typ:attribute'),','(fllibmodlit('d^mvd',[___attrValueOrObjectFive,___attrVarSix,___attrValueOrObjectSix,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectSix,___attrVarSeven,__attrValueOrObjectSeven,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,14)),','(\=(___attrVarSeven,'typ:property'),FLORA_THIS_WORKSPACE(d^tblflapply)(returnObjectPublicName,___attrValueOrObjectFive,__publicName,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,14)))))))))))),fllibexecute_delayed_calls([___attr,___attrValueOrObjectFive,___attrValueOrObjectFour,___attrValueOrObjectOne,___attrValueOrObjectSix,___attrValueOrObjectThree,___attrValueOrObjectTwo,___attrVarFive,___attrVarSeven,___attrVarSix,___attrVarThree,___attrVarTwo,___obj,__attrValueOrObjectSeven,__attrVarFour,__itteration,__publicName],[__attrValueOrObjectSeven,__attrVarFour,__itteration,__publicName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(compareGlobalOneAgainstTwo,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_flora''rule_enabled'(16,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(=(__iteration,__itterationOne),','(=(__entityType,global),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,___firstAttrValue,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,___firstAttrValue,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),'\\false',fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,__newdontcarevar4,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,16)),','(=(__publicName,___firstPublicName),=(__attrValue,___firstAttrValue)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,__newdontcarevar6,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,16)),','(=(__publicName,___firstPublicName),=(__attrValue,'NA')),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,__newdontcarevar8,__newdontcarevar9,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,16)),','(=(__publicName,___firstPublicName),=(__attrValue,'NA')),','(=(__publicName,'NA'),=(__attrValue,'NA')),102,'testHarness_flora.flr'),91,'testHarness_flora.flr'),80,'testHarness_flora.flr'),70,'testHarness_flora.flr')))),fllibexecute_delayed_calls([__newdontcarevar11,___firstAttrValue,___firstPublicName,__attrValue,__entityType,__globalInstance,__iteration,__itterationOne,__itterationTwo,__publicName],[__attrValue,__entityType,__globalInstance,__iteration,__itterationOne,__itterationTwo,__publicName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnAllAttributesUnderPerson,__ID,__objectName,__objectID,__attr,__value,__itteration,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_flora''rule_enabled'(18,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnListOfPersonObjectsAndIdentifier,___person,__ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(descend,___person,___childObjects,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributeValues,___childObjects,__objectName,__attr,__value,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectIdentifiers,___childObjects,___type,__objectID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,18))))),fllibexecute_delayed_calls([__ID,___childObjects,___person,___type,__attr,__itteration,__objectID,__objectName,__value],[__ID,__attr,__itteration,__objectID,__objectName,__value])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnAllAttributesOnPerson,__ID,__publicName,__attrValueOrObjectFive,__itteration,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_flora''rule_enabled'(20,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnListOfPersonObjectsAndIdentifier,___personObj,__ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),','(fllibmodlit('d^mvd',[___personObj,___attrVarThree,___attrValueOrObjectThree,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20)),','(==(___attrVarThree,'typ:attribute'),','(fllibmodlit('d^mvd',[___attrValueOrObjectThree,___attrVarFour,___attrValueOrObjectFour,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,20)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,20)),','(\=(___attrVarFour,'typ:properties'),','(\=(___attrVarFour,'typ:change-point'),','(fllibmodlit('d^mvd',[___attrValueOrObjectFour,___attrVarFive,__attrValueOrObjectFive,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,20)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,20)),FLORA_THIS_WORKSPACE(d^tblflapply)(returnObjectPublicName,___attrValueOrObjectThree,__publicName,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,20))))))))),fllibexecute_delayed_calls([__ID,___attrValueOrObjectFour,___attrValueOrObjectThree,___attrVarFive,___attrVarFour,___attrVarThree,___personObj,__attrValueOrObjectFive,__itteration,__publicName],[__ID,__attrValueOrObjectFive,__itteration,__publicName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(child,__X,__Y,__itteration,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_flora''rule_enabled'(22,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(fllibmodlit('d^mvd',[__X,___attr,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),fllibexecute_delayed_calls([__X,__Y,___attr,__itteration],[__X,__Y,__itteration])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(descend,__X,__Y,__itteration,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_flora''rule_enabled'(24,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(child,__X,__Y,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(descend,__X,__Y,__itteration,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_flora''rule_enabled'(26,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(child,__X,__Z,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),FLORA_THIS_WORKSPACE(d^tblflapply)(child,__Z,__Y,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26))),fllibexecute_delayed_calls([__X,__Y,__Z,__itteration],[__X,__Y,__itteration])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnListOfPersonObjectsAndIdentifier,__person,__ID,__itteration,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_flora''rule_enabled'(28,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnPersonParentObject,___obj,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),','(fllibmodlit('d^mvd',[___object,___attrID,___attrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,28)),','(fllibmodlit('d^mvd',[___attrValueOrObject,___twoAttrID,___obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,28)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,28)),','(fllibmodlit('d^mvd',[___obj,___threeAttrID,__person,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,28)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,28)),','(==(___threeAttrID,'typ:instance'),FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectIdentifiers,__person,___type,__ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,28))))))),fllibexecute_delayed_calls([__ID,___attrID,___attrValueOrObject,___obj,___object,___threeAttrID,___twoAttrID,___type,__itteration,__person],[__ID,__itteration,__person])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnPersonParentObject,__obj,__itteration,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_flora''rule_enabled'(30,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodlit('d^mvd',[___object,___attrID,___attrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30)),','(fllibmodlit('d^mvd',[___attrValueOrObject,___twoAttrID,__obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,30)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,30)),','(fllibmodlit('d^mvd',[__obj,___threeAttrID,___threeAttrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,30)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,30)),==(___threeAttrValueOrObject,person)))),fllibexecute_delayed_calls([___attrID,___attrValueOrObject,___object,___threeAttrID,___threeAttrValueOrObject,___twoAttrID,__itteration,__obj],[__itteration,__obj])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnAllObjectIdentifiers,__Obj,__type,__ID,__itteration,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_flora''rule_enabled'(32,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllInstanceObjects,__Obj,__type,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),','(fllibmodlit('d^mvd',[__Obj,___attrID,__ID,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,32)),=(___attrID,flapply(attribute,id)))),fllibexecute_delayed_calls([__ID,__Obj,___attrID,__itteration,__type],[__ID,__Obj,__itteration,__type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnAllInstanceObjects,__object,__type,__itteration,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_flora''rule_enabled'(34,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectsExcludingGlobal,___obj,__type,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(fllibmodlit('d^mvd',[___obj,___attrID,__object,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),=(___attrID,'typ:instance'))),fllibexecute_delayed_calls([___attrID,___obj,__itteration,__object,__type],[__itteration,__object,__type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnAllObjectsExcludingGlobal,__obj,__type,__itteration,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_flora''rule_enabled'(36,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(fllibmodlit('d^mvd',[___object,___attrID,___attrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,36)),','(fllibmodlit('d^mvd',[___attrValueOrObject,___twoAttrID,__obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,36)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,36)),','(fllibmodlit('d^mvd',[__obj,___threeAttrID,__type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,36)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,36)),','(==(___twoAttrID,'typ:entity'),==(___threeAttrID,flapply(attribute,id)))))),fllibexecute_delayed_calls([___attrID,___attrValueOrObject,___object,___threeAttrID,___twoAttrID,__itteration,__obj,__type],[__itteration,__obj,__type])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnAllAttributeValues,__Obj,__objectName,__attr,__value,__itteration,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','('_$_$_flora''rule_enabled'(38,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectIdentifiers,__Obj,__objectName,___ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)),','(fllibmodlit('d^mvd',[__Obj,___attrID,___attrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,38)),','(==(___attrID,'typ:attribute'),','(fllibmodlit('d^mvd',[___attrObject,___attrAttributeId,__attr,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,38)),','(==(___attrAttributeId,flapply(attribute,id)),','(fllibmodlit('d^mvd',[___attrObject,___typeValOrProperty,___finalObj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,38)),','(\=(___typeValOrProperty,'typ:properties'),fllibmodlit('d^mvd',[___finalObj,___finalAttr,__value,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,38))))))))),fllibexecute_delayed_calls([__Obj,___ID,___attrAttributeId,___attrID,___attrObject,___finalAttr,___finalObj,___typeValOrProperty,__attr,__itteration,__objectName,__value],[__Obj,__attr,__itteration,__objectName,__value])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,__ObjectType,__valuesByObject,__itteration,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','('_$_$_flora''rule_enabled'(40,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(','(fllibsetof(__newdontcarevar3,[__objectName,__ID,___objectIdentifier],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPerson,__ID,__objectName,___objectIdentifier,__attr,__value,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40)),=(__newdontcarevar3,flapply(__attr,__value))),fllibexecute_delayed_calls([__ID,___objectIdentifier,__attr,__newdontcarevar3,__itteration,__objectName,__value],[])),__newvar4),=(__valuesByObject,__newvar4)),','(=(__PersonID,__ID),=(__ObjectType,__objectName))),fllibexecute_delayed_calls([__ID,__ObjectType,__PersonID,___objectIdentifier,__attr,__itteration,__objectName,__value,__valuesByObject],[__ObjectType,__PersonID,__itteration,__valuesByObject])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(compareAllPersonAttributesOneAgainstTwo,__itteration,__PersonID,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','('_$_$_flora''rule_enabled'(42,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(=(__itteration,__itterationOne),','(=(__entityType,person),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesOnPerson,__PersonID,___onePublicName,___oneAttrValue,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesOnPerson,__PersonID,___onePublicName,___oneAttrValue,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,42)),'\\false',fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesOnPerson,__PersonID,___onePublicName,__newdontcarevar4,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,42)),','(=(__publicName,___onePublicName),=(__attrValue,___oneAttrValue)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(postReturnAllAttributesOnPerson,__PersonID,___onePublicName,__newdontcarevar6,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,42)),','(=(__publicName,___onePublicName),=(__attrValue,'NA')),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(postReturnAllAttributesOnPerson,__PersonID,__newdontcarevar8,__newdontcarevar9,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,42)),','(=(__publicName,___onePublicName),=(__attrValue,'NA')),','(=(__publicName,'NA'),=(__attrValue,'NA')),240,'testHarness_flora.flr'),229,'testHarness_flora.flr'),218,'testHarness_flora.flr'),208,'testHarness_flora.flr')))),fllibexecute_delayed_calls([__PersonID,__newdontcarevar11,___oneAttrValue,___onePublicName,__attrValue,__entityType,__itteration,__itterationOne,__itterationTwo,__publicName],[__PersonID,__attrValue,__entityType,__itteration,__itterationOne,__itterationTwo,__publicName])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(comparePersonAttributesUnderPersonOneAgainstTwo,__itteration,__PersonID,__ObjectType,__valuesByObject,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','('_$_$_flora''rule_enabled'(44,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(=(__itteration,__itterationOne),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,___oneObjectType,___oneValuesByObject,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,___oneObjectType,___oneValuesByObject,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,44)),'\\false',fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,___oneObjectType,__newdontcarevar4,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,44)),','(=(__ObjectType,___oneObjectType),=(__valuesByObject,___oneValuesByObject)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,__newdontcarevar6,__newdontcarevar7,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,44)),','(=(__ObjectType,___oneObjectType),=(__valuesByObject,'NA')),','(=(__ObjectType,'NA'),=(__valuesByObject,'NA')),283,'testHarness_flora.flr'),272,'testHarness_flora.flr'),262,'testHarness_flora.flr'))),fllibexecute_delayed_calls([__ObjectType,__PersonID,__newdontcarevar9,___oneObjectType,___oneValuesByObject,__itteration,__itterationOne,__itterationTwo,__valuesByObject],[__ObjectType,__PersonID,__itteration,__itterationOne,__itterationTwo,__valuesByObject])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(comparePersonAttributesUnderPersonSpecificValuesOneAgainstTwo,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','('_$_$_flora''rule_enabled'(46,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonOneAgainstTwo,__itteration,__PersonID,__ObjectType,___valuesByObjectOne,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46)),fllibifthenelse(FLORA_THIS_MODULE_NAME,','(FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonOneAgainstTwo,___itterationPost,__PersonID,__ObjectType,___valuesByObjectTwo,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,46)),:(flrsetops,flora_list_sublist([flapply(___type,___val)],___valuesByObjectTwo))),fllibifthenelse(FLORA_THIS_MODULE_NAME,:(flrsetops,flora_list_sublist([flapply(___type,___preVal)],___valuesByObjectOne)),fllibifthenelse(FLORA_THIS_MODULE_NAME,==(___val,___preVal),'\\false',','(=(__attrType,___type),=(__attrValue,___val)),319,'testHarness_flora.flr'),','(=(__attrType,___type),=(__attrValue,'NA')),313,'testHarness_flora.flr'),','(=(__attrType,'NA'),=(__attrValue,'NA')),305,'testHarness_flora.flr')),fllibexecute_delayed_calls([__ObjectType,__PersonID,___itterationPost,___preVal,___type,___val,___valuesByObjectOne,___valuesByObjectTwo,__attrType,__attrValue,__itteration,__itterationOne,__itterationTwo],[__ObjectType,__PersonID,__attrType,__attrValue,__itteration,__itterationOne,__itterationTwo])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,3,FLORA_THIS_WORKSPACE(d^tblflapply)(compare,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobal,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributes,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValues,__iteration,__instance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,4)))),null,'_$_$_flora''rule_enabled'(4,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,4,FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobal,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobalOneAgainstTwo,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobalOneAgainstTwo,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6))),null,'_$_$_flora''rule_enabled'(6,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,5,FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributes,__iteration,__PersonID,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributesOneAgainstTwo,__iteration,__PersonID,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributesOneAgainstTwo,__iteration,__PersonID,__entityType,__publicName,__attrValue,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8))),null,'_$_$_flora''rule_enabled'(8,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValues,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),';'(FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValuesOneAgainstTwo,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValuesOneAgainstTwo,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10))),null,'_$_$_flora''rule_enabled'(10,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(d^tblflapply)(returnObjectPublicName,__parentObject,__publicName,__itteration,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(fllibmodlit('d^mvd',[__parentObject,___attrID,__publicName,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),==(___attrID,flapply(attribute,id))),null,'_$_$_flora''rule_enabled'(12,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___attrID,__itteration,__parentObject,__publicName],[__itteration,__parentObject,__publicName]),true)).
?-(fllibinsrulesig(14,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__attrVarFour,__publicName,__attrValueOrObjectSeven,__itteration,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(fllibmodlit('d^mvd',[___obj,___attr,___attrValueOrObjectOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),','(==(___attr,medicaidRulebaseOutputVariable),','(fllibmodlit('d^mvd',[___attrValueOrObjectOne,___attrVarTwo,___attrValueOrObjectTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectTwo,___attrVarThree,___attrValueOrObjectThree,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectThree,__attrVarFour,___attrValueOrObjectFour,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectFour,___attrVarFive,___attrValueOrObjectFive,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,14)),','(==(___attrVarFive,'typ:attribute'),','(fllibmodlit('d^mvd',[___attrValueOrObjectFive,___attrVarSix,___attrValueOrObjectSix,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,14)),','(fllibmodlit('d^mvd',[___attrValueOrObjectSix,___attrVarSeven,__attrValueOrObjectSeven,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,14)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,14)),','(\=(___attrVarSeven,'typ:property'),FLORA_THIS_WORKSPACE(d^tblflapply)(returnObjectPublicName,___attrValueOrObjectFive,__publicName,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar16,14)))))))))))),null,'_$_$_flora''rule_enabled'(14,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___attr,___attrValueOrObjectFive,___attrValueOrObjectFour,___attrValueOrObjectOne,___attrValueOrObjectSix,___attrValueOrObjectThree,___attrValueOrObjectTwo,___attrVarFive,___attrVarSeven,___attrVarSix,___attrVarThree,___attrVarTwo,___obj,__attrValueOrObjectSeven,__attrVarFour,__itteration,__publicName],[__attrValueOrObjectSeven,__attrVarFour,__itteration,__publicName]),true)).
?-(fllibinsrulesig(16,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^tblflapply)(compareGlobalOneAgainstTwo,__iteration,__globalInstance,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(=(__iteration,__itterationOne),','(=(__entityType,global),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,___firstAttrValue,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,___firstAttrValue,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),'\\false',fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,__newdontcarevar4,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,16)),','(=(__publicName,___firstPublicName),=(__attrValue,___firstAttrValue)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,___firstPublicName,__newdontcarevar6,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,16)),','(=(__publicName,___firstPublicName),=(__attrValue,'NA')),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnGlobalAttributes,__globalInstance,__newdontcarevar8,__newdontcarevar9,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,16)),','(=(__publicName,___firstPublicName),=(__attrValue,'NA')),','(=(__publicName,'NA'),=(__attrValue,'NA')),102,'testHarness_flora.flr'),91,'testHarness_flora.flr'),80,'testHarness_flora.flr'),70,'testHarness_flora.flr')))),null,'_$_$_flora''rule_enabled'(16,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__newdontcarevar11,___firstAttrValue,___firstPublicName,__attrValue,__entityType,__globalInstance,__iteration,__itterationOne,__itterationTwo,__publicName],[__attrValue,__entityType,__globalInstance,__iteration,__itterationOne,__itterationTwo,__publicName]),true)).
?-(fllibinsrulesig(18,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPerson,__ID,__objectName,__objectID,__attr,__value,__itteration,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnListOfPersonObjectsAndIdentifier,___person,__ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(descend,___person,___childObjects,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributeValues,___childObjects,__objectName,__attr,__value,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,18)),FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectIdentifiers,___childObjects,___type,__objectID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,18))))),null,'_$_$_flora''rule_enabled'(18,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ID,___childObjects,___person,___type,__attr,__itteration,__objectID,__objectName,__value],[__ID,__attr,__itteration,__objectID,__objectName,__value]),true)).
?-(fllibinsrulesig(20,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesOnPerson,__ID,__publicName,__attrValueOrObjectFive,__itteration,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnListOfPersonObjectsAndIdentifier,___personObj,__ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),','(fllibmodlit('d^mvd',[___personObj,___attrVarThree,___attrValueOrObjectThree,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20)),','(==(___attrVarThree,'typ:attribute'),','(fllibmodlit('d^mvd',[___attrValueOrObjectThree,___attrVarFour,___attrValueOrObjectFour,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,20)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,20)),','(\=(___attrVarFour,'typ:properties'),','(\=(___attrVarFour,'typ:change-point'),','(fllibmodlit('d^mvd',[___attrValueOrObjectFour,___attrVarFive,__attrValueOrObjectFive,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,20)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,20)),FLORA_THIS_WORKSPACE(d^tblflapply)(returnObjectPublicName,___attrValueOrObjectThree,__publicName,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,20))))))))),null,'_$_$_flora''rule_enabled'(20,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ID,___attrValueOrObjectFour,___attrValueOrObjectThree,___attrVarFive,___attrVarFour,___attrVarThree,___personObj,__attrValueOrObjectFive,__itteration,__publicName],[__ID,__attrValueOrObjectFive,__itteration,__publicName]),true)).
?-(fllibinsrulesig(22,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(d^tblflapply)(child,__X,__Y,__itteration,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),fllibmodlit('d^mvd',[__X,___attr,__Y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),null,'_$_$_flora''rule_enabled'(22,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y,___attr,__itteration],[__X,__Y,__itteration]),true)).
?-(fllibinsrulesig(24,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,13,FLORA_THIS_WORKSPACE(d^tblflapply)(descend,__X,__Y,__itteration,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(child,__X,__Y,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),null,'_$_$_flora''rule_enabled'(24,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(26,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,14,FLORA_THIS_WORKSPACE(d^tblflapply)(descend,__X,__Y,__itteration,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(child,__X,__Z,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),FLORA_THIS_WORKSPACE(d^tblflapply)(child,__Z,__Y,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26))),null,'_$_$_flora''rule_enabled'(26,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__X,__Y,__Z,__itteration],[__X,__Y,__itteration]),true)).
?-(fllibinsrulesig(28,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,15,FLORA_THIS_WORKSPACE(d^tblflapply)(returnListOfPersonObjectsAndIdentifier,__person,__ID,__itteration,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnPersonParentObject,___obj,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),','(fllibmodlit('d^mvd',[___object,___attrID,___attrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,28)),','(fllibmodlit('d^mvd',[___attrValueOrObject,___twoAttrID,___obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,28)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,28)),','(fllibmodlit('d^mvd',[___obj,___threeAttrID,__person,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,28)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,28)),','(==(___threeAttrID,'typ:instance'),FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectIdentifiers,__person,___type,__ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,28))))))),null,'_$_$_flora''rule_enabled'(28,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ID,___attrID,___attrValueOrObject,___obj,___object,___threeAttrID,___twoAttrID,___type,__itteration,__person],[__ID,__itteration,__person]),true)).
?-(fllibinsrulesig(30,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,16,FLORA_THIS_WORKSPACE(d^tblflapply)(returnPersonParentObject,__obj,__itteration,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(fllibmodlit('d^mvd',[___object,___attrID,___attrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30)),','(fllibmodlit('d^mvd',[___attrValueOrObject,___twoAttrID,__obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,30)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,30)),','(fllibmodlit('d^mvd',[__obj,___threeAttrID,___threeAttrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,30)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,30)),==(___threeAttrValueOrObject,person)))),null,'_$_$_flora''rule_enabled'(30,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___attrID,___attrValueOrObject,___object,___threeAttrID,___threeAttrValueOrObject,___twoAttrID,__itteration,__obj],[__itteration,__obj]),true)).
?-(fllibinsrulesig(32,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,17,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectIdentifiers,__Obj,__type,__ID,__itteration,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllInstanceObjects,__Obj,__type,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),','(fllibmodlit('d^mvd',[__Obj,___attrID,__ID,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,32)),=(___attrID,flapply(attribute,id)))),null,'_$_$_flora''rule_enabled'(32,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ID,__Obj,___attrID,__itteration,__type],[__ID,__Obj,__itteration,__type]),true)).
?-(fllibinsrulesig(34,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,18,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllInstanceObjects,__object,__type,__itteration,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectsExcludingGlobal,___obj,__type,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(fllibmodlit('d^mvd',[___obj,___attrID,__object,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),=(___attrID,'typ:instance'))),null,'_$_$_flora''rule_enabled'(34,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___attrID,___obj,__itteration,__object,__type],[__itteration,__object,__type]),true)).
?-(fllibinsrulesig(36,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,19,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectsExcludingGlobal,__obj,__type,__itteration,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','(fllibmodlit('d^mvd',[___object,___attrID,___attrValueOrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,36)),','(fllibmodlit('d^mvd',[___attrValueOrObject,___twoAttrID,__obj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,36)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,36)),','(fllibmodlit('d^mvd',[__obj,___threeAttrID,__type,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,36)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,36)),','(==(___twoAttrID,'typ:entity'),==(___threeAttrID,flapply(attribute,id)))))),null,'_$_$_flora''rule_enabled'(36,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([___attrID,___attrValueOrObject,___object,___threeAttrID,___twoAttrID,__itteration,__obj,__type],[__itteration,__obj,__type]),true)).
?-(fllibinsrulesig(38,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributeValues,__Obj,__objectName,__attr,__value,__itteration,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllObjectIdentifiers,__Obj,__objectName,___ID,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)),','(fllibmodlit('d^mvd',[__Obj,___attrID,___attrObject,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,38)),','(==(___attrID,'typ:attribute'),','(fllibmodlit('d^mvd',[___attrObject,___attrAttributeId,__attr,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,38)),','(==(___attrAttributeId,flapply(attribute,id)),','(fllibmodlit('d^mvd',[___attrObject,___typeValOrProperty,___finalObj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,38)),','(\=(___typeValOrProperty,'typ:properties'),fllibmodlit('d^mvd',[___finalObj,___finalAttr,__value,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,38)],__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,38))))))))),null,'_$_$_flora''rule_enabled'(38,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Obj,___ID,___attrAttributeId,___attrID,___attrObject,___finalAttr,___finalObj,___typeValOrProperty,__attr,__itteration,__objectName,__value],[__Obj,__attr,__itteration,__objectName,__value]),true)).
?-(fllibinsrulesig(40,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,21,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,__ObjectType,__valuesByObject,__itteration,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','(','(fllibsetof(__newdontcarevar3,[__objectName,__ID,___objectIdentifier],','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPerson,__ID,__objectName,___objectIdentifier,__attr,__value,__itteration,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40)),=(__newdontcarevar3,flapply(__attr,__value))),fllibexecute_delayed_calls([__ID,___objectIdentifier,__attr,__newdontcarevar3,__itteration,__objectName,__value],[])),__newvar4),=(__valuesByObject,__newvar4)),','(=(__PersonID,__ID),=(__ObjectType,__objectName))),null,'_$_$_flora''rule_enabled'(40,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ID,__ObjectType,__PersonID,___objectIdentifier,__attr,__itteration,__objectName,__value,__valuesByObject],[__ObjectType,__PersonID,__itteration,__valuesByObject]),true)).
?-(fllibinsrulesig(42,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,22,FLORA_THIS_WORKSPACE(d^tblflapply)(compareAllPersonAttributesOneAgainstTwo,__itteration,__PersonID,__entityType,__publicName,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','(=(__itteration,__itterationOne),','(=(__entityType,person),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesOnPerson,__PersonID,___onePublicName,___oneAttrValue,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesOnPerson,__PersonID,___onePublicName,___oneAttrValue,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,42)),'\\false',fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesOnPerson,__PersonID,___onePublicName,__newdontcarevar4,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,42)),','(=(__publicName,___onePublicName),=(__attrValue,___oneAttrValue)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(postReturnAllAttributesOnPerson,__PersonID,___onePublicName,__newdontcarevar6,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,42)),','(=(__publicName,___onePublicName),=(__attrValue,'NA')),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(postReturnAllAttributesOnPerson,__PersonID,__newdontcarevar8,__newdontcarevar9,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,42)),','(=(__publicName,___onePublicName),=(__attrValue,'NA')),','(=(__publicName,'NA'),=(__attrValue,'NA')),240,'testHarness_flora.flr'),229,'testHarness_flora.flr'),218,'testHarness_flora.flr'),208,'testHarness_flora.flr')))),null,'_$_$_flora''rule_enabled'(42,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__PersonID,__newdontcarevar11,___oneAttrValue,___onePublicName,__attrValue,__entityType,__itteration,__itterationOne,__itterationTwo,__publicName],[__PersonID,__attrValue,__entityType,__itteration,__itterationOne,__itterationTwo,__publicName]),true)).
?-(fllibinsrulesig(44,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,23,FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonOneAgainstTwo,__itteration,__PersonID,__ObjectType,__valuesByObject,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','(=(__itteration,__itterationOne),','(FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,___oneObjectType,___oneValuesByObject,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,___oneObjectType,___oneValuesByObject,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,44)),'\\false',fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,___oneObjectType,__newdontcarevar4,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,44)),','(=(__ObjectType,___oneObjectType),=(__valuesByObject,___oneValuesByObject)),fllibifthenelse(FLORA_THIS_MODULE_NAME,FLORA_THIS_WORKSPACE(d^tblflapply)(returnAllAttributesUnderPersonByEntity,__PersonID,__newdontcarevar6,__newdontcarevar7,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,44)),','(=(__ObjectType,___oneObjectType),=(__valuesByObject,'NA')),','(=(__ObjectType,'NA'),=(__valuesByObject,'NA')),283,'testHarness_flora.flr'),272,'testHarness_flora.flr'),262,'testHarness_flora.flr'))),null,'_$_$_flora''rule_enabled'(44,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ObjectType,__PersonID,__newdontcarevar9,___oneObjectType,___oneValuesByObject,__itteration,__itterationOne,__itterationTwo,__valuesByObject],[__ObjectType,__PersonID,__itteration,__itterationOne,__itterationTwo,__valuesByObject]),true)).
?-(fllibinsrulesig(46,'testHarness_flora.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,24,FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonSpecificValuesOneAgainstTwo,__itteration,__PersonID,__ObjectType,__attrType,__attrValue,__itterationOne,__itterationTwo,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonOneAgainstTwo,__itteration,__PersonID,__ObjectType,___valuesByObjectOne,__itterationOne,__itterationTwo,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46)),fllibifthenelse(FLORA_THIS_MODULE_NAME,','(FLORA_THIS_WORKSPACE(d^tblflapply)(comparePersonAttributesUnderPersonOneAgainstTwo,___itterationPost,__PersonID,__ObjectType,___valuesByObjectTwo,__itterationTwo,__itterationOne,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,46)),:(flrsetops,flora_list_sublist([flapply(___type,___val)],___valuesByObjectTwo))),fllibifthenelse(FLORA_THIS_MODULE_NAME,:(flrsetops,flora_list_sublist([flapply(___type,___preVal)],___valuesByObjectOne)),fllibifthenelse(FLORA_THIS_MODULE_NAME,==(___val,___preVal),'\\false',','(=(__attrType,___type),=(__attrValue,___val)),319,'testHarness_flora.flr'),','(=(__attrType,___type),=(__attrValue,'NA')),313,'testHarness_flora.flr'),','(=(__attrType,'NA'),=(__attrValue,'NA')),305,'testHarness_flora.flr')),null,'_$_$_flora''rule_enabled'(46,'testHarness_flora.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__ObjectType,__PersonID,___itterationPost,___preVal,___type,___val,___valuesByObjectOne,___valuesByObjectTwo,__attrType,__attrValue,__itteration,__itterationOne,__itterationTwo],[__ObjectType,__PersonID,__attrType,__attrValue,__itteration,__itterationOne,__itterationTwo]),true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'testHarness_flora.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

/************************************************************************
  file: headerinc/flrtrailer_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailer.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpreddef_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrpreddef.flh"

/***********************************************************************/

