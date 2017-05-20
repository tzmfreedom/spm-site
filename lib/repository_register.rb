class RepositoryRegister
  def initialize(username: , password: )
    @username = username
    @password = password
    @query = 'language:apex stars:>=2'
    @options = {
        sort: 'stars',
        order: 'desc',
    }
  end

  def run
    Octokit.auto_paginate = true
    client = Octokit::Client.new(:login => @username, :password => @password)
    repos = client.search_repositories(@query, @options)

    repos.items.each do |item|
      package = Package.new(
        name: item.name,
        fork: item.fork,
        description: item.description,
        stargazers_count: item.stargazers_count,
        forks_count: item.forks_count,
        author: item.owner.login,
      )
      contents = item.rels[:contents].get.data
      path = walk_to_packagexml(contents, 0)
      package.package_items = [
        PackageItem.new(
          path: path,
        )
      ]
      package.save
    end
  end

  def walk_to_packagexml(contents, depth, path = '')
    return nil if depth == 3
    return path if contents.any? { |content| content.name == 'package.xml' }

    contents.each do |content|
      if content.type == 'dir'
        result_path = walk_to_packagexml(content.rels[:self].get.data, depth+1, "#{path}/#{content.name}")
        return result_path if result_path
      end
    end
    return nil
  end
end
