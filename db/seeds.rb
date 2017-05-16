# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

records = [
  {
    name: 'apex_tdclient',
    author: 'tzmfreedom',
    description: 'Apex TreasureData Client',
    package_items: [PackageItem.create(path: '/')]
  }, {
    name: 'apex-mastodon',
    author: 'tzmfreedom',
    description: 'Apex Library for apex-mastodon',
    package_items: [PackageItem.create(path: '/src')]
  }, {
    name: 'fuga',
    author: 'hoge',
    description: 'hogehoge',
    package_items: [PackageItem.create(path: '/')]
  },
]

Package.create(records)
