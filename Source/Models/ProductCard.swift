import Foundation

public class ProductCard: NSObject {

  public var product: Product?
  public var relatedProducts = [Product]()

  public init(product: Product, relatedProducts: [Product] = []) {
    self.product = product
    self.relatedProducts = relatedProducts
  }
}
