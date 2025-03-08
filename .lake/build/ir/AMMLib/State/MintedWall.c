// Lean compiler output
// Module: AMMLib.State.MintedWall
// Imports: Init Mathlib.Data.Finsupp.Defs Mathlib.Data.Real.NNReal Mathlib.Data.Sym.Sym2 Mathlib.Algebra.BigOperators.Finsupp HelpersLib.NNReal HelpersLib.Prod HelpersLib.PReal.Basic HelpersLib.PReal.Subtraction HelpersLib.Finsupp2 AMMLib.State.Tokens AMMLib.State.AtomicWall
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* l_W_u2081_empty___lambda__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_W_u2081_empty;
lean_object* l_Pi_instZero___elambda__1___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instZeroW_u2081;
LEAN_EXPORT lean_object* l_W_u2081_get(lean_object*, lean_object*, lean_object*);
static lean_object* l_W_u2081_empty___closed__1;
lean_object* l_Finsupp_zero___rarg(lean_object*);
LEAN_EXPORT lean_object* l_W_u2081_empty___lambda__1___boxed(lean_object*, lean_object*);
extern lean_object* l_instNNRealZero;
LEAN_EXPORT lean_object* l_W_u2081_empty___lambda__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
static lean_object* _init_l_W_u2081_empty___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_instNNRealZero;
x_2 = l_Finsupp_zero___rarg(x_1);
return x_2;
}
}
static lean_object* _init_l_W_u2081_empty() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = lean_box(0);
x_2 = l_W_u2081_empty___closed__1;
x_3 = lean_alloc_closure((void*)(l_W_u2081_empty___lambda__1___boxed), 2, 1);
lean_closure_set(x_3, 0, x_2);
x_4 = lean_alloc_closure((void*)(l_Pi_instZero___elambda__1___rarg), 2, 1);
lean_closure_set(x_4, 0, x_3);
x_5 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_5, 0, x_1);
lean_ctor_set(x_5, 1, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_W_u2081_empty___lambda__1___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_W_u2081_empty___lambda__1(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
static lean_object* _init_l_instZeroW_u2081() {
_start:
{
lean_object* x_1; 
x_1 = l_W_u2081_empty;
return x_1;
}
}
LEAN_EXPORT lean_object* l_W_u2081_get(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
x_5 = lean_apply_1(x_4, x_2);
x_6 = lean_ctor_get(x_5, 1);
lean_inc(x_6);
lean_dec(x_5);
x_7 = lean_apply_1(x_6, x_3);
return x_7;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Data_Finsupp_Defs(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Data_Real_NNReal(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Data_Sym_Sym2(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Algebra_BigOperators_Finsupp(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_NNReal(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Prod(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Subtraction(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Finsupp2(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Tokens(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AtomicWall(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_State_MintedWall(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Data_Finsupp_Defs(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Data_Real_NNReal(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Data_Sym_Sym2(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Algebra_BigOperators_Finsupp(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_NNReal(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_Prod(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Subtraction(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_Finsupp2(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Tokens(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AtomicWall(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_W_u2081_empty___closed__1 = _init_l_W_u2081_empty___closed__1();
lean_mark_persistent(l_W_u2081_empty___closed__1);
l_W_u2081_empty = _init_l_W_u2081_empty();
lean_mark_persistent(l_W_u2081_empty);
l_instZeroW_u2081 = _init_l_instZeroW_u2081();
lean_mark_persistent(l_instZeroW_u2081);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
