import Quick
import Nimble
import Faker
import Wall

class ProductCardSpec: QuickSpec {

  override func spec() {
    describe("ProductCard") {
      let faker = Faker()

      let product = SpecHelper.product
      let relatedProducts = [SpecHelper.product]

      var productCard: ProductCard!

      beforeEach {
        productCard = ProductCard(product: product, relatedProducts: relatedProducts)
      }

      describe("#init") {
        it("sets product") {
          expect(productCard.product).to(equal(product))
        }

        it("sets related products") {
          expect(productCard.relatedProducts.count).to(equal(1))
        }

        context("with required parameters") {
          beforeEach {
            productCard = ProductCard(product: product)
          }

          it("sets default values") {
            expect(productCard.relatedProducts.count).to(equal(0))
          }
        }
      }
    }
  }
}
