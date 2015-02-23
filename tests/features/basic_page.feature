Feature: Basic Page Fields
  In order to know that Basic Page content type fields are functioning correctly
  As a site administrator
  I need to enter information in the fields and see everything displayed as expected

Background:
    Given I am logged in as a user with the "administrator" role
    When I visit "/node/add/wetkit-page"
      And I fill in the following:
        | Title  | Title of Basic Page |
        | Editor | plain_text      |
        | Body   | Published body  |
      And I select "Published" from "workbench_moderation_state_new"
      And I check "field_featured_categories[und][1]"
      And I check "field_featured_categories[und][2]"
      And I check "menu[enabled]"
      And I fill in the following:
        | Link title  | Basic Page menu link |
    When I press "edit-submit"


  @api @wetkit_admin
  Scenario: Creating a Basic Page has correct content in the right fields
        Then the "h1" element should contain "Title of Basic Page"
        And the "p" element should contain "Published body"
        And I should see "departments" in the "Content Well"
        And I should see "features" in the "Content Well"
        And I should see "Basic Page menu link" in the "Content Well"
