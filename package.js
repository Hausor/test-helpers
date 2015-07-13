Package.describe({
  name: 'hausor:test-helpers',
  version: '0.0.1',
  summary: 'Simple test helpers for meteor',
  git: '',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.use("coffeescript")
  api.use("practicalmeteor:sinon")
  api.addFiles("both/stub_meteor_call.coffee");
  api.addFiles("both/render_template.coffee");
  api.versionsFrom('1.1.0.2');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('hausor:test-helpers');
});
