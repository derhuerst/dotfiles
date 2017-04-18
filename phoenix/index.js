// https://github.com/kasper/phoenix

Key.on('left', ['ctrl', 'alt'], () => {
	const target = Window.focused()
	const screen = target.screen()
	const {x, y, width, height} = screen.flippedVisibleFrame()
	const newWidth = width/2|0

	target.setFrame({x: x, y, width: newWidth, height})
})

Key.on('right', ['ctrl', 'alt'], () => {
	const target = Window.focused()
	const screen = target.screen()
	const {x, y, width, height} = screen.flippedVisibleFrame()
	const newWidth = width/2|0

	target.setFrame({x: x + newWidth, y, width: newWidth, height})
})

Key.on('up', ['ctrl', 'alt'], () => {
	const target = Window.focused()
	target.maximize()
})

Key.on('down', ['ctrl', 'alt'], () => {
	const target = Window.focused()
	const space = Space.active()
	if (!space.isNormal()) {
		Phoenix.log('current space is not normal')
		return
	}

	const spaces = Space.all().filter((s) => s.isNormal())
	if (spaces.length === 1) {
		Phoenix.log('only one normal space')
		return
	}

	const i = spaces.findIndex((s) => s.isEqual(space))
	if (!i < 0) {
		Phoenix.log('current space not found in list')
		return
	}

	const nextSpace = spaces[(i + 1) % spaces.length]

	// const debug = (s) => {
	// 	const f = s.screens()[0].flippedVisibleFrame()
	// 	return [f.x, f.y, f.width, f.height].join(' ')
	// }
	// Phoenix.log('current', debug(space))
	// Phoenix.log('next', debug(nextSpace))

	// space.removeWindows([target])
	// const {x, y, width, height} = nextSpace.screens()[0].flippedVisibleFrame()
	// target.setFrame({x: 0, y: 0, width, height})
	// nextSpace.addWindows([target])
})