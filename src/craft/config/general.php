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
        'siteUrl' => 'https://alternahaircare.com'
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
        'siteUrl' => 'https://qa.alternahaircare.com'
    ],

    // Staging environment settings
    'staging' => [
        'allowAdminChanges' => true,
        'siteUrl' => 'https://staging.alternahaircare.com'
    ],

    // Production environment settings
    'production' => [
        'allowAdminChanges' => true,
        'siteUrl' => 'https://prod.alternahaircare.com'
    ],
];

