import Quick
import Nimble
import Faker

class CampaignSpec: QuickSpec {

  override func spec() {
    describe("Campaign") {
      let title = Faker().lorem.word()
      let publishDate = NSDate()
      let startDate = NSDate()
      let endDate = NSDate()
      let status = Campaign.Status.Completed

      var campaign: Campaign!

      beforeEach {
        campaign = Campaign(title: title, publishDate: publishDate,
          startDate: startDate, endDate: endDate, status: status)
      }

      describe("#init") {
        it("sets title") {
          expect(campaign.title).to(equal(title))
        }

        it("sets publish date") {
          expect(campaign.publishDate).to(equal(publishDate))
        }

        it("sets start date") {
          expect(campaign.startDate).to(equal(startDate))
        }

        it("sets end date") {
          expect(campaign.endDate).to(equal(endDate))
        }

        it("sets default values") {
          expect(campaign.contentSections.count).to(equal(0))
          expect(campaign.productSections.count).to(equal(0))
        }

        context("with required parameters") {
          beforeEach {
            campaign = Campaign(title: title, publishDate: publishDate,
              startDate: startDate, endDate: endDate)
          }

          it("sets default values") {
            expect(campaign.status).to(beNil())
          }
        }

        context("with all parameters") {
          it("sets status") {
            expect(campaign.status).to(equal(status))
          }
        }
      }
    }
  }
}
