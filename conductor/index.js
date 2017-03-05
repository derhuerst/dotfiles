api.bind('left', ['ctrl', 'alt'], () => {
	const target = Window.focusedWindow()
	const {width, height} = target.screen().frameWithoutDockOrMenu()
	const newWidth = width/2|0

	target.setTopLeft({x: 0, y: 0})
	target.setSize({width: newWidth, height})
})

api.bind('right', ['ctrl', 'alt'], () => {
	const target = Window.focusedWindow()
	const {width, height} = target.screen().frameWithoutDockOrMenu()
	const newWidth = width/2|0

	target.setTopLeft({x: newWidth, y: 0})
	target.setSize({width: newWidth, height})
})

api.bind('up', ['ctrl', 'alt'], () => {
	const target = Window.focusedWindow()
	const {width, height} = target.screen().frameWithoutDockOrMenu()

	target.setTopLeft({x: 0, y: 0})
	target.setSize({width, height})
})