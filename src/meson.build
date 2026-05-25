sources = files(
  'Application.vala',
  'Helpers/ShortcutUtils.vala',
  'View/ShellView.vala',
  'View/MainView.vala',
  'ViewModel/MainViewModel.vala',
  'ViewModel/ShellViewModel.vala',
)

dependencies = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gtk4'),
  dependency('gee-0.8'),
]

vala_args = []

if host_machine.system() == 'darwin'
  vala_args += ['--define=DARWIN']
endif

executable(
  'yate',
  sources,
  dependencies: dependencies,
  vala_args: vala_args,
  install: true
)
