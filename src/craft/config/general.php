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
    ],

    // Dev environment settings
    'dev' => [
        'devMode' => true,
        'allowUpdates' => true,
        'siteUrl' => 'alterna.docker'
    ],

    // Staging environment settings
    'staging' => [
        'allowAdminChanges' => false,
    ],

    // Production environment settings
    'production' => [
        'allowAdminChanges' => false,
    ],
];

