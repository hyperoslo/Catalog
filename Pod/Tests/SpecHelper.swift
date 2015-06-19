import Faker
import Wall

struct SpecHelper {

  static var category: Category {
    let faker = Faker()

    let title = faker.lorem.word()
    let publishDate = NSDate()
    let startDate = NSDate()
    let endDate = NSDate()
    let status = Category.Status.Open

    let category = Category(title: title, publishDate: publishDate,
        startDate: startDate, endDate: endDate, status: status)

    return category
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
