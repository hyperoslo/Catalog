import Wall
import Campaign
import Faker

struct ContentGenerator {

  let faker = Faker()

  func campaign() -> Campaign {
    let title = faker.commerce.productName()
    let publishDate = NSDate()
    let startDate = NSDate()
    let endDate = NSDate()
    let status = Campaign.Status.Open

    let campaign = Campaign(
      title: title,
      publishDate: publishDate,
      startDate: startDate,
      endDate: endDate,
      status: status)

    var index = 1
    let contentSectionCount = 2
    let productSectionCount = 1

    var contentSections = [Post]()
    var productSections = [ProductSection]()

    for _ in 0..<contentSectionCount {
      contentSections.append(contentSection(index))
      index++
    }

    for _ in 0..<productSectionCount {
      productSections.append(productSection(&index))
      index++
    }

    campaign.contentSections = contentSections
    campaign.productSections = productSections

    return campaign
  }

  func contentSection(index: Int) -> Post {
    let title = faker.commerce.productName()
    let publishDate = NSDate()
    let attachments = images(index)

    let section = Post(
      date: publishDate,
      attachments: attachments)

    section.title = title

    if index % 2 == 0 {
      section.read = true
    }

    return section
  }

  func productSection(inout index: Int) -> ProductSection {
    let title = faker.commerce.productName()
    let publishDate = NSDate()
    let attachments = images(index)

    let section = ProductSection(
      date: publishDate,
      attachments: attachments)

    section.title = title

    let count = 5
    var productCards = [ProductCard]()

    for _ in 0..<count {
      productCards.append(productCard(&index))
      index++
    }

    section.productCards = productCards

    return section
  }

  func productCard(inout index: Int) -> ProductCard {
    let count = 4
    var relatedProducts = [Product]()

    for _ in 0..<count {
      relatedProducts.append(product(index))
      index++
    }

    let productCard = ProductCard(
      product: product(index),
      relatedProducts: relatedProducts)

    return productCard
  }

  func product(index: Int) -> Product {
    let title = faker.commerce.productName()
    let attachments = images(index)
    let serialNumber = faker.commerce.productName()
    let text = faker.lorem.sentences(amount: 4)
    let price = 899.0
    let oldPrice = 1005.2
    let discount = "10%"

    let product = Product(
      title: title,
      serialNumber: serialNumber,
      attachments: attachments,
      price: price,
      oldPrice: oldPrice,
      discount: discount)

    return product
  }

  func images(index: Int) -> [Attachment] {
    var images = [Attachment]()
    var count = 1

    if index % 2 == 0 {
      count = 4
    }

    for x in 0..<count {
      images.append(
        Image("http://lorempixel.com/%d/%d/?type=attachment&id=\(index)\(x)"))
    }

    return images
  }
}
