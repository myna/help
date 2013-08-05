#global module:false

'use strict'

module.exports = (grunt) ->
  grunt.initConfig
    less:
      screen:
        options:
          paths: [
            "bower_components/bootstrap/less"
            "_assets/css"
          ]
          yuicompress: true
        files:
          "static/css/screen.css": "_assets/css/screen.less"
    uglify:
      site:
        files:
          'static/js/site.js': [
            'bower_components/jquery/jquery.js'
            'bower_components/bootstrap/js/collapse.js'
            'bower_components/bootstrap/js/scrollspy.js'
            'bower_components/bootstrap/js/button.js'
            'bower_components/bootstrap/js/affix.js'
            'bower_components/respond/respond.src.js'
          ]
    copy:
      bootstrap:
        files: [{
          expand: true
          cwd: 'bower_components/bootstrap/img/'
          src: ['**']
          dest: 'static/img/'
        }]
    exec:
      install:
        cmd: 'bundle install'
      build:
        cmd: 'bundle exec jekyll build'
      serve:
        cmd: 'bundle exec jekyll serve --watch'
      # deploy:
      #   cmd: 'rsync --progress -a --delete -e "ssh -q" _site/ myuser@host:mydir/'
    bower:
      install: {}

  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-exec');
  grunt.loadNpmTasks('grunt-bower-task');

  grunt.registerTask('default', [ 'less', 'uglify', 'copy', 'exec:serve' ]);
  grunt.registerTask('deploy', [ 'default', 'exec:deploy' ]);
