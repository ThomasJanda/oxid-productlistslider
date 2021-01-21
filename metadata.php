<?php
$sMetadataVersion = '2.0';

$aModule = array(
    'id'          => 'rs-productlistslider',
    'title'       => '*RS Product list slider',
    'description' => 'Replace product list with swiper',
    'thumbnail'   => '',
    'version'     => '0.0.1',
    'author'      => '',
    'url'         => '',
    'email'       => '',
    'extend'      => array(
        /*
        \OxidEsales\Eshop\Application\Controller\ArticleDetailsController::class => \rs\reviews\Application\Controller\ArticleDetailsController::class,
        \OxidEsales\Eshop\Application\Model\Article::class => \rs\reviews\Application\Model\Article::class,
        \OxidEsales\Eshop\Application\Component\Widget\ArticleDetails::class => \rs\reviews\Application\Component\Widget\ArticleDetails::class
         */
    ),
    'controllers' => array(

    ),
    'templates'   => array(
        'rs/productlistslider/views/tpl/widget/product/list.tpl' => 'rs/productlistslider/views/tpl/widget/product/list.tpl',
    ),
    'blocks'      => array(
        array(
            'template' => 'widget/product/list.tpl',
            'block'    => 'rs_productlistslider',
            'file'     => '/views/block/widget/product/list__rs_productlistslider.tpl',
        ),
    ),
    'settings'    => array(
        array(
            'group' => 'rs-productslider_settings',
            'name'  => 'rs-productslider_settings_navigation_button',
            'type'  => 'bool',
            'value' => true,
        ),
        array(
            'group' => 'rs-productslider_settings',
            'name'  => 'rs-productslider_settings_navigation_pagination',
            'type'  => 'bool',
            'value' => false,
        ),
        array(
            'group' => 'rs-productslider_settings',
            'name'  => 'rs-productslider_settings_navigation_scrollbar',
            'type'  => 'bool',
            'value' => false,
        ),   
        array(
            'group' => 'rs-productslider_settings',
            'name'  => 'rs-productslider_settings_infinity_loop',
            'type'  => 'bool',
            'value' => true,
        ),  
    ),
);
