// Lean compiler output
// Module: AMMLib.State.AMMs
// Imports: Init Mathlib HelpersLib.NNReal HelpersLib.Prod HelpersLib.PReal.Basic HelpersLib.Finsupp2 AMMLib.State.Tokens AMMLib.State.AtomicWall
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
lean_object* l_Finsupp_instZero___rarg(lean_object*);
lean_object* l_Pi_instZero___elambda__1___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_AMMs_r1(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_AMMs_empty___lambda__1___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_AMMs_empty___lambda__1(lean_object*, lean_object*);
static lean_object* l_AMMs_empty___closed__1;
LEAN_EXPORT lean_object* l_AMMs_empty;
LEAN_EXPORT lean_object* l_AMMs_r0(lean_object*, lean_object*, lean_object*, lean_object*);
extern lean_object* l_instNNRealZero;
LEAN_EXPORT lean_object* l_AMMs_empty___lambda__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
static lean_object* _init_l_AMMs_empty___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_instNNRealZero;
x_2 = l_Finsupp_instZero___rarg(x_1);
return x_2;
}
}
static lean_object* _init_l_AMMs_empty() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = lean_box(0);
x_2 = l_AMMs_empty___closed__1;
x_3 = lean_alloc_closure((void*)(l_AMMs_empty___lambda__1___boxed), 2, 1);
lean_closure_set(x_3, 0, x_2);
x_4 = lean_alloc_closure((void*)(l_Pi_instZero___elambda__1___rarg), 2, 1);
lean_closure_set(x_4, 0, x_3);
x_5 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_5, 0, x_1);
lean_ctor_set(x_5, 1, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_AMMs_empty___lambda__1___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_AMMs_empty___lambda__1(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_AMMs_r0(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
lean_dec(x_1);
x_6 = lean_apply_1(x_5, x_2);
x_7 = lean_ctor_get(x_6, 1);
lean_inc(x_7);
lean_dec(x_6);
x_8 = lean_apply_1(x_7, x_3);
return x_8;
}
}
LEAN_EXPORT lean_object* l_AMMs_r1(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
lean_dec(x_1);
x_6 = lean_apply_1(x_5, x_3);
x_7 = lean_ctor_get(x_6, 1);
lean_inc(x_7);
lean_dec(x_6);
x_8 = lean_apply_1(x_7, x_2);
return x_8;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_NNReal(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Prod(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Finsupp2(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Tokens(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AtomicWall(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_State_AMMs(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
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
res = initialize_HelpersLib_Finsupp2(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Tokens(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AtomicWall(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_AMMs_empty___closed__1 = _init_l_AMMs_empty___closed__1();
lean_mark_persistent(l_AMMs_empty___closed__1);
l_AMMs_empty = _init_l_AMMs_empty();
lean_mark_persistent(l_AMMs_empty);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
