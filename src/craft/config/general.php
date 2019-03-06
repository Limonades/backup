<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

return [
    // Global settings
    '*' => [
        'defaultWeekStartDay' => 1,
        'omitScriptNameInUrls' => true,
        'cpTrigger' => 'admin',
        'securityKey' => getenv('SECURITY_KEY'),
        'useProjectConfigFile' => true,
        'allowUpdates' => false,
        'siteUrl' => 'http://alternahaircare.com'
    ],

    // Dev environment settings
    'dev' => [
        'devMode' => true,
        'allowUpdates' => true,
        'siteUrl' => 'alterna.docker'
    ],

    // QA environment settings
    'qa' => [
        'devMode' => true,
        'allowAdminChanges' => true,
        'siteUrl' => 'http://haircare-qa.us-east-1.elasticbeanstalk.com'
    ],

    // Staging environment settings
    'staging' => [
        'allowAdminChanges' => true,
        'siteUrl' => 'http://haircare-staging.us-east-1.elasticbeanstalk.com'
    ],

    // Production environment settings
    'production' => [
        'allowAdminChanges' => true,
        'siteUrl' => 'http://haircare-production.us-east-1.elasticbeanstalk.com'
    ],
];

