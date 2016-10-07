
Post.destroy_all


3.times do
Post.create({title: "Some Title", author: FFaker::Name.name, content: FFaker::HipsterIpsum.paragraph})
end
