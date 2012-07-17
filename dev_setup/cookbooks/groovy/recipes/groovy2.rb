groovy_version = node[:groovy2][:version]
groovy_path = node[:groovy2][:path]
remote_path = node[:groovy2][:source]

cf_groovy_install(groovy_version, groovy_path, remote_path)