#ifndef FLUTTER_OPUS_FFI_H
#define FLUTTER_OPUS_FFI_H

/// References the libopus entry points so static linking does not strip the
/// symbols that Dart resolves through DynamicLibrary.process().
void flutter_opus_link_anchor(void);

#endif
