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

class MetatagSubContext extends BehatContext implements DrupalSubContextInterface {
  /**
   * Initializes context.
   */
  public function __construct(array $parameters = array()) {
  }

  public static function getAlias() {
    return 'metatag';
  }

  /**
   * Get the session from the parent context.
   */
  protected function getSession() {
    return $this->getMainContext()->getSession();
  }

  /**
   * @Then /^the metatag attribute "(?P<attribute>[^"]*)" should have the value "(?P<value>[^"]*)"$/
   *
   * @throws \Exception
   *   If region or link within it cannot be found.
   */
  public function assertMetaRegion($metatag, $value) {
    $element = $this->getSession()->getPage()->find('xpath', '/head/meta[@name="' . $metatag . '"]/@content');

    if ($value == $element->getText()) {
      $result = $value;
    }

    if (empty($result)) {
      throw new \Exception(sprintf('No link to "%s" on the page %s', $metatag, $this->getSession()->getCurrentUrl()));
    }
  }

}
