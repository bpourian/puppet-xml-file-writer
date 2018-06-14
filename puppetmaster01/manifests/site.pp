stage { 'first':
  before  => Stage['main'],
}

stage { 'last': }

Stage['main'] -> Stage['last']

node /^puppet/ {
  class{'puppetmaster':
    stage => 'main',
  }

  # class{'webserver':
  #   stage => 'last',
  # }
}
