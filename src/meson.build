sources = files(
  'Application.vala',
  'View/MainWindow.vala',
  'View/MainView.vala',
  'ViewModel/MainViewModel.vala'
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
