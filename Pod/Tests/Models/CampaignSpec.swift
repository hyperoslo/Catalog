import Quick
import Nimble
import Faker

class CampaignSpec: QuickSpec {

  override func spec() {
    describe("Campaign") {
      let title = Faker().lorem.word()
      let startDate = NSDate()
      let endDate = NSDate()
      let status = Campaign.Status.Done

      var campaign: Campaign!

      beforeEach {
        campaign = Campaign(title: title, startDate: startDate,
          endDate: endDate, status: status)
      }

      describe("#init") {
        it("sets title") {
          expect(campaign.title).to(equal(title))
        }

        it("sets start date") {
          expect(campaign.startDate).to(equal(startDate))
        }

        it("sets end date") {
          expect(campaign.endDate).to(equal(endDate))
        }

        it("sets default values") {
          expect(campaign.id).to(beNil())
        }

        context("with required parameters") {
          beforeEach {
            campaign = Campaign(title: title, startDate: startDate,
              endDate: endDate)
          }

          it("sets default values") {
            expect(campaign.status).to(equal(Campaign.Status.New))
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
