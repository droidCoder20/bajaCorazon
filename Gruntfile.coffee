gruntFunction = (grunt) ->

  gruntConfig =
    pkg:
      grunt.file.readJSON('package.json')

    # BrowserSync ###############################
    browserSync:
      dist:
          bsFiles:
            src : ['public/**/*', 'server/views/**/*']
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
      hbs: ["src/ui/app/modules/**/*.hbs"]

    # COFFESCRIPT ###############################
    coffee:
        ui:
            expand: true
            cwd: 'src/ui/app'
            src: '**/*.coffee'
            dest: 'public/app'
            ext: '.js'
                
        server:
            expand: true
            cwd: 'src/server'
            src: '**/*.coffee'
            dest: 'server/'
            ext: '.js'        
    # EXPRESS ###################################
    express:
        dev:
            options:
                script: 'server/server.js'
    
    # HANDLEBARS ################################
    handlebars:
      compile:
        options:
          namespace: false
          amd: true
        files:[
          expand: true
          cwd: "src/ui/app/"
          src: "**/*.hbs"
          dest: "public/app"
          ext: ".js"
        ]
    
    # Imagemin #################################
    imagemin:
        static:
            options:
                optimizationLevel: 3
        dynamic:
            files: [
                expand: true
                cwd: 'src/ui/app/img'
                src: ['**/*.{png,jpg,gif}']
                dest: 'public/img'    
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
          cwd: "src/server/views"
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
          cwd: "src/ui/app"
          src: "**/*.jade"
          dest: "src/ui/app"
          ext: ".hbs"
        ]

    # STYLUS ###################################
    stylus:
      compile:
        files:[
          expand: true
          cwd: "src/ui/app/styl"
          src: "**/*.styl"
          dest: "public/css"
          ext: ".css"
        ]
        
    # WATCH ####################################
    watch:
      options:
          livereload: true
      stylus:
        files: ['src/ui/app/styl/**/*.styl']
        tasks: ['stylus']
      views:
        files: ['src/server/views/**/*.jade']
        tasks: ['jade:views']
      templates:
        files: ['src/ui/app/**/*.jade']
        tasks: ['jade:templates', 'handlebars', 'clean']
      coffee:
        files: ['src/ui/app/**/*.coffee', 'src/server/**/*.coffee']
        tasks: ['coffee']        
      express:
         files: ['server/**/*.js', 'public/app**/*.js']
         tasks: ['express:dev']
         options:
             spawn: false 

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
  grunt.loadNpmTasks 'grunt-express-server'

  # LAST SETTINGS ##############################
  grunt.registerTask 'default', [
    'stylus'
    'coffee'
    'jade'
    'handlebars'
    'clean'
    'imagemin'
    'express:dev'
    'watch'
    #'browserSync:dist'
  ]
  
  grunt.initConfig gruntConfig

module.exports = gruntFunction