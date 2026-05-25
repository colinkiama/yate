sources = files(
  'Application.vala',
  'View/ShellView.vala',
  'View/MainView.vala',
  'ViewModel/MainViewModel.vala',
  'ViewModel/ShellViewModel.vala'
)

dependencies = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gtk4'),
  dependency('gee-0.8'),
]

executable(
  'yate',
  sources,
  dependencies: dependencies,
  install: true
)
