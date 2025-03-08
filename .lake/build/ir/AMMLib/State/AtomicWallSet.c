// Lean compiler output
// Module: AMMLib.State.AtomicWallSet
// Imports: Init AMMLib.State.AtomicWall
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
extern lean_object* l___private_Mathlib_Data_Real_Basic_0__Real_zero;
LEAN_EXPORT lean_object* l_Finset_sum___at_S_u2080_supply___spec__2(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_sum___at_S_u2080_supply___spec__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_S_u2080_supply___lambda__1___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_S_u2080_supply(lean_object*, lean_object*);
lean_object* l_Multiset_map___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_sum___at_S_u2080_supply___spec__1___lambda__1(lean_object*, lean_object*, lean_object*);
lean_object* l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_657_(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_S_u2080_supply___lambda__1(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_S_u2080_get(lean_object*, lean_object*);
lean_object* l_List_foldrTR___rarg(lean_object*, lean_object*, lean_object*);
static lean_object* l_Finset_sum___at_S_u2080_supply___spec__2___closed__1;
LEAN_EXPORT lean_object* l_S_u2080_get(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_ctor_get(x_1, 1);
lean_inc(x_3);
lean_dec(x_1);
x_4 = lean_apply_1(x_3, x_2);
return x_4;
}
}
static lean_object* _init_l_Finset_sum___at_S_u2080_supply___spec__2___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_Real_definition____x40_Mathlib_Data_Real_Basic___hyg_657_), 2, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_Finset_sum___at_S_u2080_supply___spec__2(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_3 = l_Multiset_map___rarg(x_2, x_1);
x_4 = l_Finset_sum___at_S_u2080_supply___spec__2___closed__1;
x_5 = l___private_Mathlib_Data_Real_Basic_0__Real_zero;
x_6 = l_List_foldrTR___rarg(x_4, x_5, x_3);
return x_6;
}
}
LEAN_EXPORT lean_object* l_Finsupp_sum___at_S_u2080_supply___spec__1___lambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_ctor_get(x_1, 1);
lean_inc(x_4);
lean_dec(x_1);
lean_inc(x_3);
x_5 = lean_apply_1(x_4, x_3);
x_6 = lean_apply_2(x_2, x_3, x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* l_Finsupp_sum___at_S_u2080_supply___spec__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_3 = lean_ctor_get(x_1, 0);
lean_inc(x_3);
x_4 = lean_alloc_closure((void*)(l_Finsupp_sum___at_S_u2080_supply___spec__1___lambda__1), 3, 2);
lean_closure_set(x_4, 0, x_1);
lean_closure_set(x_4, 1, x_2);
x_5 = l_Finset_sum___at_S_u2080_supply___spec__2(x_3, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_S_u2080_supply___lambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_ctor_get(x_3, 1);
lean_inc(x_4);
lean_dec(x_3);
x_5 = lean_apply_1(x_4, x_1);
return x_5;
}
}
LEAN_EXPORT lean_object* l_S_u2080_supply(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_alloc_closure((void*)(l_S_u2080_supply___lambda__1___boxed), 3, 1);
lean_closure_set(x_3, 0, x_2);
x_4 = l_Finsupp_sum___at_S_u2080_supply___spec__1(x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_S_u2080_supply___lambda__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_S_u2080_supply___lambda__1(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AtomicWall(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_State_AtomicWallSet(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AtomicWall(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Finset_sum___at_S_u2080_supply___spec__2___closed__1 = _init_l_Finset_sum___at_S_u2080_supply___spec__2___closed__1();
lean_mark_persistent(l_Finset_sum___at_S_u2080_supply___spec__2___closed__1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
