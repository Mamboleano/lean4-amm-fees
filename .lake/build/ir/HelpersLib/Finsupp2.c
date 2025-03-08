// Lean compiler output
// Module: HelpersLib.Finsupp2
// Imports: Init Mathlib.Data.Finsupp.Basic Mathlib.Data.Finsupp.Defs Mathlib.Tactic.LibrarySearch HelpersLib.Prod
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
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___elambda__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___rarg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap(lean_object*, lean_object*, lean_object*);
static lean_object* l_Finsupp_uncurried__swap___rarg___closed__1;
lean_object* l_Prod_swap___rarg(lean_object*);
lean_object* l_Multiset_map___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___elambda__1___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___elambda__1(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Prod_swap__emb___elambda__1___rarg___boxed(lean_object*);
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___elambda__1___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_2);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = l_Prod_swap___rarg(x_2);
lean_dec(x_2);
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
lean_dec(x_1);
x_6 = lean_apply_1(x_5, x_4);
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_7 = lean_ctor_get(x_2, 0);
x_8 = lean_ctor_get(x_2, 1);
lean_inc(x_8);
lean_inc(x_7);
lean_dec(x_2);
x_9 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_9, 0, x_7);
lean_ctor_set(x_9, 1, x_8);
x_10 = l_Prod_swap___rarg(x_9);
lean_dec(x_9);
x_11 = lean_ctor_get(x_1, 1);
lean_inc(x_11);
lean_dec(x_1);
x_12 = lean_apply_1(x_11, x_10);
return x_12;
}
}
}
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___elambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lean_alloc_closure((void*)(l_Finsupp_uncurried__swap___elambda__1___rarg), 2, 0);
return x_5;
}
}
static lean_object* _init_l_Finsupp_uncurried__swap___rarg___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_Prod_swap__emb___elambda__1___rarg___boxed), 1, 0);
return x_1;
}
}
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_3 = lean_ctor_get(x_2, 0);
lean_inc(x_3);
x_4 = l_Finsupp_uncurried__swap___rarg___closed__1;
x_5 = l_Multiset_map___rarg(x_4, x_3);
x_6 = lean_alloc_closure((void*)(l_Finsupp_uncurried__swap___elambda__1___rarg), 2, 1);
lean_closure_set(x_6, 0, x_2);
x_7 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_7, 0, x_5);
lean_ctor_set(x_7, 1, x_6);
return x_7;
}
}
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lean_alloc_closure((void*)(l_Finsupp_uncurried__swap___rarg___boxed), 2, 0);
return x_4;
}
}
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___elambda__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l_Finsupp_uncurried__swap___elambda__1(x_1, x_2, x_3, x_4);
lean_dec(x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_Finsupp_uncurried__swap___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_Finsupp_uncurried__swap___rarg(x_1, x_2);
lean_dec(x_1);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Data_Finsupp_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Data_Finsupp_Defs(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib_Tactic_LibrarySearch(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Prod(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_HelpersLib_Finsupp2(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Data_Finsupp_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Data_Finsupp_Defs(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib_Tactic_LibrarySearch(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_Prod(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Finsupp_uncurried__swap___rarg___closed__1 = _init_l_Finsupp_uncurried__swap___rarg___closed__1();
lean_mark_persistent(l_Finsupp_uncurried__swap___rarg___closed__1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
