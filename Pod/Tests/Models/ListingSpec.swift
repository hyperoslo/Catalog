import Quick
import Nimble
import Faker

class ListingSpec: QuickSpec {

  override func spec() {
    describe("Listing") {
      let title = Faker().lorem.word()
      let publishDate = NSDate()
      let startDate = NSDate()
      let endDate = NSDate()
      let status = Listing.Status.Completed

      var listing: Listing!

      beforeEach {
        listing = Listing(title: title, publishDate: publishDate,
          startDate: startDate, endDate: endDate, status: status)
      }

      describe("#init") {
        it("sets title") {
          expect(listing.title).to(equal(title))
        }

        it("sets publish date") {
          expect(listing.publishDate).to(equal(publishDate))
        }

        it("sets start date") {
          expect(listing.startDate).to(equal(startDate))
        }

        it("sets end date") {
          expect(listing.endDate).to(equal(endDate))
        }

        it("sets default values") {
          expect(listing.contentSections.count).to(equal(0))
          expect(listing.cardSections.count).to(equal(0))
        }

        context("with required parameters") {
          beforeEach {
            listing = Listing(title: title, publishDate: publishDate,
              startDate: startDate, endDate: endDate)
          }

          it("sets default values") {
            expect(listing.status).to(beNil())
          }
        }

        context("with all parameters") {
          it("sets status") {
            expect(listing.status).to(equal(status))
          }
        }
      }
    }
  }
}
