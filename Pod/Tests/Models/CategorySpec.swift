import Quick
import Nimble
import Faker

class CategorySpec: QuickSpec {

  override func spec() {
    describe("Category") {
      let title = Faker().lorem.word()
      let publishDate = NSDate()
      let startDate = NSDate()
      let endDate = NSDate()
      let status = Category.Status.Completed

      var catalog: Category!

      beforeEach {
        catalog = Category(title: title, publishDate: publishDate,
          startDate: startDate, endDate: endDate, status: status)
      }

      describe("#init") {
        it("sets title") {
          expect(catalog.title).to(equal(title))
        }

        it("sets publish date") {
          expect(catalog.publishDate).to(equal(publishDate))
        }

        it("sets start date") {
          expect(catalog.startDate).to(equal(startDate))
        }

        it("sets end date") {
          expect(catalog.endDate).to(equal(endDate))
        }

        it("sets default values") {
          expect(catalog.contentSections.count).to(equal(0))
          expect(catalog.cardSections.count).to(equal(0))
        }

        context("with required parameters") {
          beforeEach {
            catalog = Category(title: title, publishDate: publishDate,
              startDate: startDate, endDate: endDate)
          }

          it("sets default values") {
            expect(catalog.status).to(beNil())
          }
        }

        context("with all parameters") {
          it("sets status") {
            expect(catalog.status).to(equal(status))
          }
        }
      }
    }
  }
}
