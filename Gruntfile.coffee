# Gruntfile.coffee
module.exports = (grunt) ->
  # load all tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    copy:
      htmls: files: [
        expand: true
        cwd: 'src/'
        src: '*.html'
        dest: 'build/'
        ]
      images: files: [
        expand: true
        cwd: 'src/images/'
        src: '{,*/}*.{png,jpg,jpeg,svg,gif}'
        dest: 'build/images'
        ]
    concat:
      scripts: files:
        'build/scripts.js': [
          'src/scripts/livereload-run.js'
          'src/scripts/lang-*.js'
#          'src/scripts/diagram-run.js'
          'src/scripts/prettify-run.js'
          'src/scripts/offsets-run.js'
          'src/scripts/impress-run.js'
          'src/scripts/analytics-run.js'
          'src/scripts/analytics-impress-run.js'
          ]
#      styles:  files: 'build/styles.css': 'src/styles/**/*.css'
      components: files:
        'build/components.js': [
          'components/impress.js/js/impress.js'
          'components/google-code-prettify/src/prettify.js'
          'components/google-code-prettify/src/lang*.js'
          'components/jquery/jquery.js'
#          'components/raphael/raphael.js'
#          'components/underscore/underscore.js'
#          'components/js-sequence-diagrams/build/sequence-diagram-min.js'
          ]
        'build/components.css': [
          'components/normalize-css/normalize.css'
          'components/google-code-prettify/styles/desert.css'
          ]
    less:
      styles:
        files: 'build/styles.css': 'src/styles/styles.less'
        options:
          compress:        false
          yuicompress:     false
          dumpLineNumbers: "all" # false
          optimization:     0    # 3
      
    # Web server configuration
    connect: build: options:
      hostname: '0.0.0.0'
      port: 9002
      base: 'build'

    # Livereload and compile changes
    watch:
      options:
        livereload: 19002
      htmls:
        files: ['src/**/*.html']
        tasks: ['copy:htmls']
      images:
        files: ['src/images/**/*.{png,jpg,jpeg,svg,gif}']
        tasks: ['copy:images']
      styles:
        files: ['src/styles/**/*.less']
        tasks: ['less:styles']
      scripts:
        files: ['src/scripts/**/*.js']
        tasks: ['concat:scripts']
    clean:
      dist: ['dist']
      build: ['build']
    
  grunt.registerTask 'build', [
    'copy:htmls'
    'copy:images'
    'concat:scripts'
    'concat:components'
    'less:styles'
    ]

  grunt.registerTask 'server', [
    'build','connect:build','watch']
  grunt.registerTask 'default', ['server']
      
