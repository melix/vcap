class GroovyPlugin < StandalonePlugin

  def framework
    'groovy'
  end

  def stage_application
    Dir.chdir(destination_directory) do
      create_app_directories
      copy_source_files
      FileUtils.mkdir_p File.join(destination_directory, 'temp')
      create_startup_script
      create_stop_script
    end
  end

  private def guess_main_file
    file = nil
    groovy_files = app_files_matching_patterns

    if groovy_files.length == 1
      file = groovy_files.first
    else
      %w{Main.groovy main.groovy}.each do |fname|
        file = fname if groovy_files.include? fname
      end
    end

    # TODO - Currently staging exceptions are not handled well.
    # Convert to using exit status and return value on a case-by-case basis.
    raise "Unable to determine Groovy startup command" unless file

    File.open('/tmp/main.txt', 'wb') do |f|
      f.puts(file)
    end

    file
  end


  def start_command
      main_file = guess_main_file
      "groovy #{main_file}"
  end

  def startup_script
    vars = environment_hash
    java_sys_props = "-Djava.io.tmpdir=$PWD/temp"
    vars['JAVA_OPTS'] = "$JAVA_OPTS -Xms#{application_memory}m -Xmx#{application_memory}m #{java_sys_props}"
    generate_startup_script(vars)
  end

  def stop_script
    vars = environment_hash
    generate_stop_script(vars)
  end
end
