<?php
/**
 * @file
 * Provide Behat step-definitions for generic Panopoly tests.
 *
 */

use Drupal\DrupalExtension\Context\DrupalSubContextInterface;
use Behat\Behat\Context\BehatContext;
use Drupal\Component\Utility\Random;
use Behat\Behat\Event\StepEvent;

class TestOverridesSubContext extends BehatContext implements DrupalSubContextInterface {
  /**
   * Initializes context.
   */
  public function __construct(array $parameters = array()) {
  }

  public static function getAlias() {
    return 'test_overrides';
  }

  /**
   * Get the session from the parent context.
   */
  protected function getSession() {
    return $this->getMainContext()->getSession();
  }

  /**
   * @Then /^I should see the breadcrumb "([^"]*)"$/
   * @param string $breadcrumb
   *   Breadcrumb link on the current page
   * @param boolean $present
   *   Return True if success, false otherwise
   */
  public function checkBreadcrumb($breadcrumb, $present = true) {
    $result = $this->getSession()->getPage()->find('xpath', '//nav[@id="wb-bc"]//ol[@class="breadcrumb"]//a[text()="' . $breadcrumb . '"]');
    if ($present && empty($result)) {
      throw new Exception("The breadcrumb \"" . $breadcrumb . "\" was not found on the page");
    }
    elseif (!$present && !empty($result)) {
      throw new Exception("The breadcrumb \"" . $breadcrumb . "\" was found on the page which should not be");
    }
  }

  /**
   * @Given /^I should not see the breadcrumb "([^"]*)"$/
   */
  public function iShouldNotSeeTheBreadcrumb($breadcrumb) {
    //To check for the breadcrumb link exists
    $this->checkBreadcrumb($breadcrumb, false);
  }

  /**
   * @Then /^I should debug "([^"]*)" in the "([^"]*)" element$/
   */
  public function debugText($text, $tag) {
    $page = $this->getSession()->getPage();
    $results = $page->getContent();
    $this->printDebug($results);
  }

}
