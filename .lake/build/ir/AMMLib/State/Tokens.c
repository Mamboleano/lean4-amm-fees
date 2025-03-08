// Lean compiler output
// Module: AMMLib.State.Tokens
// Imports: Init Mathlib HelpersLib.PReal.Basic HelpersLib.PReal.Subtraction HelpersLib.Finsupp2
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
LEAN_EXPORT uint8_t l_instDecidableEqT(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidableEqT___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_instDecidableSamemint(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_instDecidableDiffmint(lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t l_instDecidableNot___rarg(uint8_t);
LEAN_EXPORT lean_object* l_instDecidableSamemint___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidableDiffmint___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidableEqA___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_instDecidableEqA(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_instDecidableEqA(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = lean_nat_dec_eq(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_instDecidableEqA___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_instDecidableEqA(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_instDecidableEqT(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = lean_nat_dec_eq(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_instDecidableEqT___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_instDecidableEqT(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_instDecidableSamemint(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lean_nat_dec_eq(x_1, x_3);
if (x_5 == 0)
{
uint8_t x_6; 
x_6 = lean_nat_dec_eq(x_1, x_4);
if (x_6 == 0)
{
uint8_t x_7; 
x_7 = 0;
return x_7;
}
else
{
uint8_t x_8; 
x_8 = lean_nat_dec_eq(x_2, x_3);
return x_8;
}
}
else
{
uint8_t x_9; 
x_9 = lean_nat_dec_eq(x_2, x_4);
if (x_9 == 0)
{
uint8_t x_10; 
x_10 = lean_nat_dec_eq(x_1, x_4);
if (x_10 == 0)
{
uint8_t x_11; 
x_11 = 0;
return x_11;
}
else
{
uint8_t x_12; 
x_12 = lean_nat_dec_eq(x_2, x_3);
return x_12;
}
}
else
{
uint8_t x_13; 
x_13 = 1;
return x_13;
}
}
}
}
LEAN_EXPORT lean_object* l_instDecidableSamemint___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; lean_object* x_6; 
x_5 = l_instDecidableSamemint(x_1, x_2, x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
x_6 = lean_box(x_5);
return x_6;
}
}
LEAN_EXPORT uint8_t l_instDecidableDiffmint(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; uint8_t x_6; 
x_5 = lean_nat_dec_eq(x_1, x_3);
x_6 = l_instDecidableNot___rarg(x_5);
if (x_6 == 0)
{
uint8_t x_7; uint8_t x_8; 
x_7 = lean_nat_dec_eq(x_2, x_3);
x_8 = l_instDecidableNot___rarg(x_7);
if (x_8 == 0)
{
uint8_t x_9; 
x_9 = 0;
return x_9;
}
else
{
uint8_t x_10; uint8_t x_11; 
x_10 = lean_nat_dec_eq(x_2, x_4);
x_11 = l_instDecidableNot___rarg(x_10);
return x_11;
}
}
else
{
uint8_t x_12; uint8_t x_13; 
x_12 = lean_nat_dec_eq(x_1, x_4);
x_13 = l_instDecidableNot___rarg(x_12);
if (x_13 == 0)
{
uint8_t x_14; uint8_t x_15; 
x_14 = lean_nat_dec_eq(x_2, x_3);
x_15 = l_instDecidableNot___rarg(x_14);
if (x_15 == 0)
{
uint8_t x_16; 
x_16 = 0;
return x_16;
}
else
{
uint8_t x_17; uint8_t x_18; 
x_17 = lean_nat_dec_eq(x_2, x_4);
x_18 = l_instDecidableNot___rarg(x_17);
return x_18;
}
}
else
{
uint8_t x_19; 
x_19 = 1;
return x_19;
}
}
}
}
LEAN_EXPORT lean_object* l_instDecidableDiffmint___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; lean_object* x_6; 
x_5 = l_instDecidableDiffmint(x_1, x_2, x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
x_6 = lean_box(x_5);
return x_6;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Subtraction(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Finsupp2(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_State_Tokens(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
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
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
