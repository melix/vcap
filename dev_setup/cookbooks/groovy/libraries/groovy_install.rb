module GroovyInstall
  def cf_groovy_install(groovy_version, groovy_path, remote_path)

    zipfile = File.join("", "tmp", "groovy-binary-#{groovy_version}.zip")

    bash "Installing Groovy #{groovy_version}" do
      user node[:deployment][:user]
      cwd File.join("", "tmp")
      code <<-EOH
        if [ ! -d #{groovy_path} ]
        then
          wget -q #{remote_path}
          unzip -q -o -d #{groovy_path} #{zipfile}
        fi
      EOH
    end

  end
end

class Chef::Recipe
  include GroovyInstall
end
