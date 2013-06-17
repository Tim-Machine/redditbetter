# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', :input => 'public/assets/coffeescript' , :output => 'public/assets/js' , :bare => true

# This will concatenate the javascript files specified in :files to public/js/all.js
guard :concat, type: "js", files: %w(), input_dir: "public/js", output: "public/js/all"

guard :concat, type: "css", files: %w(), input_dir: "public/css", output: "public/css/all"

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$}) 
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)}) 
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(public/assets/\w+/(.+\.(css|js|html))).*}) { |m| "public/assets/#{m[3]}" }
end 

guard 'uglify', :destination_file => "public/javascripts/application.js" do
  watch (%r{app/assets/javascripts/application.js})
end
