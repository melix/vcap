include_attribute "deployment"
default[:groovy][:version] = "1.8.6"
default[:groovy][:path] = File.join(node[:deployment][:home], "deploy", "groovy")
default[:groovy][:source] = "http://dist.groovy.codehaus.org/distributions/groovy-binary-#{groovy[:version]}.zip"