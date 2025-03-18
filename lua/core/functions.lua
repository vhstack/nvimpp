-- Toggle Zeilennummer 
-- relative->keine->absolute
function ToggleLineNumber()
  if not vim.wo.number and not vim.wo.relativenumber then
    vim.wo.number = true
    vim.wo.relativenumber = false
  elseif vim.wo.number and not vim.wo.relativenumber then
    vim.wo.relativenumber = true
  else
	vim.wo.number = false
    vim.wo.relativenumber = false
  end
end
