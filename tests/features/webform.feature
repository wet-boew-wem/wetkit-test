Feature: Webform Fields
  In order to know that Webform content type fields are functioning correctly
  As a site administrator
  I need to enter information in the fields and see everything displayed as expected

Background:
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/webform"
      And I fill in the following:
        | Title  | Title of Webform |
        | Permalink | test-webform |
      And I check "menu[enabled]"
      And I fill in the following:
        | Link title  | Webform menu link |
    When I press "edit-submit"
    Then the "h1" element should contain "Webform menu link"
      And I fill in the following:
        | edit-add-name | Test Webform text field |
    Then I press "edit-add-add"
    Then I press "edit-actions-submit"

  @api @wetkit_admin
  Scenario: Creating a Webform has correct content in the right fields
    When I click "View" in the "Tabs" region
        Then the "h1" element should contain "Title of Webform"
        And I should see "Test Webform text field" in the "Content Well"
