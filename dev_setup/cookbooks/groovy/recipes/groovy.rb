groovy_version = node[:groovy][:version]
groovy_path = node[:groovy][:path]
remote_path = node[:groovy][:source]

cf_groovy_install(groovy_version, groovy_path, remote_path)