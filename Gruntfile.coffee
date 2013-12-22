module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    # local Server
    connect:
      server:
        options:
          livereload: true
          open: true

    # estwatch
    esteWatch:
      options:
        dirs: ["src/**"]
        livereload:
          enabled: true
          # 監視対象とするファイルの拡張子
          extensions: ['jade', 'coffee', 'sass', 'html', 'js', 'css']
          port: 35729
      jade: (filepath) ->
        'jade'
      coffee: (filepath) ->
        'coffee'
      sass: (filepath) ->
        'sass'

    # jade
    jade:
      files:
        options: pretty: true
        expand : true
        cwd    : 'src/' # 対象フォルダ
        src    : ['**/*.jade', '!**/_*.jade']
        dest   : '' # コンパイルフォルダ
        ext    : '.html'

    # sass
    sass:
      options:
        # sourcemap: true
        style: 'expanded'
      compile:
        files: 'style.css':'src/sass/style.sass'

    # coffee
    coffee:
      compile:
        options:
          bare: true
        files:
          "spacer.js": "src/coffee/spacer.coffee"
          "app.js": "src/coffee/app.coffee"

    # jshint
    jshint:
      allFiles: [
        'spacer.js', 'app.js'
      ]
      options:
        jshintrc: '.jshintrc'

    # 圧縮
    uglify:
      build:
        files:
          "spacer.min.js": ["spacer.js"]


  # start local server
  grunt.registerTask "default", ["connect", "esteWatch"]

  # "default" でデフォルトのタスクを設定
  grunt.registerTask "release", ["uglify:build"]
