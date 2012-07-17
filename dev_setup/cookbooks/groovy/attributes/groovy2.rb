include_attribute "deployment"
default[:groovy2][:version] = "2.0.0"
default[:groovy2][:path] = File.join(node[:deployment][:home], "deploy", "groovy")
default[:groovy2][:source] = "http://dist.groovy.codehaus.org/distributions/groovy-binary-#{groovy2[:version]}.zip"