module Wagyu::Wasm
  UnknownID = 0
  TypeID = 1
  ImportID = 2
  FunctionID = 3
  TableID = 4
  MemoryID = 5
  GlobalID = 6
  ExportID = 7
  StartID = 8
  ElementID = 9
  CodeID = 10
  DataID = 11

  Module = Struct.new(
    :version,
    # some sections are optional and can be nil
    :type_section,
    :import_section,
    :function_section,
    :table_section,
    :memory_section,
    :global_section,
    :export_section,
    :start_section,
    :element_section,
    :code_section,
    :data_section,
    :name_section
  )

  TypeSection = Struct.new(:types) # []FuncType
  ImportSection = Struct.new(:imports) # []ImportEntry
  FunctionSection = Struct.new(:types) # []varuint32
  TableSection = Struct.new(:tables) # []TableType
  MemorySection = Struct.new(:memories) # []MemoryType
  GlobalSection = Struct.new(:globals) # []GlobalVariable
  ExportSection = Struct.new(:exports) # []ExportEntry
  StartSection = Struct.new(:index) # uint32
  ElementSection = Struct.new(:elements) # []ElemSegment
  CodeSection = Struct.new(:bodies) # []FunctionBody
  DataSection = Struct.new(:segments) # []DataSegment
  NameSection = Struct.new(:name, :funcs) # string, []FunctionNames

  FuncType = Struct.new(:form, :params, :results) # ValueType, []ValueType, []ValueType where ValueType is varint7

  FunctionBody = Struct.new(:locals, :code)
  LocalEntry = Struct.new(:count, :type)

  ExportEntry = Struct.new(:field, :kind, :index)
end