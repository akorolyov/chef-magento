name             'magento'
maintainer       'MavenEcommerce Inc'
maintainer_email 'akorolyov@mavenecommerce.com'
license          'All rights reserved'
description      'Installs/Configures magento'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'php', '~> 1.7.0'
depends 'mysql', '~> 6.1.0'
depends 'nginx', '~> 2.7.6'