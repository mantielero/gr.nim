# Resetting /home/jose/src/gr.nim/src/wrapper/build

{.passC: "-I/home/jose/src/gr.nim/src/wrapper/build/lib".}
# Importing /home/jose/src/gr.nim/src/wrapper/build/lib/grm/grm.h
# Generated at 2020-04-27T20:14:43+02:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-#head/nimterop/toast --preprocess --recurse --includeDirs+=/home/jose/src/gr.nim/src/wrapper/build/lib --pnim --dynlib=dynlibFileGRM --nim:/home/jose/.choosenim/toolchains/nim-1.2.0/bin/nim --pluginSourcePath=/home/jose/.cache/nim/nimterop/cPlugins/nimterop_320418410.nim /home/jose/src/gr.nim/src/wrapper/build/lib/grm/grm.h

{.hint[ConvFromXtoItselfNotNeeded]: off.}

import nimterop/types

when defined(windows):
  const dynlibFileGRM = "libGRM.dll"

elif defined(linux):
  const dynlibFileGRM = "/usr/gr/lib/libGRM.so"

#  ######################### includes ###############################################################################
#  ######################### public interface #######################################################################
#  ========================= datatypes ==============================================================================
#  ------------------------- event handling -------------------------------------------------------------------------
defineEnum(grm_event_type_t)

const
  GRM_EVENT_NEW_PLOT* = 0.grm_event_type_t
  GRM_EVENT_UPDATE_PLOT* = 1.grm_event_type_t
  GRM_EVENT_SIZE* = 2.grm_event_type_t
  GRM_EVENT_MERGE_END* = 3.grm_event_type_t
  GRM_EVENT_TYPE_COUNT* = 4.grm_event_type_t

  #  ######################### includes ###############################################################################
  #  ######################### public interface #######################################################################
  #  ========================= macros =================================================================================
  #  ------------------------- receiver / sender-----------------------------------------------------------------------
  GRM_SENDER* = 0
  GRM_RECEIVER* = 1

{.pragma: impgrm, importc.}
{.pragma: impgrmC, impgrm, cdecl, dynlib: dynlibFileGRM.}

type

  #  This is a convenience header which includes all public header files of the GRM library.
  #  ######################### includes ###############################################################################
  #  ######################### includes ###############################################################################
  #  ######################### public interface #######################################################################
  #  ========================= macros =================================================================================
  #  ------------------------- util -----------------------------------------------------------------------------------
  #  ========================= functions ==============================================================================
  #  ------------------------- util -----------------------------------------------------------------------------------
  #  ######################### public interface #######################################################################
  #  ========================= datatypes ==============================================================================
  #  ------------------------- argument -------------------------------------------------------------------------------
  arg_private_t* {.bycopy.} = object
  arg_t* {.bycopy.} = object
    key*: cstring
    value_ptr*: pointer
    value_format*: cstring
    priv*: ptr arg_private_t

  #  ------------------------- argument container ---------------------------------------------------------------------
  args_node_t* {.bycopy.} = object
  grm_args_t* {.bycopy.} = object
  grm_args_ptr_t* = ptr grm_args_t

  #  ------------------------- argument iterator ----------------------------------------------------------------------
  args_iterator_private_t* {.bycopy.} = object
  args_iterator_t* {.bycopy.} = object
    next*: proc(a1: ptr args_iterator_t): ptr arg_t {.cdecl.}
    arg*: ptr arg_t
    priv*: ptr args_iterator_private_t

  #  ------------------------- value iterator -------------------------------------------------------------------------
  args_value_iterator_private_t* {.bycopy.} = object
  grm_args_value_iterator_t* {.bycopy.} = object
    next*: proc(a1: ptr grm_args_value_iterator_t): pointer {.cdecl.}
    value_ptr*: pointer
    format*: cchar
    is_array*: cint
    array_length*: uint
    priv*: ptr args_value_iterator_private_t
  args_value_iterator_t* {.impgrm, bycopy.} = grm_args_value_iterator_t
  grm_new_plot_event_t* {.bycopy.} = object
    `type`*: grm_event_type_t
    plot_id*: cint
  grm_update_plot_event_t* {.bycopy.} = object
    `type`*: grm_event_type_t
    plot_id*: cint
  grm_size_event_t* {.bycopy.} = object
    `type`*: grm_event_type_t
    plot_id*: cint
    width*: cint
    height*: cint
  grm_merge_end_event_t* {.bycopy.} = object
    `type`*: grm_event_type_t
    identificator*: cstring
  grm_event_t* {.bycopy, union.} = object
    new_plot_event*: grm_new_plot_event_t
    size_event*: grm_size_event_t
    update_plot_event*: grm_update_plot_event_t
    merge_end_event*: grm_merge_end_event_t
  grm_event_callback_t* = proc(a1: ptr grm_event_t) {.cdecl.}



#  ========================= methods ================================================================================
#  ------------------------- argument container ---------------------------------------------------------------------
proc grm_args_new*(): ptr grm_args_t {.impgrmC.}
proc grm_args_delete*(a1: ptr grm_args_t) {.impgrmC.}
proc grm_args_push*(a1: ptr grm_args_t, a2: cstring, a3: cstring): cint {.impgrmC.}
proc grm_args_push_buf*(a1: ptr grm_args_t, a2: cstring, a3: cstring, a4: pointer, a5: cint): cint {.impgrmC.}
proc grm_args_contains*(a1: ptr grm_args_t, a2: cstring): cint {.impgrmC.}
proc grm_args_clear*(a1: ptr grm_args_t) {.impgrmC.}
proc grm_args_remove*(a1: ptr grm_args_t, a2: cstring) {.impgrmC.}

#  ######################### includes ###############################################################################
#  ######################### public interface #######################################################################
#  ========================= functions ==============================================================================
#  ------------------------- dump -----------------------------------------------------------------------------------
proc grm_dump*(args: ptr grm_args_t, f: ptr FILE) {.impgrmC.}
proc grm_dump_json*(args: ptr grm_args_t, f: ptr FILE) {.impgrmC.}
proc grm_dump_json_str*(): cstring {.impgrmC.}

#  ========================= methods ================================================================================
#  ------------------------- event handling -------------------------------------------------------------------------
proc grm_register*(a1: grm_event_type_t, a2: grm_event_callback_t): cint {.impgrmC.}
proc grm_unregister*(a1: grm_event_type_t): cint {.impgrmC.}

#  ######################### includes ###############################################################################
#  ######################### public interface #######################################################################
#  ========================= functions ==============================================================================
#  ------------------------- user interaction -----------------------------------------------------------------------
proc grm_input*(a1: ptr grm_args_t): cint {.impgrmC.}
proc grm_get_box*(x1: cint, y1: cint, x2: cint, y2: cint, keep_aspect_ratio: cint, x: ptr cint, y: ptr cint, w: ptr cint, h: ptr cint): cint {.impgrmC.}

#  ========================= functions ==============================================================================
#  ------------------------- receiver / sender-----------------------------------------------------------------------
# Declaration 'grm_open' skipped
# Declaration 'grm_open' skipped
proc grm_recv*(p: pointer, a1: ptr grm_args_t): ptr grm_args_t {.impgrmC.}
proc grm_send*(a1: pointer, a2: cstring): cint {.impgrmC.}
proc grm_send_buf*(a1: pointer, a2: cstring, a3: pointer, a4: cint): cint {.impgrmC.}
proc grm_send_ref*(a1: pointer, a2: cstring, a3: cchar, a4: pointer, a5: cint): cint {.impgrmC.}
proc grm_send_args*(p: pointer, a1: ptr grm_args_t): cint {.impgrmC.}
proc grm_close*(a1: pointer) {.impgrmC.}

#  ######################### includes ###############################################################################
#  ######################### public interface #######################################################################
#  ========================= functions ==============================================================================
#  ------------------------- plot -----------------------------------------------------------------------------------
proc grm_finalize*() {.impgrmC.}
proc grm_clear*(): cint {.impgrmC.}
proc grm_max_plotid*(): cuint {.impgrmC.}
proc grm_merge*(args: ptr grm_args_t): cint {.impgrmC.}
proc grm_merge_extended*(args: ptr grm_args_t, hold: cint, identificator: cstring): cint {.impgrmC.}
proc grm_merge_hold*(args: ptr grm_args_t): cint {.impgrmC.}
proc grm_merge_named*(args: ptr grm_args_t, identificator: cstring): cint {.impgrmC.}
proc grm_plot*(args: ptr grm_args_t): cint {.impgrmC.}
proc grm_switch*(id: cuint): cint {.impgrmC.}

