Feature: Documentation Fields
  In order to know that Documentation content type fields are functioning correctly
  As a site administrator
  I need to enter information in the fields and see everything displayed as expected

Background:
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/wetkit-documentation"
      And I fill in the following:
        | Title  | Title of Documentation Page |
        | Editor | plain_text      |
        | Body   | Documentation Published body  |
      And I check "Published"
      And I check "field_featured_categories[und][1]"
      And I check "field_featured_categories[und][2]"
    When I press "edit-submit"


  @api @wetkit_admin
  Scenario: Creating a Documentation Page has correct content in the right fields
        Then the "h1" element should contain "Title of Documentation Page"
        And the "p" element should contain "Documentation Published body"
        And I should see "departments" in the "Content Well"
        And I should see "features" in the "Content Well"

