# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', :input => 'public/assets/coffeescript' , :output => 'public/assets/js', :bare => true

# This will concatenate the javascript files specified in :files to public/js/all.js
guard :concat, type: "js", files: %w(ui urls), input_dir: "public/assets/js", output: "public/assets/js/main"

guard :concat, type: "css", files: %w(), input_dir: "/public/assets/css", output: "public/assets/css/all"

guard 'livereload' do
  watch(%r{app/views/rbetter.+\.(php)$})
  watch(%r{public/.+\.(css|js|html)})
end

guard 'uglify', :destination_file => 'public/assets/js/main.min.js' do
  watch 'public/assets/js/main.js'
end
 