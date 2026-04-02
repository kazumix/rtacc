#ifdef __INTIME__
#include <rt.h>
#else
static unsigned char RtSleepEx(int msec)
{
    (void)msec;
    return 0;
}
#endif

/* hugeplc_ascii2.IL から生成される POU 関数 */
extern int hugeplc_ascii2(void);
#if defined(IL_USE_PLCP_RTEDGE)
extern void hugeplc_ascii2_slots_init(void);
extern void Hugeplc_CreateTagsFromCatalog(void);
extern void IlRtedgeRegistry_BindAllSlots(void);
#endif

int main(void)
{
#if defined(IL_USE_PLCP_RTEDGE)
    Hugeplc_CreateTagsFromCatalog();
    hugeplc_ascii2_slots_init();
    IlRtedgeRegistry_BindAllSlots();
#endif
    for (;;) {
        (void)hugeplc_ascii2();
        RtSleepEx(10); /* 10ms scan cycle */
    }
    return 0;
}
