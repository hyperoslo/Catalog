import Quick
import Nimble
import Faker
import Wall

class CardSectionSpec: QuickSpec {

  override func spec() {
    describe("CardSection") {
      let faker = Faker()

      let text = faker.lorem.word()
      let date = NSDate()

      var cardSection: CardSection!

      beforeEach {
        cardSection = CardSection(text: text, date: date)
      }

      describe("#init") {
        it("is a subclass of Post") {
          expect(cardSection).to(beAKindOf(Post.self))
        }

        it("sets default values") {
          expect(cardSection.cards.count).to(equal(0))
        }
      }
    }
  }
}
