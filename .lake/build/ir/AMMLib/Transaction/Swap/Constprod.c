// Lean compiler output
// Module: AMMLib.Transaction.Swap.Constprod
// Imports: Init AMMLib.Transaction.Swap.Rate AMMLib.Transaction.Swap.Additive AMMLib.Transaction.Swap.Reversible HelpersLib.PReal.Sqrt HelpersLib.PReal.Order
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
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__23;
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_object* l_tacticNuclear___closed__2;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__28;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__26;
static lean_object* l_tacticNuclear___closed__3;
uint8_t l_Lean_Syntax_isOfKind(lean_object*, lean_object*);
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__4;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__15;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__8;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__29;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__10;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
LEAN_EXPORT lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1(lean_object*, lean_object*, lean_object*);
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__14;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__13;
lean_object* l_Lean_SourceInfo_fromRef(lean_object*, uint8_t);
lean_object* l_Lean_Syntax_node6(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__9;
lean_object* l_Lean_Syntax_node3(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Lean_Name_str___override(lean_object*, lean_object*);
static lean_object* l_tacticNuclear___closed__4;
lean_object* l_Lean_Syntax_node2(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__7;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__22;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__16;
lean_object* l_Lean_Syntax_node4(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__27;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__18;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__6;
static lean_object* l_tacticNuclear___closed__5;
LEAN_EXPORT lean_object* l_tacticNuclear;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__24;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__25;
lean_object* l_Lean_Syntax_node1(lean_object*, lean_object*, lean_object*);
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__21;
LEAN_EXPORT lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___boxed(lean_object*, lean_object*, lean_object*);
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__20;
lean_object* l_Lean_Name_mkStr4(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_tacticNuclear___closed__1;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__5;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__19;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__12;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__17;
static lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__11;
static lean_object* _init_l_tacticNuclear___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("tacticNuclear", 13, 13);
return x_1;
}
}
static lean_object* _init_l_tacticNuclear___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l_tacticNuclear___closed__1;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_tacticNuclear___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("nuclear", 7, 7);
return x_1;
}
}
static lean_object* _init_l_tacticNuclear___closed__4() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l_tacticNuclear___closed__3;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l_tacticNuclear___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_tacticNuclear___closed__2;
x_2 = lean_unsigned_to_nat(1024u);
x_3 = l_tacticNuclear___closed__4;
x_4 = lean_alloc_ctor(3, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_tacticNuclear() {
_start:
{
lean_object* x_1; 
x_1 = l_tacticNuclear___closed__5;
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Lean", 4, 4);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Parser", 6, 6);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Tactic", 6, 6);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__4() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("paren", 5, 5);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1;
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2;
x_3 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__4;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__6() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("(", 1, 1);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__7() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("tacticSeq", 9, 9);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__8() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1;
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2;
x_3 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__7;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__9() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("tacticSeq1Indented", 18, 18);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1;
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2;
x_3 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__9;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__11() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("null", 4, 4);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__12() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__11;
x_3 = l_Lean_Name_str___override(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__13() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("Mathlib", 7, 7);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__14() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("RingNF", 6, 6);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__15() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("ringNF", 6, 6);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__16() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__13;
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
x_3 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__14;
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__15;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__17() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("ring_nf", 7, 7);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__18() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__19() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("optConfig", 9, 9);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__20() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1;
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2;
x_3 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__19;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__21() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(";", 1, 1);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__22() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("tacticTry_", 10, 10);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__23() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1;
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2;
x_3 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__22;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__24() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("try", 3, 3);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__25() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("FieldSimp", 9, 9);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__26() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("fieldSimp", 9, 9);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__27() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_1 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__13;
x_2 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3;
x_3 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__25;
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__26;
x_5 = l_Lean_Name_mkStr4(x_1, x_2, x_3, x_4);
return x_5;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__28() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked("field_simp", 10, 10);
return x_1;
}
}
static lean_object* _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__29() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_unchecked(")", 1, 1);
return x_1;
}
}
LEAN_EXPORT lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = l_tacticNuclear___closed__2;
x_5 = l_Lean_Syntax_isOfKind(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; 
x_6 = lean_box(1);
x_7 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_7, 0, x_6);
lean_ctor_set(x_7, 1, x_3);
return x_7;
}
else
{
lean_object* x_8; uint8_t x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; 
x_8 = lean_ctor_get(x_2, 5);
x_9 = 0;
x_10 = l_Lean_SourceInfo_fromRef(x_8, x_9);
x_11 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__6;
lean_inc(x_10);
x_12 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_12, 0, x_10);
lean_ctor_set(x_12, 1, x_11);
x_13 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__17;
lean_inc(x_10);
x_14 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_14, 0, x_10);
lean_ctor_set(x_14, 1, x_13);
x_15 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__12;
x_16 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__18;
lean_inc(x_10);
x_17 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_17, 0, x_10);
lean_ctor_set(x_17, 1, x_15);
lean_ctor_set(x_17, 2, x_16);
x_18 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__20;
lean_inc(x_17);
lean_inc(x_10);
x_19 = l_Lean_Syntax_node1(x_10, x_18, x_17);
x_20 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__16;
lean_inc(x_19);
lean_inc_n(x_17, 2);
lean_inc(x_10);
x_21 = l_Lean_Syntax_node4(x_10, x_20, x_14, x_17, x_19, x_17);
x_22 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__21;
lean_inc(x_10);
x_23 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_23, 0, x_10);
lean_ctor_set(x_23, 1, x_22);
x_24 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__24;
lean_inc(x_10);
x_25 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_25, 0, x_10);
lean_ctor_set(x_25, 1, x_24);
x_26 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__28;
lean_inc(x_10);
x_27 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_27, 0, x_10);
lean_ctor_set(x_27, 1, x_26);
x_28 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__27;
lean_inc_n(x_17, 3);
lean_inc(x_10);
x_29 = l_Lean_Syntax_node6(x_10, x_28, x_27, x_19, x_17, x_17, x_17, x_17);
lean_inc(x_21);
lean_inc(x_10);
x_30 = l_Lean_Syntax_node1(x_10, x_15, x_21);
x_31 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__10;
lean_inc(x_10);
x_32 = l_Lean_Syntax_node1(x_10, x_31, x_30);
x_33 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__8;
lean_inc(x_10);
x_34 = l_Lean_Syntax_node1(x_10, x_33, x_32);
x_35 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__23;
lean_inc(x_25);
lean_inc(x_10);
x_36 = l_Lean_Syntax_node2(x_10, x_35, x_25, x_34);
lean_inc(x_23);
lean_inc(x_10);
x_37 = l_Lean_Syntax_node3(x_10, x_15, x_29, x_23, x_36);
lean_inc(x_10);
x_38 = l_Lean_Syntax_node1(x_10, x_31, x_37);
lean_inc(x_10);
x_39 = l_Lean_Syntax_node1(x_10, x_33, x_38);
lean_inc(x_10);
x_40 = l_Lean_Syntax_node2(x_10, x_35, x_25, x_39);
lean_inc(x_10);
x_41 = l_Lean_Syntax_node3(x_10, x_15, x_21, x_23, x_40);
lean_inc(x_10);
x_42 = l_Lean_Syntax_node1(x_10, x_31, x_41);
lean_inc(x_10);
x_43 = l_Lean_Syntax_node1(x_10, x_33, x_42);
x_44 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__29;
lean_inc(x_10);
x_45 = lean_alloc_ctor(2, 2, 0);
lean_ctor_set(x_45, 0, x_10);
lean_ctor_set(x_45, 1, x_44);
x_46 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__5;
x_47 = l_Lean_Syntax_node3(x_10, x_46, x_12, x_43, x_45);
x_48 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_48, 0, x_47);
lean_ctor_set(x_48, 1, x_3);
return x_48;
}
}
}
LEAN_EXPORT lean_object* l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Rate(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Additive(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Reversible(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Sqrt(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Order(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_Transaction_Swap_Constprod(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Rate(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Additive(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Reversible(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Sqrt(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Order(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_tacticNuclear___closed__1 = _init_l_tacticNuclear___closed__1();
lean_mark_persistent(l_tacticNuclear___closed__1);
l_tacticNuclear___closed__2 = _init_l_tacticNuclear___closed__2();
lean_mark_persistent(l_tacticNuclear___closed__2);
l_tacticNuclear___closed__3 = _init_l_tacticNuclear___closed__3();
lean_mark_persistent(l_tacticNuclear___closed__3);
l_tacticNuclear___closed__4 = _init_l_tacticNuclear___closed__4();
lean_mark_persistent(l_tacticNuclear___closed__4);
l_tacticNuclear___closed__5 = _init_l_tacticNuclear___closed__5();
lean_mark_persistent(l_tacticNuclear___closed__5);
l_tacticNuclear = _init_l_tacticNuclear();
lean_mark_persistent(l_tacticNuclear);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__1);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__2);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__3);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__4 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__4();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__4);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__5 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__5();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__5);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__6 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__6();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__6);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__7 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__7();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__7);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__8 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__8();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__8);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__9 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__9();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__9);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__10 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__10();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__10);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__11 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__11();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__11);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__12 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__12();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__12);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__13 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__13();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__13);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__14 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__14();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__14);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__15 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__15();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__15);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__16 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__16();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__16);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__17 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__17();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__17);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__18 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__18();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__18);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__19 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__19();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__19);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__20 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__20();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__20);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__21 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__21();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__21);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__22 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__22();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__22);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__23 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__23();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__23);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__24 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__24();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__24);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__25 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__25();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__25);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__26 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__26();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__26);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__27 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__27();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__27);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__28 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__28();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__28);
l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__29 = _init_l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__29();
lean_mark_persistent(l___aux__AMMLib__Transaction__Swap__Constprod______macroRules__tacticNuclear__1___closed__29);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
