// Lean compiler output
// Module: AMMLib.Transaction.Swap.Basic
// Imports: Init AMMLib.State.Tokens AMMLib.State.AMMs AMMLib.State.AMMsNN AMMLib.State.State AMMLib.State.Supply AMMLib.State.Networth AMMLib.Transaction.Swap.Rate
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
LEAN_EXPORT lean_object* l_Swap_rate(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Swap_rate___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_AMMs_r1(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_973_(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Swap_y(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_AMMs_r0(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Swap_y___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Swap_rate(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_8 = lean_ctor_get(x_2, 2);
lean_inc(x_8);
lean_dec(x_2);
lean_inc(x_4);
lean_inc(x_3);
lean_inc(x_8);
x_9 = l_AMMs_r0(x_8, x_3, x_4, lean_box(0));
x_10 = l_AMMs_r1(x_8, x_3, x_4, lean_box(0));
x_11 = lean_apply_3(x_1, x_6, x_9, x_10);
return x_11;
}
}
LEAN_EXPORT lean_object* l_Swap_rate___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; 
x_8 = l_Swap_rate(x_1, x_2, x_3, x_4, x_5, x_6, x_7);
lean_dec(x_5);
return x_8;
}
}
LEAN_EXPORT lean_object* l_Swap_y(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; lean_object* x_9; 
lean_inc(x_6);
x_8 = l_Swap_rate(x_1, x_2, x_3, x_4, x_5, x_6, lean_box(0));
x_9 = l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_973_(x_6, x_8);
return x_9;
}
}
LEAN_EXPORT lean_object* l_Swap_y___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; 
x_8 = l_Swap_y(x_1, x_2, x_3, x_4, x_5, x_6, x_7);
lean_dec(x_5);
return x_8;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Tokens(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AMMs(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AMMsNN(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_State(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Supply(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Networth(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Rate(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_Transaction_Swap_Basic(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Tokens(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AMMs(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AMMsNN(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_State(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Supply(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Networth(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Rate(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
