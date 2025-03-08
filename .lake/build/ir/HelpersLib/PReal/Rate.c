// Lean compiler output
// Module: HelpersLib.PReal.Rate
// Imports: Init HelpersLib.PReal.Basic
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
LEAN_EXPORT lean_object* l_PReal_PRate_instCoePRatePReal;
LEAN_EXPORT lean_object* l_PReal_PRate_instCoePRateNNReal;
lean_object* l_Std_Tactic_Coe_coeDelaborator(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PReal_PRate_toPReal___boxed(lean_object*);
LEAN_EXPORT lean_object* l_PReal_PRate_toNNReal(lean_object*);
static lean_object* l_PReal_PRate_instCoePRatePReal___closed__1;
LEAN_EXPORT lean_object* l_PReal_PRate_toPReal(lean_object*);
static lean_object* l_PReal_PRate_instCoePRateNNReal___closed__1;
LEAN_EXPORT lean_object* l_PReal_PRate_toNNReal___boxed(lean_object*);
static lean_object* l_PReal_PRate_toPReal_delaborator___closed__1;
LEAN_EXPORT lean_object* l_PReal_PRate_toNNReal_delaborator(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PReal_PRate_toPReal_delaborator(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* _init_l_PReal_PRate_toPReal_delaborator___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; uint8_t x_3; lean_object* x_4; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_unsigned_to_nat(0u);
x_3 = 0;
x_4 = lean_alloc_ctor(0, 2, 1);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set_uint8(x_4, sizeof(void*)*2, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_PReal_PRate_toPReal_delaborator(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; lean_object* x_9; 
x_8 = l_PReal_PRate_toPReal_delaborator___closed__1;
x_9 = l_Std_Tactic_Coe_coeDelaborator(x_8, x_1, x_2, x_3, x_4, x_5, x_6, x_7);
return x_9;
}
}
LEAN_EXPORT lean_object* l_PReal_PRate_toPReal(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_PReal_PRate_toPReal___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_PReal_PRate_toPReal(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_PReal_PRate_instCoePRatePReal___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_PReal_PRate_toPReal___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_PReal_PRate_instCoePRatePReal() {
_start:
{
lean_object* x_1; 
x_1 = l_PReal_PRate_instCoePRatePReal___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_PReal_PRate_toNNReal_delaborator(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; lean_object* x_9; 
x_8 = l_PReal_PRate_toPReal_delaborator___closed__1;
x_9 = l_Std_Tactic_Coe_coeDelaborator(x_8, x_1, x_2, x_3, x_4, x_5, x_6, x_7);
return x_9;
}
}
LEAN_EXPORT lean_object* l_PReal_PRate_toNNReal(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_PReal_PRate_toNNReal___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_PReal_PRate_toNNReal(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_PReal_PRate_instCoePRateNNReal___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_PReal_PRate_toNNReal___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_PReal_PRate_instCoePRateNNReal() {
_start:
{
lean_object* x_1; 
x_1 = l_PReal_PRate_instCoePRateNNReal___closed__1;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Basic(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_HelpersLib_PReal_Rate(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_PReal_PRate_toPReal_delaborator___closed__1 = _init_l_PReal_PRate_toPReal_delaborator___closed__1();
lean_mark_persistent(l_PReal_PRate_toPReal_delaborator___closed__1);
l_PReal_PRate_instCoePRatePReal___closed__1 = _init_l_PReal_PRate_instCoePRatePReal___closed__1();
lean_mark_persistent(l_PReal_PRate_instCoePRatePReal___closed__1);
l_PReal_PRate_instCoePRatePReal = _init_l_PReal_PRate_instCoePRatePReal();
lean_mark_persistent(l_PReal_PRate_instCoePRatePReal);
l_PReal_PRate_instCoePRateNNReal___closed__1 = _init_l_PReal_PRate_instCoePRateNNReal___closed__1();
lean_mark_persistent(l_PReal_PRate_instCoePRateNNReal___closed__1);
l_PReal_PRate_instCoePRateNNReal = _init_l_PReal_PRate_instCoePRateNNReal();
lean_mark_persistent(l_PReal_PRate_instCoePRateNNReal);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
