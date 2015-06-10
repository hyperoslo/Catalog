import Quick
import Nimble
import Faker
import Wall

class ProductSpec: QuickSpec {

  override func spec() {
    describe("Product") {
      let faker = Faker()

      let title = faker.lorem.word()
      let attachments: [Attachment] = [Image(faker.internet.url())]
      let serialNumber = "714223-951"
      let text = faker.lorem.sentences(amount: 4)
      let price = 999.0
      let oldPrice = 1005.2
      let discount = "5%"

      var product: Product!

      beforeEach {
        product = Product(title: title, serialNumber: serialNumber, attachments: attachments, price: price, oldPrice: oldPrice, discount: discount)
      }

      describe("#init") {
        it("sets title") {
          expect(product.title).to(equal(title))
        }

        it("sets default values") {
          expect(product.parent).to(beNil())
        }

        context("with required parameters") {
          beforeEach {
            product = Product(title: title)
          }

          it("sets default values") {
            expect(product.serialNumber).to(beNil())
            expect(product.attachments).to(beNil())
            expect(product.price).to(beNil())
            expect(product.oldPrice).to(beNil())
            expect(product.discount).to(beNil())
          }
        }

        context("with all parameters") {
          it("sets serial number") {
            expect(product.serialNumber).to(equal(serialNumber))
          }

          it("sets attachments") {
            expect(product.attachments).notTo(beNil())
            expect(product.attachments?.count).to(equal(attachments.count))
          }

          it("sets price") {
            expect(product.price).to(equal(product.price))
          }

          it("sets old price") {
            expect(product.oldPrice).to(equal(product.oldPrice))
          }

          it("sets discount") {
            expect(product.discount).to(equal(discount))
          }
        }
      }
    }
  }
}
