// Lean compiler output
// Module: HelpersLib.PReal.Basic
// Imports: Init Mathlib
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
static lean_object* l_term_u211d_x3e0___closed__5;
LEAN_EXPORT lean_object* l_PReal_toNNReal___boxed(lean_object*);
static lean_object* l_term_u211d_x3e0___closed__2;
LEAN_EXPORT lean_object* l_term_u211d_x3e0;
LEAN_EXPORT lean_object* l_PReal_instCoeReal;
lean_object* l_Lean_replaceRef(lean_object*, lean_object*);
static lean_object* l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__2;
uint8_t l_Lean_Syntax_isOfKind(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PReal_instCoeNNReal;
LEAN_EXPORT lean_object* l_PReal_toReal___boxed(lean_object*);
static lean_object* l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__1;
static lean_object* l_term_u211d_x3e0___closed__4;
lean_object* l_Lean_SourceInfo_fromRef(lean_object*, uint8_t);
static lean_object* l_PReal_instCoeReal___closed__1;
LEAN_EXPORT lean_object* l_PReal_toReal(lean_object*);
lean_object* l_Lean_addMacroScope(lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_Name_str___override(lean_object*, lean_object*);
static lean_object* l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__3;
LEAN_EXPORT lean_object* l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___boxed(lean_object*, lean_object*, lean_object*);
static lean_object* l_term_u211d_x3e0___closed__1;
static lean_object* l_PReal_instCoeNNReal___closed__1;
static lean_object* l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__4;
static lean_object* l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__2;
LEAN_EXPORT lean_object* l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1(lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_Syntax_node1(lean_object*, lean_object*, lean_object*);
static lean_object* l_term_u211d_x3e0___closed__3;
LEAN_EXPORT lean_object* l_PReal_toNNReal(lean_object*);
static lean_object* l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__5;
lean_object* l_String_toSubstring_x27(lean_object*);
static lean_object* l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__1;
LEAN_EXPORT lean_object* l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1(lean_object*, lean_object*, lean_object*);
static lean_object* _init_l_term_u211d_x3e0___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("termℝ>0", 9, 7);
return x_1;
}
}
static lean_object* _init_l_term_u211d_x3e0___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_term_u211d_x3e0___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_term_u211d_x3e0___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("ℝ>0", 5, 3);
return x_1;
}
}
static lean_object* _init_l_term_u211d_x3e0___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_term_u211d_x3e0___closed__3;
x_2 = lean_alloc_ctor(5, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_term_u211d_x3e0___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_term_u211d_x3e0___closed__2;
x_2 = lean_unsigned_to_nat(1024u);
x_3 = l_term_u211d_x3e0___closed__4;
x_4 = lean_alloc_ctor(3, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_term_u211d_x3e0() {
_start:
{
lean_object* x_1; 
x_1 = l_term_u211d_x3e0___closed__5;
return x_1;
}
}
static lean_object* _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("PReal", 5, 5);
return x_1;
}
}
static lean_object* _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__1;
x_2 = l_String_toSubstring_x27(x_1);
return x_2;
}
}
static lean_object* _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__3;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
static lean_object* _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__4;
x_3 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = l_term_u211d_x3e0___closed__2;
x_5 = l_Lean_Syntax_isOfKind(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
lean_dec(x_2);
x_6 = lean_box(1);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_3);
return x_7;
}
else
{
lean_object* x_8; uint8_t x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; 
x_8 = lean_ctor_get(x_2, 5);
lean_inc(x_8);
x_9 = 0;
x_10 = l_Lean_SourceInfo_fromRef(x_8, x_9);
lean_dec(x_8);
x_11 = lean_ctor_get(x_2, 2);
lean_inc(x_11);
x_12 = lean_ctor_get(x_2, 1);
lean_inc(x_12);
lean_dec(x_2);
x_13 = l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__3;
x_14 = l_Lean_addMacroScope(x_12, x_13, x_11);
x_15 = l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__2;
x_16 = l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__5;
x_17 = lean_alloc_ctor(3, 4, 0);
lean_ctor_set(x_17, 0, x_10);
lean_ctor_set(x_17, 1, x_15);
lean_ctor_set(x_17, 2, x_14);
lean_ctor_set(x_17, 3, x_16);
x_18 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_18, 0, x_17);
lean_ctor_set(x_18, 1, x_3);
return x_18;
}
}
}
static lean_object* _init_l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("ident", 5, 5);
return x_1;
}
}
static lean_object* _init_l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__2;
lean_inc(x_1);
x_5 = l_Lean_Syntax_isOfKind(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
lean_dec(x_1);
x_6 = lean_box(0);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_3);
return x_7;
}
else
{
lean_object* x_8; uint8_t x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; 
x_8 = l_Lean_replaceRef(x_1, x_2);
lean_dec(x_1);
x_9 = 0;
x_10 = l_Lean_SourceInfo_fromRef(x_8, x_9);
lean_dec(x_8);
x_11 = l_term_u211d_x3e0___closed__3;
lean_inc(x_10);
x_12 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_12, 0, x_10);
lean_ctor_set(x_12, 1, x_11);
x_13 = l_term_u211d_x3e0___closed__2;
x_14 = l_Lean_Syntax_node1(x_10, x_13, x_12);
x_15 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_3);
return x_15;
}
}
}
LEAN_EXPORT lean_object* l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
LEAN_EXPORT lean_object* l_PReal_toReal(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_PReal_toReal___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_PReal_toReal(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_PReal_instCoeReal___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_PReal_toReal___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_PReal_instCoeReal() {
_start:
{
lean_object* x_1; 
x_1 = l_PReal_instCoeReal___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_PReal_toNNReal(lean_object* x_1) {
_start:
{
lean_inc(x_1);
return x_1;
}
}
LEAN_EXPORT lean_object* l_PReal_toNNReal___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_PReal_toNNReal(x_1);
lean_dec(x_1);
return x_2;
}
}
static lean_object* _init_l_PReal_instCoeNNReal___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_PReal_toNNReal___boxed), 1, 0);
return x_1;
}
}
static lean_object* _init_l_PReal_instCoeNNReal() {
_start:
{
lean_object* x_1; 
x_1 = l_PReal_instCoeNNReal___closed__1;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Mathlib(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_HelpersLib_PReal_Basic(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Mathlib(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_term_u211d_x3e0___closed__1 = _init_l_term_u211d_x3e0___closed__1();
lean_mark_persistent(l_term_u211d_x3e0___closed__1);
l_term_u211d_x3e0___closed__2 = _init_l_term_u211d_x3e0___closed__2();
lean_mark_persistent(l_term_u211d_x3e0___closed__2);
l_term_u211d_x3e0___closed__3 = _init_l_term_u211d_x3e0___closed__3();
lean_mark_persistent(l_term_u211d_x3e0___closed__3);
l_term_u211d_x3e0___closed__4 = _init_l_term_u211d_x3e0___closed__4();
lean_mark_persistent(l_term_u211d_x3e0___closed__4);
l_term_u211d_x3e0___closed__5 = _init_l_term_u211d_x3e0___closed__5();
lean_mark_persistent(l_term_u211d_x3e0___closed__5);
l_term_u211d_x3e0 = _init_l_term_u211d_x3e0();
lean_mark_persistent(l_term_u211d_x3e0);
l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__1 = _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__1();
lean_mark_persistent(l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__1);
l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__2 = _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__2();
lean_mark_persistent(l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__2);
l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__3 = _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__3();
lean_mark_persistent(l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__3);
l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__4 = _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__4();
lean_mark_persistent(l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__4);
l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__5 = _init_l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__5();
lean_mark_persistent(l___aux__HelpersLib__PReal__Basic______macroRules__term_u211d_x3e0__1___closed__5);
l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__1 = _init_l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__1();
lean_mark_persistent(l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__1);
l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__2 = _init_l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__2();
lean_mark_persistent(l___aux__HelpersLib__PReal__Basic______unexpand__PReal__1___closed__2);
l_PReal_instCoeReal___closed__1 = _init_l_PReal_instCoeReal___closed__1();
lean_mark_persistent(l_PReal_instCoeReal___closed__1);
l_PReal_instCoeReal = _init_l_PReal_instCoeReal();
lean_mark_persistent(l_PReal_instCoeReal);
l_PReal_instCoeNNReal___closed__1 = _init_l_PReal_instCoeNNReal___closed__1();
lean_mark_persistent(l_PReal_instCoeNNReal___closed__1);
l_PReal_instCoeNNReal = _init_l_PReal_instCoeNNReal();
lean_mark_persistent(l_PReal_instCoeNNReal);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
