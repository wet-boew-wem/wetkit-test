Feature: Theme selection
  In order to know that the WxT themes can be used
  As a website user
  I need to be able to change theme successfully

  @api @wetkit_admin @javascript
  Scenario: User changes WxT themes and the body CSS confirms theme was changed
    Given I am logged in as a user with the "administrator" role
    When I visit "/admin/wetkit/wetkit_wetboew"
      And I select "wet-boew" from "edit-wetkit-wetboew-theme"
    When I press "edit-submit"
    Then I should see an ".theme-wet-boew" element
      And I select "wet-boew" from "edit-wetkit-wetboew-theme"
    When I press "edit-submit"
    Then I should see an ".theme-wet-boew" element
      And I select "wet-boew-gcwu-fegc" from "edit-wetkit-wetboew-theme"
    When I press "edit-submit"
    Then I should see an ".theme-gcwu-fegc" element
      And I select "wet-boew-gc-intranet" from "edit-wetkit-wetboew-theme"
    When I press "edit-submit"
    Then I should see an ".theme-gc-intranet" element
      And I select "wet-boew-base" from "edit-wetkit-wetboew-theme"
    When I press "edit-submit"
    Then I should see an ".theme-base" element
      And I select "wet-boew-ogpl" from "edit-wetkit-wetboew-theme"
    When I press "edit-submit"
    Then I should see an ".theme-ogpl" element
      And I select "wet-boew-gcweb" from "edit-wetkit-wetboew-theme"
    When I press "edit-submit"
    Then I should see an ".theme-gcweb" element
