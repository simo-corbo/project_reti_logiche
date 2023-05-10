/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_633(char*, char *);
IKI_DLLESPEC extern void execute_634(char*, char *);
IKI_DLLESPEC extern void execute_635(char*, char *);
IKI_DLLESPEC extern void execute_636(char*, char *);
IKI_DLLESPEC extern void execute_29(char*, char *);
IKI_DLLESPEC extern void execute_37(char*, char *);
IKI_DLLESPEC extern void execute_39(char*, char *);
IKI_DLLESPEC extern void execute_40(char*, char *);
IKI_DLLESPEC extern void execute_41(char*, char *);
IKI_DLLESPEC extern void execute_43(char*, char *);
IKI_DLLESPEC extern void execute_44(char*, char *);
IKI_DLLESPEC extern void execute_45(char*, char *);
IKI_DLLESPEC extern void execute_60(char*, char *);
IKI_DLLESPEC extern void execute_95(char*, char *);
IKI_DLLESPEC extern void execute_164(char*, char *);
IKI_DLLESPEC extern void execute_179(char*, char *);
IKI_DLLESPEC extern void execute_279(char*, char *);
IKI_DLLESPEC extern void execute_280(char*, char *);
IKI_DLLESPEC extern void execute_284(char*, char *);
IKI_DLLESPEC extern void execute_287(char*, char *);
IKI_DLLESPEC extern void execute_290(char*, char *);
IKI_DLLESPEC extern void execute_293(char*, char *);
IKI_DLLESPEC extern void execute_309(char*, char *);
IKI_DLLESPEC extern void execute_326(char*, char *);
IKI_DLLESPEC extern void execute_329(char*, char *);
IKI_DLLESPEC extern void execute_344(char*, char *);
IKI_DLLESPEC extern void execute_441(char*, char *);
IKI_DLLESPEC extern void execute_443(char*, char *);
IKI_DLLESPEC extern void execute_445(char*, char *);
IKI_DLLESPEC extern void execute_446(char*, char *);
IKI_DLLESPEC extern void execute_481(char*, char *);
IKI_DLLESPEC extern void execute_482(char*, char *);
IKI_DLLESPEC extern void transaction_4(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
IKI_DLLESPEC extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_102(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_110(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_119(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_127(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_135(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_145(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_153(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_161(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_169(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_177(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_185(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_193(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_201(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_211(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_219(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_227(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_235(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_243(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_251(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_259(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_267(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_277(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_285(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_293(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_301(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_309(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_317(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_325(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_333(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_351(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_359(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_367(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_375(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_383(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_391(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_399(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_407(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_468(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_476(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_484(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_492(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_500(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_508(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_516(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_524(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_532(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_540(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_548(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_556(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_564(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_572(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_580(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_588(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_596(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_604(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_612(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_620(char*, char*, unsigned, unsigned, unsigned);
IKI_DLLESPEC extern void transaction_628(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[104] = {(funcp)execute_633, (funcp)execute_634, (funcp)execute_635, (funcp)execute_636, (funcp)execute_29, (funcp)execute_37, (funcp)execute_39, (funcp)execute_40, (funcp)execute_41, (funcp)execute_43, (funcp)execute_44, (funcp)execute_45, (funcp)execute_60, (funcp)execute_95, (funcp)execute_164, (funcp)execute_179, (funcp)execute_279, (funcp)execute_280, (funcp)execute_284, (funcp)execute_287, (funcp)execute_290, (funcp)execute_293, (funcp)execute_309, (funcp)execute_326, (funcp)execute_329, (funcp)execute_344, (funcp)execute_441, (funcp)execute_443, (funcp)execute_445, (funcp)execute_446, (funcp)execute_481, (funcp)execute_482, (funcp)transaction_4, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_59, (funcp)transaction_60, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_102, (funcp)transaction_110, (funcp)transaction_119, (funcp)transaction_127, (funcp)transaction_135, (funcp)transaction_145, (funcp)transaction_153, (funcp)transaction_161, (funcp)transaction_169, (funcp)transaction_177, (funcp)transaction_185, (funcp)transaction_193, (funcp)transaction_201, (funcp)transaction_211, (funcp)transaction_219, (funcp)transaction_227, (funcp)transaction_235, (funcp)transaction_243, (funcp)transaction_251, (funcp)transaction_259, (funcp)transaction_267, (funcp)transaction_277, (funcp)transaction_285, (funcp)transaction_293, (funcp)transaction_301, (funcp)transaction_309, (funcp)transaction_317, (funcp)transaction_325, (funcp)transaction_333, (funcp)transaction_351, (funcp)transaction_359, (funcp)transaction_367, (funcp)transaction_375, (funcp)transaction_383, (funcp)transaction_391, (funcp)transaction_399, (funcp)transaction_407, (funcp)transaction_468, (funcp)transaction_476, (funcp)transaction_484, (funcp)transaction_492, (funcp)transaction_500, (funcp)transaction_508, (funcp)transaction_516, (funcp)transaction_524, (funcp)transaction_532, (funcp)transaction_540, (funcp)transaction_548, (funcp)transaction_556, (funcp)transaction_564, (funcp)transaction_572, (funcp)transaction_580, (funcp)transaction_588, (funcp)transaction_596, (funcp)transaction_604, (funcp)transaction_612, (funcp)transaction_620, (funcp)transaction_628};
const int NumRelocateId= 104;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/gt_func_synth/xsim.reloc",  (void **)funcTab, 104);
	iki_vhdl_file_variable_register(dp + 1192688);
	iki_vhdl_file_variable_register(dp + 1192744);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/gt_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/gt_func_synth/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/gt_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/gt_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/gt_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
