# -*- encoding : utf-8 -*-
module Homesick
  module Actions
    # Git-related helper methods for Homesick
    module GitActions
      # TODO: move this to be more like thor's template, empty_directory, etc
      def git_clone(repo, config = {})
        config ||= {}
        destination = config[:destination] || File.basename(repo, '.git')

        destination = Pathname.new(destination) unless destination.kind_of?(Pathname)
        FileUtils.mkdir_p destination.dirname

        if destination.directory?
          say_status :exist, destination.expand_path, :blue unless options[:quiet]
        else
          say_status 'git clone',
                     "#{repo} to #{destination.expand_path}",
                     :green unless options[:quiet]
          system "git clone -q --config push.default=upstream --recursive #{repo} #{destination}" unless options[:pretend]
        end
      end

      def git_init(path = '.')
        path = Pathname.new(path)

        inside path do
          if path.join('.git').exist?
            say_status 'git init', 'already initialized', :blue unless options[:quiet]
          else
            say_status 'git init', '' unless options[:quiet]
            system 'git init >/dev/null' unless options[:pretend]
          end
        end
      end

      def git_remote_add(name, url)
        existing_remote = `git config remote.#{name}.url`.chomp
        existing_remote = nil if existing_remote == ''

        if existing_remote
          say_status 'git remote', "#{name} already exists", :blue unless options[:quiet]
        else
          say_status 'git remote', "add #{name} #{url}" unless options[:quiet]
          system "git remote add #{name} #{url}" unless options[:pretend]
        end
      end

      def git_submodule_init(config = {})
        say_status 'git submodule', 'init', :green unless options[:quiet]
        system 'git submodule --quiet init' unless options[:pretend]
      end

      def git_submodule_update(config = {})
        say_status 'git submodule', 'update', :green unless options[:quiet]
        system 'git submodule --quiet update --init --recursive >/dev/null 2>&1' unless options[:pretend]
      end

      def git_pull(config = {})
        say_status 'git pull', '', :green unless options[:quiet]
        system 'git pull --quiet' unless options[:pretend]
      end

      def git_push(config = {})
        say_status 'git push', '', :green unless options[:quiet]
        system 'git push' unless options[:pretend]
      end

      def git_commit_all(config = {})
        say_status 'git commit all', '', :green unless options[:quiet]
        if config[:message]
          system "git commit -a -m '#{config[:message]}'" unless options[:pretend]
        else
          system 'git commit -v -a' unless options[:pretend]
        end
      end

      def git_add(file, config = {})
        say_status 'git add file', '', :green unless options[:quiet]
        system "git add '#{file}'" unless options[:pretend]
      end

      def git_status(config = {})
        say_status 'git status', '', :green unless options[:quiet]
        system 'git status' unless options[:pretend]
      end

      def git_diff(config = {})
        say_status 'git diff', '', :green unless options[:quiet]
        system 'git diff' unless options[:pretend]
      end
    end
  end
end