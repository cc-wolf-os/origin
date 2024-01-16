local win = window.create(term.current(), 1, 1, term.getSize())
local old = term.redirect(win)
window.setVisible(false)

while true do
win.setVisible(false)
term.stuff() -- draw your ui
win.setVisible(true)
end
