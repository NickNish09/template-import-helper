require "template/import/helper/version"

module Template
  module Import
    module Helper
      # Your code goes here...
      class_option :path, type: :string, default: '/'
      # 'bizpage-rails/app/views/admin/index.html.erb'
      text = File.read("app/views/#{options['path']}")

      new_contents = text.gsub(/<link rel="stylesheet" href="(.+)" \/>/, "<%= stylesheet_link_tag "$1" %>")

      File.open(file_name, "app/views/#{options['path']}") {|file| file.puts new_contents }
    end
  end
end
