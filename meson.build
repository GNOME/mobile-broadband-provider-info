project(
  'mobile-broadband-provider-info',
  'c',
  version: '20240407',
  license: 'CERTIFICATION 1.0 US Deed ',
  meson_version: '>= 1.0.0',
)

prefix = get_option('prefix')
datadir = prefix / get_option('datadir')
pkgdatadir = datadir / 'mobile-broadband-provider-info'
database = pkgdatadir / 'serviceproviders.xml'
sp_xml_db = meson.global_source_root() / 'serviceproviders.xml'

pkgconfig = import('pkgconfig')

pkgconfig.generate(
  name: 'mobile-broadband-provider-info',
  description: 'Mobile Broadband Service Provider Information Database',
  variables: [
    'pkgdatadir=@0@'.format(pkgdatadir),
    'database=${pkgdatadir}/serviceproviders.xml',
  ],
  dataonly: true,
)

custom_target('build-apns-conf',
  build_by_default: true,
  output: 'apns-conf.xml',
  input: 'apns-conf.xsl',
  command: [find_program('xsltproc'), '--output', '@OUTPUT@', '@INPUT@', sp_xml_db],
  install: true,
  install_dir: pkgdatadir,
)

install_data(
  [sp_xml_db, 'serviceproviders.2.dtd'],
  install_dir: pkgdatadir,
)

test('check-blanks',
     find_program('grep'),
     args: ['^[[:blank:]]* [[:blank:]]*<\|[[:blank:]]$$', sp_xml_db],
     # There shouldn't be any matches
     should_fail: true,
)

test('xmllint',
     find_program('xmllint'),
     args: ['--postvalid', sp_xml_db])
