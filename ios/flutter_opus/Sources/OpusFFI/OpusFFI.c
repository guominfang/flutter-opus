#include "OpusFFI.h"

// These declarations intentionally avoid exposing the complete Opus API to
// Swift. Taking their addresses creates linker references for the symbols
// consumed by Dart FFI.
extern void *opus_encoder_create();
extern int opus_encode();
extern void opus_encoder_destroy();
extern int opus_encoder_ctl();
extern void *opus_decoder_create();
extern int opus_decode();
extern void opus_decoder_destroy();
extern const char *opus_get_version_string(void);

#if defined(__clang__)
#define FLUTTER_OPUS_LINK_ANCHOR_ATTRIBUTES \
  __attribute__((used, noinline, optnone))
#else
#define FLUTTER_OPUS_LINK_ANCHOR_ATTRIBUTES
#endif

FLUTTER_OPUS_LINK_ANCHOR_ATTRIBUTES
void flutter_opus_link_anchor(void) {
  // Keep the pointers themselves volatile. `volatile const void *` only makes
  // the pointed-to data volatile, allowing Release optimization to remove the
  // complete array and all references to the static libopus archive.
  static const void *volatile symbols[] = {
          (const void *)opus_encoder_create,
          (const void *)opus_encode,
          (const void *)opus_encoder_destroy,
          (const void *)opus_encoder_ctl,
          (const void *)opus_decoder_create,
          (const void *)opus_decode,
          (const void *)opus_decoder_destroy,
          (const void *)opus_get_version_string,
  };

  const unsigned long count = sizeof(symbols) / sizeof(symbols[0]);
  for (unsigned long index = 0; index < count; index++) {
#if defined(__clang__)
    __asm__ volatile("" : : "r"(symbols[index]) : "memory");
#else
    (void)symbols[index];
#endif
  }
}
