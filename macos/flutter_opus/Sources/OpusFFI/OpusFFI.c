#include "OpusFFI.h"

extern void *opus_encoder_create();
extern int opus_encode();
extern void opus_encoder_destroy();
extern int opus_encoder_ctl();
extern void *opus_decoder_create();
extern int opus_decode();
extern void opus_decoder_destroy();
extern const char *opus_get_version_string(void);

void flutter_opus_link_anchor(void) {
  volatile const void *symbols[] = {
      (const void *)opus_encoder_create,
      (const void *)opus_encode,
      (const void *)opus_encoder_destroy,
      (const void *)opus_encoder_ctl,
      (const void *)opus_decoder_create,
      (const void *)opus_decode,
      (const void *)opus_decoder_destroy,
      (const void *)opus_get_version_string,
  };
  (void)symbols;
}
