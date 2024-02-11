#!/usr/bin/env ruby

require 'xcodeproj'

def main
    # Find the Podfile in the current directory
    podfile_path = File.join(Dir.pwd, 'Podfile')
    
    # Read the Podfile to extract the target name
    target_name = extract_target_name(podfile_path)
    
    # Construct the project path using the extracted target name
    project_path = "#{target_name}.xcodeproj"
    # Print the name of project
    puts "Project name #{project_path}"
    # Open the project using the constructed path
    app_project = Xcodeproj::Project.open(project_path)
    
    # Iterate over each target in the main app project
    app_project.targets.each do |target|
        # Print the name of each target
        puts "Target: #{target.name}"
        
        # Iterate over each build configuration for the target
        target.build_configurations.each do |config|
            # Print the name of each build configuration
            #      puts "  Configuration: #{config.name}"
            config.build_settings['GENERATE_INFOPLIST_FILE'] = 'NO'
            # Modify build settings as necessary
        end
    end
    
    # Save changes to the Xcode project file
    app_project.save
    #  end
end

def extract_target_name(podfile_path)
    target_name = nil
    File.foreach(podfile_path) do |line|
        if line.match(/target\s+['"](.+)['"]\s+do/)
            target_name = $1
            break
        end
    end
    target_name
end

if __FILE__ == $PROGRAM_NAME
    main
end
