if !has('signs') || !has('ruby')
  finish
endif

function! AppendFrozenLiteral()
ruby << EOF
  VIM::Buffer.current.append(0, '')
  VIM::Buffer.current.append(0, '# frozen_string_literal: true')
EOF
endfunction

function! PrintClassName()
ruby << EOF
  b = VIM::Buffer.current

  file_name_underscored = Vim.evaluate("expand('%:t:r')")
  file_name_constantized = file_name_underscored.split('_').collect(&:capitalize).join

  b.lines.each_with_index do |line, i|
    if line.match? /^\s*class\s\w*\s*$/
      b.lines[i] = 'class ' + file_name_constantized
    end
  end
EOF
endfunction

function! AppendModulesAndClassName()
ruby << EOF
  IGNORE_PATHS = [
    'app',
    'app/models/',
    'app/controllers/',
    'lib'
  ].freeze

  file_path = Vim.evaluate("expand('%:r')")
  file_path_separated_by_slash = file_path.split('/')

  file_name = file_path_separated_by_slash.pop
  folders = file_path_separated_by_slash

  if IGNORE_PATHS.include?(folders.join('/'))
    folders = []
  end

  current_line = VIM::Buffer.current.line
  current_line_index = VIM::Buffer.current.lines.find_index { |line| line == current_line }
  buffer = VIM::Buffer.current

  folders.each_with_index do |folder_name, index|
    module_name_constantized = folder_name.split('_').collect(&:capitalize).join
    buffer.append(current_line_index + index, "module #{module_name_constantized}")
  end

  line_number_for_class_declaration = folders.length
  class_name_constantized = file_name.split('_').collect(&:capitalize).join
  buffer.append(current_line_index + line_number_for_class_declaration, "class #{class_name_constantized}")
EOF
endfunction
