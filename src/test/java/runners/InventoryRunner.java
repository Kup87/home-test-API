package runners;

import com.intuit.karate.junit5.Karate;

class InventoryRunner {
  @Karate.Test
  Karate run() {
    return Karate.run("classpath:features/inventory-get.feature");
  }
}
