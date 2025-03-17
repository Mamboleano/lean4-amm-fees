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
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
