sources = files(
  'Main.vala',
  'MainWindow.vala',
)

dependencies = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gtk4'),
]

executable(
  'yate',
  sources,
  dependencies: dependencies,
  install: true
)
