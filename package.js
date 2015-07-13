Package.describe({
  name: 'hausor:test-helpers',
  version: '0.0.1',
  summary: 'Simple test helpers for meteor',
  git: 'https://github.com/Hausor/test-helpers',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  
  api.use("coffeescript@1.0.6")
  api.use("practicalmeteor:sinon@1.14.1_2")

  api.addFiles("export.js");
  api.addFiles("both/stub_meteor_call.coffee");
  api.addFiles("client/render_template.coffee", 'client');
  
  api.export("stubMeteorMethod")
  api.export("restoreMethodStubs")
  api.export("renderTemplate")

});

Package.onTest(function(api) {
  api.use(['mike:mocha-package@0.5.7', 'practicalmeteor:chai', 'practicalmeteor:sinon@1.14.1_2']);
  api.use('coffeescript@1.0.6');
  api.use('templating@1.0.0');
  api.use('blaze@2.0.0');
  api.use('accounts-password');
  api.use('hausor:test-helpers');
  api.addFiles("tests/fixtures/test_template.html")
  api.addFiles("tests/both/stub_meteor_call_spec.coffee")
  api.addFiles("tests/client/render_template_spec.coffee", 'client')
});
