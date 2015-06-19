import Faker
import Wall

struct SpecHelper {

  static var listing: Listing {
    let faker = Faker()

    let title = faker.lorem.word()
    let publishDate = NSDate()
    let startDate = NSDate()
    let endDate = NSDate()
    let status = Listing.Status.Open

    let listing = Listing(title: title, publishDate: publishDate,
        startDate: startDate, endDate: endDate, status: status)

    return listing
  }

  static var item: Item {
    let faker = Faker()

    let title = faker.lorem.word()
    let attachments: [Attachment] = [Image(faker.internet.url())]
    let serialNumber = "714223-951"
    let text = faker.lorem.sentences(amount: 4)
    let price = 999.0
    let oldPrice = 1005.2
    let discount = "5%"

    let item = Item(title: title, serialNumber: serialNumber, attachments: attachments, price: price, oldPrice: oldPrice, discount: discount)

    return item
  }
}
