# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/reline/all/reline.rbi
#
# reline-0.1.4

module Reline
  def eof?(*args, &block); end
  def readline(*args, &block); end
  def readmultiline(*args, &block); end
  def self.ambiguous_width(*args, &block); end
  def self.auto_indent_proc(*args, &block); end
  def self.auto_indent_proc=(*args, &block); end
  def self.basic_quote_characters(*args, &block); end
  def self.basic_quote_characters=(*args, &block); end
  def self.basic_word_break_characters(*args, &block); end
  def self.basic_word_break_characters=(*args, &block); end
  def self.completer_quote_characters(*args, &block); end
  def self.completer_quote_characters=(*args, &block); end
  def self.completer_word_break_characters(*args, &block); end
  def self.completer_word_break_characters=(*args, &block); end
  def self.completion_append_character(*args, &block); end
  def self.completion_append_character=(*args, &block); end
  def self.completion_case_fold(*args, &block); end
  def self.completion_case_fold=(*args, &block); end
  def self.completion_proc(*args, &block); end
  def self.completion_proc=(*args, &block); end
  def self.completion_quote_character(*args, &block); end
  def self.core; end
  def self.delete_text(*args, &block); end
  def self.dig_perfect_match_proc(*args, &block); end
  def self.dig_perfect_match_proc=(*args, &block); end
  def self.emacs_editing_mode(*args, &block); end
  def self.emacs_editing_mode?(*args, &block); end
  def self.encoding_system_needs; end
  def self.eof?(*args, &block); end
  def self.filename_quote_characters(*args, &block); end
  def self.filename_quote_characters=(*args, &block); end
  def self.get_screen_size(*args, &block); end
  def self.input=(*args, &block); end
  def self.insert_text(*args, &block); end
  def self.last_incremental_search(*args, &block); end
  def self.last_incremental_search=(*args, &block); end
  def self.line_buffer(*args, &block); end
  def self.line_editor; end
  def self.output=(*args, &block); end
  def self.output_modifier_proc(*args, &block); end
  def self.output_modifier_proc=(*args, &block); end
  def self.point(*args, &block); end
  def self.point=(*args, &block); end
  def self.pre_input_hook(*args, &block); end
  def self.pre_input_hook=(*args, &block); end
  def self.prompt_proc(*args, &block); end
  def self.prompt_proc=(*args, &block); end
  def self.readline(*args, &block); end
  def self.readmultiline(*args, &block); end
  def self.redisplay(*args, &block); end
  def self.special_prefixes(*args, &block); end
  def self.special_prefixes=(*args, &block); end
  def self.vi_editing_mode(*args, &block); end
  def self.vi_editing_mode?(*args, &block); end
  extend Forwardable
  extend SingleForwardable
end
class Reline::Config
  def add_default_key_binding(keystroke, target); end
  def bind_key(key, func_name); end
  def bind_tty_special_chars; end
  def bind_tty_special_chars=(arg0); end
  def bind_variable(name, value); end
  def blink_matching_paren; end
  def blink_matching_paren=(arg0); end
  def byte_oriented; end
  def byte_oriented=(arg0); end
  def completion_ignore_case; end
  def completion_ignore_case=(arg0); end
  def convert_meta; end
  def convert_meta=(arg0); end
  def disable_completion; end
  def disable_completion=(arg0); end
  def editing_mode; end
  def editing_mode=(val); end
  def editing_mode_is?(*val); end
  def enable_keypad; end
  def enable_keypad=(arg0); end
  def expand_tilde; end
  def expand_tilde=(arg0); end
  def handle_directive(directive, file, no); end
  def history_preserve_point; end
  def history_preserve_point=(arg0); end
  def history_size; end
  def history_size=(arg0); end
  def horizontal_scroll_mode; end
  def horizontal_scroll_mode=(arg0); end
  def initialize; end
  def input_meta; end
  def input_meta=(arg0); end
  def inputrc_path; end
  def key_bindings; end
  def key_notation_to_code(notation); end
  def keymap; end
  def keyseq_timeout; end
  def keyseq_timeout=(arg0); end
  def mark_directories; end
  def mark_directories=(arg0); end
  def mark_modified_lines; end
  def mark_modified_lines=(arg0); end
  def mark_symlinked_directories; end
  def mark_symlinked_directories=(arg0); end
  def match_hidden_files; end
  def match_hidden_files=(arg0); end
  def meta_flag; end
  def meta_flag=(arg0); end
  def output_meta; end
  def output_meta=(arg0); end
  def page_completions; end
  def page_completions=(arg0); end
  def parse_keyseq(str); end
  def prefer_visible_bell; end
  def prefer_visible_bell=(arg0); end
  def print_completions_horizontally; end
  def print_completions_horizontally=(arg0); end
  def read(file = nil); end
  def read_lines(lines, file = nil); end
  def reset; end
  def reset_default_key_bindings; end
  def show_all_if_ambiguous; end
  def show_all_if_ambiguous=(arg0); end
  def show_all_if_unmodified; end
  def show_all_if_unmodified=(arg0); end
  def test_mode; end
  def visible_stats; end
  def visible_stats=(arg0); end
end
class Reline::Config::InvalidInputrc < RuntimeError
  def file; end
  def file=(arg0); end
  def lineno; end
  def lineno=(arg0); end
end
class Reline::KeyActor::Base
  def get_method(key); end
end
class Reline::KeyActor::Emacs < Reline::KeyActor::Base
end
class Reline::KeyActor::ViCommand < Reline::KeyActor::Base
end
class Reline::KeyActor::ViInsert < Reline::KeyActor::Base
end
module Reline::KeyActor
end
class Reline::KeyStroke
  def expand(input); end
  def initialize(config); end
  def key_mapping; end
  def match_status(input); end
end
class Reline::KillRing
  def append(string, before_p = nil); end
  def initialize(max = nil); end
  def process; end
  def yank; end
  def yank_pop; end
end
module Reline::KillRing::State
end
class Reline::KillRing::RingPoint < Struct
  def ==(other); end
  def backward; end
  def backward=(_); end
  def forward; end
  def forward=(_); end
  def initialize(str); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def str; end
  def str=(_); end
end
class Reline::KillRing::RingBuffer
  def <<(point); end
  def empty?; end
  def head; end
  def initialize(max = nil); end
  def size; end
end
class Reline::Unicode::EastAsianWidth
end
class Reline::Unicode
  def self.ed_transpose_words(line, byte_pointer); end
  def self.em_backward_word(line, byte_pointer); end
  def self.em_big_backward_word(line, byte_pointer); end
  def self.em_forward_word(line, byte_pointer); end
  def self.em_forward_word_with_capitalization(line, byte_pointer); end
  def self.escape_for_print(str); end
  def self.get_mbchar_byte_size_by_first_char(c); end
  def self.get_mbchar_width(mbchar); end
  def self.get_next_mbchar_size(line, byte_pointer); end
  def self.get_prev_mbchar_size(line, byte_pointer); end
  def self.vi_backward_word(line, byte_pointer); end
  def self.vi_big_backward_word(line, byte_pointer); end
  def self.vi_big_forward_end_word(line, byte_pointer); end
  def self.vi_big_forward_word(line, byte_pointer); end
  def self.vi_first_print(line); end
  def self.vi_forward_end_word(line, byte_pointer); end
  def self.vi_forward_word(line, byte_pointer); end
end
class Reline::LineEditor
  def argumentable?(method_obj); end
  def auto_indent_proc; end
  def auto_indent_proc=(arg0); end
  def backward_char(key, arg: nil); end
  def backward_delete_char(key); end
  def backward_word(key); end
  def beginning_of_line(key); end
  def byte_pointer; end
  def byte_pointer=(val); end
  def byteinsert(str, byte_pointer, other); end
  def byteslice!(str, byte_pointer, size); end
  def calculate_height_by_lines(lines, prompt_list); end
  def calculate_height_by_width(width); end
  def calculate_nearest_cursor; end
  def calculate_width(str, allow_escape_code = nil); end
  def call_completion_proc; end
  def capitalize_word(key); end
  def check_multiline_prompt(buffer, prompt); end
  def clear_screen(key); end
  def complete(list, just_show_list = nil); end
  def complete_internal_proc(list, is_menu); end
  def completion_append_character; end
  def completion_append_character=(arg0); end
  def completion_proc; end
  def completion_proc=(arg0); end
  def confirm_multiline_termination; end
  def confirm_multiline_termination_proc; end
  def confirm_multiline_termination_proc=(arg0); end
  def copy_for_vi(text); end
  def delete_char(key); end
  def delete_char_or_list(key); end
  def delete_text(start = nil, length = nil); end
  def dig_perfect_match_proc; end
  def dig_perfect_match_proc=(arg0); end
  def downcase_word(key); end
  def ed_argument_digit(key); end
  def ed_clear_screen(key); end
  def ed_delete_next_char(key, arg: nil); end
  def ed_delete_prev_char(key, arg: nil); end
  def ed_delete_prev_word(key); end
  def ed_digit(key); end
  def ed_insert(key); end
  def ed_kill_line(key); end
  def ed_move_to_beg(key); end
  def ed_move_to_end(key); end
  def ed_newline(key); end
  def ed_next_char(key, arg: nil); end
  def ed_next_history(key, arg: nil); end
  def ed_prev_char(key, arg: nil); end
  def ed_prev_history(key, arg: nil); end
  def ed_prev_word(key); end
  def ed_quoted_insert(str, arg: nil); end
  def ed_search_next_history(key, arg: nil); end
  def ed_search_prev_history(key, arg: nil); end
  def ed_transpose_chars(key); end
  def ed_transpose_words(key); end
  def ed_unassigned(key); end
  def editing_mode; end
  def em_capitol_case(key); end
  def em_delete(key); end
  def em_delete_next_word(key); end
  def em_delete_or_list(key); end
  def em_delete_prev_char(key); end
  def em_exchange_mark(key); end
  def em_kill_line(key); end
  def em_kill_region(key); end
  def em_lower_case(key); end
  def em_next_word(key); end
  def em_set_mark(key); end
  def em_upper_case(key); end
  def em_yank(key); end
  def em_yank_pop(key); end
  def end_of_line(key); end
  def eof?; end
  def exchange_point_and_mark(key); end
  def finalize; end
  def finish; end
  def finished?; end
  def forward_char(key, arg: nil); end
  def forward_search_history(key); end
  def forward_word(key); end
  def generate_searcher; end
  def history_search_backward(key, arg: nil); end
  def history_search_forward(key, arg: nil); end
  def incremental_search_history(key); end
  def initialize(config, encoding); end
  def input_key(key); end
  def insert_new_line(cursor_line, next_line); end
  def insert_text(text); end
  def key_delete(key); end
  def key_newline(key); end
  def line; end
  def menu(target, list); end
  def modify_lines(before); end
  def move_completed_list(list, direction); end
  def move_cursor_down(val); end
  def move_cursor_up(val); end
  def multiline_off; end
  def multiline_on; end
  def normal_char(key); end
  def output=(arg0); end
  def output_modifier_proc; end
  def output_modifier_proc=(arg0); end
  def pre_input_hook; end
  def pre_input_hook=(arg0); end
  def process_auto_indent; end
  def process_key(key, method_symbol); end
  def prompt_proc; end
  def prompt_proc=(arg0); end
  def quoted_insert(str, arg: nil); end
  def render_partial(prompt, prompt_width, line_to_render, with_control = nil); end
  def rerender; end
  def reset(prompt = nil, encoding:); end
  def reset_line; end
  def reset_variables(prompt = nil, encoding:); end
  def retrieve_completion_block(set_completion_quote_character = nil); end
  def reverse_search_history(key); end
  def run_for_operators(key, method_symbol, &block); end
  def scroll_down(val); end
  def search_next_char(key, arg, need_prev_char = nil); end
  def search_prev_char(key, arg, need_next_char = nil); end
  def self_insert(key); end
  def set_mark(key); end
  def split_by_width(prompt, str, max_width); end
  def transpose_chars(key); end
  def transpose_words(key); end
  def upcase_word(key); end
  def vi_add(key); end
  def vi_add_at_eol(key); end
  def vi_change_meta(key); end
  def vi_command_mode(key); end
  def vi_delete_meta(key); end
  def vi_delete_prev_char(key); end
  def vi_end_big_word(key, arg: nil); end
  def vi_end_of_transmission(key); end
  def vi_end_word(key, arg: nil); end
  def vi_eof_maybe(key); end
  def vi_first_print(key); end
  def vi_histedit(key); end
  def vi_insert(key); end
  def vi_insert_at_bol(key); end
  def vi_join_lines(key, arg: nil); end
  def vi_list_or_eof(key); end
  def vi_next_big_word(key, arg: nil); end
  def vi_next_char(key, arg: nil); end
  def vi_next_word(key, arg: nil); end
  def vi_paste_next(key, arg: nil); end
  def vi_paste_prev(key, arg: nil); end
  def vi_prev_big_word(key, arg: nil); end
  def vi_prev_char(key, arg: nil); end
  def vi_prev_word(key, arg: nil); end
  def vi_replace_char(key, arg: nil); end
  def vi_search_next(key); end
  def vi_search_prev(key); end
  def vi_to_column(key, arg: nil); end
  def vi_to_history_line(key); end
  def vi_to_next_char(key, arg: nil); end
  def vi_to_prev_char(key, arg: nil); end
  def vi_yank(key); end
  def vi_zero(key); end
  def whole_buffer; end
  def whole_lines(index: nil, line: nil); end
end
module Reline::LineEditor::CompletionState
end
class Struct::CompletionJourneyData < Struct
  def list; end
  def list=(_); end
  def pointer; end
  def pointer=(_); end
  def postposing; end
  def postposing=(_); end
  def preposing; end
  def preposing=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class Struct::MenuInfo < Struct
  def list; end
  def list=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def target; end
  def target=(_); end
end
class Reline::History < Array
  def <<(val); end
  def [](index); end
  def []=(index, val); end
  def check_index(index); end
  def concat(*val); end
  def delete_at(index); end
  def initialize(config); end
  def push(*val); end
  def to_s; end
end
class Reline::ANSI
  def self.clear_screen; end
  def self.cursor_pos; end
  def self.deprep(otio); end
  def self.encoding; end
  def self.erase_after_cursor; end
  def self.get_screen_size; end
  def self.getc; end
  def self.input=(val); end
  def self.move_cursor_column(x); end
  def self.move_cursor_down(x); end
  def self.move_cursor_up(x); end
  def self.output=(val); end
  def self.prep; end
  def self.retrieve_keybuffer; end
  def self.scroll_down(x); end
  def self.set_screen_size(rows, columns); end
  def self.set_winch_handler(&handler); end
  def self.ungetc(c); end
  def self.win?; end
end
class Reline::GeneralIO
  def self.clear_screen; end
  def self.cursor_pos; end
  def self.deprep(otio); end
  def self.encoding; end
  def self.erase_after_cursor; end
  def self.get_screen_size; end
  def self.getc; end
  def self.input=(val); end
  def self.move_cursor_column(val); end
  def self.move_cursor_down(val); end
  def self.move_cursor_up(val); end
  def self.prep; end
  def self.scroll_down(val); end
  def self.set_screen_size(rows, columns); end
  def self.set_winch_handler(&handler); end
  def self.ungetc(c); end
  def self.win?; end
end
class Struct::Key < Struct
  def char; end
  def char=(_); end
  def combined_char; end
  def combined_char=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def with_meta; end
  def with_meta=(_); end
end
class Reline::CursorPos < Struct
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def x; end
  def x=(_); end
  def y; end
  def y=(_); end
end
class Reline::Core
  def ambiguous_width; end
  def ambiguous_width=(arg0); end
  def auto_indent_proc; end
  def auto_indent_proc=(p); end
  def basic_quote_characters; end
  def basic_quote_characters=(v); end
  def basic_word_break_characters; end
  def basic_word_break_characters=(v); end
  def completer_quote_characters; end
  def completer_quote_characters=(v); end
  def completer_word_break_characters; end
  def completer_word_break_characters=(v); end
  def completion_append_character; end
  def completion_append_character=(val); end
  def completion_case_fold; end
  def completion_case_fold=(v); end
  def completion_proc; end
  def completion_proc=(p); end
  def completion_quote_character; end
  def config; end
  def config=(arg0); end
  def dig_perfect_match_proc; end
  def dig_perfect_match_proc=(p); end
  def emacs_editing_mode; end
  def emacs_editing_mode?; end
  def encoding; end
  def filename_quote_characters; end
  def filename_quote_characters=(v); end
  def get_screen_size; end
  def initialize; end
  def inner_readline(prompt, add_hist, multiline, &confirm_multiline_termination); end
  def input=(val); end
  def key_stroke; end
  def key_stroke=(arg0); end
  def last_incremental_search; end
  def last_incremental_search=(arg0); end
  def line_editor; end
  def line_editor=(arg0); end
  def may_req_ambiguous_char_width; end
  def output; end
  def output=(val); end
  def output_modifier_proc; end
  def output_modifier_proc=(p); end
  def pre_input_hook; end
  def pre_input_hook=(p); end
  def prompt_proc; end
  def prompt_proc=(p); end
  def read_escaped_key(keyseq_timeout, c, block); end
  def read_io(keyseq_timeout, &block); end
  def readline(prompt = nil, add_hist = nil); end
  def readmultiline(prompt = nil, add_hist = nil, &confirm_multiline_termination); end
  def special_prefixes; end
  def special_prefixes=(v); end
  def vi_editing_mode; end
  def vi_editing_mode?; end
end
