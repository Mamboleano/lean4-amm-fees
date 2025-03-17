// Lean compiler output
// Module: AMMLib
// Imports: Init AMMLib.State.AMMs AMMLib.State.AMMsNN AMMLib.State.AtomicWall AMMLib.State.AtomicWallSet AMMLib.State.MintedWall AMMLib.State.MintedWallSet AMMLib.State.Networth AMMLib.State.State AMMLib.State.Supply AMMLib.State.Tokens AMMLib.Transaction.Create AMMLib.Transaction.Deposit AMMLib.Transaction.Redeem AMMLib.Transaction.Swap.Additive AMMLib.Transaction.Swap.Basic AMMLib.Transaction.Swap.Constprod AMMLib.Transaction.Swap.Networth AMMLib.Transaction.Swap.Reversible AMMLib.Transaction.Trace AMMLib.FeeVersion.Swap.Additivity AMMLib.FeeVersion.Swap.Basic AMMLib.FeeVersion.Swap.Constprod
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
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AMMs(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AMMsNN(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AtomicWall(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_AtomicWallSet(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_MintedWall(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_MintedWallSet(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Networth(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_State(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Supply(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_State_Tokens(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Create(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Deposit(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Redeem(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Additive(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Constprod(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Networth(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Swap_Reversible(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_Transaction_Trace(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_FeeVersion_Swap_Additivity(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_FeeVersion_Swap_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_FeeVersion_Swap_Constprod(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AMMs(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AMMsNN(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AtomicWall(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_AtomicWallSet(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_MintedWall(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_MintedWallSet(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Networth(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_State(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Supply(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_State_Tokens(builtin, lean_io_mk_world());
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
res = initialize_AMMLib_Transaction_Swap_Additive(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Constprod(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Networth(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Swap_Reversible(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_Transaction_Trace(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_FeeVersion_Swap_Additivity(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_FeeVersion_Swap_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_FeeVersion_Swap_Constprod(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
