namespace :spm do
  desc 'Register Apex Repository to DB' do
    task :register_repository => :environment do
      RepositoryRegister.new.run
    end
  end
end