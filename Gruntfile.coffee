gruntFunction = (grunt) ->

  gruntConfig =
    pkg:
      grunt.file.readJSON('package.json')

    # Imagemin #################################
    imagemin:
        static:
            options:
                optimizationLevel: 3
        dynamic:
            files: [
                expand: true
                cwd: 'resources/assets/img'
                src: ['**/*.{png,jpg,gif}']
                dest: 'public/img'    
            ]
    # BrowserSync ###############################
    browserSync:
      dist:
          bsFiles:
            src : ['public/**/*', 'resources/server/views/**/*']
          options:
            watchTask: true
            proxy: 'localhost:3333'
            notify: true
            open: true
            logLevel: 'silent'
            ghostMode:
              clicks: true
              scroll: true
              links: true
              forms: true      

    # CLEAN #####################################
    clean:
      hbs: ["resources/coffee/**/*.hbs"]

    # COFFESCRIPT ###############################
    coffee:
      glob_to_multiple:
        expand: true
        cwd: 'resources/coffee'
        src: '**/*.coffee'
        dest: 'public/js'
        ext: '.js'

    # HANDLEBARS ################################
    handlebars:
      compile:
        options:
          namespace: false
          amd: true
        files:[
          expand: true
          cwd: "resources/coffee/"
          src: "**/*.hbs"
          dest: "public/js"
          ext: ".js"
        ]

    # JADE #####################################
    jade:
      views:
        options:
          pretty: true
          data:
            debug: false
        files:[
          expand: true
          cwd: "resources/server/views"
          src: ["**/*.jade"]
          dest: "server/views"
        ]
      templates:
        options:
          pretty: true
          data:
            debug: false
        files: [
          expand: true
          cwd: "resources/coffee"
          src: "**/*.jade"
          dest: "resources/coffee"
          ext: ".hbs"
        ]

    # STYLUS ###################################
    stylus:
      compile:
        files:[
          expand: true
          cwd: "resources/assets/stylus"
          src: "**/*.styl"
          dest: "public/css"
          ext: ".css"
        ]
          
    # WATCH ####################################
    watch:
      stylus:
        files: ['resources/assets/stylus/**/*.styl']
        tasks: ['stylus']
      views:
        files: ['resources/server/views/**/*.jade']
        tasks: ['jade:views']
      templates:
        files: ['resources/coffee/**/*.jade']
        tasks: ['jade:templates', 'handlebars', 'clean']
      coffee:
        files: ['resources/coffee/**/*.coffee']
        tasks: ['coffee']
      servercoffee:
          files: ['resources/server/**/*.coffee']
          tasks: ['server']        

    # SERVER ##################################
    servercoffee:
        glob_to_multiple:
          expand: true
          cwd: 'resources/server'
          src: '**/*.coffee'
          dest: 'server/'
          ext: '.js'

  # LOAD NPM TASKS #############################
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-handlebars'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-browser-sync'

  # LAST SETTINGS ##############################
  grunt.registerTask 'default', [
    'stylus'
    'coffee'
    'jade'
    'handlebars'
    'clean'
    'browserSync:dist'
    'watch'
    'imagemin'
  ]
  
  grunt.initConfig gruntConfig

module.exports = gruntFunction