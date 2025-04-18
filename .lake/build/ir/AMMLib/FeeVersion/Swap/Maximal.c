// Lean compiler output
// Module: AMMLib.FeeVersion.Swap.Maximal
// Imports: Init AMMLib.FeeVersion.Swap.Basic AMMLib.FeeVersion.Swap.Additivity AMMLib.FeeVersion.Swap.Constprod AMMLib.FeeVersion.Swap.Arbitrage HelpersLib.Real.Division HelpersLib.Real.Multiplication HelpersLib.Real.Order HelpersLib.Real.Subtraction HelpersLib.PReal.Basic HelpersLib.PReal.Division HelpersLib.PReal.Negative HelpersLib.PReal.Order HelpersLib.PReal.Sqrt
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
lean_object* initialize_AMMLib_FeeVersion_Swap_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_FeeVersion_Swap_Additivity(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_FeeVersion_Swap_Constprod(uint8_t builtin, lean_object*);
lean_object* initialize_AMMLib_FeeVersion_Swap_Arbitrage(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Real_Division(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Real_Multiplication(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Real_Order(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_Real_Subtraction(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Division(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Negative(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Order(uint8_t builtin, lean_object*);
lean_object* initialize_HelpersLib_PReal_Sqrt(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_AMMLib_FeeVersion_Swap_Maximal(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_FeeVersion_Swap_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_FeeVersion_Swap_Additivity(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_FeeVersion_Swap_Constprod(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_AMMLib_FeeVersion_Swap_Arbitrage(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_Real_Division(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_Real_Multiplication(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_Real_Order(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_Real_Subtraction(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Division(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Negative(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Order(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_HelpersLib_PReal_Sqrt(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
