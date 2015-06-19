import Quick
import Nimble
import Faker
import Wall

class ItemSpec: QuickSpec {

  override func spec() {
    describe("Item") {
      let faker = Faker()

      let title = faker.lorem.word()
      let attachments: [Attachment] = [Image(faker.internet.url())]
      let serialNumber = "714223-951"
      let text = faker.lorem.sentences(amount: 4)
      let price = 999.0
      let oldPrice = 1005.2
      let discount = "5%"

      var item: Item!

      beforeEach {
        item = Item(title: title, serialNumber: serialNumber, attachments: attachments, price: price, oldPrice: oldPrice, discount: discount)
      }

      describe("#init") {
        it("sets title") {
          expect(item.title).to(equal(title))
        }

        context("with required parameters") {
          beforeEach {
            item = Item(title: title)
          }

          it("sets default values") {
            expect(item.serialNumber).to(beNil())
            expect(item.attachments).to(beNil())
            expect(item.price).to(beNil())
            expect(item.oldPrice).to(beNil())
            expect(item.discount).to(beNil())
          }
        }

        context("with all parameters") {
          it("sets serial number") {
            expect(item.serialNumber).to(equal(serialNumber))
          }

          it("sets attachments") {
            expect(item.attachments).notTo(beNil())
            expect(item.attachments?.count).to(equal(attachments.count))
          }

          it("sets price") {
            expect(item.price).to(equal(item.price))
          }

          it("sets old price") {
            expect(item.oldPrice).to(equal(item.oldPrice))
          }

          it("sets discount") {
            expect(item.discount).to(equal(discount))
          }
        }
      }
    }
  }
}
