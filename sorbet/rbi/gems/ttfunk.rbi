# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/ttfunk/all/ttfunk.rbi
#
# ttfunk-1.6.2.1

module TTFunk
end
class TTFunk::Aggregate
  def coerce(other); end
end
class TTFunk::Directory
  def initialize(io, offset = nil); end
  def scaler_type; end
  def tables; end
end
class TTFunk::ResourceFile
  def [](type, index = nil); end
  def initialize(io); end
  def map; end
  def parse_from(offset); end
  def resources_for(type); end
  def self.open(path); end
end
class TTFunk::Collection
  def [](index); end
  def count; end
  def each; end
  def initialize(io); end
  def self.open(path); end
  include Enumerable
end
class TTFunk::TTFEncoder
  def align(data, width); end
  def checksum(data); end
  def cmap_table; end
  def cvt_table; end
  def dsig_table; end
  def encode; end
  def fpgm_table; end
  def gasp_table; end
  def glyf_table; end
  def glyphs; end
  def head_table; end
  def hhea_table; end
  def hmtx_table; end
  def initialize(original, subset, options = nil); end
  def kern_table; end
  def loca_table; end
  def maxp_table; end
  def name_table; end
  def new_to_old_glyph; end
  def old_to_new_glyph; end
  def optimal_table_order; end
  def options; end
  def original; end
  def os2_table; end
  def post_table; end
  def prep_table; end
  def raw(data); end
  def subset; end
  def tables; end
  def vorg_table; end
end
class TTFunk::UnresolvedPlaceholderError < StandardError
end
class TTFunk::DuplicatePlaceholderError < StandardError
end
class TTFunk::EncodedString
  def <<(obj); end
  def add_placeholder(new_placeholder, pos = nil); end
  def align!(width = nil); end
  def bytes; end
  def initialize; end
  def io; end
  def length; end
  def placeholders; end
  def resolve_placeholder(name, value); end
  def string; end
  def unresolved_string; end
end
class TTFunk::Placeholder
  def initialize(name, length: nil); end
  def length; end
  def name; end
  def position; end
  def position=(arg0); end
end
class TTFunk::OTFEncoder < TTFunk::TTFEncoder
  def base_table; end
  def cff_table; end
  def collect_glyphs(glyph_ids); end
  def glyf_table; end
  def loca_table; end
  def optimal_table_order; end
  def tables; end
  def vorg_table; end
end
class TTFunk::SciForm
  def ==(other); end
  def eql?(arg0); end
  def exponent; end
  def initialize(significand, exponent = nil); end
  def significand; end
  def to_f; end
end
class TTFunk::BitField
  def dup; end
  def initialize(value = nil); end
  def off(pos); end
  def off?(pos); end
  def on(pos); end
  def on?(pos); end
  def value; end
end
module TTFunk::BinUtils
  def rangify(values); end
  def slice_int(value, bit_width:, slice_count:); end
  def stitch_int(arr, bit_width:); end
  def twos_comp_to_int(num, bit_width:); end
  extend TTFunk::BinUtils
end
module TTFunk::Reader
  def hexdump(string); end
  def io; end
  def parse_from(position); end
  def read(bytes, format); end
  def read_signed(count); end
  def to_signed(number); end
end
class TTFunk::SubTable
  def eot?; end
  def file; end
  def initialize(file, offset, length = nil); end
  def length; end
  def read(*args); end
  def table_offset; end
  include TTFunk::Reader
end
class TTFunk::SubTable::EOTError < StandardError
end
class TTFunk::Min < TTFunk::Aggregate
  def <<(new_value); end
  def initialize(init_value = nil); end
  def value; end
  def value_or(default); end
end
class TTFunk::Max < TTFunk::Aggregate
  def <<(new_value); end
  def initialize(init_value = nil); end
  def value; end
  def value_or(default); end
end
class TTFunk::Sum < TTFunk::Aggregate
  def <<(operand); end
  def initialize(init_value = nil); end
  def value; end
  def value_or(_default); end
end
class TTFunk::OneBasedArray
  def [](idx); end
  def each(&block); end
  def entries; end
  def initialize(size = nil); end
  def size; end
  def to_ary; end
  include Enumerable
end
class TTFunk::Table
  def exists?; end
  def file; end
  def initialize(file); end
  def length; end
  def offset; end
  def parse!; end
  def raw; end
  def tag; end
  include TTFunk::Reader
end
class TTFunk::Table::Cff < TTFunk::Table
  def encode(new_to_old, old_to_new); end
  def global_subr_index; end
  def header; end
  def name_index; end
  def parse!; end
  def string_index; end
  def tag; end
  def top_index; end
end
class TTFunk::Table::Cmap < TTFunk::Table
  def parse!; end
  def self.encode(charmap, encoding); end
  def tables; end
  def unicode; end
  def version; end
end
module TTFunk::Table::Cmap::Format00
  def [](code); end
  def code_map; end
  def language; end
  def parse_cmap!; end
  def self.encode(charmap); end
  def supported?; end
end
module TTFunk::Table::Cmap::Format04
  def [](code); end
  def code_map; end
  def language; end
  def parse_cmap!; end
  def self.encode(charmap); end
  def supported?; end
end
module TTFunk::Table::Cmap::Format06
  def [](code); end
  def code_map; end
  def language; end
  def parse_cmap!; end
  def self.encode(charmap); end
  def supported?; end
end
module TTFunk::Table::Cmap::Format10
  def [](code); end
  def code_map; end
  def language; end
  def parse_cmap!; end
  def self.encode(charmap); end
  def supported?; end
end
module TTFunk::Table::Cmap::Format12
  def [](code); end
  def code_map; end
  def language; end
  def parse_cmap!; end
  def self.encode(charmap); end
  def supported?; end
end
class TTFunk::Table::Cmap::Subtable
  def [](_code); end
  def encoding_id; end
  def format; end
  def initialize(file, table_start); end
  def parse_cmap!; end
  def platform_id; end
  def self.encode(charmap, encoding); end
  def supported?; end
  def unicode?; end
  include TTFunk::Reader
end
class TTFunk::Table::Dsig < TTFunk::Table
  def flags; end
  def parse!; end
  def self.encode(dsig); end
  def signatures; end
  def tag; end
  def version; end
end
class TTFunk::Table::Dsig::SignatureRecord
  def format; end
  def initialize(format, length, offset, signature); end
  def length; end
  def offset; end
  def signature; end
end
class TTFunk::Table::Glyf < TTFunk::Table
  def for(glyph_id); end
  def parse!; end
  def self.encode(glyphs, new_to_old, old_to_new); end
end
class TTFunk::Table::Glyf::Compound
  def compound?; end
  def glyph_ids; end
  def id; end
  def initialize(id, raw); end
  def number_of_contours; end
  def raw; end
  def recode(mapping); end
  def x_max; end
  def x_min; end
  def y_max; end
  def y_min; end
  include TTFunk::Reader
end
class TTFunk::Table::Glyf::Compound::Component < Struct
  def arg1; end
  def arg1=(_); end
  def arg2; end
  def arg2=(_); end
  def flags; end
  def flags=(_); end
  def glyph_index; end
  def glyph_index=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def transform; end
  def transform=(_); end
end
class TTFunk::Table::Glyf::PathBased
  def compound?; end
  def horizontal_metrics; end
  def initialize(path, horizontal_metrics); end
  def left_side_bearing; end
  def number_of_contours; end
  def path; end
  def right_side_bearing; end
  def x_max; end
  def x_min; end
  def y_max; end
  def y_min; end
end
class TTFunk::Table::Glyf::Simple
  def compound?; end
  def end_point_of_last_contour; end
  def end_points_of_contours; end
  def id; end
  def initialize(id, raw); end
  def instruction_length; end
  def instructions; end
  def number_of_contours; end
  def raw; end
  def recode(_mapping); end
  def x_max; end
  def x_min; end
  def y_max; end
  def y_min; end
end
class TTFunk::Table::Head < TTFunk::Table
  def checksum_adjustment; end
  def created; end
  def flags; end
  def font_direction_hint; end
  def font_revision; end
  def glyph_data_format; end
  def index_to_loc_format; end
  def lowest_rec_ppem; end
  def mac_style; end
  def magic_number; end
  def modified; end
  def parse!; end
  def self.encode(head, loca, mapping); end
  def self.min_max_values_for(head, mapping); end
  def units_per_em; end
  def version; end
  def x_max; end
  def x_min; end
  def y_max; end
  def y_min; end
end
class TTFunk::Table::Hhea < TTFunk::Table
  def advance_width_max; end
  def ascent; end
  def caret_offset; end
  def carot_slope_rise; end
  def carot_slope_run; end
  def descent; end
  def line_gap; end
  def metric_data_format; end
  def min_left_side_bearing; end
  def min_right_side_bearing; end
  def number_of_metrics; end
  def parse!; end
  def self.encode(hhea, hmtx, original, mapping); end
  def self.min_max_values_for(original, mapping); end
  def version; end
  def x_max_extent; end
end
class TTFunk::Table::Hmtx < TTFunk::Table
  def for(glyph_id); end
  def left_side_bearings; end
  def metrics; end
  def metrics_cache; end
  def parse!; end
  def self.encode(hmtx, mapping); end
  def widths; end
end
class TTFunk::Table::Hmtx::HorizontalMetric < Struct
  def advance_width; end
  def advance_width=(_); end
  def left_side_bearing; end
  def left_side_bearing=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class TTFunk::Table::Kern < TTFunk::Table
  def add_table(format, attributes = nil); end
  def parse!; end
  def parse_version_0_tables(_num_tables); end
  def parse_version_1_tables(num_tables); end
  def self.encode(kerning, mapping); end
  def tables; end
  def version; end
end
class TTFunk::Table::Kern::Format0
  def attributes; end
  def cross_stream?; end
  def horizontal?; end
  def initialize(attributes = nil); end
  def pairs; end
  def recode(mapping); end
  def vertical?; end
  include TTFunk::Reader
end
class TTFunk::Table::Loca < TTFunk::Table
  def index_of(glyph_id); end
  def offsets; end
  def parse!; end
  def self.encode(offsets); end
  def size_of(glyph_id); end
end
class TTFunk::Table::Maxp < TTFunk::Table
  def max_component_contours; end
  def max_component_depth; end
  def max_component_elements; end
  def max_component_points; end
  def max_contours; end
  def max_function_defs; end
  def max_instruction_defs; end
  def max_points; end
  def max_size_of_instructions; end
  def max_stack_elements; end
  def max_storage; end
  def max_twilight_points; end
  def max_zones; end
  def num_glyphs; end
  def parse!; end
  def self.encode(maxp, mapping); end
  def version; end
end
class TTFunk::Table::Name < TTFunk::Table
  def compatible_full; end
  def copyright; end
  def description; end
  def designer; end
  def designer_url; end
  def entries; end
  def font_family; end
  def font_name; end
  def font_subfamily; end
  def license; end
  def license_url; end
  def manufacturer; end
  def parse!; end
  def postscript_name; end
  def preferred_family; end
  def preferred_subfamily; end
  def sample_text; end
  def self.encode(names, key = nil); end
  def strings; end
  def trademark; end
  def unique_subfamily; end
  def vendor_url; end
  def version; end
end
class TTFunk::Table::Name::NameString < String
  def encoding_id; end
  def initialize(text, platform_id, encoding_id, language_id); end
  def language_id; end
  def platform_id; end
  def strip_extended; end
end
class TTFunk::Table::OS2 < TTFunk::Table
  def ascent; end
  def ave_char_width; end
  def break_char; end
  def cap_height; end
  def char_range; end
  def code_page_range; end
  def default_char; end
  def descent; end
  def family_class; end
  def first_char_index; end
  def last_char_index; end
  def line_gap; end
  def max_context; end
  def panose; end
  def parse!; end
  def selection; end
  def self.avg_char_width_for(os2, subset); end
  def self.avg_ms_symbol_char_width_for(os2, subset); end
  def self.avg_weighted_char_width_for(os2, subset); end
  def self.code_pages_for(subset); end
  def self.encode(os2, subset); end
  def self.group_original_code_points_by_bit(os2); end
  def self.unicode_blocks_for(os2, original_field, subset); end
  def tag; end
  def type; end
  def vendor_id; end
  def version; end
  def weight_class; end
  def width_class; end
  def win_ascent; end
  def win_descent; end
  def x_height; end
  def y_strikeout_position; end
  def y_strikeout_size; end
  def y_subscript_x_offset; end
  def y_subscript_x_size; end
  def y_subscript_y_offset; end
  def y_subscript_y_size; end
  def y_superscript_x_offset; end
  def y_superscript_x_size; end
  def y_superscript_y_offset; end
  def y_superscript_y_size; end
end
class TTFunk::Table::Post < TTFunk::Table
  def fixed_pitch; end
  def fixed_pitch?; end
  def format; end
  def glyph_for(_code); end
  def italic_angle; end
  def max_mem_type1; end
  def max_mem_type42; end
  def min_mem_type1; end
  def min_mem_type42; end
  def parse!; end
  def parse_format!; end
  def recode(mapping); end
  def self.encode(post, mapping); end
  def subtable; end
  def underline_position; end
  def underline_thickness; end
end
module TTFunk::Table::Post::Format10
  def glyph_for(code); end
  def parse_format!; end
end
module TTFunk::Table::Post::Format20
  def glyph_for(code); end
  def parse_format!; end
  include TTFunk::Table::Post::Format10
end
module TTFunk::Table::Post::Format30
  def glyph_for(_code); end
  def parse_format!; end
end
module TTFunk::Table::Post::Format40
  def glyph_for(code); end
  def parse_format!; end
end
class TTFunk::Table::Sbix < TTFunk::Table
  def all_bitmap_data_for(glyph_id); end
  def bitmap_data_for(glyph_id, strike_index); end
  def flags; end
  def num_strikes; end
  def parse!; end
  def strikes; end
  def version; end
end
class TTFunk::Table::Sbix::BitmapData < Struct
  def data; end
  def data=(_); end
  def ppem; end
  def ppem=(_); end
  def resolution; end
  def resolution=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def type; end
  def type=(_); end
  def x; end
  def x=(_); end
  def y; end
  def y=(_); end
end
class TTFunk::Table::Vorg < TTFunk::Table
  def count; end
  def default_vert_origin_y; end
  def for(glyph_id); end
  def major_version; end
  def minor_version; end
  def origins; end
  def parse!; end
  def self.encode(vorg); end
  def tag; end
end
class TTFunk::File
  def ascent; end
  def bbox; end
  def cff; end
  def cmap; end
  def contents; end
  def descent; end
  def digital_signature; end
  def directory; end
  def directory_info(tag); end
  def find_glyph(glyph_id); end
  def glyph_locations; end
  def glyph_outlines; end
  def header; end
  def horizontal_header; end
  def horizontal_metrics; end
  def initialize(contents, offset = nil); end
  def kerning; end
  def line_gap; end
  def maximum_profile; end
  def name; end
  def os2; end
  def postscript; end
  def sbix; end
  def self.from_dfont(file, which = nil); end
  def self.from_ttc(file, which = nil); end
  def self.open(io_or_path); end
  def self.verify_and_open(io_or_path); end
  def vertical_origins; end
end
class TTFunk::Table::Simple < TTFunk::Table
  def initialize(file, tag); end
  def tag; end
end
module TTFunk::Subset
  def self.for(original, encoding); end
end
class TTFunk::Subset::Base
  def collect_glyphs(glyph_ids); end
  def encode(options = nil); end
  def encoder_klass; end
  def glyph_for(glyph_id); end
  def glyphs; end
  def initialize(original); end
  def microsoft_symbol?; end
  def new_to_old_glyph; end
  def old_to_new_glyph; end
  def original; end
  def to_unicode_map; end
  def unicode?; end
  def unicode_cmap; end
end
class TTFunk::Subset::Unicode < TTFunk::Subset::Base
  def covers?(_character); end
  def from_unicode(character); end
  def includes?(character); end
  def initialize(original); end
  def new_cmap_table; end
  def original_glyph_ids; end
  def to_unicode_map; end
  def unicode?; end
  def use(character); end
end
class TTFunk::Subset::Unicode8Bit < TTFunk::Subset::Base
  def covers?(character); end
  def from_unicode(character); end
  def includes?(character); end
  def initialize(original); end
  def new_cmap_table; end
  def original_glyph_ids; end
  def to_unicode_map; end
  def unicode?; end
  def use(character); end
end
class TTFunk::Subset::CodePage < TTFunk::Subset::Base
  def code_page; end
  def covers?(character); end
  def encoding; end
  def from_unicode(character); end
  def includes?(character); end
  def initialize(original, code_page, encoding); end
  def new_cmap_table; end
  def original_glyph_ids; end
  def self.mapping_cache; end
  def self.unicode_mapping_for(encoding); end
  def space_char_code; end
  def to_unicode_map; end
  def use(character); end
end
class TTFunk::Subset::MacRoman < TTFunk::Subset::CodePage
  def initialize(original); end
end
class TTFunk::Subset::Windows1252 < TTFunk::Subset::CodePage
  def initialize(original); end
end
class TTFunk::SubsetCollection
  def [](subset); end
  def encode(characters); end
  def initialize(original); end
  def use(characters); end
end
