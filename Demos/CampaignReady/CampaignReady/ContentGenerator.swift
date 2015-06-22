import Wall
import Catalog
import Faker

struct ContentGenerator {

  let faker = Faker()

  func listing() -> Listing {
    let title = faker.commerce.productName()
    let publishDate = NSDate()
    let startDate = NSDate()
    let endDate = NSDate()
    let status = Listing.Status.Open

    let listing = Listing(
      title: title,
      publishDate: publishDate,
      startDate: startDate,
      endDate: endDate,
      status: status)

    var index = 1
    let contentSectionCount = 2
    let productSectionCount = 1

    var contentSections = [ContentSection]()
    var productSections = [CardSection]()

    for _ in 0..<contentSectionCount {
      contentSections.append(contentSection(index))
      index++
    }

    for _ in 0..<productSectionCount {
      productSections.append(productSection(&index))
      index++
    }

    listing.contentSections = contentSections
    listing.cardSections = productSections

    return listing
  }

  func contentSection(index: Int) -> ContentSection {
    let title = faker.commerce.productName()
    let publishDate = NSDate()
    let attachments = images(index)

    let section = ContentSection(
      date: publishDate,
      attachments: attachments)

    section.title = title

    if index % 2 == 0 {
      section.read = true
    }

    return section
  }

  func productSection(inout index: Int) -> CardSection {
    let title = faker.commerce.productName()
    let publishDate = NSDate()
    let attachments = images(index)

    let section = CardSection(
      date: publishDate,
      attachments: attachments)

    section.title = title

    let count = 5
    var productCards = [Card]()

    for _ in 0..<count {
      productCards.append(productCard(&index))
      index++
    }

    section.cards = productCards

    return section
  }

  func productCard(inout index: Int) -> Card {
    let count = 4
    var relatedProducts = [Item]()

    for _ in 0..<count {
      relatedProducts.append(product(index))
      index++
    }

    let productCard = Card(
      item: product(index),
      relatedItems: relatedProducts)

    return productCard
  }

  func product(index: Int) -> Item {
    let title = faker.commerce.productName()
    let attachments = images(index)
    let serialNumber = faker.commerce.productName()
    let text = faker.lorem.sentences(amount: 4)
    let price = 899.0
    let oldPrice = 1005.2
    let discount = "10%"

    let product = Item(
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
