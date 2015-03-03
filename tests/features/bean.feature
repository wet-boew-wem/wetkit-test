Feature: Test Bean Types
  In order to know that Beans are functioning as expected
  As a site administrator
  I need to be able to trust that bean types work consistently

  @api @javascript
  Scenario: User save Twitter Bean
    Given I am logged in as a user with the "administrator" role
    When I visit "/block/add/wetkit-twitter"
      And I fill in the following:
        | Title                         | Testing title      |
        | label                         | WxT Feed           |
        | title_field[en][0][value]     | WxT Feed           |
        | twitter_settings[username]    | WebExpToolkit      |
        | twitter_settings[widget_id]   | 461316119865737216 |
        | twitter_settings[tweet_limit] | 5                  |
      And I press "edit-submit"
      And I wait 2 seconds
  Then I should see a ".wb-twitter" element

  @api @wetkit_bean
  Scenario: User save WetKit Bean
    Given I am logged in as a user with the "administrator" role
    When I visit "/block/add/wetkit-bean"
      And I fill in the following:
        | label                         | WxT Bean Label	|
        | Title                         | WxT Bean Title	|
        | Editor			| plain_text		|
        | Body				| WxT Bean Body		|
        | Taxonomy		        | departments		|
      And I press "edit-submit"
      And I wait 2 seconds
	  Then I should see a ".block-bean" element
	  And the "#wb-cont" element should contain "WxT Bean Title"
	  And the ".field-name-field-bean-wetkit-body" element should contain "WxT Bean Body"

  @api @wetkit_bean
  Scenario: User save Media Bean
    Given I am logged in as a user with the "administrator" role
    When I visit "/block/add/wetkit-media"
      And I fill in the following:
        | Label                         | WxT Media Label	|
        | Title                         | WxT Media Title	|
      And I select "image_thumbnail" from "image_style"
      And I select "Default" from "view_mode"
      And I press "edit-submit"
      And I wait 2 seconds
	  Then I should see a ".block-bean" element
	  And the "#wb-cont" element should contain "WxT Media Title"

  @api @wetkit_bean
  Scenario: User save Share Bean
    Given I am logged in as a user with the "administrator" role
    When I visit "/block/add/wetkit-share"
      And I fill in the following:
        | Label                         | WxT Share Label	|
        | Title                         | WxT Share Title	|
      And I select "Default" from "view_mode"
      And I press "edit-submit"
      And I wait 2 seconds
	  Then I should see a ".block-bean" element
	  And the "#wb-cont" element should contain "WxT Share Title"

  @api @wetkit_bean
  Scenario: User save Slide Bean
    Given I am logged in as a user with the "administrator" role
    When I visit "/block/add/wetkit-slide"
      And I fill in the following:
        | Label                         | WxT Slideshow Label	|
        | Title                         | WxT Slideshow Title	|
      And I select "wetkit_image_thumbnail" from "image_style"
      And I select "Default" from "view_mode"
      And I press "edit-submit"
      And I wait 2 seconds
	  Then I should see a ".block-bean" element
	  And the "#wb-cont" element should contain "WxT Slideshow Title"

  @api @wetkit_bean
  Scenario: User save Slideout Bean
    Given I am logged in as a user with the "administrator" role
    When I visit "/block/add/wetkit-bean"
      And I fill in the following:
        | label                         | WxT Slideout Label	|
        | Title                         | WxT Slideout Title	|
        | Editor			| plain_text		|
        | Body				| WxT Slideout Body	|
      And I select "Default" from "view_mode"
      And I press "edit-submit"
      And I wait 2 seconds
	  Then I should see a ".block-bean" element
	  And the "#wb-cont" element should contain "WxT Slideout Title"
	  And the ".field-name-field-bean-wetkit-body" element should contain "WxT Slideout Body"

  @api @wetkit_bean
  Scenario: User save Rate Bean
    Given I am logged in as a user with the "administrator" role
    When I visit "/block/add/wetkit-rate"
      And I fill in the following:
        | label                         | WxT Rate Label	|
        | Title                         | WxT Rate Title	|
      And I select "Default" from "view_mode"
      And I press "edit-submit"
      And I wait 2 seconds
	  Then I should see a ".block-bean" element
	  And the "#wb-cont" element should contain "WxT Rate Title"
