(*
 * wireMessage.mli
 * ---------------
 * Copyright : (c) 2008, Jeremie Dimino <jeremie@dimino.org>
 * Licence   : BSD3
 *
 * This file is a part of obus, an ocaml implemtation of dbus.
 *)

(** Module used to receive or send an entire message *)

open Wire

val recv_one_message : Transport.t -> buffer -> Header.t * byte_order * buffer * ptr
  (** [recv_one_message transport buffer] read one a message from the
      given transport. If buffer is not enough large then a new buffer
      is created. It return the parsed header of the message, the
      buffer acutally containing the body and the offset of the body
      start (aligned on an 8 boundary).

      It can raise one of these fatal errors: [Transport.Error],
      [Wire.Reading_error]. Any other errors are convertion errors. *)

val send_one_message : Transport.t -> buffer -> Header.t -> (byte_order -> buffer -> ptr -> ptr) -> buffer
  (** [send_one_message transport buffer flags serial header
      body_writer] write and send one message on the given transport.

      can raise one of [Transport.Error], [Wire.Writing_error]. Others
      errors are convertion errors. *)