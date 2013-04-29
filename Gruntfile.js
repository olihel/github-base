/*!
 * {{title}}
 * https://github.com/olihel/{{name}}.git
 *
 * Copyright (c) {{year}} Oliver Hellebusch
 * Released under MIT license (http://olihel.github.io/{{name}}/LICENSE)
 */

module.exports = function (grunt) {
  //var pkg = grunt.file.readJSON('package.json');

  grunt.initConfig({
    devserver: {
      port: 8888,
      base: 'src/',
      cache: 'no-cache'
    }
  });

  grunt.loadNpmTasks('grunt-devserver');

  grunt.registerTask('server', ['devserver']);

  grunt.registerTask('default', 'Help screen', function () {
    grunt.log.subhead('Available tasks:');
    grunt.log.writeln('- server');
  });
};