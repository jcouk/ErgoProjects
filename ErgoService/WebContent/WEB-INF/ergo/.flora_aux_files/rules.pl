
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
#define FLORA_THIS_FILENAME  'rules.flr'
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

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'rules.fdb'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FDB_FILENAME,FLORA_THIS_MODULE_NAME,'fdb'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FDB_FILENAME,FLORA_THIS_FDB_STORAGE))).
#endif

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'rules.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(rules,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'rules.fld'
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
#define FLORA_FLS_FILENAME  'rules.fls'
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

:-(FLORA_THIS_WORKSPACE(static^meth)(__person,incomeLimitsCalculated,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_flora''rule_enabled'(4,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__person,tanfIncomeLimit,__x,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),FLORA_THIS_WORKSPACE(d^mvd)(__person,medicaidIncomeLimit,__z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,4)))),fllibexecute_delayed_calls([__person,__x,__y,__z],[__person])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__person,tanfIncomeLimit,__value,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_flora''rule_enabled'(6,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)('TANF',baseAmount,__baseAmount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,householdSize,__size,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),fllibdelayedliteral('\\is','rules.flr',14,[__value,*(__baseAmount,__size)]))),fllibexecute_delayed_calls([__baseAmount,__person,__size,__value],[__person,__value])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__person,snapIncomeLimit,__value,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_flora''rule_enabled'(8,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)('SNAP',baseAmount,__baseAmount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,householdSize,__size,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),fllibdelayedliteral('\\is','rules.flr',20,[__value,*(__baseAmount,__size)]))),fllibexecute_delayed_calls([__baseAmount,__person,__size,__value],[__person,__value])))).
:-(FLORA_THIS_WORKSPACE(static^mvd)(__person,medicaidIncomeLimit,__value,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_flora''rule_enabled'(10,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)('Medicaid',baseAmount,__baseAmount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,householdSize,__size,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),fllibdelayedliteral('\\is','rules.flr',27,[__value,*(__baseAmount,__size)]))),fllibexecute_delayed_calls([__baseAmount,__person,__size,__value],[__person,__value])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_flora''rule_enabled'(12,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,tanfIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),fllibdelayedliteral(<,'rules.flr',33,[__income,__amt]))),fllibexecute_delayed_calls([__amt,__income,__person],[__person])))).
:-(FLORA_THIS_WORKSPACE(static^neg^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_flora''rule_enabled'(14,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,tanfIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),fllibdelayedliteral(=<,'rules.flr',39,[__amt,__income]))),fllibexecute_delayed_calls([__amt,__income,__person],[__person])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_flora''rule_enabled'(16,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),fllibdelayedliteral(<,'rules.flr',44,[__income,__amt]))),fllibexecute_delayed_calls([__amt,__income,__person],[__person])))).
:-(FLORA_THIS_WORKSPACE(static^neg^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_flora''rule_enabled'(18,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),fllibdelayedliteral(=<,'rules.flr',51,[__amt,__income]))),fllibexecute_delayed_calls([__amt,__income,__person],[__person])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_flora''rule_enabled'(20,'rules.flr',FLORA_THIS_MODULE_NAME),','(';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdMemberOlderThan65,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,medicaidIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20)),fllibdelayedliteral(<,'rules.flr',57,[__income,__amt])))),fllibexecute_delayed_calls([__amt,__income,__person],[__person])))).
:-(FLORA_THIS_WORKSPACE(static^neg^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_flora''rule_enabled'(22,'rules.flr',FLORA_THIS_MODULE_NAME),','(','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_unnumber_call)(','(FLORA_THIS_WORKSPACE(d^meth)(__person,householdMemberOlderThan65,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),fllibexecute_delayed_calls([__person],[]))),[__person],60,'rules.flr')),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22)),fllibdelayedliteral(=<,'rules.flr',63,[__amt,__income])))),fllibexecute_delayed_calls([__amt,__income,__person],[__person])))).
:-(FLORA_THIS_WORKSPACE(static^meth)(__person,householdBenefitsAssessed,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_flora''rule_enabled'(24,'rules.flr',FLORA_THIS_MODULE_NAME),','(';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24))),','(';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24)),FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,24))),';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,24)),FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,24))))))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,3,FLORA_THIS_WORKSPACE(d^meth)(__person,incomeLimitsCalculated,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,tanfIncomeLimit,__x,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__y,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),FLORA_THIS_WORKSPACE(d^mvd)(__person,medicaidIncomeLimit,__z,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,4)))),null,'_$_$_flora''rule_enabled'(4,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__person,__x,__y,__z],[__person]),true)).
?-(fllibinsrulesig(6,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,4,FLORA_THIS_WORKSPACE(d^mvd)(__person,tanfIncomeLimit,__value,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)('TANF',baseAmount,__baseAmount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,householdSize,__size,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),fllibdelayedliteral('\\is','rules.flr',14,[__value,*(__baseAmount,__size)]))),null,'_$_$_flora''rule_enabled'(6,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__baseAmount,__person,__size,__value],[__person,__value]),true)).
?-(fllibinsrulesig(8,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,5,FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__value,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)('SNAP',baseAmount,__baseAmount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,householdSize,__size,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),fllibdelayedliteral('\\is','rules.flr',20,[__value,*(__baseAmount,__size)]))),null,'_$_$_flora''rule_enabled'(8,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__baseAmount,__person,__size,__value],[__person,__value]),true)).
?-(fllibinsrulesig(10,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(d^mvd)(__person,medicaidIncomeLimit,__value,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)('Medicaid',baseAmount,__baseAmount,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,householdSize,__size,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),fllibdelayedliteral('\\is','rules.flr',27,[__value,*(__baseAmount,__size)]))),null,'_$_$_flora''rule_enabled'(10,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__baseAmount,__person,__size,__value],[__person,__value]),true)).
?-(fllibinsrulesig(12,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,tanfIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),fllibdelayedliteral(<,'rules.flr',33,[__income,__amt]))),null,'_$_$_flora''rule_enabled'(12,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__amt,__income,__person],[__person]),true)).
?-(fllibinsrulesig(14,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,tanfIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),fllibdelayedliteral(=<,'rules.flr',39,[__amt,__income]))),null,'_$_$_flora''rule_enabled'(14,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__amt,__income,__person],[__person]),true)).
?-(fllibinsrulesig(16,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,16)),fllibdelayedliteral(<,'rules.flr',44,[__income,__amt]))),null,'_$_$_flora''rule_enabled'(16,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__amt,__income,__person],[__person]),true)).
?-(fllibinsrulesig(18,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,18)),fllibdelayedliteral(=<,'rules.flr',51,[__amt,__income]))),null,'_$_$_flora''rule_enabled'(18,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__amt,__income,__person],[__person]),true)).
?-(fllibinsrulesig(20,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdMemberOlderThan65,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,20)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,medicaidIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,20)),fllibdelayedliteral(<,'rules.flr',57,[__income,__amt])))),null,'_$_$_flora''rule_enabled'(20,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__amt,__income,__person],[__person]),true)).
?-(fllibinsrulesig(22,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(flibnafdelay(flora_naf(FLORA_THIS_WORKSPACE(tabled_unnumber_call)(','(FLORA_THIS_WORKSPACE(d^meth)(__person,householdMemberOlderThan65,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),fllibexecute_delayed_calls([__person],[]))),[__person],60,'rules.flr')),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,totalGrossIncome,__income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,22)),','(FLORA_THIS_WORKSPACE(d^mvd)(__person,snapIncomeLimit,__amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,22)),fllibdelayedliteral(=<,'rules.flr',63,[__amt,__income])))),null,'_$_$_flora''rule_enabled'(22,'rules.flr',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__amt,__income,__person],[__person]),true)).
?-(fllibinsrulesig(24,'rules.flr','_$_$_flora''descr_vars',FLORA_THIS_MODULE_NAME,13,FLORA_THIS_WORKSPACE(d^meth)(__person,householdBenefitsAssessed,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallyTanfEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24))),','(';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24)),FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallySnapEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,24))),';'(FLORA_THIS_WORKSPACE(d^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,24)),FLORA_THIS_WORKSPACE(neg^d^meth)(__person,householdIsPotentiallyMedicaidEligible,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,24))))),null,'_$_$_flora''rule_enabled'(24,'rules.flr',FLORA_THIS_MODULE_NAME),null,true)).


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
#define FLORA_FLS2_FILENAME  'rules.fls2'
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

