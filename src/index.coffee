blessed = require('blessed')

# Get a random note, but never the previous note
previous = null
randomNote = ->
  notes = ["A", "B", "C", "D", "E", "F", "G"]
  notes.splice(notes.indexOf(previous), 1);
  previous = notes[Math.floor(Math.random() * notes.length)]

# Create and configure blessed screen
screen = blessed.screen()
box = blessed.bigtext(
  top: 'center'
  left: 'center'
  width: 'shrink'
  height: '50%'
  border: type: 'line'
  style:
    fg: 'white'
    bg: 'black'
    border: fg: '#f0f0f0'
)

# Quit on Escape, q, or Control-C.
screen.key(['escape', 'q', 'C-c'], -> process.exit(0))

setContent = ->
  box.setContent("  " + randomNote() + "  ")
  screen.render()

screen.key(['space'], setContent)

# Initial
screen.append(box)
box.focus()
setContent()
