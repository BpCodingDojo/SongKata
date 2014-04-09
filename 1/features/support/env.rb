Around do |_, block|
  stdout_bak = $stdout
  $stdout = StringIO.new

  block.call

  $stdout = stdout_bak
end
