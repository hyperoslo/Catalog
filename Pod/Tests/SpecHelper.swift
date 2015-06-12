import Faker
import Wall

struct SpecHelper {

  static var campaign: Campaign {
    let faker = Faker()

    let title = faker.lorem.word()
    let publishDate = NSDate()
    let startDate = NSDate()
    let endDate = NSDate()
    let status = Campaign.Status.Open

    let campaign = Campaign(title: title, publishDate: publishDate,
        startDate: startDate, endDate: endDate, status: status)

    return campaign
  }

  static var product: Product {
    let faker = Faker()

    let title = faker.lorem.word()
    let attachments: [Attachment] = [Image(faker.internet.url())]
    let serialNumber = "714223-951"
    let text = faker.lorem.sentences(amount: 4)
    let price = 999.0
    let oldPrice = 1005.2
    let discount = "5%"

    let product = Product(title: title, serialNumber: serialNumber, attachments: attachments, price: price, oldPrice: oldPrice, discount: discount)

    return product
  }
}
