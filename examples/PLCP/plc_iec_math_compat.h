/* 互換用: PLCPIEC.h に同等の定義をインライン化済み。単体で -include する用途向け。 */
#ifndef PLC_IEC_MATH_COMPAT_H
#define PLC_IEC_MATH_COMPAT_H
#include <stdlib.h>
#include <math.h>
#ifndef llabs
#define llabs(x) __builtin_llabs(x)
#endif
#ifndef atoll
#define atoll(x) strtoll((x), NULL, 10)
#endif
#if defined(__clang__) || defined(__GNUC__)
#ifndef isinf
#define isinf(x) __builtin_isinf((double)(x))
#endif
#ifndef isnan
#define isnan(x) __builtin_isnan((double)(x))
#endif
#ifndef round
#define round(x) __builtin_round((double)(x))
#endif
#ifndef NAN
#define NAN (__builtin_nanf(""))
#endif
#endif
#endif
