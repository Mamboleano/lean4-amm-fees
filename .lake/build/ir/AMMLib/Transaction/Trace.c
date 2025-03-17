// Lean compiler output
// Module: AMMLib.Transaction.Trace
// Imports: Init AMMLib.Transaction.Create AMMLib.Transaction.Deposit AMMLib.Transaction.Redeem AMMLib.Transaction.Swap.Basic AMMLib.State.Networth AMMLib.State.AMMs AMMLib.State.Tokens
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
LEAN_EXPORT lean_object* l_concat(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_concat___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_concat(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6) {
_start:
{
switch (lean_obj_tag(x_6)) {
case 0:
{
lean_inc(x_5);
return x_5;
}
case 1:
{
uint8_t x_7; 
x_7 = !lean_is_exclusive(x_6);
if (x_7 == 0)
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; 
x_8 = lean_ctor_get(x_6, 5);
x_9 = lean_ctor_get(x_6, 6);
x_10 = l_concat(x_1, x_2, x_3, x_8, x_5, x_9);
lean_ctor_set(x_6, 6, x_10);
return x_6;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; 
x_11 = lean_ctor_get(x_6, 0);
x_12 = lean_ctor_get(x_6, 1);
x_13 = lean_ctor_get(x_6, 2);
x_14 = lean_ctor_get(x_6, 3);
x_15 = lean_ctor_get(x_6, 4);
x_16 = lean_ctor_get(x_6, 5);
x_17 = lean_ctor_get(x_6, 6);
x_18 = lean_ctor_get(x_6, 7);
lean_inc(x_18);
lean_inc(x_17);
lean_inc(x_16);
lean_inc(x_15);
lean_inc(x_14);
lean_inc(x_13);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_6);
x_19 = l_concat(x_1, x_2, x_3, x_16, x_5, x_17);
x_20 = lean_alloc_ctor(1, 8, 0);
lean_ctor_set(x_20, 0, x_11);
lean_ctor_set(x_20, 1, x_12);
lean_ctor_set(x_20, 2, x_13);
lean_ctor_set(x_20, 3, x_14);
lean_ctor_set(x_20, 4, x_15);
lean_ctor_set(x_20, 5, x_16);
lean_ctor_set(x_20, 6, x_19);
lean_ctor_set(x_20, 7, x_18);
return x_20;
}
}
case 2:
{
uint8_t x_21; 
x_21 = !lean_is_exclusive(x_6);
if (x_21 == 0)
{
lean_object* x_22; lean_object* x_23; lean_object* x_24; 
x_22 = lean_ctor_get(x_6, 4);
x_23 = lean_ctor_get(x_6, 5);
x_24 = l_concat(x_1, x_2, x_3, x_22, x_5, x_23);
lean_ctor_set(x_6, 5, x_24);
return x_6;
}
else
{
lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; lean_object* x_32; lean_object* x_33; 
x_25 = lean_ctor_get(x_6, 0);
x_26 = lean_ctor_get(x_6, 1);
x_27 = lean_ctor_get(x_6, 2);
x_28 = lean_ctor_get(x_6, 3);
x_29 = lean_ctor_get(x_6, 4);
x_30 = lean_ctor_get(x_6, 5);
x_31 = lean_ctor_get(x_6, 6);
lean_inc(x_31);
lean_inc(x_30);
lean_inc(x_29);
lean_inc(x_28);
lean_inc(x_27);
lean_inc(x_26);
lean_inc(x_25);
lean_dec(x_6);
x_32 = l_concat(x_1, x_2, x_3, x_29, x_5, x_30);
x_33 = lean_alloc_ctor(2, 7, 0);
lean_ctor_set(x_33, 0, x_25);
lean_ctor_set(x_33, 1, x_26);
lean_ctor_set(x_33, 2, x_27);
lean_ctor_set(x_33, 3, x_28);
lean_ctor_set(x_33, 4, x_29);
lean_ctor_set(x_33, 5, x_32);
lean_ctor_set(x_33, 6, x_31);
return x_33;
}
}
case 3:
{
uint8_t x_34; 
x_34 = !lean_is_exclusive(x_6);
if (x_34 == 0)
{
lean_object* x_35; lean_object* x_36; lean_object* x_37; 
x_35 = lean_ctor_get(x_6, 4);
x_36 = lean_ctor_get(x_6, 5);
x_37 = l_concat(x_1, x_2, x_3, x_35, x_5, x_36);
lean_ctor_set(x_6, 5, x_37);
return x_6;
}
else
{
lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; 
x_38 = lean_ctor_get(x_6, 0);
x_39 = lean_ctor_get(x_6, 1);
x_40 = lean_ctor_get(x_6, 2);
x_41 = lean_ctor_get(x_6, 3);
x_42 = lean_ctor_get(x_6, 4);
x_43 = lean_ctor_get(x_6, 5);
x_44 = lean_ctor_get(x_6, 6);
lean_inc(x_44);
lean_inc(x_43);
lean_inc(x_42);
lean_inc(x_41);
lean_inc(x_40);
lean_inc(x_39);
lean_inc(x_38);
lean_dec(x_6);
x_45 = l_concat(x_1, x_2, x_3, x_42, x_5, x_43);
x_46 = lean_alloc_ctor(3, 7, 0);
lean_ctor_set(x_46, 0, x_38);
lean_ctor_set(x_46, 1, x_39);
lean_ctor_set(x_46, 2, x_40);
lean_ctor_set(x_46, 3, x_41);
lean_ctor_set(x_46, 4, x_42);
lean_ctor_set(x_46, 5, x_45);
lean_ctor_set(x_46, 6, x_44);
return x_46;
}
}
default: 
{
uint8_t x_47; 
x_47 = !lean_is_exclusive(x_6);
if (x_47 == 0)
{
lean_object* x_48; lean_object* x_49; lean_object* x_50; 
x_48 = lean_ctor_get(x_6, 4);
x_49 = lean_ctor_get(x_6, 5);
x_50 = l_concat(x_1, x_2, x_3, x_48, x_5, x_49);
lean_ctor_set(x_6, 5, x_50);
return x_6;
}
else
{
lean_object* x_51; lean_object* x_52; lean_object* x_53; lean_object* x_54; lean_object* x_55; lean_object* x_56; lean_object* x_57; lean_object* x_58; lean_object* x_59; 
x_51 = lean_ctor_get(x_6, 0);
x_52 = lean_ctor_get(x_6, 1);
x_53 = lean_ctor_get(x_6, 2);
x_54 = lean_ctor_get(x_6, 3);
x_55 = lean_ctor_get(x_6, 4);
x_56 = lean_ctor_get(x_6, 5);
x_57 = lean_ctor_get(x_6, 6);
lean_inc(x_57);
lean_inc(x_56);
lean_inc(x_55);
lean_inc(x_54);
lean_inc(x_53);
lean_inc(x_52);
lean_inc(x_51);
lean_dec(x_6);
x_58 = l_concat(x_1, x_2, x_3, x_55, x_5, x_56);
x_59 = lean_alloc_ctor(4, 7, 0);
lean_ctor_set(x_59, 0, x_51);
lean_ctor_set(x_59, 1, x_52);
lean_ctor_set(x_59, 2, x_53);
lean_ctor_set(x_59, 3, x_54);
lean_ctor_set(x_59, 4, x_55);
lean_ctor_set(x_59, 5, x_58);
lean_ctor_set(x_59, 6, x_57);
return x_59;
}
}
}
}
}
LEAN_EXPORT lean_object* l_concat___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6) {
_start:
{
lean_object* x_7; 
x_7 = l_concat(x_1, x_2, x_3, x_4, x_5, x_6);
lean_dec(x_5);
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_7;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Create(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Deposit(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Redeem(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Networth(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AMMs(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Tokens(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_Transaction_Trace(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Create(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Deposit(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Redeem(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Networth(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AMMs(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Tokens(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
